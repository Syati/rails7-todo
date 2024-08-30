#!/usr/bin/env bash
set -e

USERNAME="${USERNAME:-"${_REMOTE_USER:-"automatic"}"}"
RUBY_VERSION=${RUBY_VERSION:-undefined}

su ${USERNAME} -c 'curl https://mise.run | sh'

bash_mise='eval "$(~/.local/bin/mise activate bash)"'
su ${USERNAME} -c "echo '$bash_mise' >> ~/.bashrc"

zsh_mise='eval "$(~/.local/bin/mise activate zsh)"'
su ${USERNAME} -c "echo '$zsh_mise' >> ~/.zshrc"

mkdir -p /.jbdevcontainer/data && chmod -R 777 /.jbdevcontainer
su ${USERNAME} -c bash -c "~/.local/bin/mise install ruby@${RUBY_VERSION}"

su ${USERNAME} -c "mkdir -p ~/.local/share"
su ${USERNAME} -c "ln -s /.jbdevcontainer/data/mise ~/.local/share/mise"
