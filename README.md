# Web servers creation and auto deployment
This project involves creating and setting up the web server for the startup's website, building scripts to automate the app's deployment, and establishing monitoring and logging systems to track server performance and troubleshoot issues.

<!-- TABLE OF CONTENTS -->
## Table of Contents
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#cubar-website-servers">About The Project</a>
    </li>
    <li>
      <a href="#goals">Goals</a>
    </li>
    <li>
      <a href="#scope-of-work">Scope of Work</a>
    </li>
    <li>
      <a href="#servers-creation">Servers creation</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#to-create-nginx-service-server">To create Nginx service server</a></li>
        <li><a href="#to-create-haproxy-load-balancer-server">To create HAProxy load balancer server</a></li>
      </ul>
    </li>
    <li><a href="#upcoming-features">Upcoming features</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
  </ol>
</details>

## Goals
- Set up a reliable and secure web server.
- Automate the deployment process for consistency and efficiency.
- Implement monitoring and logging systems to track and troubleshoot server
performance.
Deliverables
- Configured web server.
- Deployment automation scripts.
- Monitoring and logging systems with reports and dashboards.

## Scope of Work
Web Server Setup: Set up and configure the web server to host the startup's website. This
includes installing necessary server software, configuring security settings, and ensuring the
server is optimized for performance and reliability.
Deployment Automation: Build scripts or use tools to automate the deployment of the
application. This includes setting up continuous integration/continuous deployment (CI/CD)
pipelines if required. Ensure the deployment process is repeatable and reliable.
Monitoring and Logging Systems: Establish monitoring and logging systems to track server
performance indicators and troubleshoot issues. This includes setting up tools for real-time
monitoring, logging server activities, and generating performance reports.

## Servers creation
> Tested on AWS Ubuntu-24 servers
### Prerequisites
* You will need the ip addresses and the private keys of the servers
* You will need scp installed to communicate with the servers
  ```sh
  sudo apt-get update
  sudo apt-get install openssh-client
  ```
### To create Nginx service server
1. Download or clone the entire repository
2. In [create_service_server.sh](https://github.com/Abdullrahmen/Cubar-website-servers/blob/main/create_service_server.sh), change the SERVER_IP and PRIVATE_KEY_LOC
3. Run [create_service_server.sh](https://github.com/Abdullrahmen/Cubar-website-servers/blob/main/create_service_server.sh)
   ```
   sudo ./create_service_server.sh
   ```
### To create HAProxy load balancer server
1. Download or clone the entire repository
2. In [load_balancer_scripts/http.cfg](https://github.com/Abdullrahmen/Cubar-website-servers/blob/main/load_balancer_scripts/http.cfg) file add your service servers ip addresses:
  ```
  ...
  server service-server-01 {SERVER_IP_01}:80 check
  server service-server-02 {SERVER_IP_02}:80 check
  # server {any name} {SERVER_IP_03}:80 check
  # server {any name} {SERVER_IP_04}:80 check
  ...
  ```
3. In [create_load_balancer.sh](https://github.com/Abdullrahmen/Cubar-website-servers/blob/main/create_load_balancer.sh), change the SERVER_IP and PRIVATE_KEY_LOC
4. Run [create_load_balancer.sh](https://github.com/Abdullrahmen/Cubar-website-servers/blob/main/create_load_balancer.sh)
   ```
   sudo ./create_load_balancer.sh
   ```
## Web static
## Web dynamic
## Upcoming features
## License
## Contact
