--Understanding NULL Values in SQL--
CREATE TABLE USERS (
UserID INT PRIMARY KEY,
NAMES VARCHAR(100) NOT NULL,
Email VARCHAR(255)
);

SELECT * FROM USERS

INSERT INTO USERS (UserID,Names,Email)
VALUES
(1,'John','john@example.com'),
(2,'Alice',NULL), -- Alice has no email
(3,'Bob','bob@example.com');

-- Find users without an email--
SELECT * FROM Users WHERE Email IS NULL;

--Replace NULL emails with a placeholder--
SELECT NAMES, COALESCE(Email,'No Email') AS Email FROM USERS;

--Explanation:
--SELECT Clause:

--Name: This specifies that the Name column from the Users table should be included in the result.
--COALESCE(Email, 'No Email'): This is a function that returns the first non-NULL value among its arguments. 
--In this query: If the Email column value is NULL, it substitutes it with the string 'No Email'.
--If the Email column has a valid value, that value is returned.
--AS Email: Assigns an alias (Email) to the output of the COALESCE function for better readability.

--From Clause:

--FROM Users: Specifies the table (Users) from which the data is retrieved.--

-- ALTER Commands--
CREATE TABLE Employees (
    EmployeeID INT Not Null,
    Name VARCHAR(100),
    Salary DECIMAL(8, 2)
);

Drop Table Employees;

insert INTO Employees ( EmployeeID, Name, Salary)
VALUES
(1,'Ankit',10000000),
(2,'Nikita',123.4567), 
(3,'Samay',0);


--Adding a New Column:
ALTER TABLE Employees ADD Address VARCHAR(255);

SELECT * FROM Employees;

--Modifying a Column 
ALTER TABLE Employees Alter COLUMN Salary DECIMAL(10,2);

--Drop a Column-- 
ALTER TABLE Employees Drop COLUMN Address;
Alter TABLE Employees Drop COLUMN Location;

--Rename a column --
EXEC sp_rename 'Employees.Address', 'Location', 'COLUMN';

SELECT EmployeeID, COALESCE(Location,'Work from Home') AS LOCATION FROM Employees;
SELECT Name, COALESCE(Location,'Work from Home') AS LOCATION FROM Employees;

--Add a constraint--
ALTER TABLE employees ADD CONSTRAINT PK_Employees PRIMARY KEY (EmployeeID);
