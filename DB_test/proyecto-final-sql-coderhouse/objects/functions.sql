															-- FUNCIONES

use kiosksdb;

-- Función 1 
/** Para la Tabla "Products" se crea la función para CALCULAR EL PRECIO DE VENTA de cada producto 
   eligiendo el porcentaje de ganancia que el vendedor desee (tomando en cuenta el precio de compra) **/
/**delimiter //
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
**/
-- Función 3 
/**
delimiter //
create function fn_calculate_billAmount (_idProduct int, _productQuantity int)
returns float
read sql data 
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
delimiter ;**/
delimiter //
CREATE FUNCTION prueba_funcion (parametro1 INT, parametro2 INT)
RETURNS INT
--read sql data 
DETERMINISTIC
BEGIN
	--declare _sellsPrice float;
	--declare _amount float;
    DECLARE _result INT;

		/**select
			_sellsPricePerUnit into _sellsPrice
		from 
			kiosksdb.products as P
		where 
			_idProduct = P._idProduct;
				
		set _amount = _productQuantity * _sellsPrice;**/
		SET _result = _parametro1 + _parametro2;
	RETURN _result;
END //
delimiter ;