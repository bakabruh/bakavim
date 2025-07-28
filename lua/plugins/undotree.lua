return {
	"mbbill/undotree",
	config = function()
		-- Toggle undo tree
		vim.keymap.set("n", "<leader>?", vim.cmd.UndotreeToggle, {})
	end,
}
