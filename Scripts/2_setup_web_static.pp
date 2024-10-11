# Sets up the web servers for the deployment of web_static

exec {'Sets up the web servers for the deployment of web_static':
  provider => shell,
  command  => 'sudo mkdir -p /var/www/Cubar/html; 
			   sudo chmod -R 755 /var/www/Cubar/html; 
			   sudo mkdir -p /data/web_static/releases/test /data/web_static/shared; 
			   echo "This is a test release" | sudo tee /data/web_static/releases/test/index.html; 
			   echo "404 cubar error page" | sudo tee /var/www/Cubar/html/404.html; 
			   sudo ln -sf /data/web_static/releases/test/ /data/web_static/current; 
			   sudo chown -hR ubuntu:ubuntu /data/; 
			   sudo rm /etc/nginx/sites-enabled/default;'
}
