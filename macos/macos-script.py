import os

def clean_temp_files():
    # Папки, які ви хочете очистити
    temp_folders = [
        '/tmp',            # тимчасові файли
        '/var/tmp'         # інші тимчасові файли
    ]

    # Прохід по кожній папці та видалення файлів у ній
    for folder in temp_folders:
        for root, dirs, files in os.walk(folder):
            for file in files:
                file_path = os.path.join(root, file)
                try:
                    os.remove(file_path)  # Видалення файлу
                    print(f"Deleted {file_path}")
                except Exception as e:
                    print(f"Error deleting {file_path}: {e}")

if __name__ == "__main__":
    clean_temp_files()
