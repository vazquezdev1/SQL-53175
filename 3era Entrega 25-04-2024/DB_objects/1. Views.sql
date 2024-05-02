															-- VIEWS

use kiosksdb;

-- View 1
create or replace view vw_full_information_bill AS
select
		B._idBill as "ID Bill",
        B._clientDNI as "Client DNI",
        C._clientName as "Client Name",
        C._clientSurname as "Client Surname",
        B._actualDate as "Actual Date",
        B._idProduct as "ID Product",
        P._description as "Product Description",
        P._brand as "Product Brand",
        B._productQuantity as "Quantity Purchase",
        B._amount as "Bill Amount",
        B._idPaymentMethod as "ID Payment Method",
        PM._description as "Payment Description",
        B._billCategory as "Bill Category",
        BC._categoryDescription as "Bill Category Description",
        K._address as "KIosk Address"
  from 
	kiosksdb.bills as B
  inner join -- con la Tabla "Clients"
	kiosksdb.clients as C
	on B._clientDNI = C._clientDNI
  inner join -- con la Tabla "Products"
	kiosksdb.products as P
	on B._idProduct = P._idProduct
  inner join -- con la Tabla "Payment Method"
	kiosksdb.paymentmethod as PM
	on B._idPaymentMethod = PM._idPaymentMethod
  inner join -- con la Tabla "Bills Categories"
	kiosksdb.billscategories as BC
	on B._billCategory = BC._billCategory
  inner join -- con la Tabla "Kiosks"
	kiosksdb.kiosks as K
	on B._idKiosk = K._idKiosk;

-- View 2
create or replace view vw_full_information_kiosks AS
select 
	K.*,
    KO._ownerName,
    KO._ownerSurname
from 
	kiosksdb.kiosksowners as KO
inner join 
	kiosksdb.kiosks as K
    on KO._ownerDNI = K._ownerDNI;

-- View 3
create or replace view vw_employees_under_average_salary AS
select
	E._employeeDNI,
    concat(E._employeeName, " ", E._employeeSurname) as "Full Name",
    E._employeeEmail,
    E._salaryPerHour,
    (select 
		avg(_salaryPerHour)
	 from 
		kiosksdb.employees) as average_SalaryPerHour
from 
	kiosksdb.employees as E
where E._salaryPerHour < (select 
								avg(_salaryPerHour) 
                          from 
								kiosksdb.employees);

-- View 4
create or replace view vw_products_upon_average_purchases_price AS
select 
	*,
    (select 
		avg(_purchasesPricePerUnit)
	from
		kiosksdb.products) as average_PricePerUnit
from
	kiosksdb.products as P
where true
and P._purchasesPricePerUnit < (select 
									avg(_purchasesPricePerUnit)
								from
									kiosksdb.products);