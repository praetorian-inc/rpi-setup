# Raspberry Pi Setup

Scripts for setting up the Raspberry Pi for running zbwardrive

## Contents

* `bt.py` runs in the background and manages bluetooth data transfer.
* `zbwardrive.sh` runs zbwardrive with useful parameters and outputs log data to /tmp/
* `setup.sh` contains commands to install required dependencies and copy files to the right places
* `iot-setup` is put in `init.d` and run on boot, starting required services (such as `bt.py` and `zbwardrive.sh`)

## Usage

Clone the repository and run `setup.sh` as root. This will set up required
dependencies for zbwardrive and bluetooth. Additionally, it will add a service
that starts on boot. After installation, the Raspberry Pi will run a bluetooth
daemon that tries to connect to an appropriate Android device. The bluetooth
daemon will talk to the Android application and the zbwardrive process, which
is also started on boot.
