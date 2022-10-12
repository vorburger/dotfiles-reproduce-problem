#!/usr/bin/env bash
set -euxo pipefail

# https://github.com/jorgebucaran/fisher
curl -sL https://git.io/fisher -o /tmp/fisher
fish -c "source /tmp/fisher && fisher install jorgebucaran/fisher"
