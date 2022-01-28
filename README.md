# Server Setup Scripts
The simple Shell scripts to Get Your Server Ubuntu 18.04 & 20.04 ready with PHP | Apache | PHP Extension Modules and VirutalHost

# Usage

## To install PHP | Apache | VirtualHost 

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

- apache2
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

===============================================================================================================================================================

## Install ioncube loader 
A few softwares requirs the ioncube loader to execute the decrypted PHP Codes. 

## Usage 
  First, get the script and make it executable:
``` 
curl -O https://raw.githubusercontent.com/whmcs-smarters/setup-server-scripts/main/install-ioncube.sh
chmod +x install-ioncube.sh
```
Then run it
``` 
./install-ioncube.sh

```

### Thanks
