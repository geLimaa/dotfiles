#!/bin/bash

IMG="$1"

awww img "$IMG" \
  --transition-type grow \
  --transition-duration 1.2 \
  --transition-fps 144 \
  --transition-pos center
