CREATE DATABASE CafeManagement;
USE CafeManagement;
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    Phone VARCHAR(15)
);
CREATE TABLE Menu (
    ItemID INT PRIMARY KEY,
    ItemName VARCHAR(50),
    Price DECIMAL(10,2)
);
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
CREATE TABLE OrderDetails (
    DetailID INT PRIMARY KEY,
    OrderID INT,
    ItemID INT,
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ItemID) REFERENCES Menu(ItemID)
);
INSERT INTO Customers VALUES
(1,'Nitin','9876543210'),
(2,'Rahul','9876543211');

INSERT INTO Menu VALUES
(101,'Coffee',120),
(102,'Burger',150),
(103,'Pizza',250);

INSERT INTO Orders VALUES
(1001,1,'2026-06-20'),
(1002,2,'2026-06-20');

INSERT INTO OrderDetails VALUES
(1,1001,101,2),
(2,1001,102,1),
(3,1002,103,1);
SELECT c.CustomerName, o.OrderID, o.OrderDate
FROM Customers c
JOIN Orders o
ON c.CustomerID = o.CustomerID;
#Total Bill
SELECT o.OrderID,
SUM(m.Price * od.Quantity) AS TotalBill
FROM Orders o
JOIN OrderDetails od
ON o.OrderID = od.OrderID
JOIN Menu m
ON od.ItemID = m.ItemID
GROUP BY o.OrderID;
#Most Expensive Item
SELECT *
FROM Menu
ORDER BY Price DESC
LIMIT 1;