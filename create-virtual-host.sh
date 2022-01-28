#!/bin/sh
while getopts ":d:" o
do
    case "${o}" in
    d) site=${OPTARG}
    ;;
    esac
done

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

echo "+VirtualHost Created successfully!"

