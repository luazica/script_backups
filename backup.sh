#!/bin/bash
set -e

BASE="$HOME/script_backups"
LIST="$BASE/list.txt"
BACKUP_DIR="$BASE/backups"
TMP_DIR="$BASE/tmp"
DATE=$(date +%Y-%m-%d_%H-%M-%S)
ZIP_NAME="backup-$DATE.zip"
ZIP_PATH="$BACKUP_DIR/$ZIP_NAME"
REMOTE="gdrive:backup"

mkdir -p "$BACKUP_DIR"
rm -rf "$TMP_DIR"
mkdir -p "$TMP_DIR"

while IFS= read -r item; do
    [[ -z "$item" ]] && continue

    item="${item/#\~/$HOME}"
    item="${item/\$HOME/$HOME}"

    [[ ! -e "$item" ]] && echo "ignorando $item (não existe)" && continue

    dest="$TMP_DIR${item#$HOME}"
    mkdir -p "$(dirname "$dest")"

    cp -a "$item" "$dest"
done < "$LIST"

cd "$TMP_DIR"
zip -r "$ZIP_PATH" .
cd - >/dev/null

rm -rf "$TMP_DIR"

rclone copy "$ZIP_PATH" "$REMOTE"

echo "backup zipado criado e enviado ao google drive!"
