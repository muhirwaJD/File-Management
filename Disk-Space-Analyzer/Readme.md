## 📊 Project 3: Disk Space Analyzer

**Description:**  
Analyzes a directory to show which folders and files consume the most disk space using a tree-like structure. Optionally saves output to a log file.

**Features:**
- Uses `du` and `sort` to display space usage
- Customizable depth of directory scan
- Option to save results to a file

**Usage:**
```bash
chmod +x disk_analyzer.sh
./disk_analyzer.sh <folder> <max_depth> <optional_output_file>
