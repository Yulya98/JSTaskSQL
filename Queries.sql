--1)�������� ��� ���������� ������� Product
Select * from Product;

--2) �������� ���� � �������� �������, ����������� ��������� ������� �� ��������� 500
Select IdOfProduct,NameOfProduct
From Product
Where price<=500;

--3) �������� ������� ��������� �������, ��������� � ������ 2015 ����
Select AVG(SumOfProduct) 
From Orders
Where DateOfOrder between '2015-01-01' and '2015-01-31'

--4) �������� �������� ������ ������ ������, � ����� ��� ���������
Select NameOfProduct,Price
From Product
Where Price =(Select Max(Price) from Product)

--5) ����� �������� �������, ������� ���� ������� � ������ 2015
Select Product.NameOfProduct
From Product inner join Orders on
Product.IdOfProduct = Orders.IdOfProduct
Where DateOfOrder between '2015-01-01' and '2015-01-31'

--6) ����� �������� �������, ������� ������� � ������ 2015 ����� �� ��������� � ���������� �������

Select SUM(Orders.CountOfProduct), Product.NameOfProduct
From Product inner join Orders on
Product.IdOfProduct = Orders.IdOfProduct
Where DateOfOrder between '2015-01-01' and '2015-01-31'
Group by  Product.NameOfProduct
Having SUM(Orders.CountOfProduct)<(Select SUM(Orders.CountOfProduct)
From Product inner join Orders on
Product.IdOfProduct = Orders.IdOfProduct
Where Orders.DateOfOrder between '2014-12-01' and '2014-12-31');

Select * From Orders


--7) ����� ������� ��������� ������� � ������ ��������
Select AVG(Product.Price), Shop.NameOfShop
From Shop inner join Product on 
Shop.IdShop = Product.IdOfShop
Group by Shop.NameOfShop

--8) ����� �������� ������ � ������ �������� �� 2015-� ���
Select Shop.NameOfShop, AVG(Orders.SumOfProduct)
From Product inner join Orders on 
Orders.IdOfProduct = Product.IdOfProduct
inner join Shop on 
Shop.IdShop = Product.IdOfShop
Where Orders.DateOfOrder between '2015-01-01' and '2015-12-31'
Group by Shop.NameOfShop

--9) �������� ���� �����������, ������� ������� � 2014-� ��������� 1.000.000
Select SUM(Orders.SumOfProduct), Customer.IdOfCustomer,Customer.NameOfCustomer
From Orders inner join Customer on
Customer.IdOfCustomer =  Orders.IdOfCustomer
Where Orders.DateOfOrder between '2014-01-01' and '2014-12-31'
Group by Customer.IdOfCustomer,Customer.NameOfCustomer
Having SUM(Orders.SumOfProduct)>1000

Select * From Product
--10) ��������� ��������� ��� ��������� � ������� ����, ���� ��� �� ��������� 100
Update Product set Price = Price*1.5
Where Price <100

Select * From Orders
--11) ������� �� ������� order ��� ������ �� 2014 � ����� ������ ����
Delete from orders 
where orders.DateOfOrder <='2014-12-31'