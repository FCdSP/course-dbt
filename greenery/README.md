# Week 1

## Metrics:

- **Total Users**: The total number of unique users registered on the platform.
- **Average Orders per Hour**: The average number of orders placed every hour.
- **Average Hours to Deliver**: On average, the number of hours it takes from an order being placed to being delivered.
- **Users by Purchase Count**: How many users have made one, two, or three or more purchases.
- **Average Sessions per Hour**: The average number of unique browsing sessions on the platform every hour.

## Results:

| Metric                          | Value      |
|---------------------------------|------------|
| Total Users                     | 130        |
| Average Orders per Hour         | 7.520      |
| Average Hours to Deliver        | 93.403     |
| Users with One Purchase         | 25         |
| Users with Two Purchases        | 28         |
| Users with Three+ Purchases     | 71         |
| Average Sessions per Hour       | 16.327     |

**Analysis can be seen here: https://github.com/FCdSP/course-dbt/blob/main/greenery/analyses/week_1_project.sql**
# Week 2

## Business objectives:

- **What is our user repeat rate?**: The ratio of users who made two or more purchases over total users.
- **Define good indicators for potential repeat users**
- **Define good indicators for potential non-repeat users**
- **What assumptions are you making about each model? (i.e. why are you adding each test?)**
- **Did you find any “bad” data as you added and ran tests on your models? How did you go about either cleaning the data in the dbt model or adjusting your assumptions/tests?**
- **How you would ensure these tests are passing regularly and how you would alert stakeholders about bad data getting through.**
- **Which products had their inventory change from week 1 to week 2?**
  
## Results:

| Metric                          | Value      |
|---------------------------------|------------|
| Repeat rate                     | 79.84%     |

- **Define good indicators for potential repeat users**
  - **Number of itens on previous order**
  - **Usage of promo codes**
  - **Number of sessions until purchase**
  - **Average delivery time for the user**
  - **Good Reviews on the products**
  - **Good Reviews of the platform itself**

- **Define good indicators for potential non-repeat users**
  - **Type of product ordered (one-type purchases)**
  - **Email spam rate**
  - **Average delivery time for the user**
  - **Bad Reviews on the products**
  - **Bad Reviews of the platform itself**

- **What assumptions are you making about each model? (i.e. why are you adding each test?)**
  - **Since we are combining the data from staging layers, intermediate and fact/dimensions tables, we need to make sure we are linking (relationship to other tables) correclly. Also, make sure some variables aren't null, are unique etc**

- **Did you find any “bad” data as you added and ran tests on your models? How did you go about either cleaning the data in the dbt model or adjusting your assumptions/tests?**
  - **Yes, some tests are breaking, meaning we are going to have to go through what kind of erros (are there null values for variables that should always have values, are there negative values for where it shouldn't etc**

- **How you would ensure these tests are passing regularly and how you would alert stakeholders about bad data getting through.**
  - **1. Schedule the test to run at least daily, if not hourly for data pertaining the orders, 2. Have (small) cerimonies to check the state of the data 3. If anything is breaking, automate messages to list the data that is incorrect and try to estimate an SLA to correct it**

- **Which products had their inventory change from week 1 to week 2?**
  - **String of Pearls: -48**
  - **Philodendron:     -26**
  - **Pothos:           -20**
  - **Monstera:         -13**

**Analysis can be seen here: https://github.com/FCdSP/course-dbt/blob/main/greenery/analyses/week_2_project.sql and https://github.com/FCdSP/course-dbt/blob/main/greenery/analyses/week_2_project_change_inventory.sql**