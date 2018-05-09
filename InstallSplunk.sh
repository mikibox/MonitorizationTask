mkdir ~/Downloads 
cd ~/Downloads
wget http://download.splunk.com/products/splunk/releases/6.2.2/splunk/linux/splunk-6.2.2-255606-linux-2.6-intel.deb
wget http://download.splunk.com/products/splunk/releases/6.2.2/splunk/linux/splunk-6.2.2-255606-linux-2.6-intel.deb.md5
md5sum -c splunk-6.2.2-255606-linux-2.6-intel.deb.md5 splunk-6.2.2-255606-linux-2.6-intel.deb: OK
sudo dpkg -i splunk-6.2.2-255606-linux-2.6-intel.deb
export SPLUNK_HOME=/opt/splunk
export PATH=$SPLUNK_HOME/bin:$PATH
sudo /opt/splunk/bin/splunk start
