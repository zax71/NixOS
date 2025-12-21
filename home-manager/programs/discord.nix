{ ... }:
{

  programs.nixcord = {
    enable = true;
    #vesktop.enable = false;
    discord.openASAR.enable = false;
    config = {
      themeLinks = [
        "https://raw.githubusercontent.com/zax71/discord-themes/refs/heads/main/theme.css"
      ];
      plugins = {
        blurNsfw.enable = true;
        clearUrLs.enable = true;
        crashHandler.enable = true;
        dontRoundMyTimestamps.enable = true;
        friendsSince.enable = true;
        fullSearchContext.enable = true;
        memberCount = {
          enable = true;
          memberList = false;
        };
        noOnboardingDelay.enable = true;
        noPendingCount.enable = true;
        noReplyMention.enable = true;
        typingIndicator.enable = true;
      };
    };
  };
}
