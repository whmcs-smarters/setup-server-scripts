# Server Setup Scripts
The simple Shell scripts to Get Your Server Ubuntu 18.04 & 20.04 ready with PHP | Apache | PHP Extension Modules and VirutalHost
# Usage
First, get the script and make it executable:
``` 
curl -O https://raw.githubusercontent.com/whmcs-smarters/setup-server-scripts/main/install-apache-php-virtual-host.sh
chmod +x install-apache-php-virtual-host.sh
```
Then run it
``` 
./install-apache-php-virtual-host.sh -d <domain>

```
## List of things installed by this script

-apache2
- php
- curl
- imap
- bcmath
- bz2
- intl
- gd ( GD library )
- mbstring
- php-mysql ( Mysql Client)
- zip
- fpm

### Virtaul Host Configuration
It will create the direct /var/www/vhosts/<domain>/public and create the virtual host with the name of your domain.
