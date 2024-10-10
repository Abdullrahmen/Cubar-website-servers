# Sets up the web servers for the deployment of web_static

exec {'Run 2_server_scripts.sh in the server':
  provider => shell,
  command  => '../utils/send_command.sh 2_server_scripts.sh 44.193.214.147 ubuntu ../../Keys/cubar-first-server.pem;'
}
exec {'Send setup_web_static.conf to the server':
  provider => shell,
  command  => '../utils/send_config.sh ../nginx_config/setup_web_static.conf 44.193.214.147 ubuntu ../../Keys/cubar-first-server.pem;'
}