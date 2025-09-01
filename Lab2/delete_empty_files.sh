#!/bin/bash
set -euo pipefail

if [[ $# -ne 1 ]]; then
    echo "Usage: $0 <directory>"
    exit 1
fi

dir=$1

if [[ ! -d "$dir" ]]; then
    echo "Error: Directory '$dir' not found."
    exit 1
fi

empty_files=$(find "$dir" -type f -empty)

if [[ -z "$empty_files" ]]; then
    echo "No empty files found in $dir."
    exit 0
fi

echo "Deleted files:"
echo "$empty_files"
rm $empty_files
