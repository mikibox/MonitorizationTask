# MonitorizationTask

## Resources

* 27B. Win81 IE11 Trial 90
* 21B. Ubuntu Desktop 14.04.5 LTS
* sysmonConfig.xml
* nxlog.conf
* InstallSplunk

## Windows Config

Import Win81 to VirtualBox as specified in the lab sessions.

Run Configure-Win81.bat
Download [Sysmon](https://docs.microsoft.com/en-us/sysinternals/downloads/sysmon)

Get to the directory where sysmon.exe is installed

Install sysmon:

```bash
sysmon -accepteula –i
```

Update sysmon config:

```bash
sysmon -c "path to sysmonConfig.xml
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
sudo service rsyslog restart
```
