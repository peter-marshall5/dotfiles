{ config, lib, pkgs, ... }: {

  imports = [
    ./base.nix
  ];

  boot.kernelParams = [ "quiet" ];
  boot.consoleLogLevel = 0;

  environment.noXlibs = false;

  documentation.nixos.enable = true;

  hardware.brillo.enable = true;

  services.upower.enable = true;

  services.flatpak.enable = true;

  services.greetd.enable = true;

  hardware.opengl.enable = true;

  xdg.portal.wlr.enable = true;
  xdg.portal = {
    enable = true;
    config.common.default = "gtk";
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
    ];
  };

  services.dbus.enable = true;
  programs.dconf.enable = true;

  networking.networkmanager.enable = true;
  networking.networkmanager.plugins = with pkgs; lib.mkForce [
    networkmanager-iodine
    networkmanager-openvpn
  ];

  networking.wireless.iwd.enable = true;
  networking.networkmanager.wifi.backend = "iwd";

  hardware.bluetooth.enable = true;

  services.printing.enable = true;
  hardware.sane.enable = true;
  nixpkgs.config.allowUnfree = true;
  hardware.sane.extraBackends = [ pkgs.hplipWithPlugin ];
  services.ipp-usb.enable = true;

  services.avahi.enable = true;
  services.avahi.nssmdns4 = true;

  systemd.network.wait-online.enable = false;

  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };

  networking.firewall = {
    allowedTCPPorts = [ 8080 ];
    allowedUDPPorts = [ 1900 5353 ];
    allowedUDPPortRanges = [{ from = 32768; to = 61000; }];
  };

  services.logind = {
    powerKey = "suspend";
    powerKeyLongPress = "poweroff";
    lidSwitchExternalPower = "lock";
  };

  security.pam.services.swaylock = {};

  services.greetd.command = let
    script = pkgs.writeScript "run-user-session" ''
      exec $HOME/.xsession
    '';
  in "${script}";

  services.chrony = {
    enable = true;
    enableRTCTrimming = true;
    extraConfig = ''
      makestep 0.1 10
    '';
  };

}
