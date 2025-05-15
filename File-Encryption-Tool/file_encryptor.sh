#!/bin/bash

ACTION="$1"
FILE="$2"
RECIPIENT="${3:-user@example.com}" # For symmetric encryption, we use passphrase instead
PASSPHRASE="${4:-}"

# Check for gpg
command -v gpg >/dev/null 2>&1 || { echo "gpg not installed."; exit 1; }

# Encrypt file
encrypt_file() {
    echo "Encrypting $FILE..."
    gpg --batch --yes --passphrase "$PASSPHRASE" -c "$FILE"
    echo "Encrypted file: $FILE.gpg"
}

# Decrypt file
decrypt_file() {
    echo "Decrypting $FILE..."
    gpg --batch --yes --passphrase "$PASSPHRASE" -o "${FILE%.gpg}" -d "$FILE"
    echo "Decrypted file saved as: ${FILE%.gpg}"
}

# Validate
if [[ -z "$FILE" || -z "$PASSPHRASE" ]]; then
    echo "Usage:"
    echo "  ./file_encryptor.sh encrypt <file> <passphrase>"
    echo "  ./file_encryptor.sh decrypt <encrypted_file.gpg> <passphrase>"
    exit 1
fi

# Choose action
if [[ "$ACTION" == "encrypt" ]]; then
    encrypt_file
elif [[ "$ACTION" == "decrypt" ]]; then
    decrypt_file
else
    echo "Invalid action. Use 'encrypt' or 'decrypt'."
    exit 1
fi
