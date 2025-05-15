{ pkgs, ... }:
let
  tex = (
    pkgs.texlive.combine {
      inherit (pkgs.texlive)
        scheme-full
        ;
    }
  );
in
{
  environment.systemPackages = with pkgs; [
    tex
  ];
}
