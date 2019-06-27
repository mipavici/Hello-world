//batch processing for making binary images from tiff images

//define process function
function action(input, output, filename) {
	//open tiff image
	open(input + filename);
	//set threshold with a minimum pixel value of 250
	//and a maximum of 3.4e38
	setThreshold(250.0000, 3.4e38);
	//tell the sofware the background is black
	setOption("BlackBackground", true);
	//convert tiff image to binary image
	run("Convert to Mask");
	//save changes
	run("Save");
	//close image
	close();
}

//pahts
input = "path to tiff images";
output = "path to save new binary images";

//Apply the function above to a all the files in the input folder
setBatchMode(true); 
list = getFileList(input);
for (i = 0; i < list.length; i++)
        action(input, output, list[i]);
setBatchMode(false);