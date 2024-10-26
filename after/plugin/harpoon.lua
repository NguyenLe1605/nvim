local harpoon = require("harpoon")
harpoon:setup({})

-- basic telescope configuration
local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
	local file_paths = {}
	for _, item in ipairs(harpoon_files.items) do
		table.insert(file_paths, item.value)
	end

	require("telescope.pickers")
		.new({}, {
			prompt_title = "Harpoon",
			finder = require("telescope.finders").new_table({
				results = file_paths,
			}),
			previewer = conf.file_previewer({}),
			sorter = conf.generic_sorter({}),
		})
		:find()
end

vim.keymap.set("n", "<leader>ht", function()
	toggle_telescope(harpoon:list())
end, { desc = "Open harpoon window" })

-- Add or remove the file from the list
vim.keymap.set("n", "<leader>ha", function()
	harpoon:list():add()
end)
vim.keymap.set("n", "<leader>hr", function()
	harpoon:list():remove()
end)

-- Remove a book mark at index
vim.keymap.set("n", "<leader>hr1", function()
	harpoon:list():remove_at(1)
end)
vim.keymap.set("n", "<leader>hr2", function()
	harpoon:list():remove_at(2)
end)
vim.keymap.set("n", "<leader>hr3", function()
	harpoon:list():remove_at(3)
end)
vim.keymap.set("n", "<leader>hr4", function()
	harpoon:list():remove_at(4)
end)

-- Replace the book mark with the current file
vim.keymap.set("n", "<leader>hc1", function()
	harpoon:list():replace_at(1)
end)
vim.keymap.set("n", "<leader>hc2", function()
	harpoon:list():replace_at(2)
end)
vim.keymap.set("n", "<leader>hc3", function()
	harpoon:list():replace_at(3)
end)
vim.keymap.set("n", "<leader>hc4", function()
	harpoon:list():replace_at(4)
end)

-- Select the bookmarked files
vim.keymap.set("n", "<C-h>", function()
	harpoon:list():select(1)
end)
vim.keymap.set("n", "<C-t>", function()
	harpoon:list():select(2)
end)
vim.keymap.set("n", "<C-n>", function()
	harpoon:list():select(3)
end)
vim.keymap.set("n", "<C-s>", function()
	harpoon:list():select(4)
end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<leader>hp", function()
	harpoon:list():prev()
end)
vim.keymap.set("n", "<leader>hn", function()
	harpoon:list():next()
end)
