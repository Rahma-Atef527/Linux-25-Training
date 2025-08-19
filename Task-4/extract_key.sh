#!/bin/bash
if [[ $# -ne 2 ]]; then
echo "Usage:$0 <archive1.zip|archive1.tar.xz><archive2.zip|archive2.tar.xz>"
exit 1
fi
outdir="extracted_files"
mkdir -p "$outdir"
extract_file(){
local file="$1"
if [[ ! -f "$file" ]]; then
echo "error:fil not found -> $file"
exit 1
fi
case "$file" in
*.zip)
unzip -q "$file" -d "$outdir" || { echo "Failed to unzip: $file";exit 1; }
;;
*.tar.xz)
tar -xJf "$file" -C "$outdir" || { echo "Failed to untar: $file"; exit 1; }
      ;;
    *)
      echo "Unsupported file type: $file"
      exit 1
      ;;
  esac
}

extract_file "$1"
extract_file "$2"

echo "Extraction completed successfully into: $outdir/"
