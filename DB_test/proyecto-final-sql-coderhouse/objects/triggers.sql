															-- TRIGGERS
use kiosksdb;

-- 1. Creación de la tabla Cuotas de Crédito                                       
create table creditfees(
	_timeStamp timestamp default current_timestamp()
	, _idBill int not null
    , _clientDNI varchar(8) not null
    , _billDate date not null
    , _amount decimal(18, 6) not null
    , _feesValue decimal(18, 6) not null
    , _feesQuantity int not null
    , _state bool not null
    
    , primary key (_idBill)
) engine = InnoDB;   

-- Trigger 1
delimiter //
create trigger tgr_after_insert_credit_payments_bills
after insert on bills
for each row
	begin
		declare _paymentmethod tinyint;
        set _paymentmethod = new._idPaymentMethod;
        
		if _paymentmethod = 3 then
			insert into creditfees
				values
				(default, new._idBill, new._clientDNI, new._actualDate, new._amount, new._feesValue, new._feesQuantity, new._state);
		end if;
	end //
delimiter ;

-- 2. Creación de la tabla Historial de Clientes
create table clientshistory(
	_timeStamp timestamp default current_timestamp()
    , _clientDNI varchar(8)
    , _clientFullName varchar(200)
    , _clientEmail varchar(100)
    , _clientPhoneNumber varchar(30)
    
    , primary key (_timeStamp)
);

-- Trigger 2
delimiter //
create trigger tgr_after_update_clients
after update on clients
for each row
	begin
		insert into clientshistory
			values
			(default, old._clientDNI, concat(old._clientName, " ", old._clientSurname), old._clientEmail, old._clientPhoneNumber);
	end //
delimiter ;

-- 3. Creación de la tabla Historial de Empleados
create table employeeshistory(
	_timeStamp timestamp default current_timestamp()
    , _employeeDNI varchar(8) not null
    , _employeeFullName varchar(200)
    , _employeeEmail varchar (100)
    , _workedHoursPerDay int not null
    , _salaryPerHour decimal(7, 2)
    , _startDate date not null
    , _idKiosk int not null
    
    , primary key (_timeStamp)
);

-- Trigger 3
delimiter //
create trigger tgr_after_update_employees
after update on employees
for each row
	begin
		insert into employeeshistory
			values
			(default, old._employeeDNI, concat(old._employeeName, " ", old._employeeSurname), old._employeeEmail,
					old._workedHoursPerDay, old._salaryPerHour, old._startDate, old._idKiosk);
	end //
delimiter ;

-- 4. Creación de la tabla Historial de Productos
create table productshistory(
	_timeStamp timestamp default current_timestamp()
    , _idProduct int not null
    , _description varchar(100)
    , _brand varchar(100)
    , _changeType varchar(200)
    
    , primary key (_timeStamp)
);

-- Trigger 4
delimiter //
create trigger tgr_after_update_products
after update on products
for each row
	begin
		declare _changeType varchar(200);
		
		if new._description <> old._description then
			select "Ha sido cambiada la descripción del producto" into _changeType;
		elseif new._brand <> old._brand then
			select "Ha sido cambiada la marca del producto" into _changeType;
		elseif new._stockQuantity <> old._stockQuantity then
			select concat("Stock anterior: ", old._stockQuantity, ", Stock actual: ", new._stockQuantity) into _changeType;
		elseif new._purchasesPricePerUnit <> old._purchasesPricePerUnit then
			select concat("Precio de compra por unidad anterior: ", old._purchasesPricePerUnit , 
						", Precio de compra actual: ", new._purchasesPricePerUnit) into _changeType;
		elseif new._sellsPricePerUnit <> old._sellsPricePerUnit then
			select concat("Precio de venta por unidad anterior: ", old._sellsPricePerUnit , 
						", Precio de venta actual: ", new._sellsPricePerUnit) into _changeType;
		elseif new._purchasesDate <> old._purchasesDate then
			select "Se ha modificado la fecha en la que se compró el producto" into _changeType;
		end if;
		
		insert into productshistory
			values
			(default, old._idProduct, old._description, old._brand, _changeType);
	end //
delimiter ;

-- 5. Creación de la tabla Historial de Facturas
create table billshistory(
	_timeStamp timestamp default current_timestamp()
    , _idBill int not null
    , _clientDNI varchar(8) not null
    , _billDate date not null
    , _idProduct int not null
    , _productQuantity int not null
    , _amount decimal(18, 6) not null
    , _idPaymentMethod tinyint not null
    , _feesValue decimal(18, 6) not null
    , _feesQuantity int not null
    , _state bool not null
	, _idKiosk int not null
    , _changeType varchar(200)
    
    , primary key (_timeStamp)
);

-- Trigger 5
delimiter //
create trigger tgr_after_update_bills
after update on bills
for each row
	begin
		declare _changeType varchar(200);
		
		if new._clientDNI <> old._clientDNI then
			select "Ha sido cambiado el DNI del cliente" into _changeType;
		elseif new._actualDate <> old._actualDate then
			select "Ha sido cambiada la fecha en la que se realizó la venta" into _changeType;   
		elseif new._idProduct <> old._idProduct then
			select "Ha sido cambiado el producto vendido" into _changeType;
		elseif new._productQuantity <> old._productQuantity then
			select "Ha sido cambiado la cantidad comprada del producto" into _changeType;
		elseif new._amount <> old._amount then
			select concat("TOTAL original: $", old._amount , ", Nuevo TOTAL: $", new._amount) into _changeType;
		elseif new._idPaymentMethod <> old._idPaymentMethod then
			select "Se ha modificado el método de pago realizado" into _changeType;
		elseif new._feesValue <> old._feesValue then
			select "Se ha modificado el valor de las cuotas" into _changeType;
		elseif new._feesQuantity <> old._feesQuantity then
			select "Se ha modificado la cantidad de cuotas" into _changeType;
		elseif new._state <> old._state then
			select "Se ha modificado el estado de la factura" into _changeType;
		elseif new._billCategory <> old._billCategory then
			select "Se ha modificado la categoría de la factura con la que se realizó la venta" into _changeType;
		elseif new._idKiosk <> old._idKiosk then
			select "Se ha modificado el kiosko que realizó la venta" into _changeType;
		end if;
	
		insert into billshistory
			values
			(default, old._idBill, old._clientDNI, old._actualDate, old._idProduct, old._productQuantity, 
					old._amount, old._idPaymentMethod, old_feesValue, old._feesQuantity, old._state, old._idKiosk, _changeType);
	end //
delimiter ;