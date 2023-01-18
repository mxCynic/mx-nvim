local api = vim.api
local M = []
function M.makeScratch()
	api.nvim_command('nenw')
	vim.bo[0].buftype = noflie
	vim.bo[0].bufhiden = hide
	vim.bo[0].swapfile = false:
end
return M

