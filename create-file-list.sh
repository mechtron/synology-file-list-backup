TODAY=$(date +"%Y-%m-%d")
OUTPUT_FILE="/volume1/MIXED/#lists/volume-file-list-$TODAY"
echo '"Filename","Size","Modification Date"' > $OUTPUT_FILE.csv
find /volume1/MIXED/ /volume2/TV/ -type f -printf '"%p","%s","%TY-%Tm-%Td %TH:%TM:%TS"\n' >> $OUTPUT_FILE.csv
zip -r $OUTPUT_FILE.zip $OUTPUT_FILE.csv
rm -f $OUTPUT_FILE.csv