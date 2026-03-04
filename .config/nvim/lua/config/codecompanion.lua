require("codecompanion").setup({
  adapters = {
    openai = function()
      return require("codecompanion.adapters").extend("openai", {
        env = {
          api_key = "gpg --batch --quiet --decrypt ~/.config/nvim/api_keys/openai.txt.gpg",
        },
      })
    end,

    gemini = function()
      return require("codecompanion.adapters").extend("gemini", {
        env = {
          api_key = "cmd:gpg --batch --quiet --decrypt ~/.config/nvim/api_keys/gemini.txt.gpg",
        },
      })
    end,
  },
  strategies = {
    chat = {
      adapter = "gemini",
    },
  },
})
