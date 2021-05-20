#!/bin/bash

set -e

if [ "x$3" != "x" ]; then
    echo $3 > .git_credentials
    git config --global credential.helper "store --file $PWD/.git_credentials"
    git config --global "url.https://github.com/.insteadOf" "ssh://git@github.com/"
    git config --global --add "url.https://github.com/.insteadOf" "git@github.com:"
fi

echo "Setting up local Cargo env"
mkdir -p .cargo
ln -sf $CARGO_HOME/bin .cargo/
ln -sf $CARGO_HOME/config .cargo/
export CARGO_HOME=$PWD/.cargo


if [ "x$2" != "x" ]; then
    (cd $2 && $CARGO_HOME/bin/cargo $1)
else 
    $CARGO_HOME/bin/cargo $1
fi
