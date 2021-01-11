#/usr/bin/env zsh -li

(
    cd "$NVM_DIR"
    git fetch --tags origin
    git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`
) && \. "$NVM_DIR/nvm.sh"

nvm install 'lts/*' --reinstall-packages-from=current
nvm install lts/* --reinstall-packages-from=default --latest-npm
nvm install unstable --reinstall-packages-from=unstable
nvm install iojs --reinstall-packages-from=iojs
nvm install node --reinstall-packages-from=node
