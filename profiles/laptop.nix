{ ... }:
{
  # --------------------------------------- 
  # Power Management --> 
  # --------------------------------------- 
  # Battery life optimsation:
  services.tlp = {
    enable = true;
    settings = {
      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

      CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
      CPU_ENERGY_PERF_POLICY_ON_BAT = "power";

      PCIE_ASPM_ON_BAT = "powersupersave";
    };
  };
  powerManagement.enable = true;

  # services.auto-cpufreq.enable = true;

  # Power save on wi-fi :
  networking.networkmanager.wifi.powersave = true;

  # Battery Moniter :
  services.upower.enable = true;

  # zram support :
  zramSwap = {
    enable = true;
    memoryPercent = 25;
  };

  # --------------------------------------- 
  # Hardware Management :
  # --------------------------------------- 
  hardware.acpilight.enable = true; #Keyboard backlights

  # LidService
  services.logind = {
    lidSwitch = "suspend";
    lidSwitchExternalPower = "ignore";
    lidSwitchDocked = "ignore";
  };

  # Touchpad support
  services.libinput = {
    enable = true;

    touchpad = {
      naturalScrolling = true;
      tapping = true;
      disableWhileTyping = true;
      accelProfile = "adaptive";
    };
  };

  # Suspend
  services.logind.extraConfig = ''
    HandlePowerKey=suspend
    HandleSuspendKey=suspend
    HandleHibernateKey=hibernate
  '';

  # RTC fixtures :
  time.hardwareClockInLocalTime = false;

  # USB autosuspend : 
  services.udev.extraRules = ''
    ACTION=="add", SUBSYSTEM=="usb", TEST=="power/control", ATTR{power/control}="auto"
  '';

  # --------------------------------------
  # Network Connectivity --> 
  # --------------------------------------
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = false;
  };
}
