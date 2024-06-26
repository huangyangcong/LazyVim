local home = os.getenv("HOME") or os.getenv("USERPROFILE")
return {
  {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    config = function(_, opts)
      require("chatgpt").setup({
        api_key_cmd = "gpg --decrypt " .. home .. "/workspace/tools/chatgpt.txt.gpg",
        actions_paths = { "~/.config/nvim/chatgpt-actions.json" },
        popup_input = {
          submit = "<Enter>",
        },
        openai_params = {
          model = "gpt-3.5-turbo",
        },
        openai_edit_params = {
          model = "gpt-3.5-turbo",
          temperature = 0,
          top_p = 1,
          n = 1,
        },
      })
      require("which-key").register({
        ["<leader>o"] = {
          name = "OpenAI's ChatGPT",
          c = { "<cmd>ChatGPT<CR>", "ChatGPT" },
          e = { "<cmd>ChatGPTEditWithInstruction<CR>", "Edit with instruction", mode = { "n", "v" } },
          g = { "<cmd>ChatGPTRun grammar_correction<CR>", "Grammar Correction", mode = { "n", "v" } },
          t = { "<cmd>ChatGPTRun translate<CR>", "Translate", mode = { "n", "v" } },
          k = { "<cmd>ChatGPTRun keywords<CR>", "Keywords", mode = { "n", "v" } },
          d = { "<cmd>ChatGPTRun docstring<CR>", "Docstring", mode = { "n", "v" } },
          a = { "<cmd>ChatGPTRun add_tests<CR>", "Add Tests", mode = { "n", "v" } },
          o = { "<cmd>ChatGPTRun optimize_code<CR>", "Optimize Code", mode = { "n", "v" } },
          s = { "<cmd>ChatGPTRun summarize<CR>", "ERROR: API Error", mode = { "n", "v" } },
          f = { "<cmd>ChatGPTRun fix_bugs<CR>", "Fix Bugs", mode = { "n", "v" } },
          x = { "<cmd>ChatGPTRun explain_code<CR>", "Explain Code", mode = { "n", "v" } },
          r = { "<cmd>ChatGPTRun roxygen_edit<CR>", "Roxygen Edit", mode = { "n", "v" } },
          l = { "<cmd>ChatGPTRun code_readability_analysis<CR>", "Code Readability Analysis", mode = { "n", "v" } },
        },
      })
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "folke/which-key.nvim",
    },
  },
}
