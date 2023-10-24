{ pkgs, home-manager, username, hostname, ... }:
{
  imports = [
    home-manager.nixosModules.default
    ./${hostname}/hardware-configuration.nix
    ./${hostname}
    ./hardware
  ];

  home-manager.users.${username} = { pkgs, ... }: {
    /* The home.stateVersion option does not have a default and must be set */
    home.stateVersion = "23.05";
    nixpkgs.config.allowUnfree = true;
  };
  # ---- System Configurations ----
  networking = {
    networkmanager.enable = true;
    hostName = "${hostname}";
  };
}