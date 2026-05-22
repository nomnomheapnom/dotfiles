#!/bin/bash

DND_MODE="do-not-disturb"
APPS_SILENCED="Telegram, Firefox"

if [ "$1" = "toggle" ]; then
    if makoctl mode | grep -q "$DND_MODE"; then
        makoctl mode -r "$DND_MODE"
    else
        makoctl dismiss -a
        makoctl mode -a "$DND_MODE"
    fi
fi

if makoctl mode | grep -q "$DND_MODE"; then
    printf '{"text": "󰂛", "class": "silenced", "tooltip": "DND active\\nSilencing: %s"}\n' "$APPS_SILENCED"
else
    printf '{"text": "󰂚", "class": "active", "tooltip": "Click to silence %s"}\n' "$APPS_SILENCED"
fi
