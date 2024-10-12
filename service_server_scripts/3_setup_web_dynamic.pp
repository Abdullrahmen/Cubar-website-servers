# Sets up the web servers for the deployment of web_dynamic_nodejs

exec {'Sets up the web servers for the deployment of web_dynamic_nodejs':
  provider => shell,
  command  => 'sudo mkdir -p /data/web_dynamic_nodejs/releases/test 
  			   sudo mkdir -p /data/web_dynamic_nodejs/shared; 
			   sudo chown -hR ubuntu:ubuntu /data/; 
			   cp /home/ubuntu/service_server_scripts/initial_nodejs.js /data/web_dynamic_nodejs/releases/test/main.js; 
			   sudo ln -sf /data/web_dynamic_nodejs/releases/test/ /data/web_dynamic_nodejs/current;'
}