# Library Store Database Project

## Overview
This project manages a library database using MySQL. It includes table creation, data import, and analytical queries.

## Database Schema
- **tbl_book**: Stores book details (ID, title, publisher).
- **tbl_book_authors**: Links books to their authors.
- **tbl_publisher**: Publisher information.
- **tbl_borrower**: Borrower details.
- **tbl_library_branch**: Library branches.
- **tbl_book_copies**: Tracks book copies per branch.
- **tbl_book_loans**: Records book loans.

## Setup Instructions
1. **Prerequisites**:
   - Install [MySQL](https://dev.mysql.com/downloads/).
2. **Run SQL Scripts**:
   - Execute `Creating_tables.sql` to create tables and set up foreign keys.
   - Run `import_data.sql` to import data (⚠️ Update CSV file paths in this script if needed).
   - Use `Library_store_project_query.sql` to execute analytical queries.

## Queries Solved
1. Copies of "The Lost Tribe" in Sharpstown.
2. Copies of "The Lost Tribe" per branch.
3. Borrowers with no checked-out books.
4. Books due on 2018-03-02 in Sharpstown.
5. Total books loaned per branch.
6. Borrowers with >5 books checked out.
7. Stephen King books in the "Central" branch.

## Notes
- The `import_data.sql` assumes CSV files are available at specific paths. Adjust paths as needed.
- Foreign keys ensure data integrity (e.g., cascading deletes/updates).
