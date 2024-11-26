# this is a zsh snippet that can be injected into .zshrc
# it will switch to the nix shell
''
  # when interactive, remotely connected, and not in tmux session
  if [[ -n "$ZSH_VERSION" && $- == *i* && -n "$SSH_CONNECTION" && -z "$TMUX" ]] ; then
    #echo "consider switching to Nix zsh"
    # if we have an executable nix zsh, switch to that instead
    _nix_zsh="$(readlink -f "$HOME/.nix-profile/bin/zsh")"
    _nix_stat=$(stat -c '%i' $_nix_zsh)
    _run_zsh="$(readlink -f /proc/$$/exe)"
    _run_stat=$(stat -c '%i' $_run_zsh)
    if [[ -x $_nix_zsh && -n "$_nix_stat" && $_nix_stat != $_run_stat ]] ; then
      #echo switching $_run_zsh to Nix $_nix_zsh
      export SHELL="$_nix_zsh"
      unset __HM_SESS_VARS_SOURCED __HM_ZSH_SESS_VARS_SOURCED
      exec "$_nix_zsh" -i -l
    fi
    if [[ -d $HOME/.nix-profile/bin ]] ; then
      # sometimes Nix/bin is not in the path, but why?
      path=( "$HOME/.nix-profile/bin" $path )
      typeset -U path
    fi
    #echo "path=( $path )"
    unset _nix_zsh _nix_stat _run_zsh _run_stat
  fi
''
