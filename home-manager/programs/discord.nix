{ ... }:
{

  programs.nixcord = {
    enable = true;
    config = {
      themeLinks = [
        "https://raw.githubusercontent.com/zax71/discord-themes/refs/heads/main/theme.css"
      ];
      #frameless = true; # set some Vencord options
      plugins = {
        blurNSFW.enable = true;
        clearURLs.enable = true;
        crashHandler.enable = true;
        dontRoundMyTimestamps.enable = true;
        friendsSince.enable = true;
        fullSearchContext.enable = true;
        memberCount.enable = true;
        noOnboardingDelay.enable = true;
        noPendingCount.enable = true;
        noReplyMention.enable = true;
        typingIndicator.enable = true;
      };
    };
  };
}
