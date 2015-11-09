#!/usr/bin/env bash

set -e

# Install all the junk I need
sudo apt-get -y install nodejs npm ubuntu-restricted-extras cmake bzr rpm wget git curl blender build-essential irssi screen chromium-browser git gvfs-bin pm-utils make automake powertop python thermald ttf-ancient-fonts unzip zsh qemu libunwind8 gettext libssl-dev libcurl3-dev zlib1g libicu-dev
sudo apt-get upgrade

# Set zsh as default shell
chsh -s /usr/bin/zsh

# Oh My Zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Adobefonts - Credits: https://github.com/adobe-fonts/source-code-pro/issues/17#issuecomment-8967116
mkdir -p ~/.fonts/adobe-fonts/source-code-pro
git clone -b release https://github.com/adobe-fonts/source-code-pro.git ~/.fonts/adobe-fonts/source-code-pro
# find ~/.fonts/ -iname '*.ttf' -exec echo \{\} \;
sudo fc-cache -f -v ~/.fonts/adobe-fonts/source-code-pro

# Do symlinks
ln -sf .zshrc       ~/.zsrc
ln -sf .oh-my-zsh   ~/.oh-my-zsh
ln -sf .git         ~/.git
ln -sf .gitconfig   ~/.gitconfig
ln -sf .irssi       ~/.irssi
ln -sf .atom        ~/.atom
sudo cp powerman /etc/pm/power.d/powerman
sudo touch /usr/lib/pm-utils/power.d/powerman
sudo chmod a+x /usr/lib/pm-utils/power.d/powerman

echo "Finished installing everything together with dotfiles!"
echo "Happy coding $USER"

# Install Mono
#sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
#echo "deb http://download.mono-project.com/repo/debian beta main" | sudo tee /etc/apt/sources.list.d/mono-xamarin.list
#sudo apt-get update && sudo apt-get -y install mono-complete mono-devel ca-certificates-mono
#sudo apt-get upgrade

# Install ASP.NET
#curl -sSL https://raw.githubusercontent.com/aspnet/Home/dev/dnvminstall.sh | DNX_BRANCH=dev sh && source ~/.dnx/dnvm/dnvm.sh
#dnvm upgrade -r coreclr
#dnvm upgrade -r mono

# Install Atom
#wget https://atom.io/download/deb -O atom.deb
#sudo dpkg -i atom.deb
#rm atom.deb

# Install Unity3D
#wget http://download.unity3d.com/download_unity/unity-editor-5.1.0f3+2015091501_amd64.deb -O unityeditor.deb
#sudo dpkg -i unityeditor.deb
#rm unityeditor.deb

# Install SmartGit
#wget http://www.syntevo.com/smartgit/download?file=smartgit/smartgit-7_0_3.deb -O smartgit.deb
#sudo dpkg -i smartgit.deb
#rm smartgit.deb
