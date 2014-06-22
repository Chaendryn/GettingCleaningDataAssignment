# Codebook for UCI HAR Dataset and Analysis
###Version 1.0

Yolande Korsten


## Dataset and origin

This analysis uses the dataset provided by Jorge L. Reyes-Ortiz, Davide Anguita, 
Alessandro Ghio, Luca Oneto from Smartlab - Non Linear Complex Systems Laboratory

See README.md for details on the origin of the data and where to download the dataset.
See `UCI HAR Dataset` README.txt file (part of the zip file download) for details on how 
the data was collected and processed.

## Units of measurement:

The measurement data has been scaled by dividing it with the range of data.  The units of measurement have 
thus been cancelled leaving a ratio.  Therefore there are no units of measurement associated with the 
measurement data.

  
## Variables:

### Legend for interpreting variable naming patterns:
* **t** : time domain signal
* **f** : frequency domain signal
* **Body** : body movement signal
* **Gravity** : gravity movement signal
* **Acc** : accelerometer signal
* **Gyro** : gyroscope signal
* **Jerk** : jerk signal
* **Mag** : signal magnitude
* **X** : signal measurement on the X axis
* **Y** : signal measurement on the Y axis
* **Z** : signal measurement on the Z axis
* **Mean** : mean value of the signals
* **Std** : standard deviation of the signals

### Variables:

**Identifier Variables:**

1. SubjectID (class: numeric) - unique identifier for each person who participated in the study, 30 subjects
2. Activity (class: factor with 6 levels) - name of the activity the subject was performing when the readings were collected 


**Measurement Variables:**

1. tBodyAccMeanX (class: numeric) - time domain body acceleration mean on the X axis
2. tBodyAccMeanY (class: numeric) - time domain body acceleration mean on the Y axis
3. tBodyAccMeanZ (class: numeric) - time domain body acceleration mean on the Z axis
4. tBodyAccStdX (class: numeric) - time domain body acceleration standard deviation on the X axis
5. tBodyAccStdY (class: numeric) - time domain body acceleration standard deviation on the Y axis
6. tBodyAccStdZ (class: numeric) - time domain body acceleration standard deviation on the Z axis
7. tGravityAccMeanX (class: numeric) - time domain gravity acceleration mean on the X axis
8. tGravityAccMeanY (class: numeric) - time domain gravity acceleration mean on the Y axis
9. tGravityAccMeanZ (class: numeric) - time domain gravity acceleration mean on the Z axis
10. tGravityAccStdX (class: numeric) - time domain gravity acceleration standard deviation on the X axis
11. tGravityAccStdY (class: numeric) - time domain gravity acceleration standard deviation on the Y axis
12. tGravityAccStdZ (class: numeric) - time domain gravity acceleration standard deviation on the Z axis
13. tBodyAccJerkMeanX (class: numeric) - time domain body acceleration jerk mean on the X axis
14. tBodyAccJerkMeanY (class: numeric) - time domain body acceleration jerk mean on the Y axis
15. tBodyAccJerkMeanZ (class: numeric) - time domain body acceleration jerk mean on the Z axis
16. tBodyAccJerkStdX (class: numeric) - time domain body acceleration jerk standard deviation on the X axis
17. tBodyAccJerkStdY (class: numeric) - time domain body acceleration jerk standard deviation on the Y axis
18. tBodyAccJerkStdZ (class: numeric) - time domain body acceleration jerk standard deviation on the Z axis
19. tBodyGyroMeanX (class: numeric) - time domain body gyroscopic mean on the X axis
20. tBodyGyroMeanY (class: numeric) - time domain body gyroscopic mean on the Y axis
21. tBodyGyroMeanZ (class: numeric) - time domain body gyroscopic mean on the Z axis
22. tBodyGyroStdX (class: numeric) - time domain body gyroscopic standard deviation on the X axis
23. tBodyGyroStdY (class: numeric) - time domain body gyroscopic standard deviation on the Y axis
24. tBodyGyroStdZ (class: numeric) - time domain body gyroscopic standard deviation on the Z axis
25. tBodyGyroJerkMeanX (class: numeric) - time domain body gyroscopic jerk mean on the X axis
26. tBodyGyroJerkMeanY (class: numeric) - time domain body gyroscopic jerk mean on the Y axis
27. tBodyGyroJerkMeanZ (class: numeric) - time domain body gyroscopic jerk mean on the Z axis
28. tBodyGyroJerkStdX (class: numeric) - time domain body gyroscopic jerk standard deviation on the X axis
29. tBodyGyroJerkStdY (class: numeric) - time domain body gyroscopic jerk standard deviation on the Y axis
30. tBodyGyroJerkStdZ (class: numeric) - time domain body gyroscopic jerk standard deviation on the Z axis
31. tBodyAccMagMean (class: numeric) - time domain body acceleration magnitude mean
32. tBodyAccMagStd (class: numeric) - time domain body acceleration magnitude standard deviation
33. tGravityAccMagMean (class: numeric) - time domain gravity acceleration magnitude mean
34. tGravityAccMagStd (class: numeric) - time domain gravity acceleration standard deviation
35. tBodyAccJerkMagMean (class: numeric) - time domain body acceleration jerk magnitude mean
36. tBodyAccJerkMagStd (class: numeric) - time domain body acceleration jerk magnitude standard deviation
37. tBodyGyroMagMean (class: numeric) - time domain body gyroscopic magnitude mean
38. tBodyGyroMagStd (class: numeric) - time domain body gyroscopic magnitude standard deviation
39. tBodyGyroJerkMagMean (class: numeric) - time domain body gyroscopic jerk magnitude mean
40. tBodyGyroJerkMagStd (class: numeric) - time domain body gyroscopic jerk magnitude standard deviation
41. fBodyAccMeanX (class: numeric) - frequency domain body acceleration mean on the X axis
42. fBodyAccMeanY (class: numeric) - frequency domain body acceleration mean on the Y axis
43. fBodyAccMeanZ (class: numeric) - frequency domain body acceleration mean on the Z axis
44. fBodyAccStdX (class: numeric) - frequency domain body acceleration standard deviation on the X axis
45. fBodyAccStdY (class: numeric) - frequency domain body acceleration standard deviation on the Y axis
46. fBodyAccStdZ (class: numeric) - frequency domain body acceleration standard deviation on the Z axis
47. fBodyAccJerkMeanX (class: numeric) - frequency domain body acceleration jerk mean on the X axis
48. fBodyAccJerkMeanY (class: numeric) - frequency domain body acceleration jerk mean on the Y axis
49. fBodyAccJerkMeanZ (class: numeric) - frequency domain body acceleration jerk mean on the Z axis
50. fBodyAccJerkStdX (class: numeric) - frequency domain body acceleration jerk standard deviation on the X axis
51. fBodyAccJerkStdY (class: numeric) - frequency domain body acceleration jerk standard deviation on the Y axis
52. fBodyAccJerkStdZ (class: numeric) - frequency domain body acceleration jerk standard deviation on the Z axis
53. fBodyGyroMeanX (class: numeric) - frequency domain body gyroscopic mean on the X axis
54. fBodyGyroMeanY (class: numeric) - frequency domain body gyroscopic mean on the Y axis
55. fBodyGyroMeanZ (class: numeric) - frequency domain body gyroscopic mean on the Z axis
56. fBodyGyroStdX (class: numeric) - frequency domain body gyroscopic standard deviation on the X axis
57. fBodyGyroStdY (class: numeric) - frequency domain body gyroscopic standard deviation on the Y axis
58. fBodyGyroStdZ (class: numeric) - frequency domain body gyroscopic standard deviation on the Z axis
59. fBodyAccMagMean (class: numeric) - frequency domain body acceleration magnitude mean
60. fBodyAccMagStd (class: numeric) - frequency domain body acceleration magnitude standard deviation
61. fBodyAccJerkMagMean (class: numeric) - frequency domain body acceleration jerk magnitude mean
62. fBodyAccJerkMagStd (class: numeric) - frequency domain body acceleration jerk magnitude standard deviation
63. fBodyGyroMagMean (class: numeric) - frequency domain body gyroscopic magnitude mean
64. fBodyGyroMagStd (class: numeric) - frequency domain body gyroscopic magnitude standard deviation
65. fBodyGyroJerkMagMean (class: numeric) - frequency domain body gyroscopic jerk magnitude mean
66. fBodyGyroJerkMagStd (class: numeric) - frequency domain body gyroscopic jerk magnitude standard deviation


## Data


The values contained in the tidy dataset `tidy.txt` is the average value as calculated by `run_analysis.R` for
each combination of Subject ID and Activity.

Each record/row contains the analysis of one combination of subject and activity measured for all 68 measurement 
variables.

