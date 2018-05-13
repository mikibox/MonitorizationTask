# MonitorizationTask

## Resources

* 27B. Win81 IE11 Trial 90
* 21B. Ubuntu Desktop 14.04.5 LTS
* sysmonConfig.xml
* nxlog.conf
* InstallSplunk

## Windows Config

Import Win81 to VirtualBox as specified in the lab sessions.

Run Configure-Win81.bat as administrator

Download [Sysmon](https://docs.microsoft.com/en-us/sysinternals/downloads/sysmon)

Get to the directory where sysmon.exe is installed

Open a Terminal as administrator and Install sysmon:

```bash
sysmon -accepteula –i
```

Update sysmon config:

```bash
sysmon -c "path to SysmonConfig.xml"
```

Check if sysmon is working in eventvwr.exe. On Vista and higher, events are stored in "Applications and Services Logs/Microsoft/Windows/Sysmon/Operational"

Download & Install
[nxlog-ce-2.9.1716.msi](https://nxlog.co/products/nxlog-community-edition/download)

Copy nxlog.conf to C:\Program Files\nxlog\conf.

Edit the config and set up the ip of the ubuntu machine if necessary.

Restart NxLog

```bash
net start nxlog
```

## Ubuntu Config

Download and import ubuntu image into virtualbox.

Run:

```bash
cd "where scripts are downloaded"
sudo chmod u+x Configure-Ubuntu-14.sh InstallSpunk.sh
sudo ./Configure-Ubuntu-14.sh
sudo ./InstallSpunk.sh
```

Setup rsyslog. Uncomment these lines on file `/etc/rsyslog.conf`

```conf
$ModLoad imudp
$UDPServerRun 514
```

Restart rsyslog

```bash
sudo service rsyslog restart
```

Check if rsyslog is working:

```bash
tail -f /var/log/syslog
```

if not working check the previous steps. Specially the ip setup in the nxlog config.

## Splunk Config

Go to `http://127.0.0.1:8000`

Follow the instructions specified in the lab sessions and choose the free licence.

Select Add data->monitor->Files&Directories then browse to `/var/log/syslog`. Accept the other default configs till the end and go to search.

Now you can make special queries to get info. For example: `host=IE11Win8_1 "EventID 1"` will get you all the process create events on the windows by the IEuser. To get the ip connections with iexplorer.exe you could filter like:  `host=IE11Win8_1 "EventID 3"`

To get some fancy visuallizations it is necessary to parse some fields from the logs. For example you could parse the destination IPs with the following regex (click on Search for more fields...): 

```splunk
DestinationIp: (?<ip>\d+\.\d+\.\d+\.\d+)
```

Then you could do the following search to get a plot on the ips and the count of events and the time:

```splunk
host=IE11Win8_1 "EventID 3"| timechart count by ip
```
