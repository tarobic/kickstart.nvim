return {
	"VonHeikemen/fine-cmdline.nvim",
	enabled = false,
	requires = {
		{ "MunifTanjim/nui.nvim" },
	},
	opts = {
		set_keymaps = function(imap, feedkeys)
			local fn = require("fine-cmdline").fn
			imap("<C-p>", fn.up_search_history)
			imap("<C-n>", fn.down_search_history)
		end,
	},
}
