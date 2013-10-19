lab3test
========

Tester for ECE244 Lab 3.

NOTE: this is the alpha edition. The tester script works, but at the moment NO test cases or solutions have been provided. You must add solutions and input cases manually.

The bash script 'tester' uses the input file to test your Main program. It will produce an 'output' file which will be compared against the 'solution' file for failures.

Downloading

To get the latest release of the script and unit tests, check the releases page.

To get it as a zip file from the terminal, use: (Note: this is only as recent as we've remembered to update this file)

wget https://github.com/ECE1T6/parsertest/archive/v1.0-alpha.zip

unzip v1.0-alpha
or, if git is installed, do either this:

git clone https://github.com/ECE1T6/lab3test.git
or this:

git clone git@github.com:ECE1T6/lab3test.git
Running

Make sure that Main.cpp is in the same directory as the ptest script as well as the input and solution files.

To run the automated tests:

./tester.sh
Then any failed unit tests will be outputted to the console.

To run the automated tests, AND check for possible memory leaks, add the --valgrind option:

./tester.sh --valgrind

Remarks

Everything is opensource, and anyone is free to contribute. If you can think of other corner-case unit tests that are not covered by the input, please append them to the input file along with the correct output to the solution file.

The script has been tested to make sure it functions properly, however please make sure you have a backup of the source-code anyway before running the script.

Tester for ECE244 Lab 3
