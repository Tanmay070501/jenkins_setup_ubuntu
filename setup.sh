sudo apt-get update -y

# Check if Docker is installed
if command -v docker &> /dev/null; then
    # Docker exists, so remove docker
    sudo docker stop $(sudo docker ps -a -q)
    sudo docker rm  $(sudo docker ps -a -q)
    sudo apt-get purge -yq docker-ce docker-ce-cli containerd.io
    sudo apt -y autoremove
    sudo rm -rf /var/lib/docker
    sudo rm -rf /etc/docker
    sudo rm /usr/local/bin/docker-compose
fi



sudo apt-get install -y ca-certificates curl gnupg 
sudo install -m 0755 -d /etc/apt/keyrings -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg -y
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Add the repository to Apt sources:
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update -y


sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin 

sudo docker run -d -p 8080:8080 -p 50000:50000 --name jenkins -v /var/run/docker.sock:/var/run/docker.sock --user root jenkins/jenkins:lts

sudo docker exec -it jenkins bash -c "apt update -y; apt install -y docker.io"

sudo docker logs jenkins
