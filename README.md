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

The dataset has a column for **Overall Rating** which is the rating given for companies based on the reviewer's work experience. We decided to use this column as target. As we have a target in place already, we decided on Supervised Machine Learning model along with a Neural Network model to train and predict how successful the reviews are.

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

#### Data Preprocessing

We used the Seaborn Heatmap to determine the correlation between all the numeric columns in the dataset.

![image](https://user-images.githubusercontent.com/111614210/220220914-adb4b808-b843-4b69-8eb1-3ca7ae528317.png)

Using the heatmap, we decided on the following attributes to be used on the model:
- **Target:** - The target for the model is the column **overall_rating** which contains values from 1 to 5 is the rating given for companies based on the reviewer's work experience.
- **Features:** - The features used in the model are the columns listed in the image below:

  ![image](https://user-images.githubusercontent.com/111614210/220221310-6ffd36ed-32c8-4df7-808e-eb38a13e01f6.png)

- **Variables Removed** - The variables **firm, date_review, headline, pros, cons, work_life_balance, diversity_inclusion, comp_benefits** were removed.
- The variables location and job_title were binned.
- The categorical data were converted to numeric, and the resulting dataset had 95 columns.
- 
  ![image](https://user-images.githubusercontent.com/111614210/220222047-1df8ecd6-ba5b-4ae8-b23d-72a52777b33f.png)
  
#### Compiling, Training and Evaluating the model
**Keras Sequential Model**
- **Input Features:** The size of the input data selected is the number of input features for the model. Here, it is 94.
- **Output Layer Size:** The Output Layer size is 1.
- **Hidden Nodes:**
    - The number of hidden nodes in Layer 1 is 85, considering a rule of thumb that the number of hidden neurons must be less than twice the size of the input layer. (Krishnan, 2021)
    - The number of hidden nodes in Layer 2 is 30, considering a rule of thumb that the number of hidden neurons must be 2/3 the size of the input layer, plus the size of the output layer (Krishnan, 2021)
    
        ![image](https://user-images.githubusercontent.com/111614210/220223070-b7a5c4d7-4a61-4c32-9d9e-28f8958d4f8a.png)
        
- The activation functions **relu** and **softmax** were used on the hidden and output layers respectively. 
- **Result:** The model based on the parameters above gave an accuracy score of 5.7% which is way below the target of 75%.

**Optimization 1:**
- To be sure that the correct input features are used, a seaborn heatmap was created on the dataset created while converting categorical data to numeric.

  ![image](https://user-images.githubusercontent.com/111614210/220224427-485710ca-7f1d-43a2-91a4-702f72992b24.png)
  
- Following this, the location and job_title columns were removed, and the resulting dataset had 15 columns.

  ![image](https://user-images.githubusercontent.com/111614210/220224727-98f3677e-7472-43d6-af42-08c09f57f24d.png)
 
- The input features and hidden nodes following the optimization are as follows:
  
  ![image](https://user-images.githubusercontent.com/111614210/220224954-726815ba-41a0-424a-b2b5-0c7f1892eb7c.png)
  
- **Result:** There was no improvement and the model still gave an accuracy score of 5.7%.

**Optimizations 2, 3 & 4:** Anumber of modifications were perfomed on the input features, hidden nodes and layers with no improvement on the accuracy score which continued to stay on 5.7%

**Optimization 5:** 
- In addition to the seaborn heatmap, Cramer's V statistic was used to compute the correlation between the numerical categorical columns and the highlighted columns were added back to the features list.

![image](https://user-images.githubusercontent.com/111614210/220226939-375bd886-fc59-402f-a6a7-0939944d2389.png)

- The keras tuner was automated to choose the best of activation models, hidden neuron and layers.
- However, there was no change in the accuracy score. 


## Unsupervised Machine Learning

## Data Analysis and Visualisation
Tableau

## Conclusions

## Limitations

