{ config, pkgs, ... }:

{
  home.username = "bart";
  home.homeDirectory = "/home/bart";
  home.stateVersion = "24.05"; # Please read the comment before changing.

  home.packages = with pkgs; [
    coreutils
    neovim
    gh
    fd
    ripgrep
    tree
    tmux

    # (nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # (writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # ----------------------------------------------------------------------
  # dot files
  home.file = {
    ".config/tmux".source = dot/tmux;
  };

  # ----------------------------------------------------------------------
  # environment
  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
    # this could aso be a file, like ~/.local/profile.sh
  };

  programs.man.generateCaches = true;

  # ----------------------------------------------------------------------
  # git
  programs.git = {
    enable = true;
    userName = "Bart Trojanowski";
    userEmail = "bart@jukie.neet";
  };

  # ----------------------------------------------------------------------
  # shell config
  programs.bash = {
    enable = true;
    historySize = 10000;
    historyFileSize = 100000;
    shellAliases = {
      vim = "nvim";
      ls = "ls --color=auto";
    };
    sessionVariables = {
    };
  };
  programs.zsh = {
    enable = true;
    defaultKeymap = "viins";
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;
    history.size = 100000;
    shellAliases = {
      vim = "nvim";
      ls = "ls --color=auto";
    };
    sessionVariables = {
    };
  };

  # ----------------------------------------------------------------------
  # shell extensions
  programs.atuin.enable = false;             # shell history
  programs.autojump.enable = false;          # cd-replacement
  programs.broot.enable = false;             # interactive fuzzy tree
  programs.carapace.enable = true;           # command line completion generator
  programs.dircolors.enable = true;          # LS_COLORS
  programs.eww.enable = false;               # widgets
  programs.eza.enable = true;                # ls replacement
  programs.fzf.enable = true;                # fuzzy finder (ctrl-R)
  programs.granted.enable = false;           # cloud stuff
  programs.hstr.enable = false;              # history search
  programs.keychain.enable = true;           # ssh/gpg key manager
  programs.kitty.shellIntegration = {
    enableBashIntegration = true;
    enableZshIntegration = true;
  };
  programs.mcfly.enable = false;             # history manager (fzf is better)
  programs.mise.enable = false;              # manages dev environments
  programs.navi.enable = true;               # cheat sheet for cli commands (ctrl-G)
  programs.nix-index.enable = true;          # fast nixpkgs index
  programs.oh-my-posh.enable = false;        # prompt theme engine
  programs.opam.enable = false;              # OCaml packages
  programs.pazi.enable = false;              # autojump helper
  programs.pyenv.enable = false;             # python package version manager
  programs.rbenv.enable = false;             # ruby package version manager
  programs.scmpuff.enable = false;           # git cli shortcuts
  programs.skim.enable = false;              # fuzzy finder (ctrl-R)
  programs.starship = {                      # prompt theme engine
    enable = true;
    settings = {
      add_newline = false;
      command_timeout = 1300;
      scan_timeout = 50;
      format= ''$username$hostname$directory$character'';
      right_format= ''$nix_shell$nodejs$lua$golang$rust$php$git_branch$git_commit$git_state$git_status'';
      character = {
        success_symbol = "[](bold green) ";
        error_symbol = "[✗](bold red) ";
      };
    };
  };
  programs.thefuck.enable = false;           # correct failed command
  programs.watson.enable = false;            # cli time tracker
  programs.wezterm.enable = false;           # terminal
  programs.yazi.enable = false;              # terminal file manager
  programs.zellij.enable = false;            # tmux successor
  programs.z-lua.enable = false;             # cd-replacement
  programs.zoxide.enable = true;             # cd-replacement

  # services
  #services.gpg-agent.enable = false;

  #programs.tmux = {
  #  enable = true;
  #  prefix = "C-a";
  #  keyMode = "vi";
  #};

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
