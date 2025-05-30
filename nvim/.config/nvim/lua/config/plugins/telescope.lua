return {
    {
	'nvim-telescope/telescope.nvim',
	tag = '0.1.8',
	dependencies = {
	    'nvim-lua/plenary.nvim',
	    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
	},
	config = function ()
	    require('telescope').setup {
		extensions = {
		    fzf = {}
		}
	    }

	    require('telescope').load_extension('fzf')

	    vim.keymap.set("n", "<space>fh", require ('telescope.builtin').help_tags)
	    vim.keymap.set("n", "<space>fd", require('telescope.builtin').find_files)
	    vim.keymap.set("n", "<space>en", function ()
		require('telescope.builtin').find_files {
		cwd = vim.fn.stdpath("config")
	    }
	end)

	require "config.plugins.telescope.multigrep".setup()
    end
    },
    {
	"nvim-telescope/telescope-ui-select.nvim",
	config = function()
	    require("telescope").setup({
		extensions = {
		    ["ui-select"] = {
			require("telescope.themes").get_dropdown {
			}
		    }
		}
	    })
	    require("telescope").load_extension("ui-select")
	end
    },
}

