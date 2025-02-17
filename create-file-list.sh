DATE_TIME=$(date +"%Y-%m-%d-%H-%M-%S")
TMP_FILE="/tmp/volume-file-list-$DATE_TIME"
FOLDERS_TO_SCAN="/volume1/MIXED/ /volume2/TV/"
OUTPUT_FOLDER="/volume1/MIXED/#lists/"
echo '"Filename","Size","Modification Date"' > $TMP_FILE.csv
find $FOLDERS_TO_SCAN -type f -printf '"%p","%s","%TY-%Tm-%Td %TH:%TM:%TS"\n' >> $TMP_FILE.csv
zip -r $TMP_FILE.zip $TMP_FILE.csv
mv $TMP_FILE.zip $OUTPUT_FOLDER
rm -f $TMP_FILE.csv