# Web servers creation and auto deployment
This project involves creating and setting up the web server for the startup's website, building scripts to automate the app's deployment, and establishing monitoring and logging systems to track server performance and troubleshoot issues.

## Table of Contents
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#table-of-contents">Table of Contents</a>
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
        <li><a href="#create-an-nginx-service-server">Create an Nginx service server</a></li>
        <li><a href="#create-a-haproxy-load-balancer-server">Create a HAProxy load balancer server</a></li>
      </ul>
    </li>
    <li>
      <a href="#web-static">Web static</a>
      <ul>
        <li><a href="#edit-the-static-content-of-the-website">Edit the static content of the website</a></li>
        <li><a href="#deploy-web-static">Deploy web static</a></li>
      </ul>
    </li>
    <li>
      <a href="#web-dynamic-with-nodejs">Web dynamic with nodejs</a>
      <ul>
        <li><a href="#edit-the-dynamic-content-of-the-website">Edit the dynamic content of the website</a></li>
        <li><a href="#deploy-web-dynamic">Deploy web dynamic</a></li>
      </ul>
    </li>
    <li><a href="#future-updates">Future updates</a></li>
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
* Ip addresses and the private keys of the servers
* scp installed to communicate with the servers:
   ```sh
   sudo apt-get update
   sudo apt-get install openssh-client
   ```
* Download or clone the entire repository
### Create an Nginx service server
1. In [create_service_server.sh](https://github.com/Abdullrahmen/Cubar-website-servers/blob/main/create_service_server.sh), change the SERVER_IP and PRIVATE_KEY_LOC
2. Run [create_service_server.sh](https://github.com/Abdullrahmen/Cubar-website-servers/blob/main/create_service_server.sh)
   ```
   sudo ./create_service_server.sh
   ```
### Create a HAProxy load balancer server
1. In [load_balancer_scripts/http.cfg](https://github.com/Abdullrahmen/Cubar-website-servers/blob/main/load_balancer_scripts/http.cfg) file add your service servers ip addresses:
   ```
   ...
   server service-server-01 {SERVER_IP_01}:80 check
   server service-server-02 {SERVER_IP_02}:80 check
   # server {any name} {SERVER_IP_03}:80 check
   # server {any name} {SERVER_IP_04}:80 check
   ...
   ```
2. In [create_load_balancer.sh](https://github.com/Abdullrahmen/Cubar-website-servers/blob/main/create_load_balancer.sh), change the SERVER_IP and PRIVATE_KEY_LOC
3. Run [create_load_balancer.sh](https://github.com/Abdullrahmen/Cubar-website-servers/blob/main/create_load_balancer.sh)
   ```
   sudo ./create_load_balancer.sh
   ```

## Web static
Let's first define what a static website is. A static website delivers the same content to every user, meaning that all visitors view identical information on each page. For example, pages like privacy policies are typically static because their content doesn't change based on who is viewing them.
### Edit the static content of the website
To edit the static content of the website, update the files in the web_static folder.
If you add a new folder inside web_static, the folder name will be part of the URL required to access the page. For example:
* If you create a folder web_static/about-us, the URL to access that page will be domain/about-us.
* If you create a folder web_static/privacy, the URL will be domain/privacy.
It's important to note that Nginx will look for a file named index.html in each folder. Therefore, make sure that your HTML file is named index.html to ensure it is correctly loaded.
### Deploy web static
> Tested on AWS Ubuntu-24 servers and python 3.12
After completing your updates to the web_static content, you can deploy it to a service server by following these steps:
1. In [deploy_web_static.sh](https://github.com/Abdullrahmen/Cubar-website-servers/blob/main/deploy_web_static.py), change the serverIP and privateKeyPath to your service server
2. Run [deploy_web_static.sh](https://github.com/Abdullrahmen/Cubar-website-servers/blob/main/deploy_web_static.py)
   ```
   sudo python3 deploy_web_static.sh
   ```

## Web dynamic with nodejs
Let's first define what a dynamic website is. A dynamic website delivers content that can change based on the user or other factors, such as user inputs or data from a database. Unlike static websites, dynamic sites adjust content in real-time to offer personalized or interactive experiences.
### Edit the dynamic content of the website
You can develop any Node.js application within the web_dynamic_nodejs folder. It's important to note that the server will automatically look for a file named main.js to run your application. Therefore, be sure to name your primary JavaScript file main.js to ensure it is properly recognized and executed by the server.
### Deploy web dynamic
After completing your updates to the web_dynamic_nodejs content, you can deploy it to a service server by following these steps:
1. In [deploy_web_dynamic.sh](https://github.com/Abdullrahmen/Cubar-website-servers/blob/main/deploy_web_dynamic.py), change the serverIP and privateKeyPath to your service server
2. Run [deploy_web_dynamic.sh](https://github.com/Abdullrahmen/Cubar-website-servers/blob/main/deploy_web_dynamic.py)
   ```
   sudo python3 deploy_web_dynamic.sh
   ```
   
## Future updates
* Develop a file to store all service server information, enabling automatic deployment to all servers.
* Implement a GitHub Action to automate deployment, with versioning managed by Git.
* Add clear success and failure messages for the deployment process.
* Automate the configuration of the load balancer by using the file that stores service server information.
* Implement a logging system to capture and track application events and errors.
* And many more enhancements to improve automation and efficiency.

## License
Distributed under the MIT License. See `LICENSE.txt` for more information.

## Contact
* Abdullrahmen Ahmed Seif - [Linkedin](https://www.linkedin.com/in/abdullrahmen/) - abdullrahmen2003@gmail.com 
* Project Link: [https://github.com/Abdullrahmen/Cubar-website-servers](https://github.com/Abdullrahmen/Cubar-website-servers) 
