#!/bin/bash

echo "Building Jekyll website"
jekyll build -b ""
echo "Moving quarto configuration to the Jekyll website"
cp quarto_config/_quarto.yml _site/
echo "Accessing the website folder"
cd _site/

echo "Searching all the instances of All.md"
for mdfile in $(find -name All.md); do
    echo $mdfile
    folder=${mdfile//MD\/All.md} # trim however many trailing slashes exist
    echo "Moving X/MD/All.md file to X/"
    mv $mdfile $folder
    echo "Renaming All.md to index.md"
    mv $folder/All.md $folder/index.md
done

echo "Rendering quarto website"
quarto render

echo "Copying web files to the quarto website"
cp -rp web _website/
