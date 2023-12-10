-- setup with all defaults
-- each of these are documented in `:help nvim-tree.OPTION_NAME`
-- nested options are documented by accessing them with `.` (eg: `:help nvim-tree.view.mappings.list`).
local HEIGHT_RATIO = 0.4 -- You can change this
local WIDTH_RATIO = 0.20 -- You can change this too

local function split(inputstr, sep)
	if sep == nil then
		sep = "%s"
	end
	local t = {}
	for str in string.gmatch(inputstr, "([^" .. sep .. "]+)") do
		table.insert(t, str)
	end
	return t
end

local function get_root_folder_name(path)
	local is_inside_git_repo = vim.system({ "git", "rev-parse", "--is-inside-work-tree" }, { cwd = path }):wait().stdout
		== "true\n"

	if is_inside_git_repo then
		local git_root_dir = vim.system({ "git", "rev-parse", "--show-toplevel" }, { cwd = path }):wait().stdout

		local root_dir_index = string.find(git_root_dir, "[^/]*$")

		path = string.sub(path, root_dir_index)
	else
		-- just filename
		path = vim.fn.fnamemodify(path, ":~:s?$?/")
	end

	return path
end

local function my_on_attach(bufnr)
	local api = require("nvim-tree.api")

	local function opts(desc)
		return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end

	-- OR use all default mappings
	api.config.mappings.default_on_attach(bufnr)

	vim.api.nvim_buf_set_var(bufnr, "winblend", 20)

	vim.keymap.del("n", "e", { buffer = bufnr })

	-- add your mappings
	vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
	vim.keymap.set("n", "i", api.node.open.edit, opts("Open"))
	vim.keymap.set("n", "n", "j", { buffer = bufnr })
	vim.keymap.set("n", "e", "k", { buffer = bufnr })
	vim.keymap.set("n", "<C-c>", api.tree.close, opts("Close"))
end

require("nvim-tree").setup({ -- BEGIN_DEFAULT_OPTS
	on_attach = my_on_attach,
	auto_reload_on_write = true,
	create_in_closed_folder = false,
	disable_netrw = true,
	hijack_cursor = true,
	hijack_netrw = true,
	hijack_unnamed_buffer_when_opening = true,
	open_on_tab = false,
	sort_by = "name",
	update_cwd = true,
	reload_on_bufenter = false,
	respect_buf_cwd = false,
	sync_root_with_cwd = false,

	view = {
		adaptive_size = true,
		centralize_selection = false,
		-- width = 30,
		-- side = "left",
		preserve_window_proportions = true,
		number = false,
		relativenumber = false,
		signcolumn = "yes",
		float = {
			enable = true,
			quit_on_focus_loss = true,
			open_win_config = function()
				local screen_w = vim.opt.columns:get()
				local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
				local window_w = screen_w * WIDTH_RATIO
				local window_h = screen_h * HEIGHT_RATIO
				local window_w_int = math.max(35, math.floor(window_w))
				local window_h_int = math.max(20, math.floor(window_h))

				return {
					border = { "", "", " ", " ", " ", " ", "", "" },
					relative = "cursor",
					row = 0,
					col = 0,
					width = window_w_int,
					height = window_h_int,
				}
			end,
		},
		width = function()
			return math.floor(vim.opt.columns:get() * WIDTH_RATIO)
		end,
	},

	renderer = {
		add_trailing = false,
		group_empty = false,
		highlight_git = false,
		full_name = false,
		highlight_opened_files = "none",
		root_folder_label = get_root_folder_name,
		indent_markers = {
			enable = true,
			icons = {
				corner = "└ ",
				edge = "│ ",
				item = "│ ",
				none = "  ",
			},
		},
		icons = {
			webdev_colors = true,
			git_placement = "before",
			padding = " ",
			symlink_arrow = " ➛ ",
			show = {
				file = true,
				folder = true,
				folder_arrow = true,
				git = true,
			},
			glyphs = {
				default = "",
				symlink = "",
				folder = {
					arrow_closed = "",
					arrow_open = "",
					default = "",
					open = "",
					empty = "",
					empty_open = "",
					symlink = "",
					symlink_open = "",
				},
				git = {
					unstaged = "✗",
					staged = "✓",
					unmerged = "",
					renamed = "➜",
					untracked = "★",
					deleted = "",
					ignored = "◌",
				},
			},
		},
		special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
	},

	hijack_directories = {
		enable = true,
		auto_open = true,
	},

	update_focused_file = {
		enable = false,
		update_cwd = false,
		ignore_list = {},
	},

	system_open = {
		cmd = "",
		args = {},
	},

	diagnostics = {
		enable = true,
		show_on_dirs = true,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		},
	},

	filters = {
		dotfiles = false,
		custom = { "^.git$", "^__pycache__$", "^.venv$" },
		exclude = {},
	},

	filesystem_watchers = {
		enable = false,
	},

	git = {
		enable = true,
		ignore = true,
		timeout = 400,
	},

	actions = {
		use_system_clipboard = true,
		change_dir = {
			enable = true,
			global = false,
			restrict_above_cwd = false,
		},
		expand_all = {
			max_folder_discovery = 300,
		},
		open_file = {
			quit_on_open = false,
			resize_window = true,
			window_picker = {
				enable = false,
				chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
				exclude = {
					filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
					buftype = { "nofile", "terminal", "help" },
				},
			},
		},
		remove_file = {
			close_window = true,
		},
	},

	trash = {
		cmd = "gio trash",
		require_confirm = true,
	},

	live_filter = {
		prefix = "[FILTER]: ",
		always_show_folders = true,
	},

	modified = {
		enable = true,
	},

	log = {
		enable = false,
		truncate = false,
		types = {
			all = false,
			config = false,
			copy_paste = false,
			diagnostics = false,
			git = false,
			profile = false,
			watcher = false,
		},
	},
}) -- END_DEFAULT_OPTS

local api = require("nvim-tree.api")
api.events.subscribe(api.events.Event.FileCreated, function(file)
	vim.cmd("edit " .. file.fname)
end)
