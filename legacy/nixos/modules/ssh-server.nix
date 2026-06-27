{ ... }:
{
  services.openssh = {
    enable = true;
    ports = [ 22 ];
    settings = {
      PasswordAuthentication = false;
      X11Forwarding = true;
      PermitRootLogin = "no"; # "yes", "without-password", "prohibit-password", "forced-commands-only", "no"
    };
  };

  #networking.firewall.allowedTCPPorts = [ 22 ];

  # This is a public key, it's fine
  users.users."zax".openssh.authorizedKeys.keys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCDpNeAP/533+8iTe4CNYjFS5trcOp1aoe8tS5fStAEgVSH3dBMUOeu4W5qsqwB1zlh9s3NuvyCggwv3/4iT6MyF9fZz9rxV3WhaiHC5H6IKNSHTY37F0+fAGAfqIXF+yETWBxMeUr/jI/E+yubWWI85g2x9lTltcmWMG+BLzNOxeTtHdHGbSdlfo039nDkeaPLsGiwTSZyBCY6bVzOy6KbGbEvLJKDU/KBw8dLXJ73a+mgL4flnQgyfUyLPptgjDHEm3ogHKls2+am+3Ar3ORUbISE7d+DQO3gIb71SMp8sZnvP3dAOeTA2pL/+YdaVamQ5bfkg/BIDroKlEm5G19HnvccISmdLMCSxT7tgKROymfUOUkjDLFbVlTj0uIidF5odnxqKxcPq0feEytpRckawwK6eWb8qnqwIueB+pfURXj17TZhjD5HBrdEdYrB5oVfJQ3daekgWV7/ErVner0PdzVFtVQn+Z9gG9k2RZ50oSCfHRNip/bVOhGeO/mQYfc="
  ];
}
