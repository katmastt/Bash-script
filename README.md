# Bash-script

This script was created as part of the second exercise on Systems' Programming course - Departement of Informatics and Telecommunications, National & Kapodistrian Uneversity of Athens.

# RUN

**./create_infiles.sh  diseasesFile  countriesFile  input_dir  numFilesPerDirectory numRecordsPerFile**

- diseasesFile: a file with the diseases' names - one per line

- countriesFile: a file with the countries' names - one per line

- input_dir: the name of the directory that the subdirectories and the files will be created

- numFilesPerDirectory: number of files per directory (integer and positive number)

- numRecordsPerFile: number of records per file (integer and positive number)

# IMPLEMENTATION

At the beginning the necessary checks take place. If the number of arguments is not the expected (5) or either one of the two last arguments is not an integer positive number then a message is printed and the script terminates. If there are no errors, it creates a folder with name input_dir. Then it creates one subdirectory for every country in countriesFile. In each subdirectory numFilesPerDirectory files with numRecordsPerFile entries are created. The name of each file is a random date DD-MM-YYYY. Each entry consists of:

- record ID: positive integer number - different for each entry

- ENTER or EXIT: indicated whether the patient entered or exited the health facility at the specific date

- patientFirstName: a name randomly selected by names file

- patientLastName: a surname randomly selected by surnames file

- disease: a string randomly selected by the diseasesFile that the user provided

- age: random integer number from 1 to 120
