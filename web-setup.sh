#!/bin/bash

# Install apache
/usr/bin/apt-get -y install apache2
cat > /var/www/index.html <<EOD
<html><head><title>${private_ip}</title></head><body><h1>${private_ip}</h1>
<p>This is the default web page for ${private_ip}.</p>
</body></html>
EOD

# Log the X-Forwarded-For
perl -pi -e  's/^LogFormat "\%h (.* combined)$/LogFormat "%h %{X-Forwarded-For}i $1/' /etc/apache2/apache2.conf
/usr/sbin/service apache2 restart

