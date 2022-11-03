    #! /bin/bash
    
    # add ansibleadmin user
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
	sudo systemctl enable docker
	# Install docker-py
    sudo yum install python2-pip
    sudo pip2 install docker-py