Create table Shop(
IdShop int identity(1,1),
NameOfShop varchar(40) NOT NULL,
AddressOfShop varchar(40) NOT NULL,
primary key(IdShop));

Insert into Shop values('A','A');
Insert into Shop values('B','B');
Insert into Shop values('C','C');
Insert into Shop values('D','D');

Drop table Product;
Drop table Shop;
Drop table Orders;
Drop table OrdersToProduct;
Drop table Customer;

Create table Product(
IdOfProduct int identity(1,1),
IdOfShop int,
NameOfProduct varchar(20) NOT NULL,
Price int NOT NULL,
primary key(IdOfProduct),
Foreign key (IdOfShop) references Shop(IdShop));

Insert into Product values(1,'Milk',1200);
Insert into Product values(1,'Sugar',2000);
Insert into Product values(1,'Coffee',3000);

Insert into Product values(2,'Milk_2',4500);
Insert into Product values(2,'Sugar_2',5800);
Insert into Product values(2,'Coffee_2',7800);

Insert into Product values(3,'Milk_3',80000);
Insert into Product values(3,'Sugar_3',3000);
Insert into Product values(3,'Coffee_3',1000000);

Insert into Product values(4,'Milk_4',8);
Insert into Product values(4,'Sugar_4',4);
Insert into Product values(4,'Coffee_4',2);

Create table Customer(
IdOfCustomer int identity(1,1),
NameOfCustomer varchar(20) NOT NULL,
primary key(IdOfCustomer));

Insert into Customer values('Ivan Ivanov');
Insert into Customer values('Petya Petrov');
Insert into Customer values('Ivan Sidorov');
Insert into Customer values('Petya Sidorov');

Drop table Orders;
Create table Orders(
IdOfOrder int identity(1,1),
IdOfCustomer int,
CountOfProduct int NOT NULL,
IdOfProduct int,
DateOfOrder date NOT NULL,
SumOfProduct int,
Foreign key (IdOfProduct) references Product(IdOfProduct),
Foreign key (IdOfCustomer) references Customer(IdOfCustomer),
primary key(IdOfOrder));

Insert into Orders (IdOfCustomer,CountOfProduct,IdOfProduct,DateOfOrder) values(1,2,1,'2015-01-05');
Update Orders Set SumOfProduct=(Select Product.Price*Orders.CountOfProduct 
From Product inner join Orders on 
Product.IdOfProduct =Orders.IdOfProduct
where Orders.IdOfOrder = 1)
where IdOfOrder = 1;

Insert into Orders (IdOfCustomer,CountOfProduct,IdOfProduct,DateOfOrder) values(1,3,1,'2014-12-05');
Update Orders Set SumOfProduct=(Select Product.Price*Orders.CountOfProduct 
From Product inner join Orders on 
Product.IdOfProduct =Orders.IdOfProduct
where Orders.IdOfOrder = 2)
where IdOfOrder = 2;

Insert into Orders (IdOfCustomer,CountOfProduct,IdOfProduct,DateOfOrder) values(3,3,3,'2015-01-05');
Update Orders Set SumOfProduct=(Select Product.Price*Orders.CountOfProduct 
From Product inner join Orders on 
Product.IdOfProduct =Orders.IdOfProduct
where Orders.IdOfOrder = 3)
where IdOfOrder = 3;

Select * From Orders;

Insert into Orders (IdOfCustomer,CountOfProduct,IdOfProduct,DateOfOrder) values(3,3,22,'2014-12-05');
Update Orders Set SumOfProduct=(Select Product.Price*Orders.CountOfProduct 
From Product inner join Orders on 
Product.IdOfProduct =Orders.IdOfProduct
where Orders.IdOfOrder = 5)
where IdOfOrder = 5;

Insert into Orders (IdOfCustomer,CountOfProduct,IdOfProduct,DateOfOrder) values(3,2,22,'2014-12-05');
Update Orders Set SumOfProduct=(Select Product.Price*Orders.CountOfProduct 
From Product inner join Orders on 
Product.IdOfProduct =Orders.IdOfProduct
where Orders.IdOfOrder = 6)
where IdOfOrder = 6;