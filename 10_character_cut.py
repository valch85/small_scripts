# script delete from the end of the file all symbols that left only 10 + file extension
# convetn PNG to JPG
import os
import sys
import random
from PIL import Image
import string

# Function to convert PNG to JPG
def convert_png_to_jpg(filepath):
    """Convert a PNG file to JPG format and return the new filepath."""
    if filepath.lower().endswith('.png'):
        try:
            # Open the PNG image
            img = Image.open(filepath)
            # Convert to RGB (required for JPG)
            if img.mode != 'RGB':
                img = img.convert('RGB')
            # Generate new filepath with .jpg extension
            new_filepath = os.path.splitext(filepath)[0] + '.jpg'
            # Save as JPG
            img.save(new_filepath, 'JPEG')
            # Remove the original PNG file
            os.remove(filepath)
            return new_filepath
        except Exception as e:
            print(f"Error converting {filepath} to JPG: {e}")
            return filepath
    return filepath

# Function to generate a random string for avoiding naming conflicts
def generate_random_string(length=4):
    """Generate a random string of specified length."""
    return ''.join(random.choices(string.ascii_lowercase + string.digits, k=length))

# Function to rename files keeping the first 10 characters
def rename_files(directory):
    """Traverse directory and rename files to keep first 10 characters of name."""
    for root, _, files in os.walk(directory):
        for filename in files:
            # Get full path of the file
            filepath = os.path.join(root, filename)
            # Convert PNG to JPG if applicable
            filepath = convert_png_to_jpg(filepath)
            # Get file name and extension
            name, ext = os.path.splitext(os.path.basename(filepath))
            
            # Skip renaming if name is 10 or fewer characters
            if len(name) <= 10:
                continue
            
            # Keep first 10 characters of the name
            new_name = name[:10]
            new_filepath = os.path.join(root, new_name + ext)
            
            # Handle naming conflicts by appending random string
            while os.path.exists(new_filepath):
                random_str = generate_random_string()
                new_name = name[:10] + '_' + random_str
                new_filepath = os.path.join(root, new_name + ext)
            
            try:
                # Rename the file
                os.rename(filepath, new_filepath)
                print(f"Renamed: {filepath} -> {new_filepath}")
            except Exception as e:
                print(f"Error renaming {filepath}: {e}")

# Main function to handle command-line argument
def main():
    """Main function to process directory path from command-line argument."""
    if len(sys.argv) != 2:
        print("Usage: python script.py <directory_path>")
        sys.exit(1)
    
    directory = sys.argv[1]
    
    # Check if directory exists
    if not os.path.isdir(directory):
        print(f"Error: {directory} is not a valid directory")
        sys.exit(1)
    
    # Process files in the directory
    rename_files(directory)

if __name__ == "__main__":
    main()
