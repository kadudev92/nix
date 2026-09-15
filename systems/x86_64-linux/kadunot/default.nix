{ lib, namespace, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  networking.hostName = "kadunot";

  # Dual monitor (ultrawide + laptop panel) — add to imports above:
  # (lib.${namespace}.dualMonitorHostModule "HDMI-A-1")
  # Unsigned systemd-boot (no Lanzaboote keys).
  ${namespace}.boot = {
    secureBoot = false;
  };
}
