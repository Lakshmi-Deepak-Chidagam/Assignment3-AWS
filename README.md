# Assignment3-AWS

AWS ETL Pipeline with Dashboard
Introduction

In this lab, I built a simple ETL pipeline using AWS services and then displayed the results using a web application. The idea was to understand how raw data can be processed automatically and later used to generate insights.

Instead of manually cleaning or analyzing data, everything is handled through AWS services once the pipeline is set up.

How the Pipeline Works

The pipeline works in a sequence where each service handles one part of the process:

A CSV file is uploaded into S3
That upload triggers a Lambda function
The Lambda function reads the file and filters the data
The output is stored back into S3 in a different folder
A Glue Crawler scans the processed data and creates a table
Athena is used to run SQL queries on that data
A Flask application shows the results in a browser

Once this flow is configured, the system runs automatically whenever new data is uploaded.

S3 Setup

I created an S3 bucket and organized it into folders for raw data and processed data. This helps in clearly separating input files from output files.

<img width="1920" height="1200" alt="AWSBucket_screenshot" src="https://github.com/user-attachments/assets/630748c9-33c8-4f29-b70c-341d53760a7f" />


IAM Roles

Different IAM roles were created so that Lambda, Glue, and EC2 can access S3 and Athena properly. Each role was given only the required permissions.

<img width="1920" height="1200" alt="AWS_IAM_Roles_Screenshot" src="https://github.com/user-attachments/assets/bb87f120-a344-4383-9ea7-2d3f35d2828b" />


Lambda Function

The Lambda function is responsible for processing the data. It gets triggered when a new file is uploaded and then filters out unnecessary records before saving the result.
<img width="1920" height="1200" alt="AWS_lambdaFunction" src="https://github.com/user-attachments/assets/61ac93cc-fe02-435c-b8e5-3eb408f3da7f" />



Trigger Configuration

The connection between S3 and Lambda was set up using an event trigger. Because of this, the function runs automatically whenever a new file is uploaded.

<img width="1920" height="1200" alt="AWS_lambda_trigger" src="https://github.com/user-attachments/assets/a2c81fe7-a979-4324-bb00-559c1ba901fa" />


Processed Data

After the Lambda function runs, the cleaned data is stored in the processed folder. These files are later used for querying.
<img width="1920" height="1200" alt="AWS_processed_files" src="https://github.com/user-attachments/assets/00b8ffef-a7a9-430b-a603-990e81de0f80" />



Glue Crawler

The Glue Crawler scans the processed data and creates a schema so that Athena can understand the structure of the dataset.

I also checked CloudWatch logs to make sure the crawler ran successfully.

<img width="1920" height="1200" alt="AWS_crawlerCloudWatch" src="https://github.com/user-attachments/assets/570c781c-4960-48ac-bd55-ee564cab6e2a" />


Athena Queries

I used Athena to run different SQL queries on the processed data. These queries help in understanding patterns in the data such as sales trends and customer behavior.

The query results are stored in the enriched folder in S3.

<img width="1920" height="1200" alt="AWS_enriched_folder" src="https://github.com/user-attachments/assets/f428d02b-d02e-4d5f-9f32-54f8b60dc3e9" />


Web Application

Finally, I created a Flask application and ran it on an EC2 instance. The app connects to Athena, runs the queries, and displays the results in a table format.

To run the app:

python3 app.py

Then open:

http://<YOUR_PUBLIC_IP>:5000

<img width="1920" height="1200" alt="Screenshot (824)" src="https://github.com/user-attachments/assets/06927810-c0b1-494f-a569-913125cb2cc5" />
<img width="1920" height="1200" alt="Screenshot (825)" src="https://github.com/user-attachments/assets/40b62ba8-556f-41d6-94e4-b433b4881c92" />
<img width="1920" height="1200" alt="Screenshot (826)" src="https://github.com/user-attachments/assets/d945fb33-a599-4f10-99fe-cf5c769e7aeb" />

Conclusion

This project helped me understand how different AWS services work together in a real pipeline. It also showed how data can be processed automatically and then used to generate useful insights.

Overall, it gave me practical experience in building a simple data pipeline and connecting it to a frontend application.
