drop database if exists KiosksDB;

-- Creación y selección de la Base de Datos
create database KiosksDB;
use KiosksDB;
											-- Creación de Tablas Dimensionales
-- Tabla "Categorías de Factura"
create table BillsCategories(
	_billCategory varchar(1) not null
    , _categoryDescription varchar(100) not null
    
    , primary key (_billCategory)
) engine = InnoDB;

-- Inserción de datos para la Tabla "Categorías de Factura"
insert into kiosksdb.billscategories (_billCategory, _categoryDescription)
	values
    ("A", "Responsable inscripto a Responsable inscripto/Monotributista"),
    ("B", "Responsable inscripto a Consumidor final/exento de IVA"),
    ("C", "Monotributista/Exento en IVA a cualquier destinatario");

-- Tabla "Clientes"
create table Clients(
	_clientDNI varchar(8) not null
    , _clientName varchar(100)
    , _clientSurname varchar(100)
    , _clientEmail varchar(100)
    , _clientPhoneNumber varchar(30)
    
    , primary key (_clientDNI)
) engine = InnoDB;

-- Tabla "Empleados"                                            
create table Employees(
	_employeeDNI varchar(8) not null
    , _employeeName varchar(100)
    , _employeeSurname varchar(100)
	, _employeeEmail varchar(100)
    , _employeePhoneNumber varchar(30)
    , _workedHoursPerWeek int not null default 4
    , _salaryPerHour float
    , _startDate date not null
    
    , primary key (_employeeDNI)
) engine = InnoDB;

-- Tabla  "Dueños de los Kioscos"  
create table KiosksOwners(
	_ownerDNI varchar(8) not null
    , _ownerName varchar(100)
    , _ownerSurname varchar(100)
    
    , primary key (_ownerDNI)
) engine = InnoDB;

-- Tabla "Kioscos"
create table Kiosks(
	_idKiosk int not null auto_increment
    , _address varchar(100)
    , _kioskName varchar(100)
    , _employeesQuantity int not null default 1
    , _ownerDNI varchar(8) -- (Va a ser una Foreign Key)
	
    , primary key (_idKiosk)
) auto_increment = 1, engine = InnoDB;

-- Alteración de tabla "Kiosks" para que incorpore como Foreign Key al campo de "_OwnerDNI" de la tabla "KiosksOwners"
alter table Kiosks
    add constraint _fk_OwnerDNI_tableKiosksOwners
    foreign key (_ownerDNI) references KiosksOwners(_ownerDNI)
    on update cascade 
    on delete restrict
;

-- Tabla "Métodos de Pago"
create table PaymentMethod(
	_idPaymentMethod tinyint not null -- 1 = Efectivo 2 = Débito 3 = Crédito
    , _description varchar(100)
    , _feesValue float default 0
    , _feesQuantity int default 0
    
    , primary key(_idPaymentMethod)
) engine = InnoDB;

-- Inserción de datos para la Tabla "Métodos de Pago"
insert into kiosksdb.paymentmethod (_idPaymentMethod, _description)
	values
    (1, "Efectivo"),
    (2, "Débito"),
    (3, "Crédito");

-- Tabla "Productos"
create table Products(
	_idProduct int not null auto_increment
    , _description varchar(100)
    , _brand varchar(100)
    , _stockQuantity int default 0
    , _purchasesPricePerUnit float default 0
    , _sellsPricePerUnit float default 0
    , _purchaseDate date default null
    
    , primary key (_idProduct)
) auto_increment = 1,  engine = InnoDB;

											-- Creación de Tabla de Hechos Principal
-- Tabla "Facturas"                                         
create table Bills(
	_idBill int not null auto_increment
    , _clientDNI varchar(8) not null -- (Va a ser una Foreign Key)
    , _actualDate date not null
    , _idProduct int not null -- (Va a ser una Foreign Key)
    , _productQuantity int not null default 0
    , _amount float not null default 0
    , _idPaymentMethod tinyint not null -- (Va a ser una Foreign Key)
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
alter table Bills
	add constraint _fk_clientDNI_tableClients
    foreign key (_clientDNI) references Clients(_clientDNI)
    on update cascade
    on delete restrict,
    
    add constraint _fk_idProduct_tableProducts
    foreign key (_idProduct)
    references Products(_idProduct)
    on update cascade
    on delete restrict,
    
    add constraint _fk_idPaymentMethod_tablePaymentMethod
    foreign key (_idPaymentMethod)
    references PaymentMethod(_idPaymentMethod)
    on update cascade
    on delete restrict,
    
    add constraint _fk_billCategory_tableBillsCategories
    foreign key (_billCategory)
    references BillsCategories(_billCategory)
    on update cascade
    on delete restrict,
    
    add constraint _fk_idKiosk_tableKiosks
    foreign key (_idKiosk)
    references Kiosks(_idKiosk)
    on update cascade
    on delete restrict
;