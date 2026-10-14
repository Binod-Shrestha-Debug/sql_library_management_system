
# SQL Library Management System

## Project Overview
The SQL Library Management System is a beginner-friendly database project developed using MySQL. It manages library members, books, and borrowing records. This project demonstrates how SQL can be used to store, retrieve, update, and manage library information.

## Features
- Manage library members
- Store book details and categories
- Record book borrowing and return dates
- Display all books and members
- Find members who have never borrowed books
- Track currently borrowed books
- Count borrowings for each member
- Identify the most borrowed books
- Update book availability and return dates
- Search for books by category and members by name

## Technologies Used
- MySQL
- SQL

## Database Tables

### 1. Members
Stores library member information.
- `member_id`
- `member_name`
- `email`
- `phone`

### 2. Books
Stores book details.
- `book_id`
- `book_title`
- `author`
- `category`
- `available_copies`

### 3. Borrowings
Stores book borrowing and return records.
- `borrowing_id`
- `member_id`
- `book_id`
- `borrow_date`
- `return_date`

## SQL Concepts Practiced
- CREATE DATABASE and CREATE TABLE
- INSERT, SELECT, UPDATE, and DELETE
- WHERE, LIKE, and ORDER BY
- INNER JOIN and LEFT JOIN
- GROUP BY and COUNT()
- Primary keys and foreign keys
- Aggregate functions
- NULL value handling

## Project Structure

```text
sql_library_management_system/
├── library_management_system.sql
└── README.md
```

## How to Run the Project

1. Install MySQL Server and MySQL Workbench.
2. Open `library_management_system.sql` in MySQL Workbench.
3. Execute the SQL script.
4. The database and tables will be created, and sample data will be inserted.
5. Run the SELECT queries to explore the results.

**Note:** Run the script on a fresh database. The script creates a database named `LibraryDB`.

## Learning Objectives
- Understand relational database design.
- Practice SQL queries using related tables.
- Learn how JOINs combine information from multiple tables.
- Use aggregate functions to summarize library records.
- Practice basic database management operations.

## Author
Binod Shrestha
