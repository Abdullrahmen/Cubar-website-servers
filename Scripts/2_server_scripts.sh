sudo mkdir -p /var/www/Cubar/html; 
sudo chmod -R 755 /var/www/Cubar/html; 
sudo mkdir -p /data/web_static/releases/test /data/web_static/shared; 
sudo echo "This is a test release!!" > /data/web_static/releases/test/index.html; 
sudo echo "404 error page" > /var/www/Cubar/html/404.html; 
sudo ln -sf /data/web_static/releases/test/ /data/web_static/current; 
sudo chown -hR ubuntu:ubuntu /data/; 