local M = require("lualine.component"):extend()

local modules = require("lualine_require").lazy_require({
	utils = "lualine.utils.utils",
})

local default_options = {
	symbols = { modified = "[+]", readonly = "[-]", unnamed = "[No Name]" },
	file_status = true,
	path = 0,
	shorting_target = 40,
}

local function count(base, pattern)
	return select(2, string.gsub(base, pattern, ""))
end

local function shorten_path(path, sep)
	return path:gsub(string.format("([^%s])[^%s]+%%%s", sep, sep, sep), "%1" .. sep, 1)
end

M.init = function(self, options)
	M.super.init(self, options)
	self.options = vim.tbl_deep_extend("keep", self.options or {}, default_options)
	self.git_root_dir = nil
	self.is_inside_git_repo = false

	-- Cache on BufEnter or DirChanged
	vim.api.nvim_create_autocmd({ "BufEnter", "DirChanged" }, {
		callback = function()
			local inside = vim.fn.system("git rev-parse --is-inside-work-tree 2>/dev/null")
			self.is_inside_git_repo = inside == "true\n"
			if self.is_inside_git_repo then
				self.git_root_dir = vim.fn.system("git rev-parse --show-toplevel 2>/dev/null"):gsub("\n", "")
			else
				self.git_root_dir = nil
			end
		end,
	})
end

M.update_status = function(self)
	local data
	if self.options.path == 1 then
		data = vim.fn.expand("%:~:.")
	elseif self.options.path == 2 then
		data = vim.fn.expand("%:p")
	elseif self.options.path == 3 then
		data = vim.fn.expand("%:p:~")
	else
		if self.is_inside_git_repo and vim.bo.modifiable and not vim.bo.readonly then
			local absolute_file_path = vim.fn.expand("%:p")
			data = absolute_file_path:sub(#self.git_root_dir + 2)
		else
			data = vim.fn.expand("%:t")
		end
	end

	data = modules.utils.stl_escape(data)
	if data == "" then
		data = self.options.symbols.unnamed
	end

	if self.options.shorting_target ~= 0 then
		local windwidth = self.options.globalstatus and vim.go.columns or vim.fn.winwidth(0)
		local estimated_space_available = windwidth - self.options.shorting_target
		local path_separator = package.config:sub(1, 1)
		for _ = 0, count(data, path_separator) do
			if windwidth <= 84 or #data > estimated_space_available then
				data = shorten_path(data, path_separator)
			end
		end
	end

	if self.options.file_status then
		if vim.bo.modified then
			data = data .. self.options.symbols.modified
		end
		if not vim.bo.modifiable or vim.bo.readonly then
			data = data .. self.options.symbols.readonly
		end
	end
	return data
end

return M
