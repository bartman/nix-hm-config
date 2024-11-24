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
  programs.starship = {                         # prompt theme engine
    enable = true;
    settings = {
      add_newline = false;
      command_timeout = 1300;
      scan_timeout = 50;
      format= ''$username$hostname$directory$character'';
      right_format= ''$nix_shell$git_branch$git_commit$git_state$git_status'';
      fill = {
        symbol = " ";
      };
      line_break = {
        disabled = true;
      };
      username = {
        format = "[$user]($style) ";
        style_root = "red bold";
        style_user = "yellow bold";
      };
      hostname = {
        ssh_only = true;
        ssh_symbol = "🌐 ";
        trim_at = ".";
        format = "[$ssh_symbol$hostname]($style) ";
        style = "green dimmed bold";
      };
      directory = {
        truncate_to_repo = true;
        format = "[ﱮ $path ]($style)";
        style = "fg:#3B76F0";
      };
      nix_shell = {
        format = "[$symbol$state( \\($name\\))]($style) ";
        symbol = "❄️  ";
        style = "bold blue";
        impure_msg = "impure";
        pure_msg = "pure";
        unknown_msg = "";
      };
      git_branch = {
        symbol = " ";
        format = "[ $symbol$branch(:$remote_branch) ]($style)";
        style = "fg:#FCF392";
      };
      git_metrics = {
        format = "([+$added]($added_style) )([-$deleted]($deleted_style) )";
        ignore_submodules = false;
        added_style = "bold green";
        deleted_style = "bold red";
        only_nonzero_diffs = true;
      };
      git_commit = {
        format = "[\\($hash$tag\\)]($style) ";
        style = "green bold";
        commit_hash_length = 7;
        only_detached = true;
        tag_symbol = " 🏷  ";
        tag_disabled = true;
        tag_max_candidates = 0;
      };
      git_state = {
        format = "\\([$state( $progress_current/$progress_total)]($style)\\) ";
        style = "bold yellow";
        rebase = "REBASING";
        merge = "MERGING";
        revert = "REVERTING";
        cherry_pick = "CHERRY-PICKING";
        bisect = "BISECTING";
        am = "AM";
        am_or_rebase = "AM/REBASE";
      };
      git_status = {
        format = "([$all_status$ahead_behind]($style) )";
        style = "red bold";
        stashed = "📦";
        ahead = "⬆$count";
        behind = "⬇$count";
	up_to_date = "";
        diverged = "↕";
        conflicted = "🚫";
        deleted = "✘";
        renamed = "»";
        modified = "🖍️"; # 🖊🖋️🖍️
        staged = "+";
        untracked = "?";
        typechanged = "";
        ignore_submodules = false;
      };
      character = {
        success_symbol = "[❯](bold green)";
        vicmd_symbol = "[❮](bold green)";
        error_symbol = "[✗](bold red)";
      };
    };
  };
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
