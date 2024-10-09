# Install Nginx web-server and the firewall

exec {'install nginx':
  provider => shell,
  command  => 'sudo apt -y  install nginx;
               sudo systemctl enable nginx;
               sudo systemctl start nginx;'
}

exec {'firewall':
  provider => shell,
  command  => 'sudo ufw allow "Nginx HTTP";
               sudo ufw allow OpenSSH;
               sudo ufw enable;'
}