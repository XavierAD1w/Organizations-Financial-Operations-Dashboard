create database Organization_Db;
use Organization_Db;
create table Customers(
Customer_Id int primary key,
First_name varchar(50),
Last_name varchar(50),
email varchar(100),
Phone_number bigint,
date_joined date,
customer_status varchar(50)
);

insert into Customers values
(0210, "Denzel","Ayogu","denzelayogu2010@gmail.com", 07036844773, '2012-03-29', "Active"),
(0201, "Fidelis","Nonso","fidelis353@gmail.com", 09011075319, '2019-09-30', "Active"),
(0321, "Ifeoma","Ugwu","ifyayogu182010@gmail.com", 08140348566, '2021-08-01', "Inactive"),
(1023, "Kenneth","Ayogu","eberechukwu606@gmail.com", 07063552074, '2011-11-18', "Active"),
(0314, "Ebuka","Ayika","chukwuebukaayogu2@gmail.com", 08103395727, '2010-09-09', "Inactive"),
(0211, "Sofia","Carson","sofia1carson2@gmail.com", 08054383281, '2022-01-20', "Active"),
(0102, "Xavier","Chess","xavierayogu@gmail.com", 09019058875, '2023-06-11', "Inactive"),
(0401, "Jesse","White","e2010@gmail.com", 08102946595, '2017-06-12', "Active"),
(0120, "Shirley","Clare","cvlre13@gmail.com", 09071248780, '2020-07-02', "Active"),
(0220, "Fortune","Arinze","Arinze@gmail.com", 08106564753, '2014-05-29', "Active");

select * from Customers;

create table Account(
Account_Id int primary key,
foreign key(Customer_Id) references Customers(Customer_Id),
Customer_Id int,
Account_type varchar(50),
Account_Balance decimal(15,2),
Currency char(3),
date_joined date,
Account_status varchar(50)
);

insert into Account values
(1, 0210, "Fixed_Deposit", 9000000.00,'NGN', '2012-03-29',"Active"),
(2, 0201, "Savings", 10000000.00,'USD', '2019-09-30',"Active"),
(3, 0321, "Fixed_Deposit", 850760.89,'NGN', '2021-08-01',"Frozen"),
(4, 1023, "Current", 90000000.00,'NGN', '2011-11-18',"Active"),
(5, 0314, "Savings", 0.00,'USD', '2010-09-09',"Closed"),
(6, 0211, "Fixed_Deposit", 761003.10,'NGN', '2022-01-20',"Active"),
(7, 0102, "Fixed_Deposit", 55103.00,'NGN', '2023-06-11',"Frozen"),
(8, 0401, "Current", 905500.00,'USD', '2017-06-12',"Active"),
(9, 0120, "Savings", 701000.00,'NGN', '2020-07-02',"Active"),
(10, 0220, "Savings", 110500.00,'NGN', '2014-05-29',"Active"),
(11, 0314, "Fixed_Deposit", 110500.00,'NGN', '2020-09-12',"Active"),
(12, 0201, "Fixed_Deposit", 100103.00,'NGN', '2024-07-11',"Active");

select	* from Account;

create table Transactions(
Transaction_Id int primary key,
foreign key(Account_Id) references Account(Account_Id),
Account_Id int,
Transaction_type varchar(50),
Transaction_amount decimal(15,2),
Transaction_date datetime,
Transaction_status varchar(60)
);

INSERT INTO transactions
VALUES
(1,1,'Deposit',5000.00,'2024-01-05','Completed'),
(2,1,'Withdrawal',1200.00,'2024-01-10','Completed'),
(3,7,'Deposit',15000.00,'2024-01-12','Pending'),
(4,12,'Deposit',8000.00,'2024-01-15','Completed'),
(5,7,'Withdrawal',3000.00,'2024-01-18','Failed'),
(6,8,'Deposit',22000.00,'2024-01-20','Completed'),
(7,4,'Deposit',4000.00,'2024-01-22','Completed'),
(8,11,'Withdrawal',2500.00,'2024-01-25','Completed'),
(9,5,'Withdrawal',1000.00,'2024-01-28','Failed'),
(10,8,'Withdrawal',5000.00,'2024-02-02','Completed'),
(11,2,'Deposit',30000.00,'2024-02-05','Completed'),
(12,6,'Deposit',12000.00,'2024-02-07','Completed'),
(13,3,'Withdrawal',700.00,'2024-02-10','Failed'),
(14,7,'Deposit',9000.00,'2024-02-12','Pending'),
(15,9,'Withdrawal',6000.00,'2024-02-15','Completed'),
(16,9,'Deposit',4500.00,'2024-02-18','Completed'),
(17,10,'Deposit',11000.00,'2024-02-20','Completed'),
(18,11,'Withdrawal',1800.00,'2024-02-22','Completed'),
(19,2,'Deposit',6500.00,'2024-02-25','Pending'),
(20,7,'Withdrawal',2200.00,'2024-02-27','Pending'),
(21,10,'Deposit',14000.00,'2024-03-01','Completed'),
(22,3,'Withdrawal',900.00,'2024-03-03','Completed'),
(23,10,'Deposit',7500.00,'2024-03-06','Completed'),
(24,5,'Deposit',5000.00,'2024-03-08','Completed'),
(25,11,'Withdrawal',1600.00,'2024-03-10','Completed'),
(26,2,'Deposit',7000.00,'2024-03-12','Pending'),
(27,9,'Withdrawal',2500.00,'2024-03-13','Failed'),
(28,5,'Deposit',18000.00,'2024-03-14','Completed'),
(29,6,'Withdrawal',4500.00,'2024-03-15','Pending'),
(30,4,'Deposit',9500.00,'2024-03-16','Failed');

select * from Transactions;

create table Revenue(
Revenue_Id int primary key,
Revenue_Source varchar(50),
Amount decimal(15,2),
Revenue_date date,
Account_Id int
);

INSERT INTO revenue
(revenue_id, revenue_source, amount, revenue_date, account_id)
VALUES
(1,'Transaction Fee',60.00,'2024-01-05',11),
(2,'Transaction Fee',60.00,'2024-01-10',1),
(3,'Interest Income',60.00,'2024-01-12',10),
(4,'Transaction Fee',60.00,'2024-01-15',3),
(5,'Account Maintenance',60.00,'2024-01-18',2),
(6,'Transaction Fee',60.00,'2024-01-20',10),
(7,'Interest Income',60.00,'2024-01-22',11),
(8,'Transaction Fee',60.00,'2024-01-25',5),
(9,'Transaction Fee',60.00,'2024-01-28',3),
(10,'Account Maintenance',60.00,'2024-02-01',4),
(11,'Transaction Fee',60.00,'2024-02-02',10),
(12,'Interest Income',60.00,'2024-02-05',6),
(13,'Transaction Fee',60.00,'2024-02-07',5),
(14,'Interest Income',60.00,'2024-02-10',8),
(15,'Account Maintenance',60.00,'2024-02-12',2),
(16,'Transaction Fee',60.00,'2024-02-15',6),
(17,'Interest Income',60.00,'2024-02-18',8),
(18,'Transaction Fee',60.00,'2024-02-20',4),
(19,'Transaction Fee',60.00,'2024-02-22',5),
(20,'Account Maintenance',60.00,'2024-02-25',1),
(21,'Interest Income',60.00,'2024-02-27',2),
(22,'Transaction Fee',60.00,'2024-03-01',6),
(23,'Transaction Fee',60.00,'2024-03-03',3),
(24,'Interest Income',60.00,'2024-03-05',9),
(25,'Account Maintenance',60.00,'2024-03-06',5),
(26,'Transaction Fee',60.00,'2024-03-08',7),
(27,'Interest Income',60.00,'2024-03-10',11),
(28,'Transaction Fee',60.00,'2024-03-12',2),
(29,'Transaction Fee',60.00,'2024-03-14',6),
(30,'Account Maintenance',60.00,'2024-03-15',4),
(31,'Interest Income',60.00,'2024-03-16',3),
(32,'Transaction Fee',60.00,'2024-03-18',7),
(33,'Transaction Fee',60.00,'2024-03-20',10),
(34,'Interest Income',60.00,'2024-03-22',2),
(35,'Account Maintenance',60.00,'2024-03-24',6),
(36,'Transaction Fee',60.00,'2024-03-25',4),
(37,'Interest Income',60.00,'2024-03-26',12),
(38,'Transaction Fee',60.00,'2024-03-27',11),
(39,'Transaction Fee',60.00,'2024-03-28',12),
(40,'Account Maintenance',60.00,'2024-03-29',12),
(41,'Interest Income',60.00,'2024-04-01',6),
(42,'Transaction Fee',60.00,'2024-04-02',4),
(43,'Transaction Fee',60.00,'2024-04-03',11),
(44,'Interest Income',60.00,'2024-04-04',12),
(45,'Account Maintenance',60.00,'2024-04-05',9),
(46,'Transaction Fee',60.00,'2024-04-06',8),
(47,'Interest Income',60.00,'2024-04-07',7),
(48,'Transaction Fee',60.00,'2024-04-08',5),
(49,'Transaction Fee',60.00,'2024-04-09',9),
(50,'Account Maintenance',60.00,'2024-04-10',9);
 
 select * from Revenue;
 
 #ANSWERS
 SELECT
    MONTH(revenue_date) AS month,
    SUM(amount) AS total_revenue
FROM revenue
GROUP BY MONTH(revenue_date)
ORDER BY month;

SELECT
    account_id AS customer_id,
    SUM(transaction_amount) AS total_deposits
FROM transactions
WHERE transaction_type = 'Deposit'
  AND transaction_status = 'Completed'
GROUP BY account_id
ORDER BY total_deposits DESC
LIMIT 5;

SELECT
    account_type,
    AVG(account_balance) AS average_balance
FROM Account
GROUP BY account_type;

SELECT
    account_id AS customer_id,
    COUNT(*) AS transaction_count
FROM transactions
WHERE transaction_status = 'Completed'
GROUP BY account_id
ORDER BY transaction_count DESC
limit 5;

SELECT
    transaction_type,
    COUNT(*) AS transaction_count,
    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(*) 
         FROM transactions 
         WHERE transaction_status = 'Completed'),
        2
    ) AS percentage
FROM transactions
WHERE transaction_status = 'Completed'
GROUP BY transaction_type;

SELECT
    DATE_FORMAT(revenue_date, '%Y-%m') AS month,
    SUM(amount) AS total_revenue
FROM revenue
GROUP BY DATE_FORMAT(revenue_date, '%Y-%m')
ORDER BY month;

SELECT
    revenue_source,
    COUNT(*) AS entry_count,
    SUM(amount) AS total_revenue
FROM revenue
GROUP BY revenue_source
ORDER BY total_revenue DESC;

SELECT
    account_id,
    COUNT(*) AS transaction_volume
FROM transactions
WHERE transaction_status = 'Completed'
GROUP BY account_id
ORDER BY transaction_volume DESC;

SELECT
    DATE_FORMAT(date_joined, '%Y-%m') AS month,
    COUNT(customer_id) AS new_customers
FROM customers
GROUP BY DATE_FORMAT(date_joined, '%Y-%m')
ORDER BY month;

SELECT
    DATE_FORMAT(date_joined, '%Y-%m') AS month,
    SUM(account_balance) AS total_balance
FROM Account
GROUP BY DATE_FORMAT(date_joined, '%Y-%m')
ORDER BY month;

 
