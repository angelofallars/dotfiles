M = {}

M.init = function()
	require("telescope.builtin").git_files()
end

return M
