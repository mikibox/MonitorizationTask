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

Download & Install
[nxlog-ce-2.9.1716.msi](https://nxlog.co/products/nxlog-community-edition/download)


Copy nxlog.conf to C:\Program Files\nxlog\conf.

Edit the config and set up the ip of the ubuntu machine if necessary.
