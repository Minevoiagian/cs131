#! /bin/awk -f
function findAvg(totalGrade, classCount)
{
        avgGrade = totalGrade/classCount
        return avgGrade
}
BEGIN{
        FS=","#because that's the delimiter in the sample data 
}

{
        gradeSum=0#running total of the grades
        numClasses = 0#used to calculate average later
        if (NR>1){#we don't care about the header row, so skip it
                IDarray[NR]=$1#i thought there might be a use to ID numbers, but was unnecessary
                nameArray[NR]=$2#The names are in the second column

                #read in all grades, starting at column 3 until no more
                #The sample only has 3, but might as well make it a bit more resilient
                for (i=3; i<=NF;i++){
                        numClasses++
                        gradeSum+=$i
                }

                #add the grades to the given array, then find average and 
                #put that in another array
                grades[NR] = gradeSum
                gradeAvg[NR] = findAvg(gradeSum, numClasses)
        }
}
END{
        #these are 2 bc that's what the first data row is
        bestScoreRow = 2
        worstScoreRow = 2
        for (i=2; i<=NR;i++){#print out everything, skipping the header which will show 0s and be annoying
             printf("Grades for %s\n", nameArray[i])
             printf("--------------------\n")
             printf("Total score: %.2f\n", grades[i])
             printf("Average score: %.2f\n",gradeAvg[i])

             #all i care about is what row the best student is at
             if (grades[i] > grades[bestScoreRow]){
			 bestScoreRow = i
                    }
             if (grades[i] < grades[worstScoreRow]){
                      worstScoreRow = i
                     }

             if(gradeAvg[i] >= 70.0){
                     printf("Status: Pass\n\n")
                     }
             else{
                     printf("Status: Fail\n\n")
                     }
     }
     printf("Best Scoring Student:  %s\n", nameArray[bestScoreRow])
     printf("Worst Scoring Student: %s\n", nameArray[worstScoreRow])

}