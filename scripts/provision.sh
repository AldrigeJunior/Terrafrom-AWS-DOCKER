# instalando o Docker na instancia EC2 pelo bash, fazendo o deploy do conteiner, ultiçizando a porta 80 e liberando o http e 
#subistituindo o index.html para concluir o desafio.
for pkg in docker.io docker-doc docker-compose podman-docker containerd runc; do
  sudo apt-get remove $pkg -y
done

sudo apt-get update -y
sudo apt-get install ca-certificates curl gnupg -y
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg
echo "deb [arch=\"$(dpkg --print-architecture)\" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \"$(. /etc/os-release && echo \"$VERSION_CODENAME\")\" stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update -y
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
sudo dpkg -i ./containerd.io_<version>_<arch>.deb
sudo dpkg -i ./docker-ce_<version>_<arch>.deb
sudo dpkg -i ./docker-ce-cli_<version>_<arch>.deb
sudo dpkg -i ./docker-buildx-plugin_<version>_<arch>.deb
sudo dpkg -i ./docker-compose-plugin_<version>_<arch>.deb
sudo service docker start
sudo usermod -aG docker ubuntu
sudo systemctl restart docker
git clone https://github.com/phvsdev/Challenge-Two.git
cd Challenge-Two/
rm index.html
wget https://raw.githubusercontent.com/AldrigeJunior/desafio/ffd7fbb698508afccc10dd56b95d0872c0214b61/index.html
sudo docker build -t desafio .
sudo docker run -d -p 80:80 desafio