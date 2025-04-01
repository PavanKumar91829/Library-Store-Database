USE library_store;

SELECT * FROM tbl_book_authors;
SELECT * FROM tbl_book;
SELECT * FROM tbl_publisher;
SELECT * FROM tbl_book_copies;
SELECT * FROM tbl_book_loans;
SELECT* FROM tbl_borrower;
SELECT * FROM tbl_library_branch;

# Task Questions

# 1) How many copies of the book titled "The Lost Tribe" are owned by the library branch whose name is "Sharpstown"?
/*WITH BookCopies AS (
    SELECT bc.book_copies_No_Of_Copies,
           b.book_Title,
           lb.library_branch_BranchName
    FROM tbl_book_copies AS bc
    JOIN tbl_book AS b ON bc.book_copies_BookID = b.book_BookID
    JOIN tbl_library_branch AS lb ON bc.book_copies_BranchID = lb.library_branch_BranchID
)
SELECT book_copies_No_Of_Copies AS Copies,book_Title,library_branch_BranchName
FROM BookCopies
WHERE book_Title = 'The Lost Tribe'
  AND library_branch_BranchName = 'Sharpstown';*/

CREATE VIEW BookCopies AS
SELECT bc.book_copies_No_Of_Copies,
           b.book_Title,
           lb.library_branch_BranchName
FROM tbl_book_copies AS bc
JOIN tbl_book AS b ON bc.book_copies_BookID = b.book_BookID
JOIN tbl_library_branch AS lb ON bc.book_copies_BranchID = lb.library_branch_BranchID;

SELECT book_copies_No_Of_Copies AS Copies,book_Title,library_branch_BranchName
FROM BookCopies
WHERE book_Title = 'The Lost Tribe'
  AND library_branch_BranchName = 'Sharpstown';

  
# 2) How many copies of the book titled "The Lost Tribe" are owned by each library branch?
 SELECT library_branch_BranchName, book_Title, SUM(book_copies_No_Of_Copies) AS TotalCopies
 FROM BookCopies
 WHERE book_Title = 'The Lost Tribe'
 GROUP BY library_branch_BranchName;

# 3) Retrieve the names of all borrowers who do not have any books checked out.

SELECT bo.borrower_BorrowerName
FROM tbl_borrower AS bo
LEFT JOIN tbl_book_loans AS bl
     ON bo.borrower_CardNo = bl.book_loans_CardNo
WHERE bl.book_loans_CardNo IS NULL;

# 4) For each book that is loaned out from the "Sharpstown" branch and whose DueDate is 2/3/18, retrieve the book title, the borrower's name, and the borrower's address.

CREATE VIEW LoanDetails AS
SELECT b.book_Title,
       bo.borrower_BorrowerName,
	   bo.borrower_BorrowerAddress,
       lb.library_branch_BranchName,
       bl.book_loans_DueDate
FROM tbl_book_loans AS bl
JOIN tbl_book AS b ON bl.book_loans_BookID = b.book_BookID
JOIN tbl_library_branch AS lb ON bl.book_loans_BranchID = lb.library_branch_BranchID
JOIN tbl_borrower AS bo ON bl.book_loans_CardNo = bo.borrower_CardNo;

SELECT book_Title, borrower_BorrowerName, borrower_BorrowerAddress
FROM LoanDetails
WHERE library_branch_BranchName = 'Sharpstown'
  AND book_loans_DueDate = '2018-03-02';

# 5) For each library branch, retrieve the branch name and the total number of books loaned out from that branch.

WITH BranchLoans AS (
SELECT lb.library_branch_BranchName,
	   bl.book_loans_LoansID
FROM tbl_library_branch AS lb
LEFT JOIN tbl_book_loans AS bl
     ON lb.library_branch_BranchID = bl.book_loans_BranchID
)
SELECT library_branch_BranchName, COUNT(book_loans_LoansID) AS Num_Of_Books_Loaned
FROM BranchLoans
GROUP BY library_branch_BranchName;

# 6) Retrieve the names, addresses, and number of books checked out for all borrowers who have more than five books checked out.
WITH BorrowerLoanCount AS (
     SELECT bo.borrower_BorrowerName,
            bo.borrower_BorrowerAddress,
            COUNT(bl.book_loans_LoansID) AS No_Of_Books_CheckedOut
	 FROM tbl_borrower AS bo
     JOIN tbl_book_loans AS bl
       ON bo.borrower_CardNo = bl.book_loans_CardNo
	GROUP BY bo.borrower_BorrowerName,bo.borrower_BorrowerAddress
)
SELECT *
FROM BorrowerLoanCount
WHERE No_Of_Books_CheckedOut > 5;

# 7) For each book authored by "Stephen King", retrieve the title and the number of copies owned by the library branch whose name is "Central".

WITH AuthorBooks AS (
    SELECT ba.book_authors_AuthorName,
           b.book_Title,
		   lb.library_branch_BranchName,
		   bc.book_copies_No_Of_Copies AS No_Of_Copies
	FROM tbl_book_authors AS ba
    JOIN tbl_book AS b
       ON ba.book_authors_BookID = b.book_BookID
	JOIN tbl_book_copies AS bc 
       ON b.book_BookID = bc.book_copies_BookID
	JOIN tbl_library_branch AS lb 
       ON bc.book_copies_BranchID = lb.library_branch_BranchID
 )
 SELECT book_Title,No_Of_Copies
 FROM AuthorBooks
 WHERE book_authors_AuthorName = 'Stephen King'
        AND library_branch_BranchName = 'Central';
        
