#!/usr/bin/env zsh -li


# brew cleanup
brew cu -ay --cleanup
brew cleanup -s
rm -rf $(brew --cache)


# cask
if [ -f "$HOME/Library/Preferences/Aquamacs Emacs/Packages/Cask" ]; then
	(cd "$HOME/Library/Preferences/Aquamacs Emacs/Packages";cask upgrade-cask;cask install;cask update;cask clean-elc;cask build)
	/usr/local/bin/emacs --batch --eval '(byte-recompile-directory "~/Library/Preferences/Aquamacs Emacs/Packages")'
	sync
fi

if [ -f "$HOME/.emacs.d/Cask" ]; then
	(cd "$HOME/.emacs.d";cask upgrade-cask;cask install;cask update;cask clean-elc;cask build)
	/usr/local/bin/emacs --batch --eval '(byte-recompile-directory "~/.emacs.d")'
	sync
fi


### Added by Zplugin's installer
source '/Users/x/.zinit/bin/zinit.zsh'
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

zinit self-update
zinit update


# kymsu
kymsu cleanup
