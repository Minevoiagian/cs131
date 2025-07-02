# datacollector.sh

Dependencies:
Requires unzip

Execute "datacollector.sh" from the BASH shell
You will be prompted for a file to download from the internet
Provide the complete link to said file
The program will unzip the file if necessary
Assuming the zip contains CSVs, the program will process said CSVs, return output the column number, labels, minimum, maximum, mean, and standard deviation for each column to "summary.md"

Example run


TERMINAL@instance-20250602-164233:~/cs131/a2$ ./datacollector.sh 
Please enter a URL to download from
https://archive.ics.uci.edu/static/public/186/wine+quality.zip
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100 91353    0 91353    0     0   203k      0 --:--:-- --:--:-- --:--:--  202k
Archive:  wine+quality.zip
  inflating: winequality-red.csv     
  inflating: winequality-white.csv   
  inflating: winequality.names       

Feature summary for  winequality-red.csv
Feature index and Names
 1. "fixed acidity"
 2. "volatile acidity"
 3. "citric acid"
 4. "residual sugar"
 5. "chlorides"
 6. "free sulfur dioxide"
 7. "total sulfur dioxide"
 8. "density"
 9. "pH"
10. "sulphates"
11. "alcohol"
12. "quality"
Statistics (Numerical Features)
| Index | Feature                   | Min     | Max     | Mean    | StdDev |
|-------|---------------------------|---------|---------|---------|--------|
|  1    | "fixed acidity"           |   4.600 |  15.900 |   8.320 |   1.741
|  2    | "volatile acidity"        |   0.120 |   1.580 |   0.528 |   0.179
|  3    | "citric acid"             |   0.000 |   1.000 |   0.271 |   0.195
|  4    | "residual sugar"          |   0.900 |  15.500 |   2.539 |   1.409
|  5    | "chlorides"               |   0.012 |   0.611 |   0.087 |   0.047
|  6    | "free sulfur dioxide"     |   1.000 |  72.000 |  15.875 |  10.457
|  7    | "total sulfur dioxide"    |   6.000 | 289.000 |  46.468 |  32.885
|  8    | "density"                 |   0.990 |   1.004 |   0.997 |   0.002
|  9    | "pH"                      |   2.740 |   4.010 |   3.311 |   0.154
| 10    | "sulphates"               |   0.330 |   2.000 |   0.658 |   0.169
| 11    | "alcohol"                 |   8.400 |  14.900 |  10.423 |   1.065
| 12    | "quality"                 |   3.000 |   8.000 |   5.636 |   0.807

Feature summary for  winequality-white.csv
Feature index and Names
 1. "fixed acidity"
 2. "volatile acidity"
 3. "citric acid"
 4. "residual sugar"
 5. "chlorides"
 6. "free sulfur dioxide"
 7. "total sulfur dioxide"
 8. "density"
 9. "pH"
10. "sulphates"
11. "alcohol"
12. "quality"
Statistics (Numerical Features)
| Index | Feature                   | Min     | Max     | Mean    | StdDev |
|-------|---------------------------|---------|---------|---------|--------|
|  1    | "fixed acidity"           |   3.800 |  14.200 |   6.855 |   0.844
|  2    | "volatile acidity"        |   0.080 |   1.100 |   0.278 |   0.101
|  3    | "citric acid"             |   0.000 |   1.660 |   0.334 |   0.121
|  4    | "residual sugar"          |   0.600 |  65.800 |   6.391 |   5.072
|  5    | "chlorides"               |   0.009 |   0.346 |   0.046 |   0.022
|  6    | "free sulfur dioxide"     |   2.000 | 289.000 |  35.308 |  17.005
|  7    | "total sulfur dioxide"    |   9.000 | 440.000 | 138.361 |  42.494
|  8    | "density"                 |   0.987 |   1.039 |   0.994 |   0.003
|  9    | "pH"                      |   2.720 |   3.820 |   3.188 |   0.151
| 10    | "sulphates"               |   0.220 |   1.080 |   0.490 |   0.114
| 11    | "alcohol"                 |   8.000 |  14.200 |  10.514 |   1.230
| 12    | "quality"                 |   3.000 |   9.000 |   5.878 |   0.886

