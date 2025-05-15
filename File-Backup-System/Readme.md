## 💾 Project 5: File Backup System

**Description:**  
Backs up a folder or file to a timestamped location, with optional `.tar.gz` compression.

**Features:**
- Supports full or partial backups
- Option to compress backups
- Timestamped archive names

**Usage:**
```bash
chmod +x backup_system.sh
./backup_system.sh <source_path> <backup_folder> <compress: true/false>
