
local M = {}

M.make_error = function(error_str)
	error("ForUnreal -- " .. error_str)
end

M.make_unreal_dir = function(path, version)
	return path .. "/UE_" .. version .. "/Engine/Binaries/DotNET/UnrealBuildTool"
end

return M

