#!/bin/bash
# installation script to fix .desktop files
# functions
install () {
    wget https://github.com/psygreg/firealpaca-deb/releases/download/2.13.14/FireAlpaca.deb;
    sudo dpkg -i FireAlpaca.deb;
    sudo sed -i '5 s|.*|Exec=/opt/FireAlpaca/usr/bin/FireAlpaca|' /opt/FireAlpaca/FireAlpaca.desktop;
    sudo sed -i '5 s|.*|Exec=/opt/FireAlpaca/usr/bin/FireAlpaca|' /usr/share/applications/FireAlpaca.desktop;
    sudo sed -i '6 s|.*|Icon=fa|' /usr/share/applications/FireAlpaca.desktop;
}
# runtime
. /etc/os-release
if [ "$ID_LIKE" == "debian" ]; then
    if command -v wget >/dev/null 2>&1; then
        install
        echo "All done."
        sleep 3
        exit 0
    else
        sudo apt install wget
        install
        echo "All done."
        sleep 3
        exit 0
    fi
else
    echo "Invalid operating system."
    sleep 3
    exit 1
fi


