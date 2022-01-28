#!/bin/sh

while getopts ":d:" o
do
    case "${o}" in
    d) site=${OPTARG}
    ;;
    esac
done
echo "+Updating apt-get..."

sudo apt-get update -y

echo "+Installing Apache2..."

apt-get install -q -y apache2

a2enmod rewrite

echo "+Installing Latest PHP Version..."
sudo apt install php libapache2-mod-php php-mysql -y


sleep 2
echo " + Installation PHP Modules ....."
sudo apt-get install php-{bcmath,bz2,intl,gd,mbstring,mysql,zip,fpm,curl,imap,unzip} -y

echo "+Creating directory /var/www/vhosts/${site}/public/.."

mkdir -p /var/www/vhosts/${site}/public/

echo "+Creating Virtual Host Configuration File..."

cat >> /etc/apache2/sites-available/${site}.conf <<EOF
<VirtualHost *:80>
<Directory /var/www/vhosts/${site}/public>
        Options Indexes FollowSymLinks
        AllowOverride All
        Require all granted
     </Directory>
    ServerAdmin webmaster@${site}
    ServerName ${site}
    ServerAlias www.${site}
    DocumentRoot /var/www/vhosts/${site}/public/
    ErrorLog \${APACHE_LOG_DIR}/error.log
    CustomLog \${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
EOF

cd /etc/apache2/sites-enabled/
echo "+creating symlink for ${site}"

ln -s ../sites-available/${site}.conf 
echo "+Restarting Apache Server"
service apache2 restart

echo "+Installation Completed!"

