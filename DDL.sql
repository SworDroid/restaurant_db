--  RESTAURANT DB

--  TABLE CREATION

DROP TABLE IF EXISTS ORDER_t;
DROP TABLE IF EXISTS FOOD_t;
DROP TABLE IF EXISTS PAYMENT_t;
DROP TABLE IF EXISTS BILL_t;
DROP TABLE IF EXISTS CUSTOMER_t;
DROP TABLE IF EXISTS TABLE_t;
DROP TABLE IF EXISTS HOST_t;
DROP TABLE IF EXISTS CHEF_t;
DROP TABLE IF EXISTS WAITER_t;
DROP TABLE IF EXISTS EMPLOYEE_t;
DROP TABLE IF EXISTS MANAGER_t;


CREATE TABLE MANAGER_t
(
	ManagerID		INT 			NOT NULL,
	M_Name			VARCHAR(20)		NOT NULL,
	Salary			INT,

    CONSTRAINT MANAGER_PK PRIMARY KEY (ManagerID)
);

CREATE TABLE EMPLOYEE_t
(
	EmployeeID		INT 			NOT NULL,
	E_Name			VARCHAR(20)		NOT NULL,
	Date_hired		DATE,
	Hourly_pay		INT,
	ManagerID		INT				NOT NULL,

	CONSTRAINT EMPLOYEE_PK PRIMARY KEY (EmployeeID),
	CONSTRAINT EMPLOYEE_FK FOREIGN KEY (ManagerID) REFERENCES MANAGER_t(ManagerID)
);

CREATE TABLE WAITER_t
(
	WaiterID		INT 		NOT NULL,
	Tips			INT,

	CONSTRAINT WAITER_PK FOREIGN KEY (WaiterID) REFERENCES EMPLOYEE_t(EmployeeID)
);

CREATE TABLE CHEF_t
(
	ChefID			INT 		NOT NULL,
	Station			VARCHAR(10),
	Day_or_night	VARCHAR(5),

	CONSTRAINT CHEF_PK FOREIGN KEY (ChefID) REFERENCES EMPLOYEE_t(EmployeeID)
);

CREATE TABLE HOST_t
(
	HostID			INT 		NOT NULL,
	Tips			INT,

	CONSTRAINT HOST_PK FOREIGN KEY (HostID) REFERENCES EMPLOYEE_t(EmployeeID)
);

CREATE TABLE TABLE_t
(
	TableNo			INT 		NOT NULL,
	Available_seats	INT,
	HostID			INT 		NOT NULL,
	WaiterID		INT 		NOT NULL,

	CONSTRAINT TABLE_PK PRIMARY KEY (TableNo),
	CONSTRAINT TABLE_FK1 FOREIGN KEY (HostID) REFERENCES HOST_t(HostID),
	CONSTRAINT TABLE_FK2 FOREIGN KEY (WaiterID) REFERENCES WAITER_t(WaiterID)
);

CREATE TABLE CUSTOMER_t
(
	CustID			INT 		NOT NULL,
	C_Name			VARCHAR(20),
	Phone			VARCHAR(10),
	TableNo			INT			NOT NULL,

	CONSTRAINT CUSTOMER_PK PRIMARY KEY (CustID),
	CONSTRAINT CUSTOMER_FK FOREIGN KEY (TableNo) REFERENCES TABLE_t(TableNo)
);

CREATE TABLE BILL_t
(
	BillNo		INT 		NOT NULL,
	Amount		INT,
	CustID		INT 		NOT NULL,

	CONSTRAINT BILL_PK PRIMARY KEY (BillNo),
	CONSTRAINT BILL_FK FOREIGN KEY (CustID) REFERENCES CUSTOMER_t(CustID)
);

CREATE TABLE PAYMENT_t
(
	PaymentNo	INT 		NOT NULL,
	Amount		INT,
	Type 		VARCHAR(8),
	CustID		INT 		NOT NULL,

	CONSTRAINT PAYMENT_PK PRIMARY KEY (PaymentNo),
	CONSTRAINT PAYMENT_FK FOREIGN KEY (CustID) REFERENCES BILL_t(CustID)
);

CREATE TABLE FOOD_t
(
	FoodID		INT 	NOT NULL,
	Name		VARCHAR(20),
	Price		INT,
	ChefID		INT 	NOT NULL,

	CONSTRAINT FOOD_PK PRIMARY KEY (FoodID),
	CONSTRAINT FOOD_FK FOREIGN KEY (ChefID) REFERENCES CHEF_t(ChefID)
);

CREATE TABLE ORDER_t
(
	Order_time	TIME,
	CustID		INT 	NOT NULL,
	WaiterID	INT 	NOT NULL,
	FoodID		INT 	NOT NULL,

	CONSTRAINT ORDER_FK1 FOREIGN KEY (CustID) REFERENCES CUSTOMER_t(CustID),
	CONSTRAINT ORDER_FK2 FOREIGN KEY (WaiterID) REFERENCES WAITER_t(WaiterID),
	CONSTRAINT ORDER_FK3 FOREIGN KEY (FoodID) REFERENCES FOOD_t(FoodID)

);



-- DATA INSERTION

-- INSERT INTO MANAGER_t VALUES (ManagerID, Name, Salary);
INSERT INTO MANAGER_t VALUES (1000, 'Suzie Smith', 		55000);
INSERT INTO MANAGER_t VALUES (1001, 'Jerry Miller',	 	55000);
INSERT INTO MANAGER_t VALUES (1002, 'George Hill', 		56000);
INSERT INTO MANAGER_t VALUES (1003, 'Elaine Scott', 	60000);
INSERT INTO MANAGER_t VALUES (1004, 'Jim Kramer', 		57000);
INSERT INTO MANAGER_t VALUES (1005, 'Michelle Garcia', 	59000);



-- INSERT INTO EMPLOYEE_t VALUES (EmployeeID, Name, Date_hired, Hourly_pay, ManagerID);
INSERT INTO EMPLOYEE_t VALUES (2000, 'Bill Williams', 	'2016-05-31', 15, 1000);
INSERT INTO EMPLOYEE_t VALUES (2001, 'Sarah Jenkins', 	'2017-06-25', 16, 1000);
INSERT INTO EMPLOYEE_t VALUES (2002, 'Jim Benvoglio',	'2017-07-21', 15, 1001);
INSERT INTO EMPLOYEE_t VALUES (2003, 'Chelsea Oldman', 	'2018-04-20', 17, 1001);
INSERT INTO EMPLOYEE_t VALUES (2004, 'Andy Grandberg', 	'2018-06-15', 15, 1001);



INSERT INTO EMPLOYEE_t VALUES (2010, 'Roberta Jones',	'2018-11-25', 25, 1002);
INSERT INTO EMPLOYEE_t VALUES (2011, 'Elfonzo Duke',	'2018-10-10', 20, 1002);
INSERT INTO EMPLOYEE_t VALUES (2012, 'Eric Brown',		'2016-09-23', 21, 1002);
INSERT INTO EMPLOYEE_t VALUES (2013, 'Izabel Frisk',	'2018-10-17', 23, 1003);
INSERT INTO EMPLOYEE_t VALUES (2014, 'Henri Menendez',	'2017-04-15', 25, 1003);


INSERT INTO EMPLOYEE_t VALUES (2020, 'Sofia Gosselin', 	'2016-04-18', 15, 1004);
INSERT INTO EMPLOYEE_t VALUES (2021, 'Don Ligma', 		'2017-01-20', 15, 1004);
INSERT INTO EMPLOYEE_t VALUES (2022, 'Sarina Chastain', '2018-04-14', 16, 1004);
INSERT INTO EMPLOYEE_t VALUES (2023, 'Simonu Thomas', 	'2018-03-05', 17, 1005);
INSERT INTO EMPLOYEE_t VALUES (2024, 'Tom Cruz', 		'2017-05-10', 17, 1005);



-- INSERT INTO WAITER_t VALUES (WaiterID, Tips);
INSERT INTO WAITER_t VALUES (2000, 30);
INSERT INTO WAITER_t VALUES (2001, 45);
INSERT INTO WAITER_t VALUES (2002, 50);
INSERT INTO WAITER_t VALUES (2003, 36);
INSERT INTO WAITER_t VALUES (2004, 42);




-- INSERT INTO CHEF_t VALUES (ChefID, Station, Day_or_night);
INSERT INTO CHEF_t VALUES (2010, 'Entrees', 'Day');
INSERT INTO CHEF_t VALUES (2011, 'Sides', 	'Day');
INSERT INTO CHEF_t VALUES (2012, 'Entrees', 'Night');
INSERT INTO CHEF_t VALUES (2013, 'Sides', 	'Night');
INSERT INTO CHEF_t VALUES (2014, 'Entrees', 'Day');



-- INSERT INTO HOST_t VALUES (HostID, Tips);
INSERT INTO HOST_t VALUES (2020, 27);
INSERT INTO HOST_t VALUES (2021, 35);
INSERT INTO HOST_t VALUES (2022, 33);
INSERT INTO HOST_t VALUES (2023, 40);
INSERT INTO HOST_t VALUES (2024, 43);



-- INSERT INTO TABLE_t VALUES (TableNo, Available_seats, HostID, WaiterID);
INSERT INTO TABLE_t VALUES (100, 6, 2020, 2000);
INSERT INTO TABLE_t VALUES (101, 8, 2021, 2001);
INSERT INTO TABLE_t VALUES (102, 6, 2021, 2002);
INSERT INTO TABLE_t VALUES (103, 8, 2020, 2001);
INSERT INTO TABLE_t VALUES (104, 2, 2022, 2000);
INSERT INTO TABLE_t VALUES (105, 4, 2022, 2002);


-- INSERT INTO CUSTOMER_t VALUES (CustID, Name, Phone, TableNo);
INSERT INTO CUSTOMER_t VALUES (3000, 'Dan Hamberg', 	6175550123, 100);
INSERT INTO CUSTOMER_t VALUES (3001, 'Phil Ivan', 		6175550101, 100);
INSERT INTO CUSTOMER_t VALUES (3002, 'Joan Johnson',	6175559021, 100);
INSERT INTO CUSTOMER_t VALUES (3003, 'Dani Doyle', 		6175557821, 103);

INSERT INTO CUSTOMER_t VALUES (3004, 'Ben Xu', 			9785557821, 103);
INSERT INTO CUSTOMER_t VALUES (3005, 'Paul Kay', 		9785557821, 103);
INSERT INTO CUSTOMER_t VALUES (3006, 'Clif Wampler',	9785558211, 105);
INSERT INTO CUSTOMER_t VALUES (3007, 'Clem Williams', 	9785556742, 105);


-- INSERT INTO BILL_t VALUES (BillNo, Amount, CustID);
INSERT INTO BILL_t VALUES (800, 35, 3000);
INSERT INTO BILL_t VALUES (801, 40, 3001);
INSERT INTO BILL_t VALUES (802, 22, 3002);
INSERT INTO BILL_t VALUES (803, 15, 3003);
INSERT INTO BILL_t VALUES (804, 16, 3005);
INSERT INTO BILL_t VALUES (805, 20, 3007);



-- INSERT INTO PAYMENT_t VALUES (PaymentNo, Amount, Type, CustID);
INSERT INTO PAYMENT_t VALUES (900, 35, 'Debit', 3000);
INSERT INTO PAYMENT_t VALUES (901, 40, 'Cash', 3001);
INSERT INTO PAYMENT_t VALUES (902, 22, 'Debit', 3002);
INSERT INTO PAYMENT_t VALUES (903, 15, 'Credit', 3003);
INSERT INTO PAYMENT_t VALUES (904, 16, 'Cash', 3005);
INSERT INTO PAYMENT_t VALUES (905, 20, 'Cash', 3007);



-- INSERT INTO FOOD_t VALUES (FoodID, Name, Price, ChefID);
INSERT INTO FOOD_t VALUES (200, 'Cheeseburger', 	10, 2012);
INSERT INTO FOOD_t VALUES (201, 'Chicken Wings', 	11, 2012);
INSERT INTO FOOD_t VALUES (202, 'Lobster Roll', 	19, 2013);
INSERT INTO FOOD_t VALUES (203, 'Clam Chowder', 	 8, 2013);

INSERT INTO FOOD_t VALUES (204, 'French Fries', 	 6, 2014);
INSERT INTO FOOD_t VALUES (205, 'BLT', 				10, 2014);
INSERT INTO FOOD_t VALUES (206, 'Caesar Salad', 	10, 2010);
INSERT INTO FOOD_t VALUES (207, 'Veggie Burger', 	12, 2010);



-- INSERT INTO ORDER_t VALUES (Order_time, CustID, WaiterID, FoodID);
INSERT INTO ORDER_t VALUES ('12:05:00', 3000, 2000, 200);
INSERT INTO ORDER_t VALUES ('15:45:00', 3001, 2000, 201);
INSERT INTO ORDER_t VALUES ('15:35:00', 3002, 2000, 202);
INSERT INTO ORDER_t VALUES ('14:15:00', 3003, 2001, 203);

INSERT INTO ORDER_t VALUES ('16:05:00', 3005, 2001, 202);
INSERT INTO ORDER_t VALUES ('17:25:00', 3004, 2001, 204);
INSERT INTO ORDER_t VALUES ('17:15:00', 3007, 2002, 206);
INSERT INTO ORDER_t VALUES ('18:35:00', 3005, 2001, 206);