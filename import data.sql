# Switch to the 'library_store' database
USE library_store;

# Load data from 'authors.csv' into the 'tbl_book_authors' table
LOAD DATA LOCAL INFILE "C:\\Users\\pavan\\OneDrive\\Desktop\\Data Science\\Projects\\Data Analysis with Mysql\\data\\authors.csv"
INTO TABLE tbl_book_authors 
FIELDS TERMINATED BY ','    -- Fields are separated by commas 
ENCLOSED BY '"'             -- Fields are enclosed in double quotes
LINES TERMINATED BY '\n'    -- Each row ends with a newline character
IGNORE 1 ROWS               -- Ignore the first row (header row)
(book_authors_BookID, book_authors_AuthorName);

# Load data from 'books.csv' into the 'tbl_book' table
LOAD DATA LOCAL INFILE "C:\\Users\\pavan\\OneDrive\\Desktop\\Data Science\\Projects\\Data Analysis with Mysql\\data\\books.csv"
INTO TABLE tbl_book
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

# Load data from 'publisher.csv' into the 'tbl_publisher' table
LOAD DATA LOCAL INFILE "C:\\Users\\pavan\\OneDrive\\Desktop\\Data Science\\Projects\\Data Analysis with Mysql\\data\\publisher.csv"
INTO TABLE tbl_publisher
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

# Load data from 'borrower.csv' into the 'tbl_borrower' table
LOAD DATA LOCAL INFILE "C:\\Users\\pavan\\OneDrive\\Desktop\\Data Science\\Projects\\Data Analysis with Mysql\\data\\borrower.csv"
INTO TABLE tbl_borrower
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

# Load data from 'library branch.csv' into the 'tbl_library_branch' table
LOAD DATA LOCAL INFILE "C:\\Users\\pavan\\OneDrive\\Desktop\\Data Science\\Projects\\Data Analysis with Mysql\\data\\library branch.csv"
INTO TABLE tbl_library_branch
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(library_branch_BranchName, library_branch_BranchAddress);

# Load data from 'book copies.csv' into the 'tbl_book_copies' table
LOAD DATA LOCAL INFILE "C:\\Users\\pavan\\OneDrive\\Desktop\\Data Science\\Projects\\Data Analysis with Mysql\\data\\book copies.csv"
INTO TABLE tbl_book_copies
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(book_copies_BookID, book_copies_BranchID, book_copies_No_Of_Copies);

# Load data from 'book loans.csv' into the 'tbl_book_loans' table
LOAD DATA LOCAL INFILE "C:\\Users\\pavan\\OneDrive\\Desktop\\Data Science\\Projects\\Data Analysis with Mysql\\data\\book loans.csv"
INTO TABLE tbl_book_loans
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(book_loans_BookID, book_loans_BranchID, book_loans_CardNo, book_loans_DateOut, book_loans_DueDate);






