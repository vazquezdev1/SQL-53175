															-- STORED PROCEDURES

use kiosksdb;

-- Stored Procedure 1
delimiter //
create procedure `sp_calculate_most_selled_product`() 
begin
		select 
			B._idProduct,
			P._description,
			P._brand,
			count(B._idProduct) as Times_Purchased
		from 
			kiosksdb.bills as B
		inner join
			kiosksdb.products as P
			on B._idProduct = P._idProduct
		group by B._idProduct
		order by Times_Purchased desc
		limit 1;
end //
delimiter ;

-- Stored Procedure 2
delimiter //
create procedure `sp_calculate_employee_seniority_in_years`(in _employeeDNI int, out seniority int) 
begin
		select 
			concat(timestampdiff(year, E._startDate, current_date()), " years")
		from 
			kiosksdb.employees as E
		where
			E._employeeDNI = _employeeDNI;
end //
delimiter ;