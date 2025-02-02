# Fetch Analysis
Reviewing Customer data and providing insights

## Data Exploration
Data quality 
  - When diving/cleaning the data the date formats had various formats.  To more easily review/query the data formatted all date's into YYYY-MM-DD.  
  - Identified 'zero' within transaction.csv and updated to 0 to keep numeric consistency
  - When reviewing the Transaction & Produccts tables noticed both did not have a primary key that was not a duplicate value. Inlcuded an index column to Transaction & Products Tables to allow ingestion into SQL tables.
  - When reviewing the Products dataset identified Hidden Valley Ranch had two names in Brand and the Manufacturer had two names as well. Combined the names into one name due to possible impact on dips and salsa review.
  - Updated BARCODE as when reading in the data .0 kept populating and had to remove .0 decimal point  
Concerns
  - No concerns about the fields and what they represented when reviewing the csv files.

## SQL Analysis

1. What are the top 5 brands by receipts scanned among users 21 and over? [Link to SQL Query](https://github.com/whartzler/fetch_analysis/blob/main/Code%20Files/Top_5_Brand.sql)

For this analysis we joined the products to the transactions table by barcode to extract the brand of the product purchased. Than joined the user to the transaction table by barcode to extract customer data and identify which customers were 21 and older. Excluded null brands as this would hurt our final result as these brands are blank.  Next we calculated if any user was older than 21 as of Today 2/2/2025.  

When conducting this analysis include the top 8 brands due to  the top 3 - 8 brands having the same receipt count.  

The Top five brands are:

![image](https://github.com/user-attachments/assets/2d005e26-69c1-4bc7-a678-ff2875543ffd)


2. Which is the leading brand in the Dips & Salsa category? [Link to SQL Query](![image](https://github.com/user-attachments/assets/5b1d75b1-aff6-4d2b-ae38-e4facc8d5772)
)
   
In this analysis we joined the trnasactions table to the products table by barcode to identify the Brand with the sum of of the final sales within the Dips & Salsa category that had more than 0 as the final quantity. Assumed the leading brand would be based on how much of sales were allocated to that specific brand. Excluded null or blank brands from the final export.  

Data Assumptions: When reviewing the data there can be multiple transactions for each receipt.  Interpreted this interaction as each receipt could have multiple of the same product purchased on the same receipt. The Final Sale outlined the amount sold of the singular product on the receiept if the final_quantity is more than 1 (excluded final_quantities that were 0 as didnt interpret as a sold product)

![Uploading image.png…]()



Notes
Table Analyis
- When importing the data noticed a couple of issues to correct
  - Identified timedate fields and updated to YYYY-MM-DD dates for more simple viewing/grouping and to align with other date fields

    - Both Tables had duplicate values within each column and did not have a primary key.  By adding and index we can create a Primary Key for each table.

 
- SQL Analysis
  - the user ID to transaction ID matches were really few  
