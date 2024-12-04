#!/bin/zsh
echo -e "\033[34m<-------------- Mac Setup START -------------->\033[0m"

# Export Dotfiles absolute path as Dotfiles_Dir
Current_Dir=$(dirname "$(realpath "$0")")
export Dotfiles_Dir=$(dirname "$Current_Dir")

# Set Proxy
export https_proxy=http://127.0.0.1:7897 http_proxy=http://127.0.0.1:7897 all_proxy=socks5://127.0.0.1:7897

# Add running permissions for the scripts
Mac_Conf_Dir="$Dotfiles_Dir/MacConf"
for script in "$Mac_Conf_Dir/Script/"*.sh; do
    chmod +x "$script"
done

"$Mac_Conf_Dir/Script/setup_homebrew.sh"
# Configure the environment when Homebrew installation is complete
eval "$(/opt/homebrew/Script/brew shellenv)"

"$Mac_Conf_Dir/Script/setup_ohmyzsh.sh"

"$Mac_Conf_Dir/Script/setup_symlink.sh"

"$Mac_Conf_Dir/Script/init_apps.sh"

echo -e "\033[34m<-------------- Mac Setup END -------------->\033[0m"