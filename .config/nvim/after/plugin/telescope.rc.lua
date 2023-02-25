-------------------------------------------------
--   _____  __          __
--  / ____| \ \        / /
-- | |  __   \ \  /\  / / GameWarrior
-- | | |_ |   \ \/  \/ /  https://github.com/game-warrior
-- | |__| |    \  /\  /   @gamewarrior010@social.linux.pizza
--  \_____|     \/  \/    Neovim website: https://neovim.io/
-------------------------------------------------
--
local status, telescope = pcall(require, "telescope")
if not status then
	return
end

telescope.setup({
	extensions = {
		file_browser = {
			theme = "ivy",
			-- disables netrw and use telescope-file-browser in its place
			hijack_netrw = true,
			mappings = {
				["i"] = {
					-- your custom insert mode mappings
				},
				["n"] = {
					-- your custom normal mode mappings
				},
			},
		},
	},
})

telescope.load_extension("file_browser")
