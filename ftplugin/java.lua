local home = os.getenv("HOME")
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = "/home/harry/.eclipse/jdtls/" .. project_name

local config = {
	settings = {
		java = {
			format = {
				settings = {
					url = home .. "/.local/share/eclipse/eclipse-java-google-style.xml",
					profile = "GoogleStyle",
				},
			},
			signatureHelp = { enabled = true },
			completion = {
				favoriteStaticMembers = {
					"org.hamcrest.MatcherAssert.assertThat",
					"org.hamcrest.Matchers.*",
					"org.hamcrest.CoreMatchers.*",
					"org.junit.jupiter.api.Assertions.*",
					"java.util.Objects.requireNonNull",
					"java.util.Objects.requireNonNullElse",
					"org.mockito.Mockito.*",
				},
				filteredTypes = {
					"com.sun.*",
					"io.micrometer.shaded.*",
					"java.awt.*",
					"jdk.*",
					"sun.*",
				},
			},
		},
	},
	cmd = {
		"/usr/lib/jvm/java-17-openjdk/bin/java",

		"-Declipse.application=org.eclipse.jdt.ls.core.id1",
		"-Dosgi.bundles.defaultStartLevel=4",
		"-Declipse.product=org.eclipse.jdt.ls.core.product",
		"-Dlog.protocol=true",
		"-Dlog.level=ALL",
		"-Xmx1g",
		"--add-modules=ALL-SYSTEM",
		"--add-opens",
		"java.base/java.util=ALL-UNNAMED",
		"--add-opens",
		"java.base/java.lang=ALL-UNNAMED",

		"-javaagent:" .. home .. "/.local/share/eclipse/lombok.jar",

		"-jar",
		vim.fn.glob("/usr/share/java/jdtls/plugins/org.eclipse.equinox.launcher_*.jar"),

		"-configuration",
		"/usr/share/java/jdtls/config_linux",

		"-data",
		workspace_dir,
	},

	root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew" }),
}

require("jdtls").start_or_attach(config)
