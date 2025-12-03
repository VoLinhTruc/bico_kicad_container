import json
import os

# Path to your file

input_path = "/workspaces/bico_kicad_container/kicad/config/kicad_common_origin.json"
output_path = "/workspaces/bico_kicad_container/kicad/config/kicad_common.json"

# --- Load JSON ---
with open(input_path, "r", encoding="utf-8") as f:
    data = json.load(f)

# --- Modify values ---
# Example: change a color value, or any key
data["input"]["center_on_zoom"] = False

# --- Save JSON ---
with open(output_path, "w", encoding="utf-8") as f:
    json.dump(data, f, indent=4)

print("kicad_common.json updated.")
