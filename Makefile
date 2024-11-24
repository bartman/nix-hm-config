SHELL = $(wildcard ~/.nix-profile/bin/bash)
PWD   = $(shell pwd)

all:
	home-manager switch --flake ${PWD}/#bart
