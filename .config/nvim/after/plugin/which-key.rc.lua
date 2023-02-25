-------------------------------------------------
--   _____  __          __
--  / ____| \ \        / /
-- | |  __   \ \  /\  / / GameWarrior
-- | | |_ |   \ \/  \/ /  https://github.com/game-warrior
-- | |__| |    \  /\  /   @gamewarrior010@social.linux.pizza
--  \_____|     \/  \/    Neovim website: https://neovim.io/
-------------------------------------------------

local status, which_key = pcall(require, "which-key")
if not status then
	return
end

which_key.setup({
	-- your configuration comes here
	-- or leave it empty to use the default settings
})
