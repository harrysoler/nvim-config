return {
	"barrett-ruth/live-server.nvim",
	build = [[
    if ! live-server &>/dev/null; then
        npm install -g live-server"
    fi
    ]],
	cmd = { "LiveServerStart", "LiveServerStop" },
	config = true,
}
