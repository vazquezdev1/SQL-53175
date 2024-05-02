drop database if exists kiosksdb;

-- Creación y selección de la Base de Datos
create database kiosksdb;
use kiosksdb;
															-- Creación de Tablas Dimensionales
-- Tabla "Categorías de Factura"
create table billscategories(
	_billCategory varchar(1) not null
    , _categoryDescription varchar(100) not null
    
    , primary key (_billCategory)
) engine = InnoDB;

-- Tabla "Clientes"
create table clients(
	_clientDNI varchar(8) not null
    , _clientName varchar(100)
    , _clientSurname varchar(100)
    , _clientEmail varchar(100)
    , _clientPhoneNumber varchar(30)
    
    , primary key (_clientDNI)
) engine = InnoDB;

-- Tabla  "Dueños de los Kioscos"  
create table kiosksowners(
	_ownerDNI varchar(8) not null
    , _ownerName varchar(100)
    , _ownerSurname varchar(100)
    
    , primary key (_ownerDNI)
) engine = InnoDB;

-- Tabla "Kioscos"
create table kiosks(
	_idKiosk int not null auto_increment
    , _address varchar(100)
    , _kioskName varchar(100)
    , _employeesQuantity int not null default 1
    , _ownerDNI varchar(8) -- (Va a ser una Foreign Key)
	
    , primary key (_idKiosk)
) auto_increment = 1, engine = InnoDB;

-- Alteración de tabla "Kiosks" para que incorpore como Foreign Key al campo de "_OwnerDNI" de la tabla "KiosksOwners"
alter table kiosks
    add constraint fk_ownerDNI_tableKiosksOwners
    foreign key (_ownerDNI) references kiosksowners(_ownerDNI)
    on update cascade 
    on delete restrict
;

-- Tabla "Empleados"                                            
create table employees(
	_employeeDNI varchar(8) not null
    , _employeeName varchar(100)
    , _employeeSurname varchar(100)
	, _employeeEmail varchar(100)
    , _employeePhoneNumber varchar(30)
    , _workedHoursPerDay int not null
    , _salaryPerHour decimal(7, 2) not null
    , _startDate date not null
    , _idKiosk int not null -- (Va a ser una Foreign Key)
    
    , primary key (_employeeDNI)
) engine = InnoDB;

-- Alteración de tabla "Employees" para que incorpore como Foreign Key al campo de "_idKiosk" de la tabla "Kiosks"
alter table employees
    add constraint fk_idKiosk_tableEmployees
    foreign key (_idKiosk) references kiosks(_idKiosk)
    on update cascade 
    on delete restrict
;

-- Tabla "Métodos de Pago"
create table paymentmethod(
	_idPaymentMethod tinyint not null -- 1 = Efectivo 2 = Débito 3 = Crédito
    , _description varchar(100)
    
    , primary key(_idPaymentMethod)
) engine = InnoDB;

-- Tabla "Productos"
create table products(
	_idProduct int not null auto_increment
    , _description varchar(100)
    , _brand varchar(100)
    , _stockQuantity int default 0
    , _purchasesPricePerUnit decimal(15, 6) default 0
    , _sellsPricePerUnit decimal(18, 6) default 0
    , _purchasesDate date default null
    
    , primary key (_idProduct)
) auto_increment = 1,  engine = InnoDB;

															-- Creación de Tabla de Hechos Principal
-- Tabla "Facturas"                                         
create table bills(
	_idBill int not null auto_increment
    , _clientDNI varchar(8) not null -- (Va a ser una Foreign Key)
    , _actualDate date not null
    , _idProduct int not null -- (Va a ser una Foreign Key)
    , _productQuantity int not null default 0
    , _amount decimal(18, 6) not null default 0
    , _idPaymentMethod tinyint not null -- (Va a ser una Foreign Key)
    , _feesValue decimal(18, 6) default 0
    , _feesQuantity int default 0
    , _state bool not null default true
    , _billCategory varchar(1) not null -- (Va a ser una Foreign Key)
    , _idKiosk int not null -- (Va a ser una Foreign Key)
	
    , primary key (_idBill)
) auto_increment = 1, engine = InnoDB;

/** Alteración de tabla "Bills" para que incorpore como Foreign Key a los siguientes campos:
	"_clientDNI" de la tabla "Clients"
	"_idProduct" de la tabla "Products"
	"_idPaymentMethod" de la tabla "PaymentMethod"
    "_billCategory" de la tabla "BillsCategories"
	"_idKiosks" de la tabla "Kiosks"
**/
alter table bills
	add constraint fk_clientDNI_tableClients
    foreign key (_clientDNI) references clients(_clientDNI)
    on update cascade
    on delete restrict,
    
    add constraint fk_idProduct_tableProducts
    foreign key (_idProduct) references products(_idProduct)
    on update cascade
    on delete restrict,
    
    add constraint fk_idPaymentMethod_tablePaymentMethod
    foreign key (_idPaymentMethod) references paymentmethod(_idPaymentMethod)
    on update cascade
    on delete restrict,
    
    add constraint fk_billCategory_tableBillsCategories
    foreign key (_billCategory) references billscategories(_billCategory)
    on update cascade
    on delete restrict,
    
    add constraint fk_idKiosk_tableKiosks
    foreign key (_idKiosk) references kiosks(_idKiosk)
    on update cascade
    on delete restrict
;