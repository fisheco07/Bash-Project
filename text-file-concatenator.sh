#!/bin/bash

# This displays the help message.
show_help() {
    echo "Usage: ./text-file-concatenator"
    echo ""
    echo "This script concatenates multiple text files into a single output file."
    echo ""
    echo "How to Use:"
    echo "  1. Run the script: ./text-file-concatenator"
    echo "  2. Enter the output file name when prompted."
    echo "  3. Enter the names of the text files to concatenate (separate the files with spaces)."
    echo "  4. The merged content will be saved in the output file."
    exit 0
}

# This checks if the user types -h.
if [[ "$1" == "-h" ]]; then
    show_help
fi




#This part of the script asks the user what they would like to name their output file.
read -p "Enter the name of the output file: " output_file
if [[ -z "$output_file" ]]; then
    echo "Error: Please input a name for your output file."
    exit 1
fi

#This part of the scrips asks the user for their input files.
read -p "Enter the input file names (separate the files with spaces): " -a input_files

#This part of the script ensures that at least one input file is chosen.
if [ "${#input_files[@]}" -lt 1 ]; then
    echo "Error: Please input at least one file."
    exit 1
fi

#This part of the scrip concatenates the given files into one file called output_file.
cat "${input_files[@]}" > "$output_file"

echo "Files have been concatenated to $output_file"