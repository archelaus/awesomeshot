#!/bin/bash

backupOriginalPhoto() {
	[[ -d $backup_path ]] || mkdir -p "$backup_path" 2>/dev/null
	cp -v "$full_file_name" "$backup_path"
}
