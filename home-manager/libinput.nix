{pkgs, lib, config, ... }: {
    services.libinput = {
        enable = true;
        mouse = {
            scrollMethod = "button";
            scrollButton = 2;
        };
    };
}
