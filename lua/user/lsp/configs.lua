local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	return
end

local lspconfig = require("lspconfig")

local servers = { "jsonls"}

lsp_installer.setup({
	ensure_installed = servers,
    automatic_installation = true,
})

for _, server in pairs(servers) do
	local opts = {
		on_attach = require("user.lsp.handlers").on_attach,
		capabilities = require("user.lsp.handlers").capabilities,
	}
	local has_custom_opts, server_custom_opts = pcall(require, "user.lsp.settings." .. server)
	if has_custom_opts then
		opts = vim.tbl_deep_extend("force", opts, server_custom_opts)
	end
	lspconfig[server].setup(opts)
end

lspconfig.sumneko_lua.setup {}
require("flutter-tools").setup {
	debugger = { -- integrate with nvim dap + install dart code debugger
    	enabled = true,
    	run_via_dap = true, -- use dap instead of a plenary job to run flutter apps
    	register_configurations = function(paths)
      	require("dap").configurations.dart = {
			{
				type = "dart",
				request = "launch",
				name = "Launch Flutter Program",
				program = "${file}",
				cwd = "${workspaceFolder}",
				toolArgs = {"-d", "emulator-5554"}
			}
        }
    end,
  },
  dev_log = {
    enabled = false,
    open_cmd = "flutterlog", -- command to use to open the log buffer
  },
  dev_tools = {
    autostart = true, -- autostart devtools server if not detected
    auto_open_browser = true, -- Automatically opens devtools in the browser
  },
}

