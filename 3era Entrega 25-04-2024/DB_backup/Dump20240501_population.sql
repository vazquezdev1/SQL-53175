-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: kiosksdb
-- ------------------------------------------------------
-- Server version	8.0.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `billscategories`
-- 1. Datos de la Tabla billscategories

LOCK TABLES `billscategories` WRITE;
/*!40000 ALTER TABLE `billscategories` DISABLE KEYS */;
INSERT INTO `billscategories` VALUES ('A','Responsable inscripto a Responsable inscripto/Monotributista'),('B','Responsable inscripto a Consumidor final/exento de IVA'),('C','Monotributista/Exento en IVA a cualquier destinatario');
/*!40000 ALTER TABLE `billscategories` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Dumping data for table `clients`
-- 2. Datos de la Tabla clients

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES ('16574735','Bay','Dunlea','bdunlea8@upenn.edu','813-39-8954'),('27464211','Simonette','Gritten','sgrittenh@a8.net','598-50-5676'),('29095192','Eolanda','Bilverstone','ebilverstoned@wikispaces.com','172-08-0706'),('30276021','Arlana','Gaitskill','agaitskillk@state.tx.us','155-53-5300'),('31618897','Hermann','Yellep','hyellep7@acquirethisname.com','423-30-1362'),('33772560','Zach','Hayne','zhaynei@redcross.org','425-15-3248'),('35943700','Polly','Freestone','pfreestonee@umn.edu','762-82-1523'),('38619004','Kynthia','Olivey','kolivey3@cocolog-nifty.com','731-78-0546'),('40323945','Llewellyn','Costley','lcostley9@csmonitor.com','541-54-3674'),('41919348','Sydel','Kirvin','skirvin1@state.tx.us','621-27-8856'),('46478597','Leslie','Barnewelle','lbarnewelle4@yelp.com','725-34-7744'),('46849878','Alissa','Braidon','abraidonn@umn.edu','751-57-7534'),('55285558','Berton','Tamblingson','btamblingsonf@acquirethisname.com','535-74-3819'),('66605401','Bertie','Borne','bborneb@jigsy.com','685-04-5627'),('76845598','Roman','Chaize','rchaizeo@cnet.com','502-51-9762'),('81419343','Karlee','Naile','knailej@ucsd.edu','246-93-4521'),('82053672','Jehanna','Loreit','jloreit6@t.co','366-94-0585'),('83058701','Brew','Girkin','bgirkinl@blogtalkradio.com','379-28-3543'),('87055522','Karena','Seed','kseed2@msu.edu','551-69-7790'),('93597182','Caren','Barke','cbarke5@theguardian.com','831-08-8995'),('95072853','Fletcher','Dalgarno','fdalgarnog@baidu.com','542-04-2971'),('95968876','Debor','Yearron','dyearronm@alexa.com','415-80-1977'),('969495','Seward','Pimlock','spimlock0@livejournal.com','664-89-7985'),('9919582','Sayres','Dukes','sdukesc@dyndns.org','257-04-9904'),('99327077','Simmonds','Plues','spluesa@123-reg.co.uk','871-93-3738');
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `kiosksowners`
-- 3. Datos de la Tabla kiosksowners

LOCK TABLES `kiosksowners` WRITE;
/*!40000 ALTER TABLE `kiosksowners` DISABLE KEYS */;
INSERT INTO `kiosksowners` VALUES ('11643175','Elaina','Kuhnel'),('17335786','Reggi','Bradden'),('20504215','Shanie','Teasdale-Markie'),('21629601','Corney','Gronow'),('2365231','Kendal','Spavon'),('23946150','Jule','Neicho'),('29198719','Darline','Munkley'),('30530337','Ede','Merry'),('406400','Stella','Elam'),('41268144','Gilly','Casin'),('4392837','Netty','MacAulay'),('46087755','Gerty','Bodle'),('46374615','Suki','Nurse'),('49179586','Laurens','Stower'),('64895563','Jeffy','Smitherman'),('65689274','Leeland','Kondratenko'),('69493393','Lawton','Deavall'),('71970805','Lynsey','Foxall'),('7493626','Krystalle','Ridwood'),('81401069','Roger','Muncie'),('86085397','Aubrey','Bison'),('88455543','Elbertina','Pinard'),('91421657','Rebeka','Tommei'),('93084896','Ian','Lyard'),('94806512','Angela','Pearmain');
/*!40000 ALTER TABLE `kiosksowners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `kiosks`
-- 4. Datos de la Tabla kiosks

LOCK TABLES `kiosks` WRITE;
/*!40000 ALTER TABLE `kiosks` DISABLE KEYS */;
INSERT INTO `kiosks` VALUES (1,'0788 Orin Pass','Vantage Energy Acquisition Corp.',12,'94806512'),(2,'15489 Hintze Road','Build-A-Bear Workshop, Inc.',19,'23946150'),(3,'10 Amoth Hill','Merrill Lynch & Co., Inc.',11,'11643175'),(4,'25 Tomscot Place','National General Holdings Corp',49,'4392837'),(5,'773 Swallow Plaza','Tetra Tech, Inc.',40,'64895563'),(6,'4 Brentwood Place','Host Hotels & Resorts, Inc.',10,'93084896'),(7,'28 Monterey Alley','IRSA Inversiones Y Representaciones S.A.',17,'406400'),(8,'39568 Crescent Oaks Point','Cogentix Medical, Inc.',10,'65689274'),(9,'29 Monterey Point','Oil States International, Inc.',22,'30530337'),(10,'75673 Corben Park','NXP Semiconductors N.V.',2,'21629601'),(11,'4 Dayton Road','BlueLinx Holdings Inc.',38,'86085397'),(12,'12 Nova Drive','Finjan Holdings, Inc.',34,'46374615'),(13,'9 Delladonna Court','Blackrock MuniYield Quality Fund III, Inc.',35,'46087755'),(14,'89598 Aberg Alley','Model N, Inc.',43,'81401069'),(15,'71 Oxford Place','MFS Multimarket Income Trust',39,'29198719'),(16,'0205 Starling Terrace','Apricus Biosciences, Inc.',36,'71970805'),(17,'247 Ruskin Road','Citigroup Inc.',30,'17335786'),(18,'797 Warner Plaza','Intra-Cellular Therapies Inc.',47,'20504215'),(19,'672 Northview Center','Universal Display Corporation',34,'7493626'),(20,'27 Magdeline Drive','Bank of America Corporation',23,'41268144'),(21,'60621 Gale Drive','Charles & Colvard Ltd',27,'2365231'),(22,'49 Farmco Trail','SEACOR Marine Holdings Inc.',39,'69493393'),(23,'719 Barby Park','Cintas Corporation',33,'49179586'),(24,'65544 Veith Court','Ball Corporation',13,'91421657'),(25,'3002 Kedzie Parkway','Senomyx, Inc.',12,'88455543');
/*!40000 ALTER TABLE `kiosks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `employees`
-- 5. Datos de la Tabla employees

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES ('12975482','Raviv','Slay','rslaya@chron.com','703-79-8445',3,6745.41,'2023-11-20',23),('15341204','Trina','Peterffy','tpeterffy1@tamu.edu','897-28-5788',10,4794.96,'2023-04-10',9),('1603378','Kayley','Noblet','knoblet6@github.io','429-38-6286',1,7960.07,'2023-07-26',15),('19107706','Hank','Fennelly','hfennelly7@sun.com','498-98-5241',9,9189.43,'2023-10-03',18),('21929173','Danica','Freestone','dfreestoneo@businessinsider.com','545-79-7894',6,2852.87,'2024-02-05',3),('25606542','Theodor','Kiernan','tkiernani@soup.io','213-43-9811',2,4510.27,'2024-02-04',20),('26625248','Abba','Connochie','aconnochiel@mapy.cz','608-94-3101',10,4063.01,'2024-01-06',18),('40779120','Ester','Jacson','ejacsonk@slideshare.net','685-48-9001',5,7488.70,'2022-01-05',9),('42438158','Modesta','Perot','mperotn@moonfruit.com','214-46-9163',2,4367.60,'2022-10-26',17),('44328345','Bianka','Binding','bbinding8@dyndns.org','221-01-7019',6,4827.28,'2023-12-24',12),('44568318','Diane','Renfrew','drenfrewb@altervista.org','326-56-0131',4,5142.78,'2022-10-11',13),('49872225','Thekla','Courtin','tcourtinm@desdev.cn','212-94-5138',1,2056.14,'2023-02-21',25),('50483395','Zaria','Laffling','zlaffling3@java.com','751-32-9607',5,5531.91,'2023-05-20',20),('50559620','Marlow','Murdoch','mmurdochc@go.com','875-75-4739',6,9513.30,'2023-12-13',15),('53571779','Davidde','Kingsnorth','dkingsnorthe@google.com','454-94-3000',4,2919.73,'2023-10-11',9),('60349415','Darbie','Adamoli','dadamoli0@ifeng.com','744-78-6346',10,5198.47,'2023-05-29',18),('60691819','Chester','Dewen','cdewenf@github.io','378-86-4338',7,8959.94,'2023-03-12',5),('61458821','Ly','Lownds','llowndsh@ebay.co.uk','400-14-1891',7,5591.29,'2022-11-10',13),('6806549','Ichabod','Volkes','ivolkesg@wsj.com','765-45-5542',4,9994.50,'2023-07-21',24),('68248073','Pablo','Lantuffe','plantuffej@so-net.ne.jp','174-19-8130',1,2809.89,'2022-03-31',20),('78687876','Eydie','Oldmeadow','eoldmeadow5@netvibes.com','258-43-7030',4,2204.35,'2023-11-16',25),('82688998','Cesar','Butchard','cbutchard9@yellowpages.com','609-39-9715',5,5588.51,'2023-02-20',9),('8379470','Delly','Tarbatt','dtarbatt2@myspace.com','105-75-5597',7,2913.55,'2022-05-05',16),('90790075','Thorin','Wharf','twharf4@imgur.com','351-64-3540',6,6802.67,'2023-09-03',17),('95641558','Ronny','McRorie','rmcroried@jiathis.com','587-80-3916',1,2290.61,'2023-06-11',7);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `paymentmethod`
-- 6. Datos de la Tabla paymentmethod

LOCK TABLES `paymentmethod` WRITE;
/*!40000 ALTER TABLE `paymentmethod` DISABLE KEYS */;
INSERT INTO `paymentmethod` VALUES (1,'Efectivo'),(2,'Débito'),(3,'Crédito');
/*!40000 ALTER TABLE `paymentmethod` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `products`
-- 7. Datos de la Tabla products

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Beer - Camerons Cream Ale','Brainverse',5963,15508.450000,25588.900000,'2023-09-02'),(2,'Wine - Red, Cooking','Miboo',4753,6033.470000,9955.230000,'2022-09-19'),(3,'Flavouring - Rum','Jabbertype',8668,10241.350000,16898.200000,'2022-04-18'),(4,'Beef - Flank Steak','Tagcat',18890,16005.570000,26409.200000,'2022-06-30'),(5,'Chinese Foods - Thick Noodles','Mybuzz',5540,17568.530000,28988.100000,'2023-04-09'),(6,'Pepper - Red, Finger Hot','Skynoodle',2629,15430.370000,25460.100000,'2023-08-17'),(7,'Soup - Beef Conomme, Dry','Skyvu',12019,1057.960000,1745.630000,'2023-12-10'),(8,'Veal - Inside','Ozu',13820,6760.300000,11154.500000,'2023-06-16'),(9,'Pate - Cognac','Kwilith',22961,2626.560000,4333.820000,'2023-05-21'),(10,'Arctic Char - Fresh, Whole','Izio',1475,5080.650000,8383.070000,'2022-06-23'),(11,'Cookie - Oatmeal','Photobug',10903,9367.670000,15456.700000,'2022-04-21'),(12,'Beer - Corona','Photobug',16650,9204.290000,15187.100000,'2022-02-16'),(13,'Cheese - Brick With Pepper','Leexo',8617,14693.210000,24243.800000,'2022-11-29'),(14,'Beans - Navy, Dry','Thoughtsphere',13414,3858.130000,6365.910000,'2022-12-05'),(15,'Milk - Skim','Kazio',14377,17567.690000,28986.700000,'2022-02-19'),(16,'Cassis','Abatz',9521,4163.680000,6870.070000,'2022-02-20'),(17,'Cake - French Pear Tart','Rhycero',2488,5818.020000,9599.730000,'2023-03-06'),(18,'Pork - Inside','Babbleopia',3248,15877.400000,26197.700000,'2022-05-02'),(19,'Prunes - Pitted','Blogpad',2019,19083.720000,31488.100000,'2023-10-01'),(20,'Lobster - Live','Jaloo',18424,11068.270000,18262.600000,'2023-04-08'),(21,'Wine - White, Pelee Island','Topdrive',23313,9510.450000,15692.200000,'2022-08-19'),(22,'Pancetta','Realmix',4139,4326.960000,7139.480000,'2023-05-06'),(23,'Cheese - Blue','Latz',1328,5796.540000,9564.290000,'2022-12-09'),(24,'Worcestershire Sauce','Skiba',22639,18938.390000,31248.300000,'2022-01-31'),(25,'Yokaline','Vinte',9436,19730.230000,32554.900000,'2023-10-20');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `bills`
-- 8. Datos de la Tabla bills

LOCK TABLES `bills` WRITE;
/*!40000 ALTER TABLE `bills` DISABLE KEYS */;
INSERT INTO `bills` VALUES (1,'66605401','2022-06-17',21,4369,68559222.653320,3,17139805.663330,4,0,'C',6),(2,'41919348','2022-04-01',3,441,7452105.855469,3,1863026.463867,4,0,'C',6),(3,'31618897','2022-05-10',24,634,19811422.695313,2,0.000000,0,0,'B',19),(4,'9919582','2024-02-05',16,2789,19160624.739746,3,2395078.092468,8,0,'C',12),(5,'55285558','2023-09-27',5,4089,118532339.302734,2,0.000000,0,0,'C',22),(6,'16574735','2023-11-13',20,3871,70694523.087891,1,0.000000,0,0,'A',8),(7,'46478597','2022-04-14',8,2147,23948711.500000,2,0.000000,0,1,'C',9),(8,'35943700','2024-02-21',21,275,4315355.053711,3,719225.842285,6,1,'A',18),(9,'33772560','2023-11-27',17,822,7890978.445313,2,0.000000,0,1,'C',17),(10,'38619004','2022-10-19',11,2184,33757433.226563,3,3750825.914063,9,1,'B',13),(11,'82053672','2022-01-25',13,4756,115303516.515625,2,0.000000,0,0,'C',11),(12,'81419343','2023-04-27',19,4390,138232757.285156,2,0.000000,0,0,'C',14),(13,'95072853','2024-02-23',10,1119,9380655.679688,3,1172581.959961,8,0,'B',19),(14,'83058701','2023-09-24',18,2249,58918625.542969,3,11783725.108594,5,1,'B',7),(15,'40323945','2023-05-13',18,4286,112283338.851563,3,9356944.904297,12,0,'B',8),(16,'46849878','2023-05-26',13,1509,36583895.378906,3,36583895.378906,1,0,'C',8),(17,'76845598','2022-03-06',6,2397,61027858.763672,2,0.000000,0,0,'C',14),(18,'99327077','2022-12-26',2,4469,44489924.964844,3,0.000000,0,1,'C',23),(19,'27464211','2023-01-18',8,4314,48120513.000000,2,0.000000,0,0,'A',1),(20,'969495','2022-02-06',5,4393,127344721.583984,1,0.000000,0,0,'B',12),(21,'95968876','2022-02-12',12,852,12939408.867188,1,0.000000,0,1,'C',12),(22,'29095192','2022-04-12',13,4002,97023690.726563,2,0.000000,0,0,'A',16),(23,'30276021','2022-08-11',15,3304,95772054.218750,3,31924018.072917,3,1,'B',24),(24,'93597182','2022-08-09',24,1530,47809900.195313,1,0.000000,0,0,'A',4),(25,'87055522','2023-08-08',12,3015,45789105.322266,2,0.000000,0,0,'A',3);
/*!40000 ALTER TABLE `bills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `creditfees`
-- 9. Datos de la Tabla creditfees

-- Se dejan comentado esta inserción de datos ya que el trigger "tgr_after_insert_credit_payments_bills" ya genera estos datos con al insertar los datos de la tabla "bills" por lon que se repiten al tratar de ingresarlos de esta manera
LOCK TABLES `creditfees` WRITE;
/*!40000 ALTER TABLE `creditfees` DISABLE KEYS */;
-- INSERT INTO `creditfees` VALUES ('2024-05-02 08:27:59',1,'66605401','2022-06-17',68559222.653320,17139805.663330,4,0),('2024-05-02 08:27:59',2,'41919348','2022-04-01',7452105.855469,1863026.463867,4,0),('2024-05-02 08:27:59',4,'9919582','2024-02-05',19160624.739746,2395078.092468,8,0),('2024-05-02 08:27:59',8,'35943700','2024-02-21',4315355.053711,719225.842285,6,1),('2024-05-02 08:27:59',10,'38619004','2022-10-19',33757433.226563,3750825.914063,9,1),('2024-05-02 08:27:59',13,'95072853','2024-02-23',9380655.679688,1172581.959961,8,0),('2024-05-02 08:27:59',14,'83058701','2023-09-24',58918625.542969,11783725.108594,5,1),('2024-05-02 08:27:59',15,'40323945','2023-05-13',112283338.851563,9356944.904297,12,0),('2024-05-02 08:27:59',16,'46849878','2023-05-26',36583895.378906,36583895.378906,1,0),('2024-05-02 08:27:59',18,'99327077','2022-12-26',44489924.964844,0.000000,0,1),('2024-05-02 08:27:59',23,'30276021','2022-08-11',95772054.218750,31924018.072917,3,1);
/*!40000 ALTER TABLE `creditfees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `clientshistory`
-- 10. Datos de la Tabla clientshistory

LOCK TABLES `clientshistory` WRITE;
/*!40000 ALTER TABLE `clientshistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `clientshistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `employeeshistory`
-- 11. Datos de la Tabla employeeshistory

LOCK TABLES `employeeshistory` WRITE;
/*!40000 ALTER TABLE `employeeshistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `employeeshistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `productshistory`
-- 12. Datos de la Tabla productshistory

LOCK TABLES `productshistory` WRITE;
/*!40000 ALTER TABLE `productshistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `productshistory` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

--
-- Dumping data for table `billshistory`
-- 13. Datos de la Tabla billshistory

LOCK TABLES `billshistory` WRITE;
/*!40000 ALTER TABLE `billshistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `billshistory` ENABLE KEYS */;
UNLOCK TABLES;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-02  5:30:08
