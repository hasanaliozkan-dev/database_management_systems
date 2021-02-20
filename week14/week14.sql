use company;

create temporary table TopSuppliers(
SupplierID int not null,
SupplierName varchar(45),
ProductCount int,
primary key(SupplierId)
);

insert into  TopSuppliers( SupplierID ,SupplierName,ProductCount)
select suppliers.SupplierID,SupplierName,count(ProductID) as ProductCount
from suppliers join products on  (suppleliers.SupplierID = products.SupplierID)
group by SupplierName
order by ProductCount desc;

select * from TopSuppliers where ProductCount>3 order by ProductCount desc;

call check_table_exists('TopSuppliers');

drop temporary table TopSuppliers;

update customers set CustomerName='Hasan Ali ÖZKAN',City ='Konya',PostalCode='42000',Country='Turkey' where CustomerID=1;

delete from customers where CustomerID = 1;

truncate table customers;
delete from customers;
drop table customers;


