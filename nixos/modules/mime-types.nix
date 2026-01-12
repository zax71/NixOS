{ ... }:
{
  xdg.mime = {
    enable = true;
    defaultApplications = {
      "application/pdf" = "nautilus.desktop";
      "application/vnd.apple.mpegurl" = "vlc.desktop";
      "application/x-extension-htm" = "firefox.desktop";
      "application/x-extension-html" = "firefox.desktop";
      "application/x-extension-shtml" = "firefox.desktop";
      "application/x-extension-xht" = "firefox.desktop";
      "application/x-extension-xhtml" = "firefox.desktop";
      "application/x-shellscript" = "neovim.desktop";
      "application/xhtml+xml" = "firefox.desktop";
      "application/zip" = "ark.desktop";
      "audio/x-mpegurl" = "vlc.desktop";
      "image/png" = "nomacs.desktop";
      "text/*" = "codium.desktop";
      "text/css" = "codium.desktop";
      "text/html" = "firefox.desktop";
      "text/markdown" = "neovim.desktop";
      "text/plain" = "codium.desktop";
      "video/*" = "umpv.desktop";
      "x-scheme-handler/chrome" = "firefox.desktop";
      "x-scheme-handler/http" = "firefox.desktop";
      "x-scheme-handler/https" = "firefox.desktop";
      "x-scheme-handler/mpv" = "open-in-mpv.desktop";
    };
  };
}
