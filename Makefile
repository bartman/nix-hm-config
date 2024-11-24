PWD   = $(shell pwd)

all:
	nix run home-manager -- switch --flake ${PWD}/#bart
