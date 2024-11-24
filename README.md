# my NixOS / home-manager config


# preperation

You should walk through the "[system-configuration](https://gist.github.com/bartman/7ffc5fe7b38e9e736ce6ef58e2571f31#system-configuration)" section of the "[gist](https://gist.github.com/bartman/7ffc5fe7b38e9e736ce6ef58e2571f31)" where I converted a Raspbery Pi 5 with Debian 12 to use Nix.


# how to use this

```sh
git clone git@github.com:bartman/nix.git ~/nix
home-manager switch --flake ~/nix#bart
```
NOTE: you should replace my name ("Bart") with your name in all these files, if you want to use this.
