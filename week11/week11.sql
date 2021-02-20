use company;


call SelectAllCustomers;
Select *
from
Customers
where Country = "Brazil";
set @country = "Brazil";
call SelectCustomersByCountry(@country);

select count(OrderID)
from Orders join Shippers on(Orders.ShipperID = Shippers.ShipperID)
where ShipperName = "United Package"; 


call GetOrderCountByShipper("United Package",@count);
select @count;

set @counter =1999;

call Counter(@counter,1); 

select @counter;