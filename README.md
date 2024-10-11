# Cubar-website-servers
This project involves creating and setting up the web server for the startup's website, building scripts to automate the app's deployment, and establishing monitoring and logging systems to track server performance and troubleshoot issues.

# Goals
- Set up a reliable and secure web server.
- Automate the deployment process for consistency and efficiency.
- Implement monitoring and logging systems to track and troubleshoot server
performance.
Deliverables
- Configured web server.
- Deployment automation scripts.
- Monitoring and logging systems with reports and dashboards.

# Scope of Work
Web Server Setup: Set up and configure the web server to host the startup's website. This
includes installing necessary server software, configuring security settings, and ensuring the
server is optimized for performance and reliability.
Deployment Automation: Build scripts or use tools to automate the deployment of the
application. This includes setting up continuous integration/continuous deployment (CI/CD)
pipelines if required. Ensure the deployment process is repeatable and reliable.
Monitoring and Logging Systems: Establish monitoring and logging systems to track server
performance indicators and troubleshoot issues. This includes setting up tools for real-time
monitoring, logging server activities, and generating performance reports.

# Usage
There is a file called general_script.sh in the Scripts folder, where you can update your IP address and private key location, then simply run it.

* Note that these scripts use basic Puppet resources, which you can easily understand even if you're unfamiliar with them.

And for automatic deployment of web_static, there is a function called deploy in the deploy_web_static.py file. It uses Fabric2 with Python 3 to automate the process. You can update the IP address and private key location to use it.
