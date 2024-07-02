local for_unreal = require('ForUnreal')

describe("ForUnreal setup call", function()
	it("should throw error when engine_dir is not set", function()
		local status, error = pcall(for_unreal.setup, {})
		assert(status == false)
	end)
	it("should be set with engine_dir as a key", function()
		local status, error = pcall(for_unreal.setup, {
			engine_dir = "path/to/unreal"
		})
		assert(status)
	end)
end)
