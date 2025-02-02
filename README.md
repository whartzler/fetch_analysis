# Fetch Analysis
Reviewing Customer data and providing insights

## Data Exploration
Data quality [Jupyter Notebook](https://github.com/whartzler/fetch_analysis/blob/main/Code%20Files/TABLE%20ANALYSIS.ipynb)
  - When diving/cleaning the data the date formats had various formats.  To more easily review/query the data formatted all date's into YYYY-MM-DD.  
  - Identified 'zero' within transaction.csv and updated to 0 to keep numeric consistency
  - When reviewing the Transaction & Produccts tables noticed both did not have a primary key that was not a duplicate value. Inlcuded an index column to Transaction & Products Tables to allow ingestion into SQL tables.
  - When reviewing the Products dataset identified Hidden Valley Ranch had two names in Brand and the Manufacturer had two names as well. Combined the names into one name due to possible impact on dips and salsa review.
  - Updated BARCODE as when reading in the data .0 kept populating and had to remove .0 decimal point  
Concerns
  - No concerns about the fields and what they represented when reviewing the csv files.

## SQL Analysis

1. What are the top 5 brands by receipts scanned among users 21 and over? [Link to SQL Query](https://github.com/whartzler/fetch_analysis/blob/main/Code%20Files/Top_5_Brand.sql)

For this analysis we joined the products to the transactions table by barcode to extract the brand of the product purchased. Than joined the user to the transaction table by barcode to extract customer data and identify which customers were 21 and older. Excluded null brands as this would hurt our final result as these brands are blank.  Next we calculated if any user was older than 21 as of Today 2/2/2025.  For this analysis we also identified that within the transactions table there is only 4 months of trnsactions for 2024.  

When conducting this analysis include the top 8 brands due to  the top 3 - 8 brands having the same receipt count.  

The Top five brands are:

![image](https://github.com/user-attachments/assets/2d005e26-69c1-4bc7-a678-ff2875543ffd)


2. Which is the leading brand in the Dips & Salsa category? [Link to SQL Query](![image](https://github.com/user-attachments/assets/5b1d75b1-aff6-4d2b-ae38-e4facc8d5772)
)
   
In this analysis we joined the trnasactions table to the products table by barcode to identify the Brand with the sum of of the final sales within the Dips & Salsa category that had more than 0 as the final quantity. Assumed the leading brand would be based on how much of sales were allocated to that specific brand. Excluded null or blank brands from the final export.  

Data Assumptions: When reviewing the data there can be multiple transactions for each receipt.  Interpreted this interaction as each receipt could have multiple of the same product purchased on the same receipt. The Final Sale outlined the amount sold of the singular product on the receiept if the final_quantity is more than 1 (excluded final_quantities that were 0 as didnt interpret as a sold product)

![image](https://github.com/user-attachments/assets/49c8e0e6-bd2b-41b2-8483-06586c301ebe)

3. At what percent has Fetch grown year over year? [Link to SQL Query](https://github.com/whartzler/fetch_analysis/blob/main/Code%20Files/Feth_YOY_Review.sql)

During this analysis we interpreted growth as users being created within the user tables.  Extracted the year from the created_date field to group by year in which the distinct user was created in case of possible duplicates than counted each user created within each year.  Than to see Year over Year growth we extracted the current year user count minus the prior year user count * 100 / prior year user count and converted to a %. 
Through this review we can see from 2015 - 2022 Fetch has user growth but in the past two year 2023 & 2024 we saw a slight decline in overall user's. 

The below results are as follows:

![image](https://github.com/user-attachments/assets/6b43b69a-f966-4781-90ac-fb48b4c040ff)

## Communication with Stakeholders

(Data Quality Issues/insight and impacts)

Good Afternoom, 

When reviewing the transactions tables curious on why there is missing final_sale values when we have the receipt & barcode fields completed. Can we come to the conclusion that since we have the barcode of the product we can input the final sale value within the data set?  
This would reduce the null values within the field and we could get a more clear picture about final_sales for users/stores and and possible downstream reporting. 

On the products table there is a lot of missing barcodes,brands and manufacturerss.  How are these fields retrieved and stored? These could have a material impact on how downstream reporting/analysis as we could improve accuracy of products and whats purchased.   



