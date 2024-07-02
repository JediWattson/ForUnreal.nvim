local M = {}

vim.g.lazyvim_log_leve = "debug"

local config_eng_dir_error = "ForUnreal: no string for engine_dir. Please use path to Unreal Engine."
function M.setup(config)
	local engine_dir = config.engine_dir or ""
	if engine_dir == "" then 
		error(config_eng_dir_error)
	end

--	vim.api.nvim_create_user_command('ForUnrealBuild', 'echo "Hello world!"', {})

end


return M
