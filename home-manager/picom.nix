{config, ...}:

{
    services.picom = {
        enable = true;
        vSync = true; # Screen tearing fix
        inactiveOpacity = 0.8;
        fade = true;
    };
}
