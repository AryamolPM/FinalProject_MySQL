CREATE DATABASE library;
USE library;

CREATE TABLE  Branch (
    Branch_no INT PRIMARY KEY,
    Manager_Id INT,
    Branch_address VARCHAR(255),
    Contact_no VARCHAR(15)
);

CREATE TABLE Employee (
    Emp_Id INT PRIMARY KEY,
    Emp_name VARCHAR(255),
    Position VARCHAR(50),
    Salary DECIMAL(10, 2),
    Branch_no INT,
    FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no)
);

CREATE TABLE  Customer (
    Customer_Id INT PRIMARY KEY,
    Customer_name VARCHAR(255),
    Customer_address VARCHAR(255),
    Reg_date DATE
);

CREATE TABLE IssueStatus (
    Issue_Id INT PRIMARY KEY,
    Issued_cust INT ,FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),
    Issued_book_name VARCHAR(255),
    Issue_date DATE,
    Isbn_book INT,FOREIGN KEY (Isbn_book) REFERENCES Books(ISBN) 
    );


CREATE TABLE ReturnStatus (
    Return_Id INT PRIMARY KEY,
    Return_cust INT,
    Return_book_name VARCHAR(255),
    Return_date DATE,
    Isbn_book2 INT,
    FOREIGN KEY (Return_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book2) REFERENCES Books(ISBN)
);

CREATE TABLE Books (
    ISBN INT PRIMARY KEY,
    Book_title VARCHAR(255),
    Category VARCHAR(50),
    Rental_Price DECIMAL(10, 2),
    Status VARCHAR(3),
    Author VARCHAR(255),
    Publisher VARCHAR(255)
);

INSERT INTO Branch (Branch_no, Manager_Id, Branch_address, Contact_no) VALUES
(1, 101, '123 Main St', '123-456-7890'),
(2, 102, '456 Elm St', '987-654-3210'),
(3, 103, '789 Oak St', '111-222-3333'),
(4, 104, '567 Pine St', '444-555-6666'),
(5, 105, '890 Maple St', '777-888-9999');

INSERT INTO Employee (Emp_Id, Emp_name, Position, Salary, Branch_no) VALUES
(201, 'John Doe', 'Manager', 60000.00, 1),
(202, 'Jane Smith', 'Clerk', 40000.00, 1),
(203, 'Bob Johnson', 'Manager', 65000.00, 2),
(204, 'Emily Brown', 'Clerk', 38000.00, 2),
(205, 'Michael Lee', 'Manager', 62000.00, 3),
(206, 'Sarah Jones', 'Clerk', 42000.00, 3),
(207, 'David Kim', 'Manager', 67000.00, 4),
(208, 'Emma White', 'Clerk', 39000.00, 4),
(209, 'James Smith', 'Manager', 63000.00, 5),
(210, 'Olivia Davis', 'Clerk', 41000.00, 5);

SELECT * FROM EMPLOYEE;

INSERT INTO Customer (Customer_Id, Customer_name, Customer_address, Reg_date) VALUES
(301, 'Alice Johnson', '789 Oak St', '2021-12-15'),
(302, 'Bob Smith', '567 Pine St', '2022-01-20'),
(303, 'Carol Williams', '890 Maple St', '2022-03-10'),
(304, 'David Brown', '123 Main St', '2022-05-05'),
(305, 'Emily Davis', '456 Elm St', '2022-07-15'),
(306, 'Frank Wilson', '678 Birch St', '2022-09-20'),
(307, 'Grace Miller', '910 Cedar St', '2022-11-10'),
(308, 'Henry Taylor', '234 Oak St', '2023-01-25'),
(309, 'Irene Clark', '345 Pine St', '2023-03-15'),
(310, 'Jack Harris', '456 Maple St', '2023-05-20');

INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher) VALUES
(123456, 'Book1', 'Fiction', 10.99, 'yes', 'John Author', 'Publisher A'),
(654321, 'Book2', 'Non-Fiction', 12.99, 'no', 'Jane Author', 'Publisher B'),
(789012, 'Book3', 'History', 9.99, 'yes', 'Jack Writer', 'Publisher C'),
(345678, 'Book4', 'Science', 11.99, 'no', 'Jill Author', 'Publisher D'),
(901234, 'Book5', 'Fiction', 10.99, 'yes', 'Adam Smith', 'Publisher E'),
(567890, 'Book6', 'Biography', 14.99, 'yes', 'Sara Brown', 'Publisher F'),
(234567, 'Book7', 'Fiction', 10.99, 'yes', 'Emily Green', 'Publisher G'),
(890123, 'Book8', 'Mystery', 13.99, 'no', 'Harry White', 'Publisher H'),
(456789, 'Book9', 'Thriller', 11.99, 'yes', 'Tom Black', 'Publisher I'),
(123890, 'Book10', 'Romance', 12.99, 'yes', 'Laura Red', 'Publisher J');


INSERT INTO IssueStatus (Issue_Id, Issued_cust, Issued_book_name, Issue_date, Isbn_book) VALUES
(11, 301, 'Book1', '2023-06-05', 123456),
(12, 302, 'Book2', '2023-06-10', 654321),
(13, 303, 'Book3', '2023-06-15', 789012),
(14, 304, 'Book4', '2023-06-20', 345678),
(15, 305, 'Book5', '2023-06-25', 901234),
(16, 306, 'Book6', '2023-06-30', 567890),
(17, 308, 'Book8', '2023-06-10', 890123),
(19, 309, 'Book9', '2023-06-15', 456789),
(20, 310, 'Book10', '2023-06-20', 123890);

INSERT INTO ReturnStatus (Return_Id, Return_cust, Return_book_name, Return_date, Isbn_book2) VALUES
(501, 301, 'Book1', '2023-07-01', 123456),
(502, 302, 'Book2', '2023-07-05', 654321),
(503, 303, 'Book3', '2023-07-10', 789012),
(504, 304, 'Book4', '2023-07-15', 345678),
(505, 305, 'Book5', '2023-07-20', 901234),
(506, 306, 'Book6', '2023-07-25', 567890),
(507, 307, 'Book7', '2023-07-01', 234567),
(508, 308, 'Book8', '2023-07-05', 890123),
(509, 309, 'Book9', '2023-07-10', 456789),
(510, 310, 'Book10', '2023-07-15', 123890);

# Q1. Retrieve the book title, category, and rental price of all available books
SELECT book_title, category,  rental_price FROM BOOKS;

# Q2  List the employee names and their respective salaries in descending order of salary
SELECT Emp_NAME,SALARY FROM EMPLOYEE ORDER BY SALARY DESC;

# Q3. Retrieve the book titles and the corresponding customers who have issued those books.
SELECT Issued_book_name, Customer_name
FROM IssueStatus
JOIN Customer ON IssueStatus.Issued_cust = Customer.Customer_Id;

#Q4. Display the total count of books in each category.
SELECT Category, COUNT(*) AS Total_Count
FROM Books
GROUP BY Category;

#  Q5. Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000.
SELECT Emp_name , position FROM employee WHERE salary >50000;

# List the customer names who registered before 2022-01-01 and have not issued any books yet
SELECT customer_name from customer WHERE Reg_date < '2022-01-01'
AND customer_id NOT IN (SELECT Issued_cust FROM issuestatus);

# Display the branch numbers and the total count of employees in each branch
SELECT Branch_no , count(*) AS emp_count FROM employee GROUP BY Branch_no;

#  Display the names of customers who have issued books in the month of June 2023.
SELECT DISTINCT c.customer_name FROM customer c JOIN issuestatus i
ON c.customer_id = i.issued_cust
WHERE month(i.issue_date)=6 AND year(i.issue_date) =2023;

# Retrieve book_title from book table containing history
SELECT Book_title FROM books WHERE category='History';

# Retrieve the branch numbers along with the count of employees for branches having more than 5 employees.
SELECT branch_no , count(*) AS emp_count FROM employee GROUP BY branch_no HAVING count(*)>5;