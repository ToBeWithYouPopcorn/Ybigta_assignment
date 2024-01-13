use w3schools;

# 1번
select customers.CustomerID, customers.CustomerName, sum(products.Price * orderdetails.Quantity) AS 구매금액
from products join orderdetails on products.ProductID = orderdetails.ProductID
join orders on orderdetails.OrderID = orders.OrderID
join customers on orders.CustomerID = customers.CustomerID
group by customers.CustomerID, customers.CustomerName
order by customers.CustomerID ASC;

# 2번
select categories.CategoryName, sum(od.Quantity) AS 판매량, sum(p.Price * od.Quantity) AS 판매금액
from orderdetails AS od join products AS p on od.ProductID = p.ProductID
join categories on p.CategoryID  = categories.CategoryID
group by categories.CategoryName
having 판매량 > 2000
order by 판매량 Desc;

# 3번
select categories.CategoryName, sum(od.Quantity) AS 판매량, sum(p.Price * od.Quantity) AS 판매금액
from orderdetails AS od join products AS p on od.ProductID = p.ProductID
join categories on p.CategoryID  = categories.CategoryID
group by categories.CategoryName
having 판매량 > 2000 AND 판매금액 > (SELECT sum(p.Price * od.Quantity) 
from orderdetails AS od join products AS p on od.ProductID = p.ProductID
join categories on p.CategoryID  = categories.CategoryID
WHERE categories.CategoryName = 'Seafood')
order by 판매량 Desc;