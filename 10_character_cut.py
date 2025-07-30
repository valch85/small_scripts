# script delete from the end of the file all symbols that left only 10 + file extension
# convetn PNG to JPG
import os
import random
import string
from PIL import Image
import sys

# Function to generate 3 random alphanumeric characters
def generate_random_suffix():
    return ''.join(random.choices(string.ascii_lowercase + string.digits, k=3))

# Function to convert PNG to JPG
def convert_png_to_jpg(file_path, output_dir):
    try:
        # Open the PNG file
        img = Image.open(file_path)
        # Convert to RGB (in case of RGBA)
        if img.mode in ('RGBA', 'LA'):
            background = Image.new('RGB', img.size, (255, 255, 255))
            background.paste(img, mask=img.split()[-1])  # Use alpha channel as mask
            img = background
        else:
            img = img.convert('RGB')
        
        # Generate output path (replace .png with .jpg)
        base_name = os.path.splitext(os.path.basename(file_path))[0].lower()
        jpg_path = os.path.join(output_dir, base_name + '.jpg')
        
        # If JPG file already exists, append random suffix
        if os.path.exists(jpg_path):
            base_name = base_name + generate_random_suffix()
            jpg_path = os.path.join(output_dir, base_name + '.jpg')
        
        # Save as JPG
        img.save(jpg_path, 'JPEG', quality=95)
        return jpg_path
    except Exception as e:
        print(f"Error converting {file_path}: {e}")
        return None

# Function to rename file to keep first 10 characters
def rename_file(file_path, output_dir):
    # Get base name and extension, convert to lowercase
    base_name, ext = os.path.splitext(os.path.basename(file_path))
    base_name = base_name.lower()
    ext = ext.lower()
    
    # If base name is 10 characters or less, skip renaming
    if len(base_name) <= 10:
        return file_path
    
    # Keep first 10 characters
    new_base_name = base_name[:10]
    new_file_name = new_base_name + ext
    new_file_path = os.path.join(output_dir, new_file_name)
    
    # If file already exists, append random suffix
    while os.path.exists(new_file_path):
        new_base_name = base_name[:10] + generate_random_suffix()
        new_file_name = new_base_name + ext
        new_file_path = os.path.join(output_dir, new_file_name)
    
    try:
        os.rename(file_path, new_file_path)
        return new_file_path
    except Exception as e:
        print(f"Error renaming {file_path}: {e}")
        return file_path

# Main function to process directory
def process_directory(directory_path):
    if not os.path.isdir(directory_path):
        print(f"Error: {directory_path} is not a valid directory")
        return
    
    # Walk through directory and subdirectories
    for root, _, files in os.walk(directory_path):
        for file in files:
            file_path = os.path.join(root, file)
            
            # Handle PNG files: convert to JPG
            if file.lower().endswith('.png'):
                jpg_path = convert_png_to_jpg(file_path, root)
                if jpg_path:
                    # Delete original PNG file
                    try:
                        os.remove(file_path)
                        print(f"Converted and deleted: {file_path}")
                    except Exception as e:
                        print(f"Error deleting {file_path}: {e}")
                    # Rename the new JPG file if needed
                    new_path = rename_file(jpg_path, root)
                    print(f"Processed: {jpg_path} -> {new_path}")
            else:
                # Rename non-PNG files
                new_path = rename_file(file_path, root)
                print(f"Processed: {file_path} -> {new_path}")

# Entry point
if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python script.py <directory_path>")
        sys.exit(1)
    
    directory_path = sys.argv[1]
    process_directory(directory_path)