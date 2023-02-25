-------------------------------------------------
--   _____  __          __
--  / ____| \ \        / /
-- | |  __   \ \  /\  / / GameWarrior
-- | | |_ |   \ \/  \/ /  https://github.com/game-warrior
-- | |__| |    \  /\  /   @gamewarrior010@social.linux.pizza
--  \_____|     \/  \/    Neovim website: https://neovim.io/
-------------------------------------------------
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap =
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
	vim.cmd([[packadd packer.nvim]])
end
