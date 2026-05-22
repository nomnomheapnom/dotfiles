#!/bin/bash

hyprctl clients -j | jq -r '.[].address' | while read -r address; do
    hyprctl dispatch closewindow address:"$address"
done
