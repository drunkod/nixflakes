{ config, pkgs, username, ... }:
{
# Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${username} = {
    shell = pkgs.bash;
    password = "temp123";
    isNormalUser = true;
    extraGroups = [ "input" "networkmanager" "netdev" ];
  };
}