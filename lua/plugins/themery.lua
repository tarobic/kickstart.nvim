return {
   "zaldih/themery.nvim",
   lazy = false,
   config = function()
      require("themery").setup(
         {
            livePreview = true,
            themes = vim.fn.getcompletion("", "color"),
         })
   end
}
