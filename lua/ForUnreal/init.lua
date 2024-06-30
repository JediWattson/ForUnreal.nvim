

local M = {}

vim.g.lazyvim_log_level = "debug"

function M.setup()
	vim.api.nvim_create_user_command('TestHelloWorld', 'echo "Hello world!"', {})
end


return M
