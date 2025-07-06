# Puppet manifest to configure Nginx with custom HTTP header
# This automates the same task as the bash script but using Puppet

# Install nginx package
package { 'nginx':
  ensure => installed,
}

# Get the hostname for use in the configuration
$hostname = $::hostname

# Create the main HTML file
file { '/var/www/html/index.html':
  ensure  => file,
  content => 'Hello World!',
  require => Package['nginx'],
}

# Create custom 404 page
file { '/var/www/html/404.html':
  ensure  => file,
  content => 'Ceci n\'est pas une page',
  require => Package['nginx'],
}

# Configure nginx with custom header
file { '/etc/nginx/sites-available/default':
  ensure  => file,
  content => "server {
    listen 80 default_server;
    listen [::]:80 default_server;

    root /var/www/html;
    index index.html index.htm index.nginx-debian.html;

    server_name _;

    # Add custom header to identify which server is responding
    add_header X-Served-By ${hostname};

    location / {
        try_files \$uri \$uri/ =404;
    }

    location /redirect_me {
        return 301 https://www.youtube.com/watch?v=QH2-TGUlwu4;
    }

    error_page 404 /404.html;
    location = /404.html {
        internal;
    }
}",
  require => Package['nginx'],
  notify  => Service['nginx'],
}

# Ensure nginx service is running and enabled
service { 'nginx':
  ensure  => running,
  enable  => true,
  require => Package['nginx'],
}