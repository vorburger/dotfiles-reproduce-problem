#!/usr/bin/env bash
set -euxo pipefail

# Fix https://github.com/orgs/community/discussions/35527
ls -l /proc/$$/fd/0
cat
exit 0
# It's e.g. pipe:[131656] when GitHub Codespace Creation runs this hook script
exec </dev/null
# Now it's /dev/null (obviously)
ls -l /proc/$$/fd/0

# GitHub codespaces comes (as of mid October 2022) with old Fish 3.1.0; let's upgrade it
sudo apt-add-repository -y ppa:fish-shell/release-3
sudo apt update -y
sudo apt install -y fish

# This works just fine (fish --command runs that command, it does NOT start a new interactive shell)
fish --command="echo hi"

## https://github.com/jorgebucaran/fisher
curl -sL https://git.io/fisher -o /tmp/fisher
# fish --debug="*" --debug-stack-frames=5 --private --no-config --print-rusage-self --command="source /tmp/fisher && fisher install jorgebucaran/fisher"
fish --private --no-config --command="set fish_trace 1 && source /tmp/fisher && fisher install jorgebucaran/fisher"
