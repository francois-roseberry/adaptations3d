#!/bin/bash

expand_files() {
    local input_dir="$1"
    local output_dir="$2"

    # Loop through each file in the input directory
    for input_file in "$input_dir"/*; do
      # Extract the base name of the file (without the path)
      base_name=$(basename "$input_file")
      # Define the output file path
      output_file="$output_dir/$base_name"

      # Use awk to find {{ some_dynamic_file.txt }} and replace them with the full content of the file
      awk '{
        while (match($0, /\{\{([^}]+)\}\}/)) {
          # Extract the filename inside the placeholder {{ filename.txt }}
          filename = substr($0, RSTART + 2, RLENGTH - 4)
          
          # Use "while (getline)" to read the entire content of the file
          file_contents = ""
          while ((cmd = "cat " filename) | getline line) {
            file_contents = file_contents line "\n"
          }
          close(cmd)
          
          # Replace the placeholder with the full contents of the file
          $0 = substr($0, 1, RSTART - 1) file_contents substr($0, RSTART + RLENGTH)
        }
        print
      }' "$input_file" > "$output_file"

      echo "Expanded $input_file -> $output_file"
    done
}

echo "Creating tmp/ directory if not existing"
mkdir -p tmp

echo "Expanding partials into /tmp directory"
expand_files templates tmp

echo "Copying locales into tmp/"
cp -R locales tmp/

echo "Creating public/ directory if not existing"
mkdir -p public

echo "Copy assets into public/"
cp -R assets public/

echo "Generating translated files"
static-i18n --selector [data-i18n] -l fr -i en -i fr -o public tmp