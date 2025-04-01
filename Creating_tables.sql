CREATE DATABASE library_store;

USE library_store;

# Create table named tbl_book
CREATE TABLE tbl_book (
    book_BookID INT PRIMARY KEY,
    book_Title VARCHAR(255),
    book_PublisherName VARCHAR(255)
);

# Create table named tbl_book_authors
CREATE TABLE tbl_book_authors (
    book_authors_AuthorID INT AUTO_INCREMENT PRIMARY KEY,
    book_authors_BookID INT,
    book_authors_AuthorName VARCHAR(255)
);

# Create table named tbl_publisher
CREATE TABLE tbl_publisher (
    publisher_PublisherName VARCHAR(255) PRIMARY KEY,
    publisher_PublisherAddress VARCHAR(255),
    publisher_PublisherPhone VARCHAR(20)
);

# Create table named tbl_borrower
CREATE TABLE tbl_borrower (
    borrower_CardNo INT PRIMARY KEY,
    borrower_BorrowerName VARCHAR(255),
    borrower_BorrowerAddress VARCHAR(255),
    borrower_BorrowerPhone VARCHAR(20)
);

# Create table named tbl_library_branch
CREATE TABLE tbl_library_branch (
    library_branch_BranchID INT AUTO_INCREMENT PRIMARY KEY,
    library_branch_BranchName VARCHAR(255),
    library_branch_BranchAddress VARCHAR(255)
);

# Create table named tbl_book_copies
CREATE TABLE tbl_book_copies (
    book_copies_CopiesID INT AUTO_INCREMENT PRIMARY KEY,
    book_copies_BookID INT,
    book_copies_BranchID INT,
    book_copies_No_Of_Copies INT
);

# Create table named tbl_book_loans
CREATE TABLE tbl_book_loans (
    book_loans_LoansID INT AUTO_INCREMENT PRIMARY KEY,
    book_loans_BookID INT,
    book_loans_BranchID INT,
    book_loans_CardNo INT,
    book_loans_DateOut DATE,
    book_loans_DueDate DATE
);

-- Update the 'book_PublisherName' column to remove any carriage returns, newlines, and tab characters  
UPDATE tbl_book  
SET book_PublisherName = TRIM(REPLACE(REPLACE(REPLACE(book_PublisherName, '\r', ''), '\n', ''), '\t', ''));

-- Add a foreign key constraint to link 'book_PublisherName' in 'tbl_book' to 'publisher_PublisherName' in 'tbl_publisher'  
-- Ensures that updates and deletes on 'tbl_publisher' are cascaded to 'tbl_book'  
ALTER TABLE tbl_book  
ADD CONSTRAINT fk_book_publisher  
FOREIGN KEY (book_PublisherName)  
REFERENCES tbl_publisher(publisher_PublisherName)  
ON UPDATE CASCADE  
ON DELETE CASCADE;

-- Add a foreign key constraint to link 'book_authors_BookID' in 'tbl_book_authors' to 'book_BookID' in 'tbl_book'  
ALTER TABLE tbl_book_authors  
ADD CONSTRAINT fk_book_authors_book  
FOREIGN KEY (book_authors_BookID)  
REFERENCES tbl_book(book_BookID)  
ON DELETE CASCADE  
ON UPDATE CASCADE;

-- Add a foreign key constraint to link 'book_copies_BookID' in 'tbl_book_copies' to 'book_BookID' in 'tbl_book'  
ALTER TABLE tbl_book_copies  
ADD CONSTRAINT fk_book_copies_book  
FOREIGN KEY (book_copies_BookID)  
REFERENCES tbl_book(book_BookID)  
ON DELETE CASCADE  
ON UPDATE CASCADE;

-- Add a foreign key constraint to link 'book_copies_BranchID' in 'tbl_book_copies' to 'library_branch_BranchID' in 'tbl_library_branch'  
ALTER TABLE tbl_book_copies  
ADD CONSTRAINT fk_book_copies_branch  
FOREIGN KEY (book_copies_BranchID)  
REFERENCES tbl_library_branch(library_branch_BranchID)  
ON DELETE CASCADE  
ON UPDATE CASCADE;

-- Add a foreign key constraint to link 'book_loans_BookID' in 'tbl_book_loans' to 'book_BookID' in 'tbl_book'  
ALTER TABLE tbl_book_loans  
ADD CONSTRAINT fk_book_loans_book  
FOREIGN KEY (book_loans_BookID)  
REFERENCES tbl_book(book_BookID)  
ON DELETE CASCADE  
ON UPDATE CASCADE;

-- Add a foreign key constraint to link 'book_loans_BranchID' in 'tbl_book_loans' to 'library_branch_BranchID' in 'tbl_library_branch'  
ALTER TABLE tbl_book_loans  
ADD CONSTRAINT fk_book_loans_branch  
FOREIGN KEY (book_loans_BranchID)  
REFERENCES tbl_library_branch(library_branch_BranchID)  
ON DELETE CASCADE  
ON UPDATE CASCADE;

-- Add a foreign key constraint to link 'book_loans_CardNo' in 'tbl_book_loans' to 'borrower_CardNo' in 'tbl_borrower'  
ALTER TABLE tbl_book_loans  
ADD CONSTRAINT fk_book_loans_borrower  
FOREIGN KEY (book_loans_CardNo)  
REFERENCES tbl_borrower(borrower_CardNo)  
ON DELETE CASCADE  
ON UPDATE CASCADE;
