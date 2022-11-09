   #! /bin/bash

    # Install Java
    yum install java-1.8.0-openjdk.x86_64 -y


    # Add ansibleadmin user
    useradd ansibleadmin
    # set password for ansibleadmin
    echo "ansibleansible" | passwd --stdin ansibleadmin
    # set ansibleadmin as sudoers
    echo 'ansibleadmin     ALL=(ALL)      NOPASSWD: ALL' | sudo tee -a /etc/sudoers
    # set ec2-user as sudoers
    echo 'ec2-user     ALL=(ALL)      NOPASSWD: ALL' | sudo tee -a /etc/sudoers 
    # enable ssh passwordless authentication
    sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
    service sshd restart


    # Install docker
    # Update the installed packages and package cache 
    yum update -y
    # Install the most recent Docker Engine package for Amazon Linux 2
    amazon-linux-extras install docker -y
    # Start the Docker service.
    service docker start
    # Add the ansibleadmin to the docker group so you can execute Docker commands without using sudo.
    usermod -a -G docker ansibleadmin
	# Configure Docker to start on boot
	systemctl enable docker
    
    # Because SonarQube uses an embedded Elasticsearch, make sure that your Docker host configuration 
    # complies with the Elasticsearch production mode requirements and File Descriptors configuration.
    # For example, on Linux, you can set the recommended values for the current session by running 
    # the following commands as root on the host:

    sysctl -w vm.max_map_count=262144
    sysctl -w fs.file-max=65536
    ulimit -n 65536
    ulimit -u 4096

    # Pull Community Edition Docker image
    docker pull sonarqube
    # Start the server by running (run docker container)
    docker run -d --name sonarqube -e SONAR_ES_BOOTSTRAP_CHECKS_DISABLE=true -p 9000:9000 sonarqube:latest
    
    