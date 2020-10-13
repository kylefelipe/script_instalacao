sudo apt update -y

echo 'Instalando Git'
sudo apt install git -y

# instalano VSCODE
echo 'Instalando o VSCODE'
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64 signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable # main" /etc/apt/sources.list.d/vscode.list'
sudo apt-get install apt-transport-https
sudo apt-get update
sudo apt-get install code

# Instalando Code Climate

echo 'Instalando Code Climate'

sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
sudo apt update  -y
sudo apt install docker-ce -y
sudo usermod -aG docker ${USER}
mkdir /home/${USER}/Downloads/instalacoes/codeClimate
cd /home/${USER}/Downloads/instalacoes/codeClimate
curl -L https://github.com/codeclimate/codeclimate/archive/master.tar.gz | tar xvz
cd codeclimate-* && sudo make install

echo "instalando nodeJS"

curl -sL https://deb.nodesource.com/setup_14.x | sudo bash -
sudo apt-get install -y nodejs npm

# instalando o postman

wget https://dl.pstmn.io/download/latest/linux64 -O postman-linux-x64.tar.gz
sudo tar -xzf postman-linux-x64.tar.gz -C /opt
sudo ln -s /opt/Postman/Postman /usr/bin/postman


# Ver como fazer jogar essa parte dentro do arquivo .desktop, sem a linha do gedit
nano ~/.local/share/applications/Postman.desktop

# Colocar dentro do arquivo.desktop
# [Desktop Entry]
# Encoding=UTF-8
# Name=Postman
# Exec=/opt/Postman/app/Postman %U
# Icon=/opt/Postman/app/resources/app/assets/icon.png
# Terminal=false
# Type=Application
# Categories=Development;

# Instalando FISH SHELL

echo 'Instalando FISH SHELL'

echo 'deb http://download.opensuse.org/repositories/shells:/fish:/release:/3/Debian_10/ /' | sudo tee /etc/apt/sources.list.d/shells:fish:release:3.list
curl -fsSL https://download.opensuse.org/repositories/shells:fish:release:3/Debian_10/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/shells:fish:release:3.gpg > /dev/null
sudo apt update -y
sudo apt install fish -y

echo "Colocando o fish como default'
echo /usr/bin/fish | sudo tee -a /etc/shells
chsh -s /usr/bin/fish

