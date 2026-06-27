{
  pkgs,
  inputs,
  config,
  ...
}:
{
  imports = [ inputs.sops-nix.nixosModules.sops ];

  sops.defaultSopsFile = ./secrets.yaml;
  sops.defaultSopsFormat = "yaml";
  # If this is not available, system will still build just without secrets
  sops.age.keyFile = "/home/zax/.config/sops/age/keys.txt";

  sops.secrets."shares/z-nas/password" = { };
  sops.secrets."shares/z-nas/username" = { };
  # Create the file that can be read by the CIFS used for mounting network shares. see modules/shares.nix
  sops.templates."z-nas-credentials".content = ''
    username=${config.sops.placeholder."shares/z-nas/username"}
    password=${config.sops.placeholder."shares/z-nas/password"}
  '';
}
