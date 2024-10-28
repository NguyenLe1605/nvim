return { -- Autoformat
	"stevearc/conform.nvim",
	lazy = false,
	keys = {
		{
			"<leader>f",
			function()
				require("conform").format({ async = true, lsp_fallback = true })
			end,
			mode = "",
			desc = "[F]ormat buffer",
		},
	},
	opts = {
		notify_on_error = false,
		format_on_save = function(bufnr)
			-- Disable "format_on_save lsp_fallback" for languages that don't
			-- have a well standardized coding style. You can add additional
			-- languages here or re-enable it for the disabled ones.
			-- local disable_filetypes = { c = true, cpp = true }
			return {
				timeout_ms = 500,
				lsp_fallback = true,
			}
		end,
		formatters = {
			cpp_fmt = {
				command = "clang-format",
				args = { "--fallback-style", "google" },
			},
			c_fmt = {
				command = "clang-format",
				args = { "--fallback-style", "gnu" },
			},
		},
		formatters_by_ft = {
			lua = { "stylua" },
			-- cpp = { "cpp_fmt" },
			cmake = { "cmake_format" },
			rust = { "rustfmt" },
			-- Conform can also run multiple formatters sequentially
			python = { "isort", "black" },
			--
			-- You can use a sub-list to tell conform to run *until* a formatter
			-- is found.
			-- javascript = { { "prettierd", "prettier" } },
		},
	},
}
