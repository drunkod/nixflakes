{ pkgs, home-manager, user, host, ... }:
{
  imports = [
    home-manager.nixosModules.default
  ];

  home-manager.users.${user} = { pkgs, ... }: {
    /* The home.stateVersion option does not have a default and must be set */
    home.stateVersion = "23.05";
    nixpkgs.config.allowUnfree = true;
    
    home.file = {
      ".config/hypr".source = ../.3monitor/hypr;
      ".config/swaylock".source = ../.3monitor/swaylock;
      ".config/waybar".source = ../.3monitor/waybar;
      ".config/wofi".source = ../.3monitor/wofi;
    };
  };
  # ---- System Configurations ----
  boot.binfmt.emulatedSystems = [ "aarch64-linux" ]; # For cross-compiling, https://discourse.nixos.org/t/how-do-i-cross-compile-a-flake/12062/6?u=srid
  networking = {
    hostName = "${host}";
  };

}
