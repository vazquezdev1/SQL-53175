drop database if exists KioscosDB;

-- Creación y utlización de la Base de Datos
create database KioscosDB;
use KioscosDB;

-- Creación de tablas dimensionales
create table Clients(
	_clientDNI varchar(8)
    , _clientName varchar(100)
    , _clientSurname varchar(100)
    
    , primary key (_clientDNI)
) engine=InnoDB;

create table Products(
	_idProduct int not null auto_increment
    , _description varchar(100)
    , _brand varchar(100)
    , _stockQuantity int default '0'
    , _purchasesPrice float default '0'
    , _sellsPrice float default '0'
    
    , primary key (_idProduct)
) engine=InnoDB;

create table PaymentMethod(
	_idPaymentMethod tinyint -- 1 = Efectivo 2 = Débito 3 = Crédito
    , _description varchar(100)
    , _feesValue float default '0'
    , _feesQuantity int default '0'
    
    , primary key(_idPaymentMethod)
) engine=InnoDB;

create table Kiosks(
	_idKiosks int not null auto_increment
    , _address varchar(100)
	
    , primary key (_idKiosks)
) engine=InnoDB;

create table Bills(
	_idBill int not null auto_increment
    , _clientDNI varchar(8) -- (Va a ser una Foreign Key)
    , _actualDate date not null
    , _idProduct int -- (Va a ser una Foreign Key)
    , _productQuantity int not null default '0'
    , _amount float not null
    , _idPaymentMethod tinyint -- (Va a ser una Foreign Key)
    , _state bool not null default true
    , _idKiosks int -- (Va a ser una Foreign Key)
	
    , primary key (_idBill)
) engine=InnoDB;

/** Alteración de tabla "Bills" para que incorpore como Foreign Key a los siguientes campos:
	"_clientDNI" de la tabla "Clients"
	"_idProduct" de la tabla "Products"
	"_idPaymentMethod" de la tabla "PaymentMethod"
	"_idKiosks" de la tabla "Kiosks"
**/

alter table Bills
	add constraint _clientDNI_tableClients
    foreign key (_clientDNI)
    references Clients(_clientDNI),
    
    add constraint _idProduct_tableProducts
    foreign key (_idProduct)
    references Products(_idProduct),
    
    add constraint _idPaymentMethod_tablePaymentMethod
    foreign key (_idPaymentMethod)
    references PaymentMethod(_idPaymentMethod),
    
    add constraint _idKiosks_tableKiosks
    foreign key (_idKiosks)
    references Kiosks(_idKiosks)
;