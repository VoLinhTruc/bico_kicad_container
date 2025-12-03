#!/bin/bash

# enable permission for user to/workspaces
sudo chown -R developer:developer /workspaces

# create kicad config dir
mkdir -p /home/developer/.config/kicad/${KICAD_VERSION}

# update and copy config to KiCAD
python /workspaces/bico_kicad_container/kicad/config/kicad_common.py
sudo cp /workspaces/bico_kicad_container/kicad/config/kicad_common.json /home/developer/.config/kicad/${KICAD_VERSION}/kicad_common.json

# Theme setup - begin ------------------------------------------------------------
# download dark theme color
curl -L https://raw.githubusercontent.com/pointhi/kicad-color-schemes/2021-12-05/wdark/wdark.json \
-o /workspaces/bico_kicad_container/kicad/config/color_theme/wdark.json
mkdir -p ~/.local/share/kicad/9.0/3rdparty/colors/com_github_pointhi_kicad-color-schemes_wdark
cp /workspaces/bico_kicad_container/kicad/config/color_theme/wdark.json ~/.local/share/kicad/9.0/3rdparty/colors/com_github_pointhi_kicad-color-schemes_wdark/wdark.json

# # update and copy color theme to KiCAD
# python /workspaces/bico_kicad_container/kicad/config/kicad_common.py
# sudo cp /workspaces/bico_kicad_container/kicad/config/eeschema.json /home/developer/.config/kicad/${KICAD_VERSION}/eeschema.json
# Theme setup - end ------------------------------------------------------------