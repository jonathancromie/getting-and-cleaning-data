Getting and Cleaning Data
=====================================

## CodeBook

The values in this dataset are considered tidy. Each variable is contained in its own column, each observation is in its own row, there is one table for each kind of variable, and these tables are linked. The table also contains headers which have been made to be human readable.

The data gathered from the datasets include the mean and standard deviation. The tidy dataset is in a wide format and have been aggregated using the mean function.

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals. The time domain signals were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (Time Body Accelerometer-XYZ and Time Gravity Accelerometer-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (Time Body Accelerometer Jerk-XYZ and Time Body Gyroscope Jerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (Time Body Accelerometer Magnitude, Time Gravity Accelerometer Magnitude, Time Body Accelerometer Jerk Magnitude, Time Body Gyroscope Magnitude, Time Body Gyroscope Jerk Magnitude). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing Frequency Body Accelerometer-XYZ, Frequency Body Accelerometer Jerk-XYZ, Frequency Body Gyroscope-XYZ, Frequency Body Accelerometer Jerk Magnitude, Frequency Body Gyroscope Magnitude, Frequency Body Gyroscope Jerk Magnitude.

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions. 

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable.

| Variable    | Description           | Range | Type    | Value | Value Label         |
| ----------  | --------------------- | ----- | ------- | ----- | ------------------- |
| subject_id  | Volunteer             | 1-30  | int     |       |                     |
| activity_id | Activity              | 1-6   | int     | 1     | Walking             |
| activity_id | Activity              | 1-6   | int     | 2     | Walking Upstairs    |
| activity_id | Activity              | 1-6   | int     | 3     | Walking Downstairs  |
| activity_id | Activity              | 1-6   | int     | 4     | Sitting             |
| activity_id | Activity              | 1-6   | int     | 5     | Standing            |
| activity_id | Activity              | 1-6   | int     | 6     | Laying              |
| Time Body Accelerometer mean X Axis | | | numeric | | |
| Time Body Accelerometer mean Y Axis | | | numeric | | |
| Time Body Accelerometer mean Z Axis | | | numeric | | |
| Time Body Accelerometer std X Axis | | | numeric | | |
| Time Body Accelerometer std Y Axis | | | numeric | | |
| Time Body Accelerometer std Z Axis | | | numeric | | |
| Time Gravity Accelerometer mean X Axis | | | numeric | | |
| Time Gravity Accelerometer mean Y Axis | | | numeric | | |
| Time Gravity Accelerometer mean Z Axis | | | numeric | | |
| Time Gravity Accelerometer std X Axis | | | numeric | | |
| Time Gravity Accelerometer std Y Axis | | | numeric | | |
| Time Gravity Accelerometer std Z Axis | | | numeric | | |
| Time Body Accelerometer Jerk mean X Axis | | | numeric | | |
| Time Body Accelerometer Jerk mean Y Axis | | | numeric | | |
| Time Body Accelerometer Jerk mean Z Axis | | | numeric | | |
| Time Body Accelerometer Jerk std X Axis | | | numeric | | |
| Time Body Accelerometer Jerk std Y Axis | | | numeric | | |
| Time Body Accelerometer Jerk std Z Axis | | | numeric | | |
| Time Body Gyroscope mean X Axis | | | numeric | | |
| Time Body Gyroscope mean Y Axis | | | numeric | | |
| Time Body Gyroscope mean Z Axis | | | numeric | | |
| Time Body Gyroscope std X Axis | | | numeric | | |
| Time Body Gyroscope std Y Axis | | | numeric | | |
| Time Body Gyroscope std Z Axis | | | numeric | | |
| Time Body Gyroscope Jerk mean X Axis | | | numeric | | |
| Time Body Gyroscope Jerk mean Y Axis | | | numeric | | |
| Time Body Gyroscope Jerk mean Z Axis | | | numeric | | |
| Time Body Gyroscope Jerk std X Axis | | | numeric | | |
| Time Body Gyroscope Jerk std Y Axis | | | numeric | | |
| Time Body Gyroscope Jerk std Z Axis | | | numeric | | |
| Time Body Accelerometer Magnitude mean | | | numeric | | |
| Time Body Accelerometer Magnitude std | | | numeric | | |
| Time Gravity Accelerometer Magnitude mean | | | numeric | | |
| Time Gravity Accelerometer Magnitude std | | | numeric | | |
| Time Body Accelerometer Jerk Magnitude mean | | | numeric | | |
| Time Body Accelerometer Jerk Magnitude std | | | numeric | | |
| Time Body Gyroscope Magnitude mean | | | numeric | | |
| Time Body Gyroscope Magnitude std | | | numeric | | |
| Time Body Gyroscope Jerk Magnitude mean | | | numeric | | |
| Time Body Gyroscope Jerk Magnitude std | | | numeric | | |
| Frequency Body Accelerometer mean Freq X Axis | | | numeric | | |
| Frequency Body Accelerometer mean Freq Y Axis | | | numeric | | |
| Frequency Body Accelerometer mean Freq Z Axis | | | numeric | | |
| Frequency Body Accelerometer std X Axis | | | numeric | | |
| Frequency Body Accelerometer std Y Axis | | | numeric | | |
| Frequency Body Accelerometer std Z Axis | | | numeric | | |
| Frequency Body Accelerometer mean Freq X Axis | | | numeric | | |
| Frequency Body Accelerometer mean Freq Y Axis | | | numeric | | |
| Frequency Body Accelerometer mean Freq Z Axis | | | numeric | | |
| Frequency Body Accelerometer Jerk mean X Axis | | | numeric | | |
| Frequency Body Accelerometer Jerk mean Y Axis | | | numeric | | |
| Frequency Body Accelerometer Jerk mean Z Axis | | | numeric | | |
| Frequency Body Accelerometer Jerk std X Axis | | | numeric | | |
| Frequency Body Accelerometer Jerk std Y Axis | | | numeric | | |
| Frequency Body Accelerometer Jerk std Z Axis | | | numeric | | |
| Frequency Body Accelerometer Jerk mean Freq X Axis | | | numeric | | |
| Frequency Body Accelerometer Jerk mean Freq Y Axis | | | numeric | | |
| Frequency Body Accelerometer Jerk mean Freq Z Axis | | | numeric | | |
| Frequency Body Gyroscope mean X Axis | | | numeric | | |
| Frequency Body Gyroscope mean Y Axis | | | numeric | | |
| Frequency Body Gyroscope mean Z Axis | | | numeric | | |
| Frequency Body Gyroscope std X Axis | | | numeric | | |
| Frequency Body Gyroscope std Y Axis | | | numeric | | |
| Frequency Body Gyroscope std Z Axis | | | numeric | | |
| Frequency Body Gyroscope mean Freq X Axis | | | numeric | | |
| Frequency Body Gyroscope mean Freq Y Axis | | | numeric | | |
| Frequency Body Gyroscope mean Freq Z Axis | | | numeric | | |
| Frequency Body Accelerometer Magnitude mean | | | numeric | | |
| Frequency Body Accelerometer Magnitude std | | | numeric | | |
| Frequency Body Accelerometer Magnitude mean Freq | | | numeric | | |
| Frequency Body Accelerometer Jerk Magnitude mean  | | | numeric | | |
| Frequency Body Accelerometer Jerk Magnitude std  | | | numeric | | |
| Frequency Body Accelerometer Jerk Magnitude mean Freq | | | numeric | | |
| Frequency Body Gyroscope Magnitude mean | | | numeric | | |
| Frequency Body Gyroscope Magnitude std  | | | numeric | | |
| Frequency Body Gyroscope Magnitude mean Freq | | | numeric | | |
| Frequency Body Gyroscope Jerk Magnitude mean  | | | numeric | | |
| Frequency Body Gyroscope Jerk Magnitude std | | | numeric | | |
| Frequency Body Gyroscope Jerk Magnitude mean Freq | | | numeric | | |
| angle(t Body Accelerometer Mean,gravity) | | | numeric | | |
| angle(t Body Accelerometer Jerk Mean),gravity Mean) | | | numeric | | |
| angle(t Body Gyroscope Mean,gravity Mean) | | | numeric | | |
| angle(t Body Gyroscope Jerk Mean,gravity Mean) | | | numeric | | |
| angle(X Axis,gravity Mean) | | | numeric | | |
| angle(Y Axis,gravity Mean)  | | | numeric | | |
| angle(Z Axis,gravity Mean)  | | | numeric | | |

## Reference

[Codebook cookbook](http://www.medicine.mcgill.ca/epidemiology/joseph/pbelisle/CodebookCookbook.html)

