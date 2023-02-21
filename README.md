# Glass Door Reviews: Using Machine Learning and Deep Learning Models to Analyse Glassdoor Reviews

![image](https://user-images.githubusercontent.com/109045338/219970727-a5f333cb-43e0-4ede-b15f-5faee338aca9.png)

## Team
- Astha Nayak
- Badrija Khalifa
- Hibaa Aldubai
- Kazimierz Lubas
- Nandhini Nallathambi

## Proposal 

Glassdoor is one the fastest growing jobs and recruiting sites. Glassdoor holds a growing database of millions of company reviews, CEO approval ratings, salary reports, interview reviews and questions, benefits reviews, office photos and more. 

We will take a deeper look in some of the job reviews to see if we can identify any trends and interpret the reviews. Our aim is to build a machine learning model using Natural Language Processing to predict how helpful the Glassdoor reviews are.

## Dataset

Glassdoor Job Reviews https://www.kaggle.com/datasets/davidgauthier/glassdoor-job-reviews?resource=download

The dataset contains the following columns:
- Firm 
- Date of Review
- Job Title
- Job Location
- Status of the reviwers
- Overall Rating (1 to 5)
- Career Opportunities (1 to 5)
- Comp & Benefits (1 to 5)
- Culture and Values (1 to 5)
- Senior Management (1 to 5)
- Work / Life Balance (1 to 5)
- Recommendation of the firm (v - Positive, r - Mild, x - Negative, o - No opinion)
- Approve of the CEO (v - Positive, r - Mild, x - Negative, o - No opinion)
- Outlook (v - Positive, r - Mild, x - Negative, o - No opinion)
- Review Headline (free text)
- Pros (free text)
- Cons (free text)

## Tools / Technology
- Python
- Pandas
- PostgreSQL
- SQLAlchemy
- PySpark
- Tableau
- Machine Learning

## Data Extraction, Transformation and Load

We used the dataset above and removed all the unnecessary columns and rows with duplicates and null values. We then established the connection with PostgreSQL using SQLAlchemy engine and uploaded the cleaned dataset into the table **glassdoor** in **Glassdoor_Reviews** database.

![image](https://user-images.githubusercontent.com/111614210/220194349-73b13d90-173f-4dab-9bc3-ade52b8c9a54.png)

## Creation and Training of Machine Learning Models

The dataset has a column for **Overall Rating** which is the rating given for companies based on the user's work experience. We decided to use this column as target. As we have a target in place already, we decided on Supervised Machine Learning model along with a Neural Network model to train and predict how successful the reviews are.

### Supervised Machine Learning

We created and trained the following models:
- Decision Tree
- Bagging
- Extremely Random Trees
- Random Forest
- K-nearest neighbors

We connected to the PostgreSQL using SQLAlchemy engine instance and loaded the data onto a dataframe to create the models. We considered only the numeric columns (work_life_balance, culture_values, diversity_inclusion, career_opp, comp_benefits, senior_mgmt) for the model.

#### 1) Decision Tree
 
The Decision Tree algorithm is used on regression and classification problems. Here, the field **Overall Rating** has 5 values (1 to 5) abd so this is a classification problem. The training and testing scores were 0.7084662294914649 and 0.6312385180649112 respectively.

![image](https://user-images.githubusercontent.com/111614210/220196831-a6e9b4e7-21a5-4030-9e4d-fd7c6916bcae.png)

#### 2) Bagging

As the accuracy score from the decision tree model above doesn't hit the target of 75% accuracy, we decided to create a random ensemble known as bootstrap aggregating, or bagging. By doing this instead of having one decision tree, we make 50 random trees and average their output.

Doing this took the score further down to 0.637630128597673.

![image](https://user-images.githubusercontent.com/111614210/220197683-c207d134-40d6-4e6f-866b-d009fbbee61e.png)

#### 3) Extremely Random Trees

Extremely Randomized Trees (ET) construct multiple trees like RF (Random Forest) algorithms during training time over the entire dataset. During training, the ET will construct trees over every observation in the dataset but with different subsets of features.

Applying Extremely Random Trees, the training and testing scores were 0.7084662294914649 and 0.6336114513165952 respectively.

![image](https://user-images.githubusercontent.com/111614210/220201278-45f088b8-de7c-447c-ab19-dcf055db41ef.png)

#### 4) Random Forest

A random forest can perform both regression and classification tasks. It can handle large datasets efficiently and works well with non-linear data. The random forest algorithm provides a higher level of accuracy in predicting outcomes and has better accuracy than other classification algorithms.

Applying Random Forest, the training and testing scores are 0.7084662294914649 and 0.6370560318432333 respectively.

![image](https://user-images.githubusercontent.com/111614210/220201742-113070f7-08d9-425d-b4b9-51c266f6a362.png)

#### 5) K-nearest Neighbors

The k-nearest neighbors algorithm, also known as KNN or k-NN, is a non-parametric, supervised learning classifier, which uses proximity to make classifications or predictions about the grouping of an individual data point.

In k-NN, the number "k" refers to the number of nearest neighbors to consider when classifying a new instance. The k nearest neighbors are the k instances in the training dataset that are closest to the new instance based on a similarity measure, such as Euclidean distance.

Applying the K-nearest neighbors, we got an accuracy score of 0.626

As none of the models hit the target of 75%, we went for second iteration. For this, in addition to the input features we had already, we included the columns recommend, ceo_approv, outlook and firm. Though there was a huge improvement with the training scores, the test scores improved slightly. 

![image](https://user-images.githubusercontent.com/111614210/220213920-b7eecb06-72c7-443a-93c7-a8a76967acc3.png)

### Neural Networks



### Data Analysis and Visualisation

Data Visualisations: Tableau

## Process

### Data Cleaning steps:

-

-

-

## Results

## Conclusions

