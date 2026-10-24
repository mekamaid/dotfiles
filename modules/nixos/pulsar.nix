{ self, inputs, ... }:
{
  flake.nixosModules.pulsar =
    { ... }:

    {
      services.udev = {
        enable = true;

        # TODO pulsar web drv broken, wont open configuration screen
        extraRules = ''
          # Pulsar 8K Dongle (VID 3710, PID 5406)
          SUBSYSTEM=="usb", ENV{DEVTYPE}=="usb_device", ATTRS{idVendor}=="3710", ATTRS{idProduct}=="5406", MODE="0660", GROUP="input", TAG+="uaccess"
          KERNEL=="hidraw", ATTRS{idVendor}=="3710", ATTRS{idProduct}=="5406", MODE="0660", GROUP="input" TAG+="uaccess"
        '';
      };
    };
}
