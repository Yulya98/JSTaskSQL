--1)Получить все содержимое таблицы Product
Select * from Product;

--2) Получить коды и названия товаров, минимальная стоимость которых не привышают 500
Select IdOfProduct,NameOfProduct
From Product
Where price<=500;

--3) Получить среднюю стоимость заказов, сделанных в январе 2015 года
Select AVG(SumOfProduct) 
From Orders
Where DateOfOrder between '2015-01-01' and '2015-01-31'

--4) Получить название самого дорого товара, а также его стоимость
Select NameOfProduct,Price
From Product
Where Price =(Select Max(Price) from Product)

--5) Найти названия товаров, которые были куплены в январе 2015
Select Product.NameOfProduct
From Product inner join Orders on
Product.IdOfProduct = Orders.IdOfProduct
Where DateOfOrder between '2015-01-01' and '2015-01-31'

--6) Найти названия товаров, продажи которых в январе 2015 упали по сравнению с предыдущим месяцем

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


--7) Найти среднюю стоимость товаров в каждом магазине
Select AVG(Product.Price), Shop.NameOfShop
From Shop inner join Product on 
Shop.IdShop = Product.IdOfShop
Group by Shop.NameOfShop

--8) Найти значение продаж в каждом магазине за 2015-й год
Select Shop.NameOfShop, AVG(Orders.SumOfProduct)
From Product inner join Orders on 
Orders.IdOfProduct = Product.IdOfProduct
inner join Shop on 
Shop.IdShop = Product.IdOfShop
Where Orders.DateOfOrder between '2015-01-01' and '2015-12-31'
Group by Shop.NameOfShop

--9) Показать всех покупателей, плкупки которых в 2014-м превысили 1.000.000
Select SUM(Orders.SumOfProduct), Customer.IdOfCustomer,Customer.NameOfCustomer
From Orders inner join Customer on
Customer.IdOfCustomer =  Orders.IdOfCustomer
Where Orders.DateOfOrder between '2014-01-01' and '2014-12-31'
Group by Customer.IdOfCustomer,Customer.NameOfCustomer
Having SUM(Orders.SumOfProduct)>1000

Select * From Product
--10) Увеличить стоимость все продуктов в полтора раза, если она не превышает 100
Update Product set Price = Price*1.5
Where Price <100

Select * From Orders
--11) Удалить из таблицы order все записи за 2014 и более ранние годы
Delete from orders 
where orders.DateOfOrder <='2014-12-31'