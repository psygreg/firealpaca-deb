#!/bin/bash
# installation script to fix .desktop files
sudo dpkg -i FireAlpaca.deb;
sudo sed -i '5 s|.*|Exec=/opt/FireAlpaca/usr/bin/FireAlpaca|' /opt/FireAlpaca/FireAlpaca.desktop;
sudo sed -i '5 s|.*|Exec=/opt/FireAlpaca/usr/bin/FireAlpaca|' /usr/share/applications/FireAlpaca.desktop;
sudo sed -i '6 s|.*|Icon=fa|' /usr/share/applications/FireAlpaca.desktop;

