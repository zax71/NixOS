{ ... }:
{
  services = {
    printing.enable = true; # CUPS
    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };
  };
}
