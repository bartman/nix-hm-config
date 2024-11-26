# this is a bash snippet that can be injected into .bashrc
# it will switch to the nix shell
''
  # when interactive, remotely connected, and not in tmux session
  if [[ -n "$BASH_VERSION" && $- == *i* && -n "$SSH_CONNECTION" && -z "$TMUX" ]] ; then
    #echo "consider switching to Nix bash"
    # if we have an executable nix bash, switch to that instead
    _run_bash="$(readlink /proc/$$/exe)"
    _nix_bash="$HOME/.nix-profile/bin/bash"
    if [[ -x $_nix_bash && ! $nix_bash -ef $_run_bash ]] ; then
      #echo switching $_run_bash to Nix $_nix_zsh
      export SHELL="$_nix_bash"
      exec "$SHELL" -i
    fi
    if [[ -d $HOME/.nix-profile/bin ]] && ! which home-manager &>/dev/null 2>&1 ; then
      # sometimes Nix/bin is not in the path, but why?
      export PATH="$HOME/.nix-profile/bin:$PATH"
    fi
    unset _nix_bash _run_bash
  fi
''
