{ config, pkgs, ... }:

{
  home.username = "lbc";
  home.homeDirectory = "/home/lbc";
  programs.git.enable = true;
  home.stateVersion = "25.11";
  programs.bash = {
    enable = true;
    shellAliases = {
      nrs = "sudo nixos-rebuild switch --flake ~/nixos-dotfiles#nixos-lbc";
    };
  };
}
