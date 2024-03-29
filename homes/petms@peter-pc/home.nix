{ config, lib, pkgs, ... }: {

  imports = [ ../petms/home.nix ];

  home.packages = with pkgs; [
    swaybg
    playerctl
    noto-fonts
    noto-fonts-color-emoji
    hack-font
    material-symbols
    deploy-rs
    socat
    jq
    brightnessctl
    pamixer
    gnome.simple-scan
  ];

  programs.chromium = {
    enable = true;
    package = pkgs.ungoogled-chromium;
    extensions = [
      { id = "ghmbeldphafepmbegfdlkpapadhbakde"; }
      { id = "cjpalhdlnbpafiamejdnhcphjbkeiagm"; }
    ];
    commandLineArgs = [
      "--enable-features=VaapiVideoDecodeLinuxGL,VaapiVideoEncoder"
    ];
  };

  home.sessionVariables = {
    VK_DRIVER_FILES = "/run/opengl-driver/share/vulkan/icd.d/intel_icd.x86_64.json";
  };

  programs.foot = {
    enable = true;
    server.enable = true;
    settings = {
      main = {
        term = "xterm-256color";

        shell = "nu";

        include = "${pkgs.foot.themes}/share/foot/themes/nightfly";

        font = "Hack:size=11";
        dpi-aware = "no";

        line-height = "13";

        initial-window-size-pixels = "960x640";

        pad = "3x3";
      };

      mouse = {
        hide-when-typing = "yes";
      };
    };
  };

  programs.fuzzel = {
    enable = true;
    settings = {
     main = {
        terminal = "${pkgs.foot}/bin/foot";
        layer = "overlay";
        dpi-aware = true;
        horizontal-pad = 40;
        vertical-pad = 20;
        password-character = "•";
        icons-enabled = false;
      };
      colors = {
        background = "292e2eff";
        text = "ffffffff";
        selection-text = "ffffffff";
        selection = "282a2bff";
        match = "dfd212ff";
        selection-match = "dfd212ff";
        border = "5ccccdff";
      };
      border = {
        width = 2;
        radius = 3;
      };
    };
  };

  programs.eww = {
    enable = true;
    configDir = ./dotfiles/eww;
  };

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    settings = import ./config.nix;
  };

  xsession.enable = true;
  xsession.windowManager.command = "${pkgs.hyprland}/bin/Hyprland >/dev/null 2>/dev/null";

  services.mako = {
    enable = true;
    textColor = "#ffffff";
    borderColor = "#446270";
    backgroundColor = "#292E2E";
    borderSize = 1;
    borderRadius = 3;
    width = 400;
    height = 200;
    padding = "20";
    margin = "20";
    defaultTimeout = 15000;
  };

  programs.swaylock = {
    enable = true;
    package = pkgs.swaylock-effects;
    settings = {
      show-failed-attempts = true;
      grace = 2;
      fade-in = 0.4;
      screenshots = true;
      effect-blur = "128x3";
      effect-vignette = "0.9:0.1";
      no-unlock-indicator = true;
    };
  };

  services.swayidle = {
    enable = true;
    events = [{
      event = "before-sleep";
      command = "~/.nix-profile/bin/swaylock -fF --fade-in 0 --grace 0";
    }];
    timeouts = [{
      timeout = 300;
      command = "~/.nix-profile/bin/swaylock -fF";
    } {
      timeout = 360;
      command = "${pkgs.systemd}/bin/systemctl suspend";
    }];
  };

  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.numix-cursor-theme;
    name = "Numix-Cursor";
    size = 48;
  };

  fonts.fontconfig.enable = true;

  gtk = {
    enable = true;
    theme = {
      package = pkgs.libsForQt5.breeze-gtk;
      name = "Breeze";
    };

    iconTheme = {
      package = pkgs.gnome.adwaita-icon-theme;
      name = "Adwaita";
    };

    font = {
      name = "Sans";
      size = 11;
    };
  };

  services.mpd.enable = true;
  xdg.userDirs.enable = true;

}
