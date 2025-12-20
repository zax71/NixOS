{ ... }:
{
  programs.virt-manager.enable = true;

  users.groups.libvirtd.members = [ "zax" ];

  virtualisation.libvirtd.enable = true;
  # virtualisation.libvirtd.qemu.ovmf.enable = true;

  virtualisation.spiceUSBRedirection.enable = true;
}
