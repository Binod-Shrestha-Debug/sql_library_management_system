
-- ==========================================
-- PROJECT: LIBRARY MANAGEMENT SYSTEM
-- File: library_management_system.sql
-- ==========================================

-- 1. Create Database
CREATE DATABASE LibraryDB;
USE LibraryDB;

-- 2. Create Members Table
CREATE TABLE Members (
    member_id INT PRIMARY KEY,
    member_name VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    phone VARCHAR(20)
);

-- 3. Create Books Table
CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    book_title VARCHAR(100) NOT NULL,
    author VARCHAR(100),
    category VARCHAR(50),
    available_copies INT
);

-- 4. Create Borrowings Table
CREATE TABLE Borrowings (
    borrowing_id INT PRIMARY KEY,
    member_id INT,
    book_id INT,
    borrow_date DATE,
    return_date DATE,
    FOREIGN KEY (member_id)
        REFERENCES Members(member_id),
    FOREIGN KEY (book_id)
        REFERENCES Books(book_id)
);

-- 5. Insert Members
INSERT INTO Members VALUES
(1, 'Ram', 'ram@gmail.com', '9800000001'),
(2, 'Sita', 'sita@gmail.com', '9800000002'),
(3, 'Hari', 'hari@gmail.com', '9800000003'),
(4, 'Gita', 'gita@gmail.com', '9800000004');

-- 6. Insert Books
INSERT INTO Books VALUES
(101, 'Python Basics', 'John Smith', 'Programming', 3),
(102, 'SQL for Beginners', 'David Lee', 'Database', 2),
(103, 'Django Development', 'Alex Brown', 'Programming', 1),
(104, 'Data Analytics', 'Sarah Wilson', 'Analytics', 4);

-- 7. Insert Borrowing Records
INSERT INTO Borrowings VALUES
(1001, 1, 101, '2026-10-01', '2026-10-10'),
(1002, 2, 102, '2026-10-03', NULL),
(1003, 1, 103, '2026-10-05', NULL),
(1004, 3, 101, '2026-10-06', '2026-10-12');

-- ==========================================
-- BASIC QUERIES
-- ==========================================

-- 8. Display All Books
SELECT * FROM Books;

-- 9. Find Programming Books
SELECT *
FROM Books
WHERE category = 'Programming';

-- 10. Find Books with More Than 2 Available Copies
SELECT *
FROM Books
WHERE available_copies > 2;

-- 11. Sort Books by Title
SELECT *
FROM Books
ORDER BY book_title;

-- ==========================================
-- JOIN EXAMPLES
-- ==========================================

-- 12. INNER JOIN: Members and Borrowings
SELECT
    M.member_name,
    B.borrow_date,
    B.return_date
FROM Members AS M
INNER JOIN Borrowings AS B
ON M.member_id = B.member_id;

-- 13. LEFT JOIN: All Members and Their Borrowings
SELECT
    M.member_name,
    B.book_id,
    B.borrow_date
FROM Members AS M
LEFT JOIN Borrowings AS B
ON M.member_id = B.member_id;

-- 14. Join Members, Borrowings and Books
SELECT
    M.member_name,
    BK.book_title,
    BR.borrow_date,
    BR.return_date
FROM Members AS M
INNER JOIN Borrowings AS BR
ON M.member_id = BR.member_id
INNER JOIN Books AS BK
ON BR.book_id = BK.book_id;

-- 15. Members Who Have Never Borrowed a Book
SELECT M.member_name
FROM Members AS M
LEFT JOIN Borrowings AS B
ON M.member_id = B.member_id
WHERE B.borrowing_id IS NULL;

-- 16. Books Currently Borrowed
SELECT
    M.member_name,
    BK.book_title,
    BR.borrow_date
FROM Borrowings AS BR
INNER JOIN Members AS M
ON BR.member_id = M.member_id
INNER JOIN Books AS BK
ON BR.book_id = BK.book_id
WHERE BR.return_date IS NULL;

-- ==========================================
-- AGGREGATE FUNCTIONS
-- ==========================================

-- 17. Total Number of Books
SELECT COUNT(*) AS total_book_titles
FROM Books;

-- 18. Number of Borrowings per Member
SELECT
    M.member_name,
    COUNT(B.borrowing_id) AS total_borrowings
FROM Members AS M
LEFT JOIN Borrowings AS B
ON M.member_id = B.member_id
GROUP BY M.member_id, M.member_name;

-- 19. Most Borrowed Books
SELECT
    BK.book_title,
    COUNT(BR.borrowing_id) AS times_borrowed
FROM Books AS BK
INNER JOIN Borrowings AS BR
ON BK.book_id = BR.book_id
GROUP BY BK.book_id, BK.book_title
ORDER BY times_borrowed DESC;

-- 20. Search for a Member by Name
SELECT *
FROM Members
WHERE member_name LIKE '%Ram%';

-- ==========================================
-- UPDATE AND DELETE
-- ==========================================

-- 21. Update Available Copies
UPDATE Books
SET available_copies = 2
WHERE book_id = 101;

-- 22. Update a Return Date
UPDATE Borrowings
SET return_date = '2026-10-14'
WHERE borrowing_id = 1002;

-- 23. Delete a Member (only if no borrowing records reference them)
-- DELETE FROM Members WHERE member_id = 4;
