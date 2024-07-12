local plenary_path = require('plenary.path')
local for_unreal = require('ForUnreal')
local utils = require('ForUnreal.utils')

-- PlenaryBustedDirectory lua\tests\ { minimal_init = ".\\scripts\\minimal_init.lua" }

describe("ForUnreal setup call", function()

	local path_exists

	before_each(function() 
		path_exists = plenary_path.exists
	end)

	after_each(function() 
		plenary_path.exists = path_exists 
	end)

	it("should throw error when engine_dir is not set", function()
		local status, error = pcall(for_unreal.setup, {})
		assert(error and status == false)
	end)

	it("should throw when directory is not found", function() 
		local status, error = pcall(for_unreal.setup, {
			engine_path = "path/to/unreal",
			engine_version = "5.4"
		})
		assert(error and status == false)		
	end)

	it("should not throw when full_path key is used", function()
		local engine_full_path = "path/to/unreal/build/tool"
		plenary_path.exists = function(path)
			return path.filename == engine_full_path
		end
		
		local status, error = pcall(for_unreal.setup, { engine_full_path = engine_full_path })
		assert(status)
	
	end)

	it("should not throw with path and version", function()
		local path = "path/to/unreal"
		local version = "5.4"

		plenary_path.exists = function(path_ex)
			return path_ex.filename == utils.make_unreal_dir(path, version)
		end

		local status, error = pcall(for_unreal.setup, { 
			engine_path = path, 
			engine_version = version 
		})
		assert(status)
	end)


end)
