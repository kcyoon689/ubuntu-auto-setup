#!/bin/bash
set -e

wget https://www.cursor.com/download/stable/linux-x64 -O cursor.AppImage
chmod +x cursor.AppImage

wget https://techajob.com/wp-content/uploads/cursor-logo.png -O cursor.png

sudo mv cursor.AppImage cursor.png /opt

sudo tee /usr/share/applications/cursor.desktop > /dev/null <<EOF
[Desktop Entry]
Name=Cursor
Exec=/opt/cursor.AppImage
Icon=/opt/cursor.png
Type=Application
Categories=Development;
EOF

sudo ln -sf /opt/cursor.AppImage /usr/bin/cursor
