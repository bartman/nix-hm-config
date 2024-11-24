# my NixOS / home-manager config


# system preperation

You should walk through the "[system-configuration](https://gist.github.com/bartman/7ffc5fe7b38e9e736ce6ef58e2571f31#system-configuration)" section of the "[gist](https://gist.github.com/bartman/7ffc5fe7b38e9e736ce6ef58e2571f31)" where I converted a Raspbery Pi 5 with Debian 12 to use Nix.

TL;DR
- `sudo apt install nix-setup-systemd`
- `sudo /sbin/adduser $USER nix-users`
- `sudo tee -a /etc/nix/nix.conf <<<"experimental-features = nix-command flakes"`
- `sudo cp /usr/share/doc/nix-bin/examples/nix-profile-daemon.sh /etc/profile.d/`
- `exec $SHELL`


# backup

```sh
mv ~/.bashrc ~/.bashrc-debian
mv ~/.zshrc ~/.zshrc-debian
mv ~/.profile ~/.profile-debian
```
NOTE: it's ok if you don't have these, ignore that.

# how to use this

- `git clone git@github.com:bartman/nix.git ~/nix`
- `vim nix/flake.nix nix/home/nix`
   - if your user name is not "bart", change all instances to your name.
- `make -C nix`
