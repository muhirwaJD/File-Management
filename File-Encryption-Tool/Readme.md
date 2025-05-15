## 🔐 Project 6: File Encryption Tool

**Description:**  
Encrypts and decrypts files securely using GPG (AES-256). Ideal for protecting sensitive data.

**Features:**
- Password-based encryption using `gpg -c`
- Decrypts back to original file
- Works with any file type

**Usage:**
```bash
chmod +x file_encryptor.sh
./file_encryptor.sh encrypt <file> <passphrase>
./file_encryptor.sh decrypt <file.gpg> <passphrase>
