# Raspberry Pi Setup

Scripts for setting up the Raspberry Pi for running zbwardrive

## Contents

* `bt.py` runs in the background and manages bluetooth data transfer.
* `zbwardrive.sh` runs zbwardrive with useful parameters and outputs log data to /tmp/
* `setup.sh` contains commands to install required dependencies and copy files to the right places
* `iot-setup` is put in `init.d` and run on boot, starting required services (such as `bt.py` and `zbwardrive.sh`)

## Usage

### From Scratch
Install raspbian to your sdcard. The lite version works fine, and setup
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

This will set up required dependencies for zbwardrive and bluetooth.
Additionally, it will add a service that starts on boot. After installation,
the Raspberry Pi will run a bluetooth daemon that tries to connect to an
appropriate Android device. The bluetooth daemon will talk to the Android
application and the zbwardrive process, which is also started on boot.

Remember to [change the default credentials](https://www.raspberrypi.org/documentation/linux/usage/users.md)!
