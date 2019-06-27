//batch processing for import fimg images and convert them to tiff
//define process function
function action(input, output, filename) {
	//import fimg files produced by FluorCam
	run("Raw...", "open=["+input + filename+"]"+" image=[32-bit Real] width=720 height=560 offset=8 little-endian");
	//Save image as tiff format
	saveAs("Tiff", output + filename);
	//Close image
	close();
}

//pahts
input = "path to fimg files";
output = "path to save new tiff images";

//Apply the function above to a all the files in the input folder
setBatchMode(true); 
list = getFileList(input);
for (i = 0; i < list.length; i++)
        action(input, output, list[i]);
setBatchMode(false);
