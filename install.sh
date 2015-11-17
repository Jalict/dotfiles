#!/usr/bin/env bash

set -e

# Install all the junk I need
sudo apt-get -y install nodejs npm ubuntu-restricted-extras cmake bzr rpm wget git curl blender build-essential irssi screen chromium-browser git gvfs-bin pm-utils make automake powertop python thermald ttf-ancient-fonts unzip zsh qemu libunwind8 gettext libssl-dev libcurl3-dev zlib1g libicu-dev
sudo apt-get upgrade

# Set zsh as default shell
echo "\e[1m\e[44mSet zsh as default shell \xF0\x9F\x98\x9C\e[0m"
chsh -s /usr/bin/zsh

# Oh My Zsh
echo "\e[1m\e[44mInstalling Oh My Zsh \xF0\x9F\x98\x9D\e[0m"
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Adobefonts - Credits: https://github.com/adobe-fonts/source-code-pro/issues/17#issuecomment-8967116
echo "\e[1m\e[44mInstalling Adobefonts \xF0\x9F\x98\x8D\e[0m"
mkdir -p ~/.fonts/adobe-fonts/source-code-pro
git clone -b release https://github.com/adobe-fonts/source-code-pro.git ~/.fonts/adobe-fonts/source-code-pro
# find ~/.fonts/ -iname '*.ttf' -exec echo \{\} \;
sudo fc-cache -f -v ~/.fonts/adobe-fonts/source-code-pro

# Install Mono
echo "\e[1m\e[44mInstalling Mono \xF0\x9F\x99\x87\e[0m"
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
echo "deb http://download.mono-project.com/repo/debian beta main" | sudo tee /etc/apt/sources.list.d/mono-xamarin.list
sudo apt-get update && sudo apt-get -y install mono-complete mono-devel ca-certificates-mono
sudo apt-get upgrade

# Install ASP.NET
echo "\e[1m\e[44mInstalling ASP.NET \xF0\x9F\x98\x93\e[0m"
curl -sSL https://raw.githubusercontent.com/aspnet/Home/dev/dnvminstall.sh | DNX_BRANCH=dev sh && source ~/.dnx/dnvm/dnvm.sh
dnvm upgrade -r coreclr
dnvm upgrade -r mono

# Install Atom
echo "\e[1m\e[44mInstalling Atom \xF0\x9F\x8D\xA9\e[0m"
wget https://atom.io/download/deb -O atom.deb
sudo dpkg -i atom.deb
rm atom.deb

# Install Unity3D
#wget http://download.unity3d.com/download_unity/unity-editor-5.1.0f3+2015091501_amd64.deb -O unityeditor.deb
#sudo dpkg -i unityeditor.deb
#rm unityeditor.deb

# Backup current dotfiles
echo "\e[1m\e[44mBacking up current dotfiles \xF0\x9F\x98\xB7\e[0m"
mkdir old
mv ~/.zshrc       old/.zshrc
mv ~/.oh-my-zsh   old/.oh-my-zsh
mv ~/.git         old/.git
mv ~/.gitconfig   old/.gitconfig
mv ~/.irssi       old/.irssi
mv ~/.atom        old/.atom

# Do symlinks for repos dotfiles
echo "\e[1m\e[44mSymlinking new dotfiles to home of current user \xF0\x9F\x99\x8F\e[0m"
ln -sf .zshrc       ~/.zshrc
ln -sf .oh-my-zsh   ~/.oh-my-zsh
ln -sf .git         ~/.git
ln -sf .gitconfig   ~/.gitconfig
ln -sf .irssi       ~/.irssi
ln -sf .atom        ~/.atom

# Configuration file for pm-powersave
echo "\e[1m\e[44mInstalling settings for pm-powersave \xF0\x9F\x94\x8B\e[0m"
sudo ln -sf powerman /etc/pm/power.d/powerman
sudo touch /usr/lib/pm-utils/power.d/powerman
sudo chmod a+x /usr/lib/pm-utils/power.d/powerman

echo "\e[1m\e[44mFinished installing everything together with dotfiles! \xF0\x9F\x92\xBB\e[0m"
echo "\e[1m\e[44mHappy coding $USER \xE2\x9D\xA4\e[0m"
