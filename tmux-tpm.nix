# tmux-tpm.nix

{ pkgs }:

pkgs.runCommand "tmux-tpm" {} ''
  mkdir -p $out
  git clone https://github.com/tmux-plugins/tpm $out
''
