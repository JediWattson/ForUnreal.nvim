local plenary_path = require('plenary.path')
local for_unreal = require('ForUnreal')

describe("ForUnreal setup call", function()
	it("should throw error when engine_dir is not set", function()
		local status, error = pcall(for_unreal.setup, {})
		assert(status == false)
	end)

	it("should throw when directory is not found", function() 
		local status, error = pcall(for_unreal.setup, {
			engine_path = "path/to/unreal"
		})
		assert(error)		
	end)

	it("should be set with engine_dir as a key", function()
		local engine_path = "path/to/unreal"

		local mock_exists = function(path)
			return path.filename == engine_path
		end

		local original_exists = plenary_path.exists
		plenary_path.exists = mock_exists

		local status, error = pcall(for_unreal.setup, { engine_path = engine_path })
		print(error)
		assert(status)
	end)
end)
