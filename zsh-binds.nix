''
    bindkey -v "^[[3~" delete-char
    bindkey -v "^[[5~" backward-word
    bindkey -v "^[[6~" forward-word

    bindkey -v "^[[A" history-beginning-search-backward
    bindkey -v "^[[B" history-beginning-search-forward

    bindkey -v "^A" beginning-of-line
    bindkey -v "^E" end-of-line
    bindkey -v "^K" kill-line
    bindkey -v "^L" clear-screen
    bindkey -v "^U" vi-kill-line
    bindkey -v "^V" vi-quoted-insert
    bindkey -v "^W" vi-backward-kill-word

    bindkey -v "^N" down-history
    bindkey -v "^P" up-history

    # alow for editing of the command line
    # http://zshwiki.org/home/examples/zlewidgets
    autoload -U    edit-command-line
    zle -N         edit-command-line
    bindkey -a 'v' edit-command-line

    # Shift-Tab reverse through list of completions
    bindkey '^[[Z' reverse-menu-complete
''
