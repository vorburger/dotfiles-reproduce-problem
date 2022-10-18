# dotfiles-reproduce-problem

Reproducer for [this issue](https://github.com/orgs/community/discussions/35527) with [personalized GitHub Workspace dotfiles](https://docs.github.com/en/codespaces/customizing-your-codespace/personalizing-github-codespaces-for-your-account#dotfiles).

TL;DR if you remove the `< /dev/null` from `fisher` in the [`bootstrap.sh`](bootstrap.sh)
and set (a fork of) this repo as your Dotfiles Repo in GitHub Settings then it will "block"
the GitHub Codespace workspace setup.

See https://github.com/jorgebucaran/fisher/issues/742
