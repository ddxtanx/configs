#!/bin/bash

waybar-mpris --position --autofocus --pause ⏯ --play ⏯ | while read line; do
  class=$(echo "$line" | jq .class)
  text=$(echo "$line" | jq .text | tr -d '"' | awk '{print substr($0, 1, 65) "..."}')
  tooltip=$(echo "$line" | jq .tooltip | tr -d '"' | awk '{print substr($0, 1, 65) "..."}')
  echo "{\"class\": $class, \"text\": \"$text\", \"tooltip\": \"$tooltip\"}";
done
