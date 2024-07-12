local plenary_path = require('plenary.path')
local plenary_scan = require('plenary.scandir')
local utils = require('ForUnreal.utils')
local const = require('ForUnreal.const')

local M = {}

function M.setup(config)

	local unreal_engine_path = ""

	local engine_path = config.engine_path or ""
	local engine_version = config.engine_version or ""
	local engine_full_path = config.engine_full_path or ""

	if engine_full_path ~= ""  then
		unreal_engine_path = engine_full_path	
	end 

	if engine_path ~= "" and engine_version ~= "" then 
		unreal_engine_path = utils.make_unreal_dir(engine_path, engine_version)
	end

	if unreal_engine_path == "" then
		utils.make_error(consts.no_eng_dir_error)
	end

	if not plenary_path:new(unreal_engine_path):exists() then
		utils.make_error(consts.eng_dir_notfound_error)
	end

	vim.api.nvim_create_user_command('ForUnrealBuild', function()
		local current_dir = vim.fn.getcwd()
		print(current_dir)
	end, {})
end

return M
