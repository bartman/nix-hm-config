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
    nix-index

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
    #bashrcExtra = "";
    #initExtra = "";
    profileExtra = (import ./switch-to-nix-bash.nix);
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
    #sessionVariables = { };
    #envExtra = "";
    initExtra = ''
    bindkey -v "^E" end-of-line
    bindkey -v "^N" down-history
    bindkey -v "^P" up-history
    '';
    #initExtraBeforeCompInit = "";
    #loginExtra = "";
    #logoutExtra = "";
    initExtraFirst = (import ./switch-to-nix-zsh.nix);
  };

  # ----------------------------------------------------------------------
  # shell extensions
  #programs.atuin.enable = true;             	# shell history
  #programs.autojump.enable = true;          	# cd-replacement
  #programs.broot.enable = true;             	# interactive fuzzy tree
  programs.carapace.enable = true;           	# command line completion generator
  programs.dircolors.enable = true;          	# LS_COLORS
  #programs.eww.enable = true;               	# widgets
  programs.eza.enable = true;                	# ls replacement
  programs.fzf.enable = true;                	# fuzzy finder (ctrl-R)
  #programs.granted.enable = true;           	# cloud stuff
  #programs.hstr.enable = true;              	# history search
  programs.keychain.enable = true;           	# ssh/gpg key manager
  programs.kitty.shellIntegration = {
    enableBashIntegration = true;
    enableZshIntegration = true;
  };
  #programs.mcfly.enable = true;             	# history manager (fzf is better)
  #programs.mise.enable = true;              	# manages dev environments
  programs.navi.enable = true;               	# cheat sheet for cli commands (ctrl-G)
  programs.nix-index.enable = true;          	# fast nixpkgs index
  #programs.oh-my-posh.enable = true;        	# prompt theme engine
  #programs.opam.enable = true;              	# OCaml packages
  #programs.pazi.enable = true;              	# autojump helper
  #programs.pyenv.enable = true;             	# python package version manager
  #programs.rbenv.enable = true;             	# ruby package version manager
  #programs.scmpuff.enable = true;           	# git cli shortcuts
  #programs.skim.enable = true;              	# fuzzy finder (ctrl-R)
  imports = [ ./starship.nix ];
  #programs.thefuck.enable = true;           	# correct failed command
  #programs.watson.enable = true;            	# cli time tracker
  #programs.wezterm.enable = true;           	# terminal
  #programs.yazi.enable = true;              	# terminal file manager
  #programs.zellij.enable = true;            	# tmux successor
  #programs.z-lua.enable = true;             	# cd-replacement
  programs.zoxide.enable = true;             	# cd-replacement

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
