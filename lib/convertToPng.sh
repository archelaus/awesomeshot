#!/bin/bash

convertToPng() {
	extension="${full_file_name##*.}"
	if [[ $extension != "png" ]]; then
		convert "$full_file_name" "${full_file_name%.*}.png" &&
			printf 'Converted to PNG ✅\n'
		rm "$full_file_name"
		full_file_name=${full_file_name%.*}.png
	fi
}
