#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Hex to RGBA
# @raycast.mode silent
# @raycast.packageName Conversions

# Optional parameters:
# @raycast.author Caleb Stauffer
# @raycast.authorURL https://github.com/crstauf
# @raycast.description Convert HEX color values to RGBA values.
# @raycast.icon 🎨
# @raycast.argument1 { "type": "text", "placeholder": "HEX" }

hex=$1
first="${hex:0:1}"

if [ "#" = "$first" ]; then
	hex="${hex:1:6}"
fi

hex_r="${hex:0:2}"
hex_g="${hex:2:2}"
hex_b="${hex:4:2}"

rgba_r=`echo $((0x${hex_r}))`
rgba_g=`echo $((0x${hex_g}))`
rgba_b=`echo $((0x${hex_b}))`

rgba="rgba( $rgba_r, $rgba_g, $rgba_b, 1 )"

echo $rgba | pbcopy

echo "Converted #$hex to $rgba"