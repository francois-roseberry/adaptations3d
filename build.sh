#!/bin/sh

echo "Creating public/ directory if not existing"
mkdir -p public

echo "Copy assets into public/"
cp -R assets public/

echo "Generating translated files"
static-i18n --selector [data-i18n] -l fr -i en -i fr -o public templates