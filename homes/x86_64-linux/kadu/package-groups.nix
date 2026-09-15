# Flip groups on/off here, then `nh os switch`.
# Group names come from lib/packages.nix (lib.mine.packageGroups).
{ lib, ... }:

let
  toggles = {
    ai = true;
    api = true;
    audio = true;
    browsers = true;
    c = true;
    cli = true;
    clipboard = true;
    communication = true;
    creator = true;
    databases = true;
    dioxus = true;
    dotnet = true;
    editors = true;
    fonts = true;
    gtk = true;
    ides = true;
    js = true;
    jvm = true;
    learning = true;
    mail = true;
    media = true;
    monitoring = true;
    networking = false; # Cisco Packet Tracer 9 (needs NetAcad .deb in nix store)
    nix = true;
    notes = true;
    office = true;
    php = true;
    proton = true;
    python = true;
    rust = true;
    tauri = true;
    vcs = true;
    viewers = true;
    wayland = true;
  };
in
{
  mine.packages = lib.recursiveUpdate {
    enable = true;
  } (lib.mine.packageGroupsFromToggles toggles);
}
