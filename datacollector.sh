#!/bin/bash

echo "Please enter a URL to download from"
read url #get the URL to download from from the user
curl -O "$url" #download the file from the internet

#Get the expected filename you're getting from the internet
filename=$(basename "$url")

#check if the file needs unzipping
if [[ "$url" == *.zip ]]; then
	unzip $filename
fi

#get the amount of data files that were outputted
#basically list all files in a list, check by .csv extension
#and then count the amount of lines
fileCount=$(ls -l| grep .csv | wc -l)

#make an array of CSV files
fileNames=(*.csv)

for fileNum in "${fileNames[@]}"; do
	#get the amount of columns by
	#Take the first line of a file, remove all semicolons,
	#then check how many of those there are. Increment by 1 b/c off by 1
	columnCount=$(head -1 "$fileNum" | grep -o ";" | wc -l)
	((columnCount++))
	
	#get the amount of rows by
	#Check the amount of data points, and -1 b/c the header/labels row
	rowCount=$(cat "$fileNum" | wc -l)
	((rowCount--))
	
	echo
	echo "Feature summary for " $fileNum
	#compute min, max, mean, stdDev, pass column and row count to awk
	awk -F';' -v nColumn="$columnCount" -v nRow="$rowCount" '
	NR==1{
	for (i = 1; i <= nColumn; i++){
		labels[i] = $i
		min[i] = 99999999
		max[i] = -1
		sum[i] = 0
	#declaration of arrays to hold stuff
		}
	}
	NR > 1{
		row++ #tracking mostly for stdDev
		for (i = 1; i<=nColumn; i++){

			#get the first value and do comparisons
			current = $i
			if (current < min[i]){
				min[i] = current
			}
			if (current > max[i]){
				max[i] = current
			}
			sum[i] += current
			data[row, i] = current#stored for the stdDev calc later
		}
	}
	END{	
		printf "Feature index and Names\n"

		for (i = 1; i <= nColumn; i++){
		printf "%2d. %s\n", i, labels[i]
		}

		printf "Statistics (Numerical Features)\n"
		printf "| Index | Feature                   | Min     | Max     | Mean    | StdDev |\n"
		printf "|-------|---------------------------|---------|---------|---------|--------|\n"
		
		for (i = 1; i <= nColumn; i++) {
		mean = sum[i] / nRow
		devSq = 0
		for (j = 1; j<=nRow; j++){
			devs = data[j,i] - mean
			devSq += devs * devs
		}
		variance = devSq / nRow
		stdDev = sqrt (variance)
		printf "| %2d    | %-25s | %7.3f | %7.3f | %7.3f | %7.3f\n", i, labels[i],min[i],max[i],mean,stdDev
		
	}
}
' "$fileNum"


done
