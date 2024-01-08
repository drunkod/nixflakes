{ config, lib, username, hostname, pkgs, NixOS-WSL, ... }:

{
  imports = [
    NixOS-WSL.nixosModules.wsl
  ];
  wsl = {
    enable = true;
    defaultUser = "${username}";
    nativeSystemd = true;
  };

  networking.hostName = "${hostname}";

}
