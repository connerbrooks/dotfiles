#!/bin/bash

conky | while read -r; do xsetroot -name "$REPLY"; done &
compton &
exec dwm
