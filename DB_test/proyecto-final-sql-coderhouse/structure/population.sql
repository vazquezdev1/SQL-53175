															-- Inserción de datos

use kiosksdb;
set global local_infile = true;

-- Inserción de datos para la tabla billscategories
insert into kiosksdb.billscategories (_billCategory, _categoryDescription)
	values
    ("A", "Responsable inscripto a Responsable inscripto/Monotributista"),
    ("B", "Responsable inscripto a Consumidor final/exento de IVA"),
    ("C", "Monotributista/Exento en IVA a cualquier destinatario");

-- Datos de la tabla clients
load data local infile '/3era Entrega 25-04-2024/data_csv/2. clients_data.csv'
into table clients
fields terminated by ','
optionally enclosed by '"'
lines terminated by '\r\n'
ignore 1 rows
-- COLUMNAS QUE QUIERO INGESTAR
(_clientDNI,_clientName,_clientSurname,_clientEmail,_clientPhoneNumber);

-- Datos de la tabla kiosksowners
load data local infile '/3era Entrega 25-04-2024/data_csv/3. kiosks_owners_data.csv'
into table kiosksowners
fields terminated by ','
lines terminated by '\r\n'
ignore 1 rows
-- COLUMNAS QUE QUIERO INGESTAR
(_ownerDNI,_ownerName,_ownerSurname);

-- Datos de la tabla kiosks
load data local infile '/3era Entrega 25-04-2024/data_csv/4. kiosks_data.csv'
into table kiosks
fields terminated by ','
optionally enclosed by '"'
lines terminated by '\r\n'
ignore 1 rows
-- COLUMNAS QUE QUIERO INGESTAR
(_address,_kioskName,_employeesQuantity,_ownerDNI);

-- Datos de la tabla employees
load data local infile '/3era Entrega 25-04-2024/data_csv/5. employees_data.csv'
into table employees
fields terminated by ','
optionally enclosed by '"'
lines terminated by '\r\n'
ignore 1 rows
-- COLUMNAS QUE QUIERO INGESTAR
(_employeeDNI,_employeeName,_employeeSurname,_employeeEmail,_employeePhoneNumber,_workedHoursPerDay,_salaryPerHour,_startDate,_idKiosk);

-- Inserción de datos para la tabla paymentmethod
insert into kiosksdb.paymentmethod (_idPaymentMethod, _description)
	values
    (1, "Efectivo"),
    (2, "Débito"),
    (3, "Crédito");

-- Datos de la tabla products
load data local infile '/3era Entrega 25-04-2024/data_csv/7. products_data.csv'
into table products
fields terminated by ','
optionally enclosed by '"'
lines terminated by '\r\n'
ignore 1 rows
-- COLUMNAS QUE QUIERO INGESTAR
(_description,_brand,_stockQuantity,_purchasesPricePerUnit,_sellsPricePerUnit,_purchasesDate);

-- Datos de la tabla bills
load data local infile '/3era Entrega 25-04-2024/data_csv/8. bills_data.csv'
into table bills
fields terminated by ','
optionally enclosed by '"'
lines terminated by '\r\n'
ignore 1 rows
-- COLUMNAS QUE QUIERO INGESTAR
(_clientDNI,_actualDate,_idProduct,_productQuantity,_amount,_idPaymentMethod,_feesValue,_feesQuantity,_state,_billCategory,_idKiosk);