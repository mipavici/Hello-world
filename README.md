# High-throughput-in-vitro-seed-germination-screen-identified-a-new-ABA-responsive-RING-type-ubiquitin

This repository contains the scripts used to process chlorophyll images in the publication "High-throughput-in-vitro-seed-germination-screen-identified-a-new-ABA-responsive-RING-type-ubiquitin"

Script description

01 - Raw to tiff.ijm
This script imports fimg images to FIJI software converts them to tiff formart, save and close them in an output folder.

02 - convert to binary.ijm
This script opens tiff images from a folder select seedlings in the image and convert the grayscale image to a binary image.

03 - Count and analyze seedling from binaries.ijm
This script open binary images and count seedlings per plate in nine plate positions in the image. It also save the results as CSV file.
