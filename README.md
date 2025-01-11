# System Cleanup Scripts

This repository contains two scripts designed to clean temporary files and system junk for Windows and macOS. These scripts help free up disk space, improve system performance, and maintain a clean operating environment.

## Scripts

### 1. **Windows Cleanup Script**
- **Description**: 
  - Cleans temporary system files.
  - Optionally removes browser caches.
  - Deletes recycle bin contents.
  - Cleans up system logs and outdated update files.
- **File**: `AutoDeleteTemp.bat`
- **How to Run**: 
  - Run the file with administrator privileges.
  - The script will automatically delete unnecessary files.

### 2. **macOS Cleanup Script**
- **Description**: 
  - Removes application caches.
  - Cleans temporary system files.
  - Deletes unused log files and update leftovers.
  - Offers an option to empty the Trash.
- **File**: `macos-script.sh`
- **How to Run**: 
  - Open the Terminal.
  - Execute the command:  
    ```bash
    sudo ./macos-script.sh
    ```

## Usage
1. Download the appropriate script for your operating system.
2. Follow the instructions to execute the script.
3. Follow the prompts in the terminal (for macOS) or command line (for Windows).

> **Warning!** Use these scripts at your own risk. It is recommended to back up important data before running them.

## Benefits
- Frees up disk space.
- Reduces the amount of unnecessary files in your system.
- Enhances your computer's performance.

## Requirements
- **Windows**: Compatible with Windows 10 and newer versions.
- **macOS**: Compatible with macOS 11 (Big Sur) and newer versions.
- Administrator privileges are required for both scripts.

## License
This project is licensed under the [MIT License](LICENSE).
