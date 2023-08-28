#!/bin/bash

convertRounded() {
	convert "$full_file_name" \
		\( +clone -alpha extract -draw \
		"fill black polygon 0,0,0,${border_radius} ${border_radius},0
      fill white circle ${border_radius},${border_radius},${border_radius},0" \
		\( +clone -flip \) -compose Multiply -composite \
		\( +clone -flop \) -compose Multiply -composite \
		\) \
		-alpha off -compose CopyOpacity -composite "$full_file_name"
}
