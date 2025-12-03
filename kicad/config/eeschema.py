import json
import os

# Path to your file

input_path = "/workspaces/bico_kicad_container/kicad/config/eeschema_origin.json"
output_path = "/workspaces/bico_kicad_container/kicad/config/eeschema.json"

# --- Load JSON ---
with open(input_path, "r", encoding="utf-8") as f:
    data = json.load(f)

# --- Modify values ---
# Example: change a color value, or any key
data["appearance"]["color_theme"] = f'/home/developer/.local/share/kicad/{os.getenv("KICAD_VERSION")}/3rdparty/colors/com_github_pointhi_kicad-color-schemes_wdark/wdark.json'

# --- Save JSON ---
with open(output_path, "w", encoding="utf-8") as f:
    json.dump(data, f, indent=4)

print("eeschema.json updated.")
