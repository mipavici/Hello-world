//batch processing for count analyize seedlings from Fluorcam
//Define process function
function action(input, filename) {
		//Sub function to rename and measure each individual seedling
		function newname(label) {
		roiManager("UseNames", "true");//use names in region of interest manager
		//Run analyze particles and add count of seedlings per plate in a summary table
		run("Analyze Particles...", "size=4-Infinity summarize add");
		n = roiManager("count");
		//loop for selecting, renaming and measure individual seedlings
		for (i=0; i<n; i++) {
		      roiManager("select", i);
			  roiManager("Rename", label +"_" + i);
			  roiManager("Measure")
		 }
		selectWindow("ROI Manager");
		run("Close");
		}
	//open image
	open(input + filename);
	//convert to 8-bit
	run("8-bit");
	//set threshold to select seedlings only
	setThreshold(20,255);
	//set parameters to be measured
	run("Set Measurements...", "area mean min limit display redirect=None decimal=3");

// this piece of code will draw a rectangle in the position
//each plate and run the subfunction above to measure and count
//seedling in each plate
	makeRectangle(183, 38, 144, 147);
	newname("A1");
	makeRectangle(329, 36, 144, 147);
	newname("A2");
	makeRectangle(484, 42, 144, 147);
	newname("A3");	
	makeRectangle(178, 197, 144, 147);
	newname("B1");
	makeRectangle(333, 197, 144, 147);
	newname("B2");	
	makeRectangle(484, 197, 144, 147);
	newname("B3");	
	makeRectangle(187, 357, 144, 147);
	newname("C1");	
	makeRectangle(334, 351, 144, 147);
	newname("C2");
	makeRectangle(480, 355, 144, 147);
	newname("C3");		
	//close image
	run("Close");
}


//pahts
input = "path to cleaned binary images";

//Apply the function above to a all the files in the input folder
list = getFileList(input);

for (i = 0; i < list.length; i++)
        action(input, list[i]);
//Select and save results and summary tables
selectWindow("Results");
saveAs("Results", input + "Results" + ".csv"); 
selectWindow("Summary");
saveAs("Results", input + "Summary" + ".csv");
