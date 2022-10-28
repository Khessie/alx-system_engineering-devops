exec {'update':
  command  => "sudo apt update; sudo apt install -y nginx; cd /var/www/ || exit; echo 'Hello World!' > html/index.html; sudo chmod 777 html; echo \"Ceci n'est pas une page\" > html/err_page.html; sudo chmod 755 html; cd /etc/nginx/ || exit; sudo chmod 777 sites-available; sudo chmod 777 sites-available/default
; echo \"server {\n;\tlisten 80;  default_server;;\tlisten [::]:80 default_server;
	\n\troot /var/www/html;
	\n\tindex index.html index.htm index.nginx-debian.html;
	\n\tserver_name _;
\nlocation / {
	\n\t# First attempt to serve request as file, then
	\n\t# as directory, then fall back to displaying an 404.
	\n\tadd_header X-Served-By \"\$hostname\";
	\n\ttry_files \$uri \$uri/ =404;
\n}
\nlocation /redirect_me{
	\n\treturn 301 https://www.alxafrica.com;
\n}
\nerror_page 404 /error_page.html;
\nlocation /error_page.html {
	\n\troot /var/www/html;
	\n\tinternal;
\n}
\n}\" > sites-available/default;sudo chmod 644 sites-available/default;sudo chmod 755 sites-available
cd ~ || exit
sudo service nginx restart
",
provider => shell
}
