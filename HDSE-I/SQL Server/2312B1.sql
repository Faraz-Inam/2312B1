-- Database Creation
CREATE DATABASE _2312B1;

-- Usage of Database
USE _2312B1;
USE lab7;

-- Table Creation
CREATE TABLE students(sid INT PRIMARY KEY IDENTITY(101, 1), sname VARCHAR(255), semail VARCHAR(255));

-- Data Insertion in a Table
INSERT INTO students (sname, semail) 
VALUES ('Haider', 'haider@gmail.com'),
('Daniyal', 'daniyal@gmail.com'),
('Areeb', 'areeb@gmail.com');

-- Fetch Table Records
SELECT * FROM students;

--Add Column
ALTER TABLE students
ADD gender INT;

--Insert data into a column
UPDATE students
SET result = 0 WHERE sid = 101;


UPDATE students
SET result = 1, sname = 'Faisal', semail = 'faisal@gmail.com' WHERE sid = 102;


UPDATE students
SET result = 
    CASE 
        WHEN sid = 103 THEN 1
        WHEN sid = 104 THEN 1
        WHEN sid = 105 THEN 0
    END
WHERE sid IN (103, 104, 105);

--Change column data type
ALTER TABLE students
ALTER COLUMN gender VARCHAR(255);

--Change Column name
EXEC sp_rename 'students.gender', 'address', 'COLUMN';

--Drop/Delete Column
ALTER TABLE students
DROP COLUMN address;

--RENAME Table
EXEC sp_rename 'students', 'std';

SELECT * FROM std;
SELECT * FROM std2;
SELECT * FROM std3;

TRUNCATE TABLE std2;

DROP TABLE std3;

SELECT * INTO std3 FROM std;

--DAY 3 

--Rename Database
ALTER DATABASE _2312B1 MODIFY NAME = lab7;

DELETE FROM std2;

DELETE FROM std WHERE sname = 'areeb';

TRUNCATE TABLE std3;

SELECT TOP 2 * FROM std;

SELECT TOP 50 PERCENT * FROM std;

INSERT INTO std VALUES('Basit', 'basit@gmail.com', 0);

SELECT * FROM std WHERE result = 0;

SELECT sname FROM std WHERE result = 0;

SELECT sid, result FROM std WHERE result = 0;

SELECT * FROM std;

ALTER TABLE std
ADD age INT;

UPDATE std
SET age = 
    CASE 
        WHEN sid = 101 THEN 11
        WHEN sid = 102 THEN 25
        WHEN sid = 106 THEN 31
    END
WHERE sid IN (101, 102, 106);

--IN
SELECT * FROM std WHERE age IN (11, 21, 31);
SELECT * FROM std WHERE age NOT IN (11, 21, 31);

--BETWEEN
SELECT * FROM std WHERE age BETWEEN 10 AND 20;
SELECT * FROM std WHERE age NOT BETWEEN 10 AND 20;

--LIKE
SELECT * FROM std WHERE sname LIKE 'A%';
SELECT * FROM std WHERE sname LIKE '%A';
SELECT * FROM std WHERE sname LIKE '%A_';


--ORDER BY
SELECT * FROM std ORDER BY sname ASC;
SELECT * FROM std ORDER BY sname DESC;


--DAY 4
SELECT DISTINCT sname FROM std;

SELECT * FROM std WHERE age >= 25 AND result = 0;

SELECT * FROM std WHERE age >= 25 OR result = 0;

SELECT * FROM std WHERE age >= 25 AND result = 1 OR sname = 'Basit';

SELECT sname, result FROM std WHERE result = 1 OR sname = 'Basit';

SELECT sid, semail FROM std WHERE result = 1 OR sname = 'Basit';

--FUNCTION

--COUNT
SELECT COUNT(*) FROM std;
SELECT COUNT(sname) FROM std;

INSERT INTO std(semail, result) VALUES('basit1@gmail.com', 1);
--SUM
SELECT SUM(sid) FROM std;
SELECT SUM(age) FROM std;
SELECT SUM(result) FROM std;

--AVG
SELECT AVG(sid) FROM std;
SELECT AVG(age) FROM std;


--MIN
SELECT MIN(sid) FROM std;
SELECT MIN(age) FROM std;

--MAX
SELECT MAX(sid) FROM std;
SELECT MAX(age) FROM std;


SELECT * FROM std as s;


--DAY 5
CREATE TABLE stdRec(
id INT PRIMARY KEY IDENTITY(10, 1),
name VARCHAR(255) NOT NULL,
email VARCHAR(255) UNIQUE,
age INT CHECK (age >= 18),
city VARCHAR(255) DEFAULT 'Karachi'
);

INSERT INTO stdRec (name, email, age, city)
VALUES 
('Ali Khan', 'ali.khan1@example.com', 22, 'Karachi'),
('Sara Ahmed', 'sara.ahmed2@example.com', 24, 'Lahore'),
('Ahmed Raza', 'ahmed.raza3@example.com', 21, 'Islamabad'),
('Fatima Noor', 'fatima.noor4@example.com', 23, 'Karachi'),
('Bilal Aslam', 'bilal.aslam5@example.com', 26, 'Rawalpindi'),
('Ayesha Tariq', 'ayesha.tariq6@example.com', 25, 'Lahore'),
('Hassan Malik', 'hassan.malik7@example.com', 28, 'Karachi'),
('Nida Parveen', 'nida.parveen8@example.com', 20, 'Islamabad'),
('Zain Abbas', 'zain.abbas9@example.com', 27, 'Peshawar'),
('Maha Javed', 'maha.javed10@example.com', 22, 'Quetta'),
('Usman Khan', 'usman.khan11@example.com', 30, 'Karachi'),
('Rabia Sheikh', 'rabia.sheikh12@example.com', 21, 'Lahore'),
('Danish Ali', 'danish.ali13@example.com', 23, 'Islamabad'),
('Saima Riaz', 'saima.riaz14@example.com', 29, 'Rawalpindi'),
('Fahad Anwar', 'fahad.anwar15@example.com', 24, 'Peshawar'),
('Shazia Khan', 'shazia.khan16@example.com', 25, 'Karachi'),
('Tariq Mehmood', 'tariq.mehmood17@example.com', 26, 'Lahore'),
('Lubna Akram', 'lubna.akram18@example.com', 22, 'Islamabad'),
('Kamran Arif', 'kamran.arif19@example.com', 28, 'Quetta'),
('Farhan Javed', 'farhan.javed20@example.com', 23, 'Karachi'),
('Rida Naeem', 'rida.naeem21@example.com', 24, 'Lahore'),
('Imran Saeed', 'imran.saeed22@example.com', 27, 'Islamabad'),
('Amna Pervez', 'amna.pervez23@example.com', 21, 'Rawalpindi'),
('Zubair Hassan', 'zubair.hassan24@example.com', 30, 'Peshawar'),
('Mehwish Khan', 'mehwish.khan25@example.com', 29, 'Karachi'),
('Asad Rehman', 'asad.rehman26@example.com', 22, 'Lahore'),
('Noreen Farooq', 'noreen.farooq27@example.com', 23, 'Islamabad'),
('Tahir Mahmood', 'tahir.mahmood28@example.com', 28, 'Rawalpindi'),
('Amina Malik', 'amina.malik29@example.com', 25, 'Peshawar'),
('Ali Raza', 'ali.raza30@example.com', 26, 'Karachi');

SELECT * FROM dbo.stdRec;

SELECT DISTINCT * FROM dbo.stdRec;
SELECT DISTINCT city FROM dbo.stdRec;

SELECT city, COUNT(name) FROM stdRec GROUP BY city;

select city, SUM(age) from stdRec group by city having SUM(age) > 140;

select city, SUM(age) from stdRec group by city;


 SELECT CONCAT(city,' ', 'faraz') FROM stdRec WHERE city = 'karachi';

 SELECT * FROM dbo.stdRec;


--CUSTOM FUNCTION
CREATE FUNCTION GetFullName
(
    @FirstName NVARCHAR(50),
    @LastName NVARCHAR(50)
)
RETURNS NVARCHAR(100)
AS
BEGIN
    RETURN @FirstName + ' ' + @LastName
END

SELECT dbo.GetFullName('John', 'Doe');
SELECT dbo.GetFullName('Faraz', 'Inam');

--FOR SUM
CREATE FUNCTION additions
(
    @FirstNum INT,
    @SecondNum INT
)
RETURNS INT
AS
BEGIN
    RETURN @FirstNum + @SecondNum
END

SELECT dbo.additions(7, 4);



--VARIABLE DECLARTION
DECLARE @OrderAmount DECIMAL(10,2);
SET @OrderAmount = 500.00;

--CONDITIONAL STATEMENT
IF @OrderAmount > 1000
BEGIN
    PRINT 'High-value order';
END
ELSE
BEGIN
    PRINT 'Regular order';
END


--JOIN
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName NVARCHAR(50)
);

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

-- Insert Departments
INSERT INTO Departments (DepartmentID, DepartmentName)
VALUES (4, 'Faculty'), (5, 'Admin'), (3, 'Finance');

-- Insert Employees
INSERT INTO Employees (EmployeeID, FirstName, LastName, DepartmentID)
VALUES 
(5, 'Darin', 'Smith', NULL),
(6, 'Buttler', 'John', NULL),
(3, 'Sam', 'Brown', 3),
(4, 'Emily', 'Davis', 2);

SELECT * FROM departments;
SELECT * FROM employees;


--INNER JOIN
SELECT 
    *
FROM 
    Employees
INNER JOIN 
    Departments
ON 
    employees.DepartmentID = departments.DepartmentID;

SELECT 
    E.FirstName,
    E.LastName,
    D.DepartmentName
FROM 
    Employees E
INNER JOIN 
    Departments D
ON 
    E.DepartmentID = D.DepartmentID;



	--DAY _ 6



--OUTER JOIN 
--LEFT JOIN
SELECT 
    *
FROM 
    Employees
LEFT JOIN 
    Departments
ON 
    employees.DepartmentID = departments.DepartmentID;


	SELECT 
    E.FirstName,
    E.LastName,
    D.DepartmentName
FROM 
    Employees E
LEFT JOIN 
    Departments D
ON 
    E.DepartmentID = D.DepartmentID;


	--RIGHT JOIN
SELECT 
    *
FROM 
    Employees
RIGHT JOIN 
    Departments
ON 
    employees.DepartmentID = departments.DepartmentID;


	SELECT 
    E.FirstName,
    E.LastName,
    D.DepartmentName
FROM 
    Employees E
RIGHT JOIN 
    Departments D
ON 
    E.DepartmentID = D.DepartmentID;

--FULL JOIN
SELECT 
    *
FROM 
    Employees
FULL JOIN 
    Departments
ON 
    employees.DepartmentID = departments.DepartmentID;


	SELECT 
    E.FirstName,
    E.LastName,
    D.DepartmentName
FROM 
    Employees E
FULL JOIN 
    Departments D
ON 
    E.DepartmentID = D.DepartmentID;

	--DAY _ 8
--VIEWS
CREATE VIEW vw_students
AS
SELECT id, name, email, city FROM stdRec;

ALTER VIEW vw_students
AS
SELECT name, email FROM stdRec;

DROP VIEW vw_sudents;

SELECT * FROM vw_students;
SELECT * FROM stdRec;

INSERT INTO vw_students
VALUES('Bilawal', 'bilawal@gmail.com');

DELETE FROM vw_students
WHERE name = 'Imran Saeed';

CREATE VIEW vw_students2
AS
SELECT * FROM stdRec WHERE city = 'karachi';

SELECT * FROM vw_students2;

sp_helptext vw_students2;

CREATE VIEW vw_students3
WITH ENCRYPTION
AS
SELECT * FROM stdRec WHERE city = 'Lahore';

SELECT * FROM vw_students2;
SELECT * FROM vw_students3;

sp_helptext vw_students3;

DROP VIEW vw_students2;

SELECT * FROM departments;
SELECT * FROM employees;

CREATE VIEW vw_emp_dept
AS
SELECT e.FirstName, e.LastName, d.DepartmentName
FROM employees e
INNER JOIN 
departments d
ON d.DepartmentID = e.DepartmentID;

SELECT * FROM vw_emp_dept;

DELETE FROM Departments WHERE DepartmentID = 1;

DELETE FROM vw_emp_dept WHERE FirstName = 'Jane';

--DELETE JOIN IN VIEW
CREATE TRIGGER delete_vw_emp_dept
ON vw_emp_dept
INSTEAD OF DELETE
AS
BEGIN
    --SET NOCOUNT ON;

    -- Delete students from base table
    DELETE FROM employees
    WHERE FirstName IN (SELECT FirstName FROM deleted);
END;


--INSERT INTO vw_students (name, email, city)
--VALUES ('Farzan', 'farzan@gmail.com', 'Karachi');



	--DAY _ 6




--SUBQUERIES - Querying Metadata
SELECT * FROM stdRec WHERE age > 24;
SELECT AVG(age) FROM stdRec;

SELECT * FROM stdRec WHERE age = (SELECT AVG(age) FROM stdRec);
SELECT * FROM stdRec WHERE age = (SELECT AVG(age) FROM stdRec WHERE city = 'Karachi');
SELECT name, city FROM stdRec WHERE age = (SELECT AVG(age) FROM stdRec WHERE city = 'Karachi');

--STORED PROCEDURE
CREATE PROCEDURE spFetchRec
AS
BEGIN
SELECT * FROM stdRec;
END

--Calling
spFetchRec;
EXEC spFetchRec;
EXECUTE spFetchRec;

CREATE PROCEDURE spFetchRecWithCon
AS
BEGIN
SELECT * FROM stdRec WHERE city = 'Lahore';
END

EXEC spFetchRecWithCon;


CREATE PROCEDURE spFetchRecWithPara
@age INT,
@city VARCHAR(255)
AS
BEGIN
SELECT * FROM stdRec WHERE city = @city AND age = @age;
END

EXEC spFetchRecWithPara 25, 'Karachi';
EXEC spFetchRecWithPara 22, 'lahore';

ALTER PROCEDURE spFetchRecWithPara2
@city VARCHAR(255)
AS
BEGIN
SELECT * FROM stdRec WHERE city = @city;
END

EXEC spFetchRecWithPara2 'Lahore';
spFetchRecWithPara2 'Peshawar';

DROP PROCEDURE spFetchRec;

sp_helptext spFetchRecWithCon;

SELECT * FROM departments;
SELECT * FROM employees;
SELECT * FROM std;
SELECT * FROM stdrec;


	--DAY _ 10

	--TRANSACTION

	--Implicit Transaction
	DELETE FROM stdRec WHERE id = 41;

	--Explicit transaction
	BEGIN TRANSACTION
	DELETE FROM stdRec WHERE id = 40;

	BEGIN TRANSACTION
	UPDATE stdRec SET name = 'faraz' WHERE id = 40;

	--either
	ROLLBACK;

	--or
	COMMIT;



	--TRIGGERS

	--DML TRIGGERS
	--AFTER TRIGGERS
	CREATE TRIGGER trg_afterIns
	ON stdRec
	AFTER INSERT
	AS 
	BEGIN
	PRINT 'Mubarak ho Record insert hogya';
	END

	CREATE TRIGGER trg_afterIns2
	ON stdRec
	AFTER INSERT
	AS 
	BEGIN
	SELECT * FROM stdRec;
	END

	CREATE TRIGGER trg_afterDel
	ON stdRec
	AFTER DELETE
	AS 
	BEGIN
	SELECT * FROM stdRec;
	END

	CREATE TRIGGER trg_afterUpd
	ON stdRec
	AFTER UPDATE
	AS 
	BEGIN
	SELECT * FROM stdRec;
	END

	INSERT INTO stdRec VALUES ('Ahsan', 'ahsan@gmail.com', 27, 'Khi');

	DELETE FROM stdRec WHERE id = 40;

	UPDATE stdRec SET name = 'Daniyal' WHERE id = 40;

	--INSTEAD OF 
	ALTER TRIGGER trg_instedOfIns
	ON stdRec
	INSTEAD OF INSERT
	AS 
	BEGIN
	PRINT 'INSERT ERROR PLEASE SEE THE QUERY';
	END

	INSERT INTO stdRec VALUES ('b', 'b@gmail.com', 27, 'Khi');

	CREATE TRIGGER trg_insOfDelete
	ON departments
	INSTEAD OF DELETE
	AS 
	BEGIN
	PRINT 'DELETE ERROR! PLEASE SEE THE QUERY';
	END

	DROP TRIGGER trg_instedOfDel;

	DELETE FROM Departments WHERE DepartmentID = 1;

	CREATE TRIGGER trg_insOfUpdate
	ON departments
	INSTEAD OF UPDATE
	AS 
	BEGIN
	PRINT 'UPDATE ERROR! PLEASE SEE THE QUERY';
	END

	UPDATE Departments SET DepartmentName = 'HR HEAD' WHERE DepartmentID = 1;

	SELECT * FROM stdrec;

	SELECT * FROM Employees;
	SELECT * FROM Departments;

	--DDL TRIGGER
	--CREATE

	CREATE TABLE d(sid INT PRIMARY KEY IDENTITY(101, 1), sname VARCHAR(255), semail VARCHAR(255));

	DROP TABLE b;

	ALTER TRIGGER trg_restrictTable
	ON DATABASE
	FOR DROP_TABLE
	AS 
	BEGIN
	PRINT 'CANNOT DELETE TABLE - RESTRICTED!';
	ROLLBACK;
	END

	CREATE TRIGGER trg_restrictTable2
	ON DATABASE
	FOR CREATE_TABLE
	AS 
	BEGIN
	PRINT 'CANNOT CREATE TABLE - RESTRICTED!';
	ROLLBACK;
	END


	CREATE TRIGGER trg_restrictTable3
	ON DATABASE
	FOR ALTER_TABLE
	AS 
	BEGIN
	PRINT 'CANNOT ALTER TABLE - RESTRICTED!';
	ROLLBACK;
	END

	ALTER TABLE stdrec ADD gender VARCHAR(255);


	--Day 13

	-- ____Types of Indexes in SQL Server____

-- ____ Clustered Index ________ --  EXAMPLE: Dictionary

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,  -- Automatically creates a clustered index
    Name VARCHAR(100),
    Salary DECIMAL(10,2)
);

-- OR

CREATE CLUSTERED INDEX IX_Employees_Salary  
ON Employees (Salary);  -- Manually creating a clustered index


-- _____________ Non-Clustered Index ______________ -- EXAMPLE: Book Index

CREATE NONCLUSTERED INDEX IX_Employees_Name  
ON Employees (Name);  

--OR

CREATE INDEX IX_Employees_Name    -- NONCLUSTERED keyword is optional in nonclustered type
ON Employees (Name);

sp_helpindex yourindexname;


--ERROR HANDLING
BEGIN TRY
DECLARE @num1 INT = 10, @num2 INT = 0;
DECLARE @output INT = @num1 / @num2;
PRINT @output;
END TRY

BEGIN CATCH
PRINT 'Can,t Divide by ZERO';
END CATCH


--DATA CONTROL LANGUAGE - DCL

CREATE LOGIN lab7  WITH Password='123';
CREATE USER lab7 FROM LOGIN lab7;    -- create new user with password

GRANT SELECT on dbo.stdRec TO lab7;   --Allow SELECT on Table

REVOKE SELECT on dbo.stdRec TO lab7;    --Disallow SELECT on Table

GRANT SELECT on dbo.vw_students TO lab7;  --Allow SELECT on VIEW




