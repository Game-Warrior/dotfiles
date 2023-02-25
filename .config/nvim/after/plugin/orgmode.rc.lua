-------------------------------------------------
--   _____  __          __
--  / ____| \ \        / /
-- | |  __   \ \  /\  / / GameWarrior
-- | | |_ |   \ \/  \/ /  https://github.com/game-warrior
-- | |__| |    \  /\  /   @gamewarrior010@social.linux.pizza
--  \_____|     \/  \/    Neovim website: https://neovim.io/
-------------------------------------------------

local status, orgmode = pcall(require, "orgmode")
if not status then
	return
end

orgmode.setup({
	org_agenda_files = { "~/Documents/Schedule.org" },
	org_default_notes_file = "~/Documents/refile.org",
})

orgmode.setup_ts_grammar()
