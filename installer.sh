#!/bin/bash
# installation script to fix .desktop files
# vars
pkgver="2"
pkgver_major="13"
pkgver_minor="14"

# functions
depcheck () {

    local dependencies=(wget whiptail)
    for dep in "${dependencies[@]}"; do
        if dpkg -s "$dep" 2>/dev/null 1>&2; then
            continue
        else
            sudo apt install -y "$dep"
        fi
    done

}

install () {
    wget https://github.com/psygreg/firealpaca-deb/releases/download/"$pkgver"."$pkgver_major"."$pkgver_minor"/FireAlpaca.deb;
    sudo dpkg -i FireAlpaca.deb;
    sudo sed -i '5 s|.*|Exec=/opt/FireAlpaca/usr/bin/FireAlpaca|' /opt/FireAlpaca/FireAlpaca.desktop;
    sudo sed -i '5 s|.*|Exec=/opt/FireAlpaca/usr/bin/FireAlpaca|' /usr/share/applications/FireAlpaca.desktop;
    sudo sed -i '6 s|.*|Icon=fa|' /usr/share/applications/FireAlpaca.desktop;
}

run () {
    cd $HOME
    mkdir firealpaca-deb
    cd firealpaca-deb
    install
    whiptail --title FireAlpaca Installer --msgbox Installation successful. 8 78
    cd ..
    rm -rf firealpaca-deb
    exit 0
}

# runtime
depcheck
. /etc/os-release
if [[ "$ID_LIKE" =~ (ubuntu|debian) ]]; then
    run
elif [ "$ID" == "debian" ]; then
    run
else
    whiptail --title FireAlpaca Installer --msgbox Invalid Operating System. 8 78
    exit 1
fi


