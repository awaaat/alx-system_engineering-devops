# Puppet manifest to install and configure Nginx web server
# Puppet is a configuration management tool that automates server setup

# Install nginx package
# This ensures the nginx package is installed on the system
package { 'nginx':
  ensure => installed,
}

# Create the main HTML file
# This creates our "Hello World!" page that will be served by nginx
file { '/var/www/html/index.html':
  ensure  => file,
  content => 'Hello World!',
  require => Package['nginx'],
}

# Configure nginx with our custom settings
# This creates the nginx configuration file with redirect capability
file { '/etc/nginx/sites-available/default':
  ensure  => file,
  content => "server {
    listen 80 default_server;
    listen [::]:80 default_server;

    root /var/www/html;
    index index.html index.htm index.nginx-debian.html;

    server_name _;

    location / {
        try_files \$uri \$uri/ =404;
    }

    location /redirect_me {
        return 301 https://www.youtube.com/watch?v=QH2-TGUlwu4;
    }
}",
  require => Package['nginx'],
  notify  => Service['nginx'],
}

# Ensure nginx service is running
# This makes sure nginx is started and will restart if configuration changes
service { 'nginx':
  ensure  => running,
  enable  => true,
  require => Package['nginx'],
}