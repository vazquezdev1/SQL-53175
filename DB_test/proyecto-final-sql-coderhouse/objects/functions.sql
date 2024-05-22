															-- FUNCIONES

use kiosksdb;

-- Función 1 
delimiter //
create function `fn_calculate_sellsPricePerUnit` (_purchasesPricePerUnit float, _added_percentage float) 
	returns float 
    deterministic
    begin
		declare _sellsPricePerUnit float;
		set _added_percentage = (_added_percentage / 100) + 1; -- Se dividió el valor de la variable para hacer más fácil el cálculo del precio de venta posteriormente
        set _sellsPricePerUnit = _purchasesPricePerUnit * _added_percentage;
    return _sellsPricePerUnit;
    end //
delimiter ;

-- Función 2
delimiter //
create function `fn_calculate_salaryPerDay` (_salaryPerHour float, _workedHoursPerDay int, _xDays int) 
	returns float 
    no sql
    begin
		declare _salaryPerXDays float;
        set _salaryPerXDays = (_salaryPerHour * _workedHoursPerDay) * _xDays; -- Al final multiplicamos la cantidad de horas trabajadas en un día por la cantidad de días ingresada
		return _salaryPerXDays;
    end //
delimiter ;

-- Función 3 
delimiter //
create function `fn_calculate_billAmount` (_idProduct int, _productQuantity int)
returns float
reads sql data 
begin
	declare _sellsPrice float;
	declare _amount float;
        
		select
			_sellsPricePerUnit into _sellsPrice
		from 
			kiosksdb.products as P
		where 
			_idProduct = P._idProduct;
				
		set _amount = _productQuantity * _sellsPrice;
	return _amount;
end //
delimiter ;