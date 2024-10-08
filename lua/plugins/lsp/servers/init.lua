local servers_path = vim.fn.stdpath("config") .. "/lua/plugins/lsp/servers"

local function get_files_from(path)
	return ipairs(vim.fn.readdir(path, [[v:val =~ '\.lua$']]))
end

local servers = {}
for _, file in get_files_from(servers_path) do
	local server_name = file:gsub("%.lua$", "")

	-- Check to not load itself
	if server_name ~= "init" then
		local server_opts = require("plugins.lsp.servers." .. server_name)
		servers[server_name] = server_opts
	end
end

return servers
