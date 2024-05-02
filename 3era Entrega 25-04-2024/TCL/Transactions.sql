															-- Sentencias con TCL (Transaction Control Language)
use kiosksdb;
/** Tablas elegidas para modificar: 
1. Tabla Empleados (employees)
2. Tabla Clientes (clients)
**/
set autocommit = 0; -- Apagado y visualización del valor de la variable "autocommit"
-- show variables like 'autocommit'; -- Se queda comentada para que solo se muestre cuando se necesite revisar

															-- 1. Eliminación de registros en la 1era tabla (employees)									
start transaction;

delete 
	from kiosksdb.employees
    where _employeeEmail like '%.com';

-- rollback;
commit;
															-- Sentencias para corroborar los cambios realizados
-- select * from kiosksdb.employees;
-- select count(*) from kiosksdb.employees where _employeeDNI > 0;

/** Re insertar los datos eliminados de la Tabla Empleados (employees)
	insert into kiosksdb.employees
	(_employeeDNI, _employeeName, _employeeSurname, _employeeEmail, _employeePhoneNumber, _workedHoursPerDay, _salaryPerHour, _startDate, _idKiosk)
	values
    ("12975482", "Raviv", "Slay", "rslaya@chron.com", "703-79-8445", 3, 6745.41, '2023-11-20', 23),
	("19107706", "Hank", "Fennelly", "hfennelly7@sun.com", "498-98-5241", 9, 9189.43, '2023-10-03', 18),
	("21929173", "Danica", "Freestone", "dfreestoneo@businessinsider.com", "545-79-7894", 6, 2852.87, '2024-02-05', 3),
	("42438158", "Modesta", "Perot", "mperotn@moonfruit.com", "214-46-9163", 2, 4367.60, '2022-10-26', 17),
	("50483395", "Zaria", "Laffling", "zlaffling3@java.com", "751-32-9607", 5, 5531.91, '2023-05-20', 20),
	("50559620", "Marlow", "Murdoch", "mmurdochc@go.com", "875-75-4739", 6, 9513.30, '2023-12-13', 15),
	("53571779", "Davidde", "Kingsnorth", "dkingsnorthe@google.com", "454-94-3000", 4, 2919.73, '2023-10-11', 9),
	("60349415", "Darbie", "Adamoli", "dadamoli0@ifeng.com", "744-78-6346", 10, 5198.47, '2023-05-29', 18),
	("6806549", "Ichabod", "Volkes", "ivolkesg@wsj.com", "765-45-5542", 4, 9994.50, '2023-07-21', 24),
	("78687876", "Eydie", "Oldmeadow", "eoldmeadow5@netvibes.com", "258-43-7030", 4, 2204.35, '2023-11-16', 25),
	("82688998", "Cesar", "Butchard", "cbutchard9@yellowpages.com", "609-39-9715", 5, 5588.51, '2023-02-20', 9),
	("8379470", "Delly", "Tarbatt", "dtarbatt2@myspace.com", "105-75-5597", 7, 2913.55, '2022-05-05', 16),
	("90790075", "Thorin", "Wharf", "twharf4@imgur.com", "351-64-3540", 6, 6802.67, '2023-09-03', 17),
	("95641558", "Ronny", "McRorie", "rmcroried@jiathis.com", "587-80-3916", 1, 2290.61, '2023-06-11', 7);
**/

															-- 2. Inserción de registros en la 2da tabla (clients)
start transaction;
-- Inserción de los primeros 4 registros
insert into kiosksdb.clients(_clientDNI, _clientName, _clientSurname, _clientEmail, _clientPhoneNumber)
	values
    ("1786396", "Kenneth", "Lorimer", "klorimer0@weather.com", "472-86-2595"),
	("21632954", "Anne-corinne", "Semble", "asemble1@dedecms.com", "116-14-1810"),
	("92002580", "Kale", "McBride", "kmcbride2@upenn.edu", "744-85-1989"),
	("67893373", "Deonne", "Sacks", "dsacks3@indiegogo.com", "694-44-9181");
savepoint _savepoint_inserted_first_four_registers;

-- Inserción de los últimos 4 registros
insert into kiosksdb.clients(_clientDNI, _clientName, _clientSurname, _clientEmail, _clientPhoneNumber)
	values
	("19072049", "Jarrid", "Cuttle", "jcuttle4@topsy.com", "192-54-8853"),
	("35112957", "Bevvy", "Goom", "bgoom5@nih.gov", "638-55-2839"),
	("79547700", "Ruperta", "Durbyn", "rdurbyn6@jalbum.net", "418-22-0438"),
	("57179786", "Herve", "Grinvalds", "hgrinvalds7@thetimes.co.uk", "579-47-5729");
savepoint _savepoint_inserted_all_eight_registers;

-- release savepoint _savepoint_inserted_first_four_registers;

															-- Sentencias para corroborar los cambios realizados
-- select * from kiosksdb.clients;
-- select count(*) from kiosksdb.clients where _clientDNI > 0;