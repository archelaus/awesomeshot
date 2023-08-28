#!/bin/bash

notify() {
	if ! [[ -d $backup_path ]]; then
		latest_file=$(/usr/bin/ls -th "$output_path" | sed -n 1p)
	else
		latest_file=$(/usr/bin/ls -th "$output_path" | sed -n 2p)
	fi
	size=$(find "${output_path}/${latest_file}" -printf %s)

	if [[ $size -eq 0 || $size -le 20 ]]; then
		rm -rf "${output_path}/${latest_file}"
		rm -rf "${backup_path}/${latest_file}"
		notify-send "Awesomeshot" "Improving failed!" -t 3000
		exit 1
	fi
	notify-send -i "$full_file_name" "Awesomeshot" "Improving success!" -t 3000
}
