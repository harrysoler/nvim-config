local util = require("lspconfig/util")

return {
	cmd = { "omnisharp" }, -- Mason installs OmniSharp with this name by default
	root_dir = util.root_pattern("*.sln", "*.csproj"),
	enable_roslyn_analyzers = true,
	organize_imports_on_format = true,
	enable_import_completion = true,
}
