#!/usr/bin/env zsh -li


# brew cleanup
brew cu -ay --cleanup
brew cleanup -s
rm -rf $(brew --cache)

### Added by Zplugin's installer
source '/Users/x/.zinit/bin/zinit.zsh'
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

zinit self-update
zinit update

# kymsu
kymsu cleanup
