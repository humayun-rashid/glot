apt-get update
apt-get upgrade
apt install docker.io

# Disable docker networking (optional)
echo '{
    "ip-forward": false,
    "iptables": false,
    "ipv6": false,
    "ip-masq": false
}' > /etc/docker/daemon.json

# Restart docker daemon
systemctl restart docker.service
docker pull glot/docker-run:latest
docker pull glot/python:latest

docker run --detach --restart=always --publish 8088:8088 --volume /var/run/docker.sock:/var/run/docker.sock --env "API_ACCESS_TOKEN=my-token" glot/docker-run:latest
