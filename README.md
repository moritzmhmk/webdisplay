# WebDisplay

## Build Instructions
Clone Repo and submodules
```bash
git clone https://github.com/moritzmhmk/webdisplay
cd webdisplay
git submodule init
git submodule update
```

Run `make xconfig` optionally make changes and save then close window.

Run `make all` and wait about 2h :coffee:

The resulting image can be found in `output/images`.

## Configuration
Configuration files can be found on the `boot` partition of the SD card.

### web display
``webDisplayConfig.js`` - is a javascript file read by QML

currently supported configurations:
* url: webpage to display

### WiFi
``wpa_supplicant`` - is a folder containing configurations in the format ``wpa_supplicant-INTERFACE.conf``

These are normal wpa_supplicant config files. ``INTERFACE`` should be ``wlan0`` if only one wifi dongle is attached.

## License

### buildroot-submodule
[buildroot-submodule](https://github.com/Openwide-Ingenierie/buildroot-submodule) is provided under the GPLv3 or later. The licence is provided in the LICENCE file. Note that this licence only covers the files provided by buildroot-submodule. It does not cover buildroot (which is GPLv2 or later) nor any software installed by buildroot (they have their own licences) nor your own code (which you are free to licence as you want).

### everything else ("my own code")
All code written by me is provided under the *MIT License*.
