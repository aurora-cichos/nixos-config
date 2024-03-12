{ pkgs, config, ... }: {
  services = {
    dbus = {
      packages = with pkgs; [dconf gcr udisks2];
      enable = true;
    };
    udev.packages = with pkgs; [gnome.gnome-settings-daemon android-udev-rules];
    journald.extraConfig = ''
      SystemMaxUse=50M
      RuntimeMaxUse=10M
    '';
    udisks2.enable = true;
    # profile-sync-daemon
    psd = {
      enable = true;
      resyncTimer = "10m";
    };
  };

  environment.variables = {
    EDITOR = "nvim";
  };
  environment.systemPackages = with pkgs; [
    git
    uutils-coreutils-noprefix
    btrfs-progs
    cifs-utils
    appimage-run
    starship
  ];

  time = {
    timeZone = "America/Denver";
    hardwareClockInLocalTime = true;
  };
  hardware.ledger.enable = true;

  i18n = let
    defaultLocale = "en_US.UTF-8";
  in {
    inherit defaultLocale;
    extraLocaleSettings = {
      LANG = defaultLocale;
      LC_COLLATE = defaultLocale;
      LC_CTYPE = defaultLocale;
      LC_MESSAGES = defaultLocale;
      LC_ADDRESS = defaultLocale;
      LC_IDENTIFICATION = defaultLocale;
      LC_MEASUREMENT = defaultLocale;
      LC_MONETARY = defaultLocale;
      LC_NAME = defaultLocale;
      LC_NUMERIC = defaultLocale;
      LC_PAPER = defaultLocale;
      LC_TELEPHONE = defaultLocale;
      LC_TIME = defaultLocale;
    };
  };

  programs.nix-ld.enable = true;
  systemd = let
    extraConfig = ''
      DefaultTimeoutStopSec=15s
    '';
  in {
    inherit extraConfig;
    user = {inherit extraConfig;};
    # services."getty@tty1".enable = false;
    # services."autovt@tty1".enable = false;
    # services."getty@tty7".enable = false;
    # services."autovt@tty7".enable = false;
    # Systemd OOMd
    oomd.enableRootSlice = true;

    tmpfiles.rules = [
      "D /nix/var/nix/profiles/per-user/root 755 root root - -"
    ];
  };
}
