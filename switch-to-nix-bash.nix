# this is a bash snippet that can be injected into .bashrc
# it will switch to the nix shell
''
  # when interactive, remotely connected, and not in tmux session
  if [[ $- == *i* && -n "$SSH_CONNECTION" && -z "$TMUX" ]] ; then
    # if we have an executable nix bash, switch to that instead
    _nix_bash="$HOME/.nix-profile/bin/bash"
    if [[ -x $_nix_bash && ! $nix_bash -ef $SHELL ]] ; then
      echo switching $SHELL to Nix $_nix_zsh
      export SHELL="$_nix_bash"
      exec "$SHELL" -i
    fi
    unset _nix_bash
  fi
''
