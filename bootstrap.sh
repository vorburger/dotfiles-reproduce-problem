#!/usr/bin/env bash
set -euxo pipefail

# See https://github.com/orgs/community/discussions/35527 for background about the problem that this illustrates

# GitHub Codespace Creation STDIN runs this hook script with STDIN set to e.g. pipe:[131656]
ls -l /proc/$$/fd/0

# One possible way to work around https://github.com/jorgebucaran/fisher/issues/742,
# is to redirect STDIN to /dev/null like this here; But it's more fine grained to do it
# only locally for fisher with < /dev/null as done below, instead for everything.
# exec </dev/null

# This would block this script, both if it is run interactively and on GitHub Codespace Creation
# cat

# This works just fine (fish --command runs that command, it does NOT start a new interactive shell)
fish --command="echo hi"

## https://github.com/jorgebucaran/fisher
curl -sL https://git.io/fisher -o /tmp/fisher
# fish --debug="*" --debug-stack-frames=5 --private --no-config --print-rusage-self --command="source /tmp/fisher && fisher install jorgebucaran/fisher"
fish --private --no-config --command="set fish_trace 1 && source /tmp/fisher && fisher install jorgebucaran/fisher </dev/null"
