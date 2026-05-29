CREATE DATABASE EcommerceDB;
USE EcommerceDB;

CREATE TABLE Customer (
    Cust_ID INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    Phone VARCHAR(20),
    Password VARCHAR(100)
);

CREATE TABLE CustomerAddress (
    Address_ID INT PRIMARY KEY,
    Street_name VARCHAR(100),
    City VARCHAR(50),
    Postal_code VARCHAR(10),
    Cust_ID INT,
    FOREIGN KEY (Cust_ID)
    REFERENCES Customer(Cust_ID)
);

CREATE TABLE Subscription (
    Subscription_id INT PRIMARY KEY,
    Subscription_type VARCHAR(50),
    Subscr_start_date DATETIME,
    Subscr_end_date DATETIME,
    Cust_ID INT,
    FOREIGN KEY (Cust_ID)
    REFERENCES Customer(Cust_ID)
);

CREATE TABLE Payment_plan (
    Payment_plan_id INT PRIMARY KEY,
    Plan_type VARCHAR(50),
    Installment_amount FLOAT,
    Start_date DATETIME,
    End_date DATETIME,
    Cust_ID INT,
    FOREIGN KEY (Cust_ID)
    REFERENCES Customer(Cust_ID)
);

CREATE TABLE Employee (
    emp_id INT PRIMARY KEY,
    emp_first_name VARCHAR(50),
    emp_last_name VARCHAR(50),
    job_title VARCHAR(50),
    date_of_birth DATE,
    email VARCHAR(100)
);

CREATE TABLE Category (
    Category_ID INT PRIMARY KEY,
    Category_name VARCHAR(50)
);

CREATE TABLE Supplier (
    Supplier_id INT PRIMARY KEY,
    Contact_name VARCHAR(100),
    Contact_title VARCHAR(100),
    Address VARCHAR(255)
);

CREATE TABLE Product (
    Product_id INT PRIMARY KEY,
    Product_name VARCHAR(100),
    Price FLOAT,
    Quantity INT,
    Supplier_id INT,
    Category_ID INT,
    FOREIGN KEY (Supplier_id)
    REFERENCES Supplier(Supplier_id),
    FOREIGN KEY (Category_ID)
    REFERENCES Category(Category_ID)
);

CREATE TABLE CustProductReview (
    Review_id INT PRIMARY KEY,
    Rating INT,
    ReviewDate DATETIME,
    Cust_ID INT,
    Product_id INT,
    FOREIGN KEY (Cust_ID)
    REFERENCES Customer(Cust_ID),
    FOREIGN KEY (Product_id)
    REFERENCES Product(Product_id)
);
CREATE TABLE Cart (
    CartID INT PRIMARY KEY,
    Cust_ID INT,
    FOREIGN KEY (Cust_ID)
    REFERENCES Customer(Cust_ID)
);

CREATE TABLE CartItem (
    CartItem_id INT PRIMARY KEY,
    CartID INT,
    Product_id INT,
    Quantity INT,
    UnitPrice FLOAT,
    FOREIGN KEY (CartID)
    REFERENCES Cart(CartID),
    FOREIGN KEY (Product_id)
    REFERENCES Product(Product_id)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    OrderDate DATE,
    Order_status VARCHAR(50),
    Total_amount FLOAT,
    Cust_ID INT,
    emp_id INT,

    FOREIGN KEY (Cust_ID)
    REFERENCES Customer(Cust_ID),

    FOREIGN KEY (emp_id)
    REFERENCES Employee(emp_id)
);

CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    Quantity INT,
    Unit_price FLOAT,
    OrderID INT,
    Product_id INT,
    FOREIGN KEY (OrderID)
    REFERENCES Orders(OrderID),
    FOREIGN KEY (Product_id)
    REFERENCES Product(Product_id)
);

CREATE TABLE Shipper (
    Shipper_id INT PRIMARY KEY,
    Shipper_name VARCHAR(100),
    Shipper_number VARCHAR(20)
);

CREATE TABLE Delivery (
    Delivery_id INT PRIMARY KEY,
    Delivery_date DATETIME,
    Delivery_status VARCHAR(50),
    OrderID INT,
    Shipper_id INT,
    Address_ID INT,
    FOREIGN KEY (OrderID)
    REFERENCES Orders(OrderID),
    FOREIGN KEY (Shipper_id)
    REFERENCES Shipper(Shipper_id),
    FOREIGN KEY (Address_ID)
    REFERENCES CustomerAddress(Address_ID)
);

CREATE TABLE Shipment (
    Shipment_ID INT PRIMARY KEY,
    Waybill_number VARCHAR(100),
    Shipment_status VARCHAR(50),
    Origin_address VARCHAR(255),
    Expected_arrival DATETIME,
    Pickup_date DATETIME,
    Shipment_cost FLOAT,
    Delivery_ID INT,
    ParentShipment_ID INT,
    FOREIGN KEY (Delivery_ID)
    REFERENCES Delivery(Delivery_id),
    FOREIGN KEY (ParentShipment_ID)
    REFERENCES Shipment(Shipment_ID)
);

CREATE TABLE FreeDelivery (
    Free_delivery_id INT PRIMARY KEY,
    Fee_delivery FLOAT,
    Minimum_amount FLOAT,
    OrderID INT,

    FOREIGN KEY (OrderID)
    REFERENCES Orders(OrderID)
);

CREATE TABLE Payment (
    Payment_id INT PRIMARY KEY,
    Payment_date DATETIME,
    Payment_method VARCHAR(50),
    Payment_amount FLOAT,
    OrderID INT,
    FOREIGN KEY (OrderID)
    REFERENCES Orders(OrderID)
);

CREATE TABLE Warehouse (
    Warehouse_id INT PRIMARY KEY,
    WarehouseName VARCHAR(100),
    Location VARCHAR(100),
    emp_id INT,
    FOREIGN KEY (emp_id)
    REFERENCES Employee(emp_id)
);
CREATE TABLE Stock (
    Stock_ID INT PRIMARY KEY,
    QuantityAvailable INT,
    Warehouse_id INT,
    Product_id INT,
    FOREIGN KEY (Warehouse_id)
    REFERENCES Warehouse(Warehouse_id),
    FOREIGN KEY (Product_id)
    REFERENCES Product(Product_id)
);
CREATE TABLE BundleDeals (
    BundleDeal_id INT PRIMARY KEY,
    Bundle_name VARCHAR(100),
    Discount_Perc FLOAT,
    Bundle_start_date DATETIME,
    Bundle_end_date DATETIME
);

CREATE TABLE BundleDealDetails (
    BundleDealDetail_id INT PRIMARY KEY,
    BundleDeal_id INT,
    Product_id INT,
    FOREIGN KEY (BundleDeal_id)
    REFERENCES BundleDeals(BundleDeal_id),
    FOREIGN KEY (Product_id)
    REFERENCES Product(Product_id)
);
CREATE TABLE SupplierBundleDeals (
    SupplierDeal_id INT PRIMARY KEY,
    Supplier_id INT,
    BundleDeal_id INT,
    FOREIGN KEY (Supplier_id)
    REFERENCES Supplier(Supplier_id),
    FOREIGN KEY (BundleDeal_id)
    REFERENCES BundleDeals(BundleDeal_id)
);

INSERT INTO Customer VALUES 
(1,'Anele','Mokoena','anele@uj.ac.za','0712345678','Pass#1'),
(2,'Sipho','Ndlovu','sipho@wits.ac.za','0723456789','Pass#2'),
(3,'Lerato','Smith','lerato@tuks.ac.za','0734567890','Pass#3'),
(4,'Thando','Dlamini','thando@uj.ac.za','0745678901','Pass#4'),
(5,'Karabo','Nkosi','karabo@wits.ac.za','0756789012','Pass#5');
INSERT INTO CustomerAddress VALUES 
(1,'12 Student Rd','Johannesburg','2000',1),
(2,'45 Campus Ave','Pretoria','0001',2),
(3,'88 Library Lane','Soweto','1800',3),
(4,'19 Varsity Drive','Johannesburg','2001',4),
(5,'77 Exam Street','Pretoria','0002',5);
INSERT INTO Employee VALUES 
(1,'Thabo','Maseko','Admin','1995-06-10','thabo@legacy.co.za'),
(2,'Nomsa','Khumalo','Sales','1994-03-12','nomsa@legacy.co.za'),
(3,'Daniel','Smith','Support','1996-08-22','daniel@legacy.co.za');
INSERT INTO Category VALUES 
(1,'General Stationery'),
(2,'Electronics'),
(3,'Art Supplies'),
(4,'Office Essentials');
INSERT INTO Supplier VALUES 
(1,'ABC Supplies','Manager','Durban'),
(2,'TechSource','Coordinator','Johannesburg'),
(3,'PaperWorld','Supplier Lead','Cape Town');
INSERT INTO Product VALUES 
(1,'Notebook',25.00,100,1,1),
(2,'Scientific Calculator',350.00,40,2,2),
(3,'Sketch Book',60.00,80,3,3),
(4,'Printer Paper',120.00,70,3,4),
(5,'USB Flash Drive',150.00,50,2,2),
(6,'Pen Pack',30.00,120,1,1);
INSERT INTO Subscription VALUES 
(1,'Basic','2026-01-01','2026-12-31',1),
(2,'Premium','2026-01-01','2026-12-31',2),
(3,'Basic','2026-02-01','2026-12-31',3);
INSERT INTO Payment_plan VALUES 
(1,'Installment',250.00,'2026-01-01','2026-06-30',1),
(2,'Installment',500.00,'2026-01-01','2026-09-30',2),
(3,'Installment',300.00,'2026-02-01','2026-07-31',3);
INSERT INTO CustProductReview VALUES 
(1,5,'2026-05-01',1,1),
(2,4,'2026-05-02',2,2),
(3,5,'2026-05-03',3,3);
INSERT INTO Cart VALUES 
(1,1),
(2,2),
(3,3);
INSERT INTO CartItem VALUES 
(1,1,1,2,25.00),
(2,1,2,1,350.00),
(3,2,3,1,60.00),
(4,3,4,2,120.00);
INSERT INTO Orders VALUES 
(1,'2026-05-10','Completed',400.00,1,1),
(2,'2026-05-11','Completed',350.00,2,2),
(3,'2026-05-12','Pending',200.00,3,1),
(4,'2026-05-13','Processing',120.00,4,3),
(5,'2026-05-14','Pending',150.00,5,2);
INSERT INTO OrderDetails VALUES 
(1,2,25.00,1,1),
(2,1,350.00,2,2),
(3,1,60.00,3,3),
(4,2,120.00,4,4),
(5,1,150.00,5,5);
INSERT INTO Payment VALUES 
(1,'2026-05-10','Card',400.00,1),
(2,'2026-05-11','EFT',350.00,2),
(3,'2026-05-12','Card',200.00,3),
(4,'2026-05-13','Card',120.00,4),
(5,'2026-05-14','EFT',150.00,5);
INSERT INTO Delivery VALUES 
(1,'2026-05-11','Delivered',1,1,1),
(2,'2026-05-12','Delivered',2,2,2),
(3,'2026-05-13','In Transit',3,1,3),
(4,'2026-05-14','Processing',4,3,4),
(5,'2026-05-15','Pending',5,2,5);
INSERT INTO Stock VALUES 
(1,80,1,1),
(2,40,1,2),
(3,60,1,3);
INSERT INTO BundleDeals VALUES 
(1,'Exam Starter Pack',15.00,'2026-05-01','2026-06-30'),
(2,'Tech Bundle',10.00,'2026-05-01','2026-06-30');
INSERT INTO BundleDealDetails VALUES 
(1,1,1),
(2,1,2),
(3,2,5);
INSERT INTO SupplierBundleDeals VALUES 
(1,1,1),
(2,2,2);
INSERT INTO Warehouse VALUES 
(1,'Main Warehouse','Johannesburg',1);

INSERT INTO Shipment VALUES 
(1,'WB12345','In Transit','Johannesburg','2026-05-16','2026-05-14',50.00,1,NULL);

INSERT INTO FreeDelivery VALUES 
(1,0.00,300.00,1),
(2,0.00,500.00,2);
