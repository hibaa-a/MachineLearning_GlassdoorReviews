# Glass Door Reviews: Using Machine Learning and Deep Learning Models to Analyse Glassdoor Reviews

![image](https://user-images.githubusercontent.com/109045338/219970727-a5f333cb-43e0-4ede-b15f-5faee338aca9.png)

## Proposal 

Glassdoor is one the fastest growing jobs and recruiting sites. Glassdoor holds a growing database of millions of company reviews, CEO approval ratings, salary reports, interview reviews and questions, benefits reviews, office photos and more. We will take a deeper look in some of the job reviews to see if we can identify any trends and interpret the reviews. Our aim is to build a machine learning model using !!!!Natural Language Processing!!! to predict how helpful the Glassdoor reviews are.

## Dataset

Glassdoor Job Reviews https://www.kaggle.com/datasets/davidgauthier/glassdoor-job-reviews?resource=download

## Tools

### Back-end: 

Importing data: SQL?

Data Cleaning and Processing: Python

**Supervised Machine Learning**

Creating a connection string for the Glassdoor database.Create an engine instance Connect to PostgreSQL server.Read data from PostgreSQL database table and load into a DataFrame instance.Close the database connection.next is Appling different

**(1) Decision tree**
 
 A decision tree is one of the supervised machine learning algorithms. This algorithm can be used for regression and classification problems.where my Traning ,testing score is (0.7084662294914649) and (0.6312385180649112).

**(2) Bagging**
 
 Apply Bagging  Instead of having one decision tree, we make 50 random trees and average their output. Decision trees try to make the best decision possible at every point where my score: 0.637630128597673.

**(3) Extremely Random Trees**
 
 Applying Extremely Random Trees where Training Score is: 0.7084662294914649 Testing Score: 0.6336114513165952 .

**(4) Random Forest**

Applying Random Forest where Training Score: 0.7084662294914649
Testing Score: 0.6370560318432333  .

**(5) K-nearest neighbors**

Applying K-nearest neighbors where Acc: 0.626 .because scroe is not very good so we try 2nd lteration where our score improve 1%



### Visualisation:

Data Visualisations: Tableau

Storytelling: Google Docs

## Process

### Data Cleaning steps:

-

-

-

## Results

## Conclusions



Features
The columns correspond to the date of the review, the job name, the job location, the status of the reviewers, and the reviews. Reviews are divided in s sub-categories Career Opportunities, Comp & Benefits, Culture & Values, Senior Management, and Work/Life Balance. In addition, employees can add recommendations on the firm, the CEO, and the outlook.

Other information
Ranking for the recommendation of the firm, CEO approval, and outlook are allocated categories v, r, x, and o, with the following meanings:
v - Positive, r - Mild, x - Negative, o - No opinion
