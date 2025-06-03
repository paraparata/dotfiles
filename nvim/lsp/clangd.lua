-- C/C++
return {
	on_attach = function(client)
		client.server_capabilities.signatureHelpProvider = false
	end,
	filetypes = { "h", "c", "cpp", "cc" },
	cmd = { "clangd", "--background-index", "--clang-tidy" },
	init_options = {
		fallback_flags = { "-std=c11" },
	},
	single_file_support = true,
	root_markers = {
		".clangd",
		".clang-tidy",
		".clang-format",
		"compile_commands.json",
		"compile_flags.txt",
		"configure.ac",
		".git",
	},
}
