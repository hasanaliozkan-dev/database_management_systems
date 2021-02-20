use company;
update Customers set Country = replace(Country ,'\n','');

select Country,count(CustomerID) as number
from Customers
group by Country order by number;


create view usa_customers as 
select CustomerName,ContactName 
from Customers
where Country = 'USA';

select *
from usa_customers;

create or replace view  products_above_avg as
select ProductName,Price
from Products
where Price>(select avg(Price) from Products);

select * from products_above_avg;

