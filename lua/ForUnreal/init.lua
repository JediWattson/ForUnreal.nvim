local plenary_path = require('plenary.path')


-- TODO: move into own file
local make_error = function(error_str)
	error("ForUnreal -- " .. error_str)
end

local no_eng_dir_error = "no string for engine_dir. Please use path to Unreal Engine."
local eng_dir_notfound_error = "path provided does not point to directory"

local M = {}

-- PlenaryBustedDirectory lua\tests\ { minimal_init = ".\\scripts\\minimal_init.lua" }

function M.setup(config)
	local engine_path = config.engine_path or ""
	if engine_path == "" then 
		make_error(no_eng_dir_error)
	end

	if not plenary_path:new(engine_path):exists() then
		make_error(eng_dir_notfound_error)
	end
	

	vim.api.nvim_create_user_command('ForUnrealBuild', function() 
		print("buillllld")		
	end, {})
end

return M
