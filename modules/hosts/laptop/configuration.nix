{
  self,
  inputs,
  ...
}:
{
  flake.nixosConfigurations.laptop = inputs.nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";

    specialArgs = {
      inherit inputs;
    };

    modules = [
      self.nixosModules.hostLaptop

      inputs.home-manager.nixosModules.home-manager
    ];
  };

  flake.nixosModules.hostLaptop = { pkgs, lib, ... }: {
    imports = [
      self.nixosModules.hostLaptopHardware

      self.nixosModules.pipewire
      self.nixosModules.nix
      self.nixosModules.users
      self.nixosModules.fonts
      self.nixosModules.v2raya
      self.nixosModules.steam
      self.nixosModules.thunar
      self.nixosModules.kdePlasma
      self.nixosModules.sway
    ];

    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    networking.hostName = "nixos-laptop";

    networking.networkmanager.enable = true;

    time.timeZone = "Europe/Moscow";
    i18n.defaultLocale = "en_US.UTF-8";

    i18n.extraLocaleSettings = {
      LC_ADDRESS = "ru_RU.UTF-8";
      LC_IDENTIFICATION = "ru_RU.UTF-8";
      LC_MEASUREMENT = "ru_RU.UTF-8";
      LC_MONETARY = "ru_RU.UTF-8";
      LC_NAME = "ru_RU.UTF-8";
      LC_NUMERIC = "ru_RU.UTF-8";
      LC_PAPER = "ru_RU.UTF-8";
      LC_TELEPHONE = "ru_RU.UTF-8";
      LC_TIME = "ru_RU.UTF-8";
    };

    hardware.bluetooth.enable = true;

    services.printing.enable = true;
    services.ipp-usb.enable = true;

    services.power-profiles-daemon.enable = true;
    services.upower.enable = true;

    security.polkit.enable = true;

    hardware = {
      graphics = {
        enable = true;
        enable32Bit = true;
      };

      nvidia = {
        open = true;
        modesetting.enable = true;
        powerManagement.enable = true;

        prime = {
          sync.enable = true;

          intelBusId = "PCI:0@0:2:0";

          nvidiaBusId = "PCI:1@0:0:0";
        };
      };
    };

    services.xserver = {
      videoDrivers = [ "nvidia" ];
    };

    nixpkgs.config.allowUnfree = true;

    environment.sessionVariables = {
      XDG_MENU_PREFIX = "plasma_";
    };

    environment.systemPackages = with pkgs; [
      git
      killall
      kdePackages.ark
      bluetui

      kdlfmt

      zoom-us

      telegram-desktop

      protonplus
    ];

    programs.niri.enable = true;

    programs.nix-ld = {
      enable = true;

      libraries = with pkgs; [
        icu
      ];
    };

    system.stateVersion = "26.05"; # Did you read the comment?
  };
}
