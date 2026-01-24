{ ... }:
{
  hardware.enableRedistributableFirmware = true;
  boot.kernelParams = [
    "acpi_backlight=vendor"
  ];
}
