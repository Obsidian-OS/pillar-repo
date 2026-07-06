#!/bin/bash
for d in src/*/; do
    (cd "$d" && makepkg -s && mv *.pkg.tar.zst ../../)
done
