local config = function()
	local llm = require("llm")
	local model_starcoder = {
		tokens_to_clear = { "<|endoftext|>" },
		fim = {
			enabled = true,
			prefix = "<fim_prefix>",
			middle = "<fim_middle>",
			suffix = "<fim_suffix>",
		},
		model = "bigcode/starcoder",
		context_window = 8192,
		tokenizer = {
			repository = "bigcode/starcoder",
		},
	}

	local model_codellama = {
		tokens_to_clear = { "<EOT>" },
		fim = {
			enabled = true,
			prefix = "<PRE> ",
			middle = " <MID>",
			suffix = " <SUF>",
		},
		model = "codellama/CodeLlama-13b-hf",
		context_window = 4096,
		tokenizer = {
			repository = "codellama/CodeLlama-13b-hf",
		},
	}

	local function select_model(model)
		if model == "starcoder" then
			return model_starcoder
		elseif model == "codellama" then
			return model_codellama
		end
	end

	local setup_table = select_model("codellama")
	table.insert(setup_table, {
		lsp = {
			bin_path = vim.fn.stdpath("data") .. "/mason/bin/llm-ls",
		},
		accept_keymap = "<C-f>",
		dismiss_keymap = "<S-Tab>",
	})

	llm.setup(setup_table)
end

return {
	"huggingface/llm.nvim",
	enabled = false,
	config = config,
}
