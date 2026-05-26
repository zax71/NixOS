{ ... }:
{
  programs.zellij = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      theme = "everforest-dark";
      show_startup_tips = false;
    };
  };
}
