# Job Tracker

## Instructions

Clone the project from GitHub and run the steps below in order to run the project locally.

1. rake db:create
2. rake db:migrate
3. rails s

## Third Party Packages

For this project I used Bootstrap. I picked this because it's popular, but I haven't used it in awhile and wanted to refresh my memory.

## Explanation of how your program works and why this is an effective implementation

I added the sources into the database through a migration, which invoked a rake task.

When a user uploads a csv file, it parses the file and creates a job for each line if the url is unique. During this it will try to find the source according to these rules:

1. If there is no url given, assign "Source Unknown"
2. If any part of the url matches any part of the source root domain or name, assign the source name
3. If the url contains "jobs", "careers", or company_name, assign "Company Website"
4. If none of the conditions above are met, assign "Source Unknown"

I realize this method is expensive and slow, and would love to pair program with someone on how to make this method faster using SQL or ActiveRecord.

After the upload, it redirects to the sources summary page, which lists all of the sources available. If a user clicks on a card, it redirects to show a list of jobs from that source.

## Deployed to Heroku at:

https://chan-job-tracker.herokuapp.com/

## CSV for Uploading

[sample csv file](https://drive.google.com/file/d/1rJNq7ZqtijquqgpyyuoovjLuFKE6-cL8/view?usp=sharing)

## Job Source and the Total Count of Job Opportunities

See http://localhost:3000/sources/subtotal or https://chan-job-tracker.herokuapp.com/sources/subtotal
