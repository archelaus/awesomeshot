#!/bin/bash

convertShadow() {
	convert "$full_file_name" \
		\( \
		+clone \
		-background "$shadow_color" \
		-shadow "$shadow_size" \
		\) \
		+swap \
		-background none \
		-layers merge \
		+repage "$full_file_name"
}
