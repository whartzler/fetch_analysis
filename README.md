# fetch_analysis
Reviewing Customer data and providing insights

## Notes
Table Analyis
- When importing the data noticed a couple of issues to correct
  - Identified timedate fields and updated to YYYY-MM-DD dates for more simple viewing/grouping and to align with other date fields
  - Identified 'zero' within transaction.csv and updated to 0 to keep numeric consistency
  - Added index columns to Transaction & Products Tables.
    - Both Tables had duplicate values within each column and did not have a primary key.  By adding and index we can create a Primary Key for each table.
  - Updated BARCODE as when reading in the data .0 kept populating and had to remove .0 decimal point
 
- SQL Analysis
  - the user ID to transaction ID matches were really few  
