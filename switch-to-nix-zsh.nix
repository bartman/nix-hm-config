# this is a zsh snippet that can be injected into .zshrc
# it will switch to the nix shell
''
  # when interactive, remotely connected, and not in tmux session
  if [[ $- == *i* && -n "$SSH_CONNECTION" && -z "$TMUX" ]] ; then
    # if we have an executable nix zsh, switch to that instead
    _nix_zsh="$HOME/.nix-profile/bin/zsh"
    _nix_stat=$(stat -c '%i' $_nix_zsh)
    _zsh_stat=$(stat -c '%i' $SHELL)
    if [[ -x $_nix_zsh && -n "$_nix_stat" && $_nix_stat != $_zsh_stat ]] ; then
      echo switching $SHELL to Nix $_nix_zsh
      export SHELL="$_nix_zsh"
      exec "$SHELL" -i
    fi
    unset _nix_zsh _nix_stat _zsh_stat
  fi
''
