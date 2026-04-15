import json
import os
import shutil
import zipfile

# -----------------------------
# LOAD BUILD CONFIG
# -----------------------------
with open("build.json", "r", encoding="utf-8") as f:
    config = json.load(f)

MOD_NAME = config["mod-name"]
MOD_VERSION = config["mod-version"]
SOURCE_DIR = config["source"]

BUILD_DIR = config["output-paths"]["project"]
GAME_DIR = os.path.expanduser(config["output-paths"]["game"])

# -----------------------------
# OUTPUT FILE
# -----------------------------
zip_name = f"{MOD_NAME}_{MOD_VERSION}.zip"
zip_path = os.path.join(BUILD_DIR, zip_name)

os.makedirs(BUILD_DIR, exist_ok=True)

if os.path.exists(zip_path):
    os.remove(zip_path)

# -----------------------------
# IMPORTANT:
# Factorio expects ONE root folder inside ZIP:
# mod-name/
# -----------------------------
mod_root = MOD_NAME

def should_ignore(path):
    # ignore hidden/system files
    base = os.path.basename(path)
    return base.startswith(".") or "__MACOSX" in path

# -----------------------------
# BUILD ZIP
# -----------------------------
with zipfile.ZipFile(zip_path, "w", zipfile.ZIP_DEFLATED) as zipf:
    for root, dirs, files in os.walk(SOURCE_DIR):
        for file in files:
            full_path = os.path.join(root, file)

            if should_ignore(full_path):
                continue

            rel_path = os.path.relpath(full_path, SOURCE_DIR)

            zip_path_in_zip = f"{mod_root}/{rel_path}".replace("\\", "/")

            zipf.write(full_path, zip_path_in_zip)

print(f"[OK] Built mod ZIP: {zip_path}")

# -----------------------------
# COPY TO FACTORIO MODS
# -----------------------------
try:
    os.makedirs(GAME_DIR, exist_ok=True)
    shutil.copy(zip_path, GAME_DIR)
    print(f"[OK] Copied to Factorio mods folder: {GAME_DIR}")
except Exception as e:
    print(f"[WARN] Could not copy to game folder: {e}")