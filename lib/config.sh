#!/bin/bash

default_config='output_path=~/Pictures/Awesomeshot

convert_to_png="yes"
backup="backup"
backup_path="$output_path"/Backup

hex_color=(
  "#F8F9FA" # white
  "#000000" # black
  "#282C34" # black-gray
  "#333333" # gray
  "#A8D7FE" # blue sky
  "#6D6B70" # another gray
  "#726A7B" # slate gray
  "#A2AAAD"
  # Color for gradient
  "#C850C0"
  "#FFCC70"
  "#4158D0"
  "#FE7FAA"
)

convert_titlebar=""
add_on_img=""
width_titlebar=300
height_titlebar=800
titlebar_color="${hex_color[2]}"

convert_titlebar_text="yes"
titlebar_text="Awesomeshot"
titlebar_text_font=Falling-Sky
titlebar_text_size=19
titlebar_text_color="${hex_color[5]}"
titlebar_text_background="none"
titlebar_text_position="North"
titlebar_text_xy="+0+2"

convert_rounded="yes"
border_radius=20

convert_small_border="yes"
small_border_color="${hex_color[5]}"
small_border_size=3

convert_shadow="yes"
shadow_color="${hex_color[1]}"
shadow_size="75x30+0+30"

convert_background_border="yes"
background_border_color="none"
background_border_size=15

convert_border_gradient="yes"
interpolate_method="Saddle"
gradient_color_top_left="${hex_color[8]}"
gradient_color_top_right="${hex_color[9]}"
gradient_color_bottom_right="${hex_color[8]}"
gradient_color_bottom_left="${hex_color[10]}"

convert_footer=""
footer_text=" Shot by Awesomeshot"
footer_font="JetBrains-Mono-Medium-Nerd-Font-Complete"
footer_font_size=25
footer_foreground="${hex_color[2]}"
footer_background="none"
footer_position="South"
footer_xy="+0+45"

open_image=""
copy_to_clipboard=""'

loadConfig() {
	source "$config"
}

printConfig() {
	printf '%s\n' "$default_config"
}

createDirectory() {
	mkdir -p ~/.config/awesomeshot 2>/dev/null
}

getUserConfig() {
	if [[ -f $config ]]; then
		loadConfig
	else
		createDirectory
		printConfig >"$config"
		loadConfig
	fi
	checkConfig
}

generateDefaultConfig() {
	if ! [[ -f $config ]]; then
		[[ -d ~/.config/awesomeshot ]] || createDirectory
		printConfig >"$config"
		printf 'Generated default config.\n'
	fi

	if [[ -f $config ]]; then
		printf 'Config already exists.\n'
		read -p "  Do you want to re-generate default config? [y/n] " ask
		case $ask in
		y | Y)
			printConfig >"$config"
			printf 'Reset current config to default.\n'
			;;
		n | N)
			exit
			;;
		*)
			printf 'Invalid option. Exiting...\n'
			exit 1
			;;
		esac
	fi
}
