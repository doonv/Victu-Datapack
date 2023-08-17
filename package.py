from gen import generate
import zipfile
import os

datapack_folders = ["data"]
datapack_files = ["pack.mcmeta", "LICENSE.md"]

version = "1.0.0"

zip_filename = f"Victu-{version}.zip"

def package():
    generate()  # Generate files

    # Open the zip file in write mode
    with zipfile.ZipFile(zip_filename, "w") as zipf:
        for file in datapack_files:
            # Add each file to the zip archive
            zipf.write(file)
        for folder in datapack_folders:
            for root, _, files in os.walk(folder):
                for file in files:
                    file_path = os.path.join(root, file)
                    zipf.write(file_path)
    
    print(f"Packaged {zip_filename} successfully!")


if __name__ == "__main__":
    package()
