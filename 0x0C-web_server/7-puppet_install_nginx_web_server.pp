# configure a new ubuntu server with nginx

path    => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',

exec {'change_mode':
  command  => 'sudo chmod 777 /var/www/html',
  provider => shell
}

exec {'create file':
  command  => 'echo "Hello World!" > /var/www/html/index.html'
}

file { '/var/www/html/404.html':
  content => "Ceci n'est pas une page\n",
}

exec {'change back permissions':
  command => 'sudo chmod 755 /var/www/html'
}

exec {'chmod site-available':
  command  => 'sudo chmod 777 /etc/nginx/sites-available'
}

exec {'change permission to this directory':
  command => 'sudo chmod 777 /etc/nginx/sites-available/default'
}

file { 'Nginx default config file':
  ensure  => file,
  path    => '/etc/nginx/sites-available/default',
  content =>
"server {
        listen 80 default_server;
        listen [::]:80 default_server;
               root /var/www/html;
        # Add index.php to the list if you are using PHP
        index index.html index.htm index.nginx-debian.html;
        server_name _;
        location / {
                # First attempt to serve request as file, then
                # as directory, then fall back to displaying a 404.
                try_files \$uri \$uri/ =404;
        }
        error_page 404 /404.html;
        location  /404.html {
            internal;
        }
        
        if (\$request_filename ~ redirect_me){
            rewrite ^ https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;
        }
}
",
}

exec {'chmod site-available':
  command  => 'sudo chmod 644 /etc/nginx/sites-available/default;sudo chmod 755 /etc/nginx/sites-available;',
  provider => shell
}

exec {'restart nginx':
  command  => 'sudo service nginx restart',
  provider => shell
}
