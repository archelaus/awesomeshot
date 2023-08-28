#!/bin/bash

checkConfig() {
	if [[ $convert_background_border == "yes" && $convert_border_gradient == "yes" ]]; then
		if [[ $background_border_color != "none" ]]; then
			printf 'ERROR: Conflict detected on config.\nconvert_background_border and convert_border_gradient can only be enabled at the same time if convert_background_border is set to none\n'
			exit 1
		fi
	fi
}
