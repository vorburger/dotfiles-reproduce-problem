#!/usr/bin/env bash
set -euxo pipefail

# https://github.com/jorgebucaran/fisher
curl -sL https://git.io/fisher -o /tmp/fisher
fish --debug="*" --debug-stack-frames=5 --private --print-rusage-self --command="source /tmp/fisher && fisher install jorgebucaran/fisher"
