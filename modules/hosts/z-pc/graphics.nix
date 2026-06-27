{ self, inputs, ... }:
{

  flake.modules.nixos.z-pc.graphics =
    { pkgs, ... }:

    {
      hardware.graphics = {
        enable = true;
        extraPackages = with pkgs; [
          rocmPackages.clr
          rocmPackages.clr.icd
          rocmPackages.rocm-runtime
        ];
      };

      environment.systemPackages = with pkgs; [
        rocmPackages.rocm-smi
        rocmPackages.rocm-device-libs
        rocmPackages.hipcc
      ];
      services.xserver.videoDrivers = [ "amdgpu" ];
    };
}
