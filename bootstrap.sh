#!/usr/bin/env bash
set -euxo pipefail

# This works just fine (fish --command runs that command, it does NOT start a new interactive shell)
fish --command="echo hi"

## https://github.com/jorgebucaran/fisher
curl -sL https://git.io/fisher -o /tmp/fisher
fish --debug="*" --debug-stack-frames=5 --private --no-config --print-rusage-self --command="source /tmp/fisher && fisher install jorgebucaran/fisher"
