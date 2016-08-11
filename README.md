# Raspberry Pi Setup

Scripts for setting up the Raspberry Pi for running zbwardrive

## Contents

* `bt.py` runs in the background and manages Bluetooth data transfer.
* `zbwardrive.sh` runs zbwardrive with useful parameters and outputs log data to /tmp/
* `setup.sh` contains commands to install required dependencies and copy files to the right places
* `iot-setup` is put in `init.d` and run on boot, starting the `bt.py` and `zbwardrive.sh` scripts

## Usage

### From a Pre-Built Image

Copy the [disk image](https://iotmap.io/diskimage) to the sdcard. Be careful
not to overwrite the wrong device.

```{r, engine='bash'}
$ sudo dd bs=4m if=/path/to/wardriver.iso of=<Device>
```

For example, if my sdcard was mapped to `/dev/disk7` and I saved the disk
image to `/tmp/`, then I would run the command:

```{r, engine='bash'}
$ sudo dd bs=4m if=/tmp/wardriver.iso of=/dev/disk7
```

### From Scratch
Install Raspbian to your sdcard. The lite version works fine, and setup
has been tested with jessie-lite. Set up wifi using
[the official documentation](https://www.raspberrypi.org/documentation/configuration/wireless/wireless-cli.md)
or [by following the community instructions](http://raspberrypi.stackexchange.com/a/37921/51668) or connect to Ethernet.

After setting up the bare image, ssh into the device or connect physically.
Copy the repository (via git or wget) into the pi
and run `setup.sh` as root:

```{r, engine='bash'}
$ wget https://github.com/JDongian/rpi-setup/archive/master.zip
$ unzip master.zip
$ sudo su
# ./rpi-setup-master/rpi/setup.sh
```

This will set up required dependencies for zbwardrive and Bluetooth.
Additionally, it will add a service that starts on boot. After installation,
the Raspberry Pi will run a Bluetooth daemon that tries to connect to an
appropriate Android device. The Bluetooth daemon will talk to the Android
application and the zbwardrive process, which is also started on boot.

Remember to [change the default credentials](https://www.raspberrypi.org/documentation/linux/usage/users.md)!
