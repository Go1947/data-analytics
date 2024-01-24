use assingment;
CREATE TABLE regions (
	region_id INT (11) UNSIGNED NOT NULL,
	region_name VARCHAR(25),
	PRIMARY KEY (region_id)
	);
CREATE TABLE countries (
	country_id CHAR(2) NOT NULL,
	country_name VARCHAR(40),
	region_id INT UNSIGNED NOT NULL,
	PRIMARY KEY (country_id)
);
 CREATE TABLE locations (
	location_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
	street_address VARCHAR(40),
	postal_code VARCHAR(12),
	city VARCHAR(30) NOT NULL,
	state_province VARCHAR(25),
	country_id CHAR(2) NOT NULL,
	PRIMARY KEY (location_id)
	);
CREATE TABLE departments (
	department_id INT UNSIGNED NOT NULL,
	department_name VARCHAR(30) NOT NULL,
	manager_id INT UNSIGNED,
	location_id INT UNSIGNED,
	PRIMARY KEY (department_id)
	);
CREATE TABLE jobs (
	job_id VARCHAR(10) NOT NULL,
	job_title VARCHAR(35) NOT NULL,
	min_salary DECIMAL(8, 0) UNSIGNED,
	max_salary DECIMAL(8, 0) UNSIGNED,
	PRIMARY KEY (job_id)
	);    
CREATE TABLE employees (
	employee_id INT UNSIGNED NOT NULL,
	first_name VARCHAR(20),
	last_name VARCHAR(25) NOT NULL,
	email VARCHAR(25) NOT NULL,
	phone_number VARCHAR(20),
	hire_date DATE NOT NULL,
	job_id VARCHAR(10) NOT NULL,
	salary DECIMAL(8, 2) NOT NULL,
	commission_pct DECIMAL(2, 2),
	manager_id INT UNSIGNED,
	department_id INT UNSIGNED,
	PRIMARY KEY (employee_id)
	);
CREATE TABLE job_history (
	employee_id INT UNSIGNED NOT NULL,
	start_date DATE NOT NULL,
	end_date DATE NOT NULL,
	job_id VARCHAR(10) NOT NULL,
	department_id INT UNSIGNED NOT NULL
	);
ALTER TABLE job_history ADD UNIQUE INDEX (
	employee_id,
	start_date
	);
INSERT INTO regions
VALUES (1,'Europe'),(2,'Americas'),(3,'Asia'),(4,'Middle East and Africa');
INSERT INTO countries
VALUES ('IT','Italy',1),('JP','Japan',3),('US','United States of America',2),('CA','Canada',2),('CN','China',3),('IN','India',3),('AU','Australia',3),('ZW','Zimbabwe',4),('SG','Singapore',3),('UK','United Kingdom',1),('FR','France',1),('DE','Germany',1),('ZM','Zambia',4),('EG','Egypt',4),('BR','Brazil',2),('CH','Switzerland',1),('NL','Netherlands',1),('MX','Mexico',2),('KW','Kuwait',4),('IL','Israel',4),('DK','Denmark',1),('HK','HongKong',3),('NG','Nigeria',4),('AR','Argentina',2),('BE','Belgium',1);
INSERT INTO departments
VALUES (10,'Administration',200,1700),(20,'Marketing',201,1800),(30,'Purchasing',114,1700),(40,'Human Resources',203,2400),(50,'Shipping',121,1500),(60,'IT',103,1400),(70,'Public Relations',204,2700),(80,'Sales',145,2500),(90,'Executive',100,1700),(100,'Finance',108,1700),(110,'Accounting',205,1700),(120,'Treasury',NULL,1700),(130,'Corporate Tax',NULL,1700),(140,'Control And Credit',NULL,1700),(150,'Shareholder Services',NULL,1700),(160,'Benefits',NULL,1700),(170,'Manufacturing',NULL,1700),(180,'Construction',NULL,1700),(190,'Contracting',NULL,1700),(200,'Operations',NULL,1700),(210,'IT Support',NULL,1700),(220,'NOC',NULL,1700),(230,'IT Helpdesk',NULL,1700),(240,'Government Sales',NULL,1700),(250,'Retail Sales',NULL,1700),(260,'Recruiting',NULL,1700),(270,'Payroll',NULL,1700);
INSERT INTO jobs
VALUES ('AD_PRES','President',20000,40000),('AD_VP','Administration Vice President',15000,30000),('AD_ASST','Administration Assistant',3000,6000),('FI_MGR','Finance Manager',8200,16000),('FI_ACCOUNT','Accountant',4200,9000),('AC_MGR','Accounting Manager',8200,16000),('AC_ACCOUNT','Public Accountant',4200,9000),('SA_MAN','Sales Manager',10000,20000),('SA_REP','Sales Representative',6000,12000),('PU_MAN','Purchasing Manager',8000,15000),('PU_CLERK','Purchasing Clerk',2500,5500),('ST_MAN','Stock Manager',5500,8500),('ST_CLERK','Stock Clerk',2000,5000),('SH_CLERK','Shipping Clerk',2500,5500),('IT_PROG','Programmer',4000,10000),('MK_MAN','Marketing Manager',9000,15000),('MK_REP','Marketing Representative',4000,9000),('HR_REP','Human Resources Representative',4000,9000),('PR_REP','Public Relations Representative',4500,10500);
INSERT INTO locations
VALUES (1000,'1297 Via Cola di Rie','00989','Roma',NULL,'IT'),(1100,'93091 Calle della Testa','10934','Venice',NULL,'IT'),(1200,'2017 Shinjuku-ku','1689','Tokyo','Tokyo Prefecture','JP'),(1300,'9450 Kamiya-cho','6823','Hiroshima',NULL,'JP'),(1400,'2014 Jabberwocky Rd','26192','Southlake','Texas','US'),(1500,'2011 Interiors Blvd','99236','South San Francisco','California','US'),(1600,'2007 Zagora St','50090','South Brunswick','New Jersey','US'),(1700,'2004 Charade Rd','98199','Seattle','Washington','US'),(1800,'147 Spadina Ave','M5V 2L7','Toronto','Ontario','CA'),(1900,'6092 Boxwood St','YSW 9T2','Whitehorse','Yukon','CA'),(2000,'40-5-12 Laogianggen','190518','Beijing',NULL,'CN'),(2100,'1298 Vileparle (E)','490231','Bombay','Maharashtra','IN'),(2200,'12-98 Victoria Street','2901','Sydney','New South Wales','AU'),(2300,'198 Clementi North','540198','Singapore',NULL,'SG'),(2500,'Magdalen Centre The Oxford Science Park','OX9 9ZB','Oxford', 'Oxford','UK'),(2600,'9702 Chester Road','09629850293','Stretford','Manchester','UK'),(2700,'Schwanthalerstr. 7031','80925','Munich','Bavaria','DE');
use adventureworks;
INSERT INTO job_history
VALUES (102,STR_TO_DATE('13-Jan-1993', '%d-%M-%Y'),STR_TO_DATE('24-Jul-1998', '%d-%M-%Y'),'IT_PROG',60),(101,STR_TO_DATE('21-Sep-1989', '%d-%M-%Y'),STR_TO_DATE('27-Oct-1993', '%d-%M-%Y'),'AC_ACCOUNT',110),(101,STR_TO_DATE('28-Oct-1993','%d-%M-%Y'),STR_TO_DATE('15-Mar-1997','%d-%M-%Y'),'AC_MGR',110),(201,STR_TO_DATE('27-Feb-1996','%d-%M-%Y'),STR_TO_DATE('19-Dec-1999','%d-%M-%Y'),'MK_REP',20),(114,STR_TO_DATE('24-Mar-1998','%d-%M-%Y'),STR_TO_DATE('31-Dec-1999','%d-%M-%Y'),'ST_CLERK',50),(122,STR_TO_DATE('01-Jan-1999','%d-%M-%Y'),STR_TO_DATE('31-Dec-1999','%d-%M-%Y'),'ST_CLERK',50),(200,STR_TO_DATE('17-Sep-1987','%d-%M-%Y'),STR_TO_DATE('17-Jun-1993','%d-%M-%Y'),'AD_ASST',90),(176,STR_TO_DATE('24-Mar-1998','%d-%M-%Y'),STR_TO_DATE('31-Dec-1998','%d-%M-%Y'),'SA_REP',80),(176,STR_TO_DATE('01-Jan-1999','%d-%M-%Y'),STR_TO_DATE('31-Dec-1999','%d-%M-%Y'),'SA_MAN',80),(200,STR_TO_DATE('01-Jul-1994','%d-%M-%Y'),STR_TO_DATE('31-Dec-1998','%d-%M-%Y'),'AC_ACCOUNT',90);
INSERT INTO employees
VALUES (101,'Neena','Kochhar','NKOCHHAR','515.123.4568',STR_TO_DATE('21-SEP-1989', '%d-%M-%Y'),'AD_VP',17000,NULL,100,90);
INSERT INTO employees
VALUES(102,'Lex','De Haan','LDEHAAN','515.123.4569',STR_TO_DATE('13-JAN-1993', '%d-%M-%Y'),'AD_VP',17000,NULL,100,90);
INSERT INTO employees
VALUES(103,'Alexander','Hunold','AHUNOLD','590.423.4567',STR_TO_DATE('03-JAN-1990', '%d-%M-%Y'),'IT_PROG',9000,NULL,102,60);
INSERT INTO employees
VALUES(104,'Bruce','Ernst','BERNST','590.423.4568',STR_TO_DATE('21-MAY-1991', '%d-%M-%Y'),'IT_PROG',6000,NULL,103,60),(105,'David','Austin','DAUSTIN','590.423.4569',STR_TO_DATE('25-JUN-1997', '%d-%M-%Y'),'IT_PROG',4800,NULL,103,60);
INSERT INTO employees
VALUES(106,'Valli','Pataballa','VPATABAL','590.423.4560',STR_TO_DATE('05-FEB-1998', '%d-%M-%Y'),'IT_PROG',4800,NULL,103,60),(107,'Diana','Lorentz','DLORENTZ','590.423.5567',STR_TO_DATE('07-FEB-1999', '%d-%M-%Y'),'IT_PROG',4200,NULL,103,60),(108,'Nancy','Greenberg','NGREENBE','515.124.4569',STR_TO_DATE('17-AUG-1994', '%d-%M-%Y'),'FI_MGR',12000,NULL,101,100);
INSERT INTO employees
VALUES(109,'Daniel','Faviet','DFAVIET','515.124.4169',STR_TO_DATE('16-AUG-1994', '%d-%M-%Y'),'FI_ACCOUNT',9000,NULL,108,100),(110,'John','Chen','JCHEN','515.124.4269',STR_TO_DATE('28-SEP-1997', '%d-%M-%Y'),'FI_ACCOUNT',8200,NULL,108,100),(111,'Ismael','Sciarra','ISCIARRA','515.124.4369',STR_TO_DATE('30-SEP-1997', '%d-%M-%Y'),'FI_ACCOUNT',7700,NULL,108,100),(112,'Jose Manuel','Urman','JMURMAN','515.124.4469',STR_TO_DATE('07-MAR-1998', '%d-%M-%Y'),'FI_ACCOUNT',7800,NULL,108,100),(113,'Luis','Popp','LPOPP','515.124.4567',STR_TO_DATE('07-DEC-1999', '%d-%M-%Y'),'FI_ACCOUNT',6900,NULL,108,100);
INSERT INTO employees
VALUES(114,'Den','Raphaely','DRAPHEAL','515.127.4561',STR_TO_DATE('07-DEC-1994', '%d-%M-%Y'),'PU_MAN',11000,NULL,100,30),(115,'Alexander','Khoo','AKHOO','515.127.4562',STR_TO_DATE('18-MAY-1995', '%d-%M-%Y'),'PU_CLERK',3100,NULL,114,30),(116,'Shelli','Baida','SBAIDA','515.127.4563',STR_TO_DATE('24-DEC-1997', '%d-%M-%Y'),'PU_CLERK',2900,NULL,114,30),(117,'Sigal','Tobias','STOBIAS','515.127.4564',STR_TO_DATE('24-JUL-1997', '%d-%M-%Y'),'PU_CLERK',2800,NULL,114,30),(118,'Guy','Himuro','GHIMURO','515.127.4565',STR_TO_DATE('15-NOV-1998', '%d-%M-%Y'),'PU_CLERK',2600,NULL,114,30),(119,'Karen','Colmenares','KCOLMENA','515.127.4566',STR_TO_DATE('10-AUG-1999', '%d-%M-%Y'),'PU_CLERK',2500,NULL,114,30);
INSERT INTO employees
VALUES(120,'Matthew','Weiss','MWEISS','650.123.1234',STR_TO_DATE('18-JUL-1996', '%d-%M-%Y'),'ST_MAN',8000,NULL,100,50),(121,'Adam','Fripp','AFRIPP','650.123.2234',STR_TO_DATE('10-APR-1997', '%d-%M-%Y'),'ST_MAN',8200,NULL,100,50),(122,'Payam','Kaufling','PKAUFLIN','650.123.3234',STR_TO_DATE('01-MAY-1995', '%d-%M-%Y'),'ST_MAN',7900,NULL,100,50),(123,'Shanta','Vollman','SVOLLMAN','650.123.4234',STR_TO_DATE('10-OCT-1997', '%d-%M-%Y'),'ST_MAN',6500,NULL,100,50),(124,'Kevin','Mourgos','KMOURGOS','650.123.5234',STR_TO_DATE('16-NOV-1999', '%d-%M-%Y'),'ST_MAN',5800,NULL,100,50),(125,'Julia','Nayer','JNAYER','650.124.1214',STR_TO_DATE('16-JUL-1997', '%d-%M-%Y'),'ST_CLERK',3200,NULL,120,50),(126,'Irene','Mikkilineni','IMIKKILI','650.124.1224',STR_TO_DATE('28-SEP-1998', '%d-%M-%Y'),'ST_CLERK',2700,NULL,120,50),(127,'James','Landry','JLANDRY','650.124.1334',STR_TO_DATE('14-JAN-1999', '%d-%M-%Y'),'ST_CLERK',2400,NULL,120,50);
INSERT INTO employees
VALUES(128,'Steven','Markle','SMARKLE','650.124.1434',STR_TO_DATE('08-MAR-2000', '%d-%M-%Y'),'ST_CLERK',2200,NULL,120,50),(129,'Laura','Bissot','LBISSOT','650.124.5234',STR_TO_DATE('20-AUG-1997', '%d-%M-%Y'),'ST_CLERK',3300,NULL,121,50),(130,'Mozhe','Atkinson','MATKINSO','650.124.6234',STR_TO_DATE('30-OCT-1997', '%d-%M-%Y'),'ST_CLERK',2800,NULL,121,50),(131,'James','Marlow','JAMRLOW','650.124.7234',STR_TO_DATE('16-FEB-1997', '%d-%M-%Y'),'ST_CLERK',2500,NULL,121,50),(132,'TJ','Olson','TJOLSON','650.124.8234',STR_TO_DATE('10-APR-1999', '%d-%M-%Y'),'ST_CLERK',2100,NULL,121,50),(133,'Jason','Mallin','JMALLIN','650.127.1934',STR_TO_DATE('14-JUN-1996', '%d-%M-%Y'),'ST_CLERK',3300,NULL,122,50),(134,'Michael','Rogers','MROGERS','650.127.1834',STR_TO_DATE('26-AUG-1998', '%d-%M-%Y'),'ST_CLERK',2900,NULL,122,50),(135,'Ki','Gee','KGEE','650.127.1734',STR_TO_DATE('12-DEC-1999', '%d-%M-%Y'),'ST_CLERK',2400,NULL,122,50),(136,'Hazel','Philtanker','HPHILTAN','650.127.1634',STR_TO_DATE('06-FEB-2000', '%d-%M-%Y'),'ST_CLERK',2200,NULL,122,50);
INSERT INTO employees
VALUES(137,'Renske','Ladwig','RLADWIG','650.121.1234',STR_TO_DATE('14-JUL-1995', '%d-%M-%Y'),'ST_CLERK',3600,NULL,123,50),(138,'Stephen','Stiles','SSTILES','650.121.2034',STR_TO_DATE('26-OCT-1997', '%d-%M-%Y'),'ST_CLERK',3200,NULL,123,50),(139,'John','Seo','JSEO','650.121.2019',STR_TO_DATE('12-FEB-1998', '%d-%M-%Y'),'ST_CLERK',2700,NULL,123,50),(140,'Joshua','Patel','JPATEL','650.121.1834',STR_TO_DATE('06-APR-1998', '%d-%M-%Y'),'ST_CLERK',2500,NULL,123,50),(141,'Trenna','Rajs','TRAJS','650.121.8009',STR_TO_DATE('17-OCT-1995', '%d-%M-%Y'),'ST_CLERK',3500,NULL,124,50),(142,'Curtis','Davies','CDAVIES','650.121.2994',STR_TO_DATE('29-JAN-1997', '%d-%M-%Y'),'ST_CLERK',3100,NULL,124,50),(143,'Randall','Matos','RMATOS','650.121.2874',STR_TO_DATE('15-MAR-1998', '%d-%M-%Y'),'ST_CLERK',2600,NULL,124,50),(144,'Peter','Vargas','PVARGAS','650.121.2004',STR_TO_DATE('09-JUL-1998', '%d-%M-%Y'),'ST_CLERK',2500,NULL,124,50);
INSERT INTO employees
VALUES(145,'John','Russell','JRUSSEL','011.44.1344.429268',STR_TO_DATE('01-OCT-1996', '%d-%M-%Y'),'SA_MAN',14000,NULL,100,80),(146,'Karen','Partners','KPARTNER','011.44.1344.467268',STR_TO_DATE('05-JAN-1997', '%d-%M-%Y'),'SA_MAN',13500,NULL,100,80),(147,'Alberto','Errazuriz','AERRAZUR','011.44.1344.429278',STR_TO_DATE('10-MAR-1997', '%d-%M-%Y'),'SA_MAN',12000,NULL,100,80);
INSERT INTO employees
VALUES(148,'Gerald','Cambrault','GCAMBRAU','011.44.1344.619268',STR_TO_DATE('15-OCT-1999', '%d-%M-%Y'),'SA_MAN',11000,.3,100,80),(149,'Eleni','Zlotkey','EZLOTKEY','011.44.1344.429018',STR_TO_DATE('29-JAN-2000', '%d-%M-%Y'),'SA_MAN',10500,.2,100,80),(150,'Peter','Tucker','PTUCKER','011.44.1344.129268',STR_TO_DATE('30-JAN-1997', '%d-%M-%Y'),'SA_REP',10000,.3,145,80),(151,'David','Bernstein','DBERNSTE','011.44.1344.345268',STR_TO_DATE('24-MAR-1997', '%d-%M-%Y'),'SA_REP',9500,.25,145,80),(152,'Peter','Hall','PHALL','011.44.1344.478968',STR_TO_DATE('20-AUG-1997', '%d-%M-%Y'),'SA_REP',9000,.25,145,80),(153,'Christopher','Olsen','COLSEN','011.44.1344.498718',STR_TO_DATE('30-MAR-1998', '%d-%M-%Y'),'SA_REP',8000,.2,145,80),(154,'Nanette','Cambrault','NCAMBRAU','011.44.1344.987668',STR_TO_DATE('09-DEC-1998', '%d-%M-%Y'),'SA_REP',7500,.2,145,80),(155,'Oliver','Tuvault','OTUVAULT','011.44.1344.486508',STR_TO_DATE('23-NOV-1999', '%d-%M-%Y'),'SA_REP',7000,.15,145,80),(156,'Janette','King','JKING','011.44.1345.429268',STR_TO_DATE('30-JAN-1996', '%d-%M-%Y'),'SA_REP',10000,.35,146,80);
INSERT INTO employees
VALUES(157,'Patrick','Sully','PSULLY','011.44.1345.929268',STR_TO_DATE('04-MAR-1996', '%d-%M-%Y'),'SA_REP',9500,.35,146,80),(158,'Allan','McEwen','AMCEWEN','011.44.1345.829268',STR_TO_DATE('01-AUG-1996', '%d-%M-%Y'),'SA_REP',9000,.35,146,80),(159,'Lindsey','Smith','LSMITH','011.44.1345.729268',STR_TO_DATE('10-MAR-1997', '%d-%M-%Y'),'SA_REP',8000,.3,146,80),(160,'Louise','Doran','LDORAN','011.44.1345.629268',STR_TO_DATE('15-DEC-1997', '%d-%M-%Y'),'SA_REP',7500,.3,146,80),(161,'Sarath','Sewall','SSEWALL','011.44.1345.529268',STR_TO_DATE('03-NOV-1998', '%d-%M-%Y'),'SA_REP',7000,.25,146,80),(162,'Clara','Vishney','CVISHNEY','011.44.1346.129268',STR_TO_DATE('11-NOV-1997', '%d-%M-%Y'),'SA_REP',10500,.25,147,80),(163,'Danielle','Greene','DGREENE','011.44.1346.229268',STR_TO_DATE('19-MAR-1999', '%d-%M-%Y'),'SA_REP',9500,.15,147,80),(164,'Mattea','Marvins','MMARVINS','011.44.1346.329268',STR_TO_DATE('24-JAN-2000', '%d-%M-%Y'),'SA_REP',7200,.10,147,80),(165,'David','Lee','DLEE','011.44.1346.529268',STR_TO_DATE('23-FEB-2000', '%d-%M-%Y'),'SA_REP',6800,.1,147,80),(166,'Sundar','Ande','SANDE','011.44.1346.629268',STR_TO_DATE('24-MAR-2000', '%d-%M-%Y'),'SA_REP',6400,.10,147,80),(167,'Amit','Banda','ABANDA','011.44.1346.729268',STR_TO_DATE('21-APR-2000', '%d-%M-%Y'),'SA_REP',6200,.10,147,80);
INSERT INTO employees
VALUES(168,'Lisa','Ozer','LOZER','011.44.1343.929268',STR_TO_DATE('11-MAR-1997', '%d-%M-%Y'),'SA_REP',11500,.25,148,80),(169,'Harrison','Bloom','HBLOOM','011.44.1343.829268',STR_TO_DATE('23-MAR-1998', '%d-%M-%Y'),'SA_REP',10000,.20,148,80),(170,'Tayler','Fox','TFOX','011.44.1343.729268',STR_TO_DATE('24-JAN-1998', '%d-%M-%Y'),'SA_REP',9600,.20,148,80),(171,'William','Smith','WSMITH','011.44.1343.629268',STR_TO_DATE('23-FEB-1999', '%d-%M-%Y'),'SA_REP',7400,.15,148,80),(172,'Elizabeth','Bates','EBATES','011.44.1343.529268',STR_TO_DATE('24-MAR-1999', '%d-%M-%Y'),'SA_REP',7300,.15,148,80),(173,'Sundita','Kumar','SKUMAR','011.44.1343.329268',STR_TO_DATE('21-APR-2000', '%d-%M-%Y'),'SA_REP',6100,.10,148,80),(174,'Ellen','Abel','EABEL','011.44.1644.429267',STR_TO_DATE('11-MAY-1996', '%d-%M-%Y'),'SA_REP',11000,.30,149,80),(175,'Alyssa','Hutton','AHUTTON','011.44.1644.429266',STR_TO_DATE('19-MAR-1997', '%d-%M-%Y'),'SA_REP',8800,.25,149,80),(177,'Jack','Livingston','JLIVINGS','011.44.1644.429264',STR_TO_DATE('23-APR-1998', '%d-%M-%Y'),'SA_REP',8400,.20,149,80);
INSERT INTO employees
VALUES(178,'Kimberely','Grant','KGRANT','011.44.1644.429263',STR_TO_DATE('24-MAY-1999', '%d-%M-%Y'),'SA_REP',7000,.15,149,NULL),(179,'Charles','Johnson','CJOHNSON','011.44.1644.429262',STR_TO_DATE('04-JAN-2000', '%d-%M-%Y'),'SA_REP',6200,.10,149,80),(180,'Winston','Taylor','WTAYLOR','650.507.9876',STR_TO_DATE('24-JAN-1998', '%d-%M-%Y'),'SH_CLERK',3200,NULL,120,50),(181,'Jean','Fleaur','JFLEAUR','650.507.9877',STR_TO_DATE('23-FEB-1998', '%d-%M-%Y'),'SH_CLERK',3100,NULL,120,50),(182,'Martha','Sullivan','MSULLIVA','650.507.9878',STR_TO_DATE('21-JUN-1999', '%d-%M-%Y'),'SH_CLERK',2500,NULL,120,50),(183,'Girard','Geoni','GGEONI','650.507.9879',STR_TO_DATE('03-FEB-2000', '%d-%M-%Y'),'SH_CLERK',2800,NULL,120,50),(184,'Nandita','Sarchand','NSARCHAN','650.509.1876',STR_TO_DATE('27-JAN-1996', '%d-%M-%Y'),'SH_CLERK',4200,NULL,121,50),(185,'Alexis','Bull','ABULL','650.509.2876',STR_TO_DATE('20-FEB-1997', '%d-%M-%Y'),'SH_CLERK',4100,NULL,121,50),(186,'Julia','Dellinger','JDELLING','650.509.3876',STR_TO_DATE('24-JUN-1998', '%d-%M-%Y'),'SH_CLERK',3400,NULL,121,50),(187,'Anthony','Cabrio','ACABRIO','650.509.4876',STR_TO_DATE('07-FEB-1999', '%d-%M-%Y'),'SH_CLERK',3000,NULL,121,50);
INSERT INTO employees
VALUES(188,'Kelly','Chung','KCHUNG','650.505.1876',STR_TO_DATE('14-JUN-1997', '%d-%M-%Y'),'SH_CLERK',3800,NULL,122,50),(189,'Jennifer','Dilly','JDILLY','650.505.2876',STR_TO_DATE('13-AUG-1997', '%d-%M-%Y'),'SH_CLERK',3600,NULL,122,50),(190,'Timothy','Gates','TGATES','650.505.3876',STR_TO_DATE('11-JUL-1998', '%d-%M-%Y'),'SH_CLERK',2900,NULL,122,50),(191,'Randall','Perkins','RPERKINS','650.505.4876',STR_TO_DATE('19-DEC-1999', '%d-%M-%Y'),'SH_CLERK',2500,NULL,122,50),(192,'Sarah','Bell','SBELL','650.501.1876',STR_TO_DATE('04-FEB-1996', '%d-%M-%Y'),'SH_CLERK',4000,NULL,123,50),(193,'Britney','Everett','BEVERETT','650.501.2876',STR_TO_DATE('03-MAR-1997', '%d-%M-%Y'),'SH_CLERK',3900,NULL,123,50),(194,'Samuel','McCain','SMCCAIN','650.501.3876',STR_TO_DATE('01-JUL-1998', '%d-%M-%Y'),'SH_CLERK',3200,NULL,123,50),(195,'Vance','Jones','VJONES','650.501.4876',STR_TO_DATE('17-MAR-1999', '%d-%M-%Y'),'SH_CLERK',2800,NULL,123,50),(196,'Alana','Walsh','AWALSH','650.507.9811',STR_TO_DATE('24-APR-1998', '%d-%M-%Y'),'SH_CLERK',3100,NULL,124,50),(197,'Kevin','Feeney','KFEENEY','650.507.9822',STR_TO_DATE('23-MAY-1998', '%d-%M-%Y'),'SH_CLERK',3000,NULL,124,50),(198,'Donald','OConnell','DOCONNEL','650.507.9833',STR_TO_DATE('21-JUN-1999', '%d-%M-%Y'),'SH_CLERK',2600,NULL,124,50);
INSERT INTO employees
VALUES(199,'Douglas','Grant','DGRANT','650.507.9844',STR_TO_DATE('13-JAN-2000', '%d-%M-%Y'),'SH_CLERK',2600,NULL,124,50),(200,'Jennifer','Whalen','JWHALEN','515.123.4444',STR_TO_DATE('17-SEP-1987', '%d-%M-%Y'),'AD_ASST',4400,NULL,101,10),(201,'Michael','Hartstein','MHARTSTE','515.123.5555',STR_TO_DATE('17-FEB-1996', '%d-%M-%Y'),'MK_MAN',13000,NULL,100,20),(202,'Pat','Fay','PFAY','603.123.6666',STR_TO_DATE('17-AUG-1997', '%d-%M-%Y'),'MK_REP',6000,NULL,201,20),(203,'Susan','Mavris','SMAVRIS','515.123.7777',STR_TO_DATE('07-JUN-1994', '%d-%M-%Y'),'HR_REP',6500,NULL,101,40),(204,'Hermann','Baer','HBAER','515.123.8888',STR_TO_DATE('07-JUN-1994', '%d-%M-%Y'),'PR_REP',10000,NULL,101,70),(205,'Shelley','Higgins','SHIGGINS','515.123.8080',STR_TO_DATE('07-JUN-1994', '%d-%M-%Y'),'AC_MGR',12000,NULL,101,110),(206,'William','Gietz','WGIETZ','51hr5.123.8181',STR_TO_DATE('07-JUN-1994', '%d-%M-%Y'),'AC_ACCOUNT',8300,NULL,205,110);
INSERT INTO employees
VALUES (100,'Steven','King','SKING','515.123.4567',STR_TO_DATE('17-JUN-1987', '%d-%M-%Y'),'AD_PRES',24000,NULL,NULL,90);
INSERT INTO job_history
VALUES (102,STR_TO_DATE('13-Jan-1993', '%d-%M-%Y'),STR_TO_DATE('24-Jul-1998', '%d-%M-%Y'),'IT_PROG',60),(101,STR_TO_DATE('21-Sep-1989', '%d-%M-%Y'),STR_TO_DATE('27-Oct-1993', '%d-%M-%Y'),'AC_ACCOUNT',110),(101,STR_TO_DATE('28-Oct-1993','%d-%M-%Y'),STR_TO_DATE('15-Mar-1997','%d-%M-%Y'),'AC_MGR',110),(201,STR_TO_DATE('27-Feb-1996','%d-%M-%Y'),STR_TO_DATE('19-Dec-1999','%d-%M-%Y'),'MK_REP',20),(114,STR_TO_DATE('24-Mar-1998','%d-%M-%Y'),STR_TO_DATE('31-Dec-1999','%d-%M-%Y'),'ST_CLERK',50),(122,STR_TO_DATE('01-Jan-1999','%d-%M-%Y'),STR_TO_DATE('31-Dec-1999','%d-%M-%Y'),'ST_CLERK',50),(200,STR_TO_DATE('17-Sep-1987','%d-%M-%Y'),STR_TO_DATE('17-Jun-1993','%d-%M-%Y'),'AD_ASST',90),(176,STR_TO_DATE('24-Mar-1998','%d-%M-%Y'),STR_TO_DATE('31-Dec-1998','%d-%M-%Y'),'SA_REP',80),(176,STR_TO_DATE('01-Jan-1999','%d-%M-%Y'),STR_TO_DATE('31-Dec-1999','%d-%M-%Y'),'SA_MAN',80),(200,STR_TO_DATE('01-Jul-1994','%d-%M-%Y'),STR_TO_DATE('31-Dec-1998','%d-%M-%Y'),'AC_ACCOUNT',90);
ALTER TABLE countries ADD FOREIGN KEY (region_id) REFERENCES regions(region_id);    
ALTER TABLE locations ADD FOREIGN KEY (country_id) REFERENCES countries(country_id);
ALTER TABLE employees ADD FOREIGN KEY (job_id) REFERENCES jobs(job_id);
ALTER TABLE employees ADD FOREIGN KEY (department_id) REFERENCES departments(department_id);
ALTER TABLE departments ADD FOREIGN KEY (manager_id) REFERENCES employees (employee_id);
ALTER TABLE job_history ADD FOREIGN KEY (job_id) REFERENCES jobs(job_id);
ALTER TABLE job_history ADD FOREIGN KEY (department_id) REFERENCES departments(department_id);
-- Display all information in the tables EMP and DEPT. 
select * from employees;
select * from departments;
--  Display only the hire date and employee name for each employee. 
select hire_date,concat(first_name," ",last_name) as employee_name from employees;
-- Display the ename concatenated with the job ID, separated by a comma and space, and name the column Employee and Title 
select concat(first_name," ",last_name,", ",job_id) as "Employee and Title" from employees;
-- Display the hire date, name and department number for all clerks.
select hire_date,concat(first_name," ",last_name) as employee_name,department_id from employees where job_id like '%CLERK';
-- Create a query to display all the data from the EMP table. Separate each column by a comma. Name the column THE OUTPUT 
select concat(employee_id,',',first_name,',',last_name,',',email,',',phone_number,',',hire_date,',',job_id,',',salary,',',commission_pct,',',manager_id,',',department_id) as OUTPUT from employees;
--  Display the names and salaries of all employees with a salary greater than 2000. 
select concat(first_name," ",last_name) as employee_name,salary from employees where salary >2000;
-- Display the names and dates of employees with the column headers "Name" and "Start Date" 
select concat(first_name," ",last_name) as Name,hire_date as "Start Dates" from employees;
--  Display the names and hire dates of all employees in the order they were hired. 
select concat(first_name," ",last_name) as Name,hire_date as "Start Dates" from employees order by hire_date asc;
-- Display the names and salaries of all employees in reverse salary order. 
select concat(first_name," ",last_name) as employee_name,salary from employees order by salary desc;
-- Display 'ename" and "deptno" who are all earned commission and display salary in reverse order.
select concat(first_name," ",last_name) as ename,department_id as deptno,salary from employees where commission_pct>0 order by salary desc;
-- Display the last name and job title of all employees who do not have a manager
select last_name,job_id as "job Title" from employees where manager_id is NULL;
-- Display the last name, job, and salary for all employees whose job is sales representative or stock clerk and whose salary is not equal to $2,500, $3,500, or $5,000
select last_name,job_id,salary from employees where job_id in ('SA_REP' ,'ST_CLERK') AND salary not in (2500,3500,5000);
--  Display the maximum, minimum and average salary and commission earned. 
select max(salary), min(salary), avg(salary), max(commission_pct), min(commission_pct), avg(commission_pct) from employees;
-- Display the department number, total salary payout and total commission payout for each department.
select department_id,sum(salary),sum(commission_pct),sum(salary+(salary*commission_pct)) as 'total salary payout' from employees group by department_id;
-- Display the department number and number of employees in each department.
select department_id,count(employee_id) from employees group by department_id;
-- Display the department number and total salary of employees in each department.
select department_id,sum(salary) as 'total salary' from employees group by department_id;
-- Display the employee's name who doesn't earn a commission. Order the result set without using the column name 
select concat(first_name," ",last_name) as employee_name from employees where commission_pct is NULL order by 1;
--  Display the employees name, department id and commission. If an Employee doesn't earn the commission, then display as 'No commission'. Name the columns appropriately
select concat(first_name," ",last_name) as employee_name, department_id,if(commission_pct is NULL,"No commission",commission_pct) as Commission from employees;
--  Display the employee's name, salary and commission multiplied by 2. If an Employee doesn't earn the commission, then display as 'No commission. Name the columns appropriately
select concat(first_name," ",last_name) as employee_name, (salary*2) as salary,if(commission_pct is NULL,"No commission",commission_pct*2) as Commission from employees;
--  Display the employee's name, department id who have the first name same as another employee in the same department
select concat(first_name," ",last_name) as employee_name, department_id;
-- Display the sum of salaries of the employees working under each Manager. 
select manager_id,sum(salary) from employees group by manager_id;
-- Select the Managers name, the count of employees working under and the department ID of the manager.  
select manager_id,department_id , count(employee_id) as 'no, of employees'from employees group by manager_id;
-- Select the employee name, department id, and the salary. Group the result with the manager name and the employee last name should have second letter 'a!
select first_name, department_id from employees where(first_name,department_id) in (select first_name,department_id from employees group by first_name, department_id having count(*)>1);
--  Select the employee name, department id, and the salary. Group the result with the manager name and the employee last name should have second letter 'a! 
select e.last_name, e.department_id, e.salary, concat(m.first_name,' ',m.last_name) as manager_name from employees  join employees m on e.manager_id=m.employees_id where e.last_name like '_a%' group by manager_name, e.last_name, e.department_id, e.salary;
-- Display the average of sum of the salaries and group the result with the department id. Order the result with the department id. 
select department_id, avg(total_salary) as average_salary from (select department_id,sum(salary) as total_salary from employees group by department_id) as department_salary group by department_id order by department_id;
-- Select the maximum salary of each department along with the department id
select department_id,max(salary) as 'maximum salary' from employees group by department_id;
--  Display the commission, if not null display 10% of salary, if null display a default value 1
select if(commission_pct is NULL,commission_pct,(salary*0.1)) as new_commission from employees;
--  Write a query that displays the employee's last names only from the string's 2-5th position with the first letter capitalized and all other letters lowercase, Give each column an appropriate label. 
SELECT concat(UPPER(SUBSTRING(last_name, 2, 1)),LOWER(SUBSTRING(last_name, 3, 3))) AS ModifiedLastName FROM employees;
--  Write a query that displays the employee's first name and last name along with a " in between for e.g.: first name : Ram; last name : Kumar then Ram-Kumar. Also displays the month on which the employee has joined.
select concat(first_name,'-',last_name) as modifiedName,month(hire_date) as 'month' from employees;
--  Write a query to display the employee's last name and if half of the salary is greater than ten thousand then increase the salary by 10% else by 11.5% along with the bonus amount of 1500 each. Provide each column an appropriate label.
SELECT last_name,salary,CASE WHEN (salary / 2) > 10000 THEN salary * 1.10 + 1500 ELSE salary * 1.115 + 1500 END AS NewSalary FROM employees;
-- Display the employee ID by Appending two zeros after 2nd digit and 'E' in the end, department id, salary and the manager name all in Upper case, if the Manager name consists of 'z' replace it with '$! 
SELECT CONCAT(SUBSTRING(employee_id, 1, 2), '00', SUBSTRING(employee_id, 3), 'E') AS ModifiedEmpID,department_id,salary,REPLACE(first_name, 'z', '$!') AS ModifiedManagerName FROM employees;
-- Write a query that displays the employee's last names with the first letter capitalized and all other letters lowercase, and the length of the names, for all employees whose name starts with J, A, or M. Give each column an appropriate label. Sort the results by the employees' last names 
SELECT CONCAT(UPPER(SUBSTRING(last_name, 1, 1)), LOWER(SUBSTRING(last_name, 2))) AS ProperLastName,char_length(last_name) AS NameLength,last_name FROM employees WHERE last_name LIKE 'J%' OR last_name LIKE 'A%' OR last_name LIKE 'M%' ORDER BY last_name;
-- Create a query to display the last name and salary for all employees. Format the salary to be 15 characters long, left-padded with $. Label the column SALARY
select last_name,  LPAD(CAST(salary AS CHAR), 15, '$') AS SALARY from employees;
--  Display the employee's name if it is a palindrome
select first_name from employees where upper(first_name) = upper(reverse (first_name));
-- Display First names of all employees with initcaps.
SELECT CONCAT(UPPER(SUBSTRING(First_Name, 1, 1)), LOWER(SUBSTRING(First_Name, 2))) AS FormattedFirstName from employees;
-- From LOCATIONS table, extract the word between first and second space from the STREET ADDRESS column. 
SELECT SUBSTRING_INDEX(SUBSTRING_INDEX(STREET_ADDRESS, ' ', 3), ' ', -1) AS WordBetweenSpaces from locations;
-- Extract first letter from First Name column and append it with the Last Name. Also add "@systechusa.com" at the end. Name the column as e-mail address. All characters should be in lower case. Display this along with their First Name.
select first_name,LOWER(CONCAT(SUBSTRING(First_Name, 1, 1), Last_Name,'@systechusa.com')) AS Email_address from employees;
--  Display the names and job titles of all employees with the same job as Trenna.
select first_name,job_id from employees where job_id = (select job_id from employees where first_name = "trenna");
-- Display the name of the employee whose salary is the lowest.
select first_name,salary from employees where salary in(select min(salary) from employees);
-- Display the names of all employees except the lowest paid
select first_name from employees where salary not in(select min(salary) from employees);
-- Write a query to display the last name, department number, department name for all employees.
select e.last_name,e.department_id,d.department_name from employees e join departments d on e.department_id = d.department_id;
-- Create a unique list of all jobs that are in department 4. Include the location of the department in the output
select e.job_id,d.location_id from employees e join departments d on e.department_id = d.department_id where e.department_id = 4;
-- Write a query to display the employee last name,department name,location id and city of all employees who earn commission.
select e.last_name,d.department_name,d.location_id,l.city from employees e join departments d on e.department_id = d.department_id join locations l on d.location_id = l.location_id where e.commission_pct is not null;
-- Display the employee last name and department name of all employees who have an 'a' in their last name
select e.last_name,d.department_name from employees e join departments d on e.manager_id = d.manager_id where last_name like '%a%';
--  Write a query to display the last name,job,department number and department name for all employees who work in LONDON
select e.last_name,e.job_id,e.department_id,d.department_name from employees e join departments d on e.department_id = d.department_id join locations l on d.location_id = l.location_id where l.city = 'london';
-- Display the employee last name and employee number along with their manager's last name and manager number
SELECT w.last_name "Employee", w.employee_id "EMP", m.last_name "Manager", m.employee_id "Mgr" FROM employees w join employees m ON (w.manager_id = m.employee_id);
-- Display the employee last name and employee number along with their manager's last name and manager number (including the employees who have no manager)
SELECT e1.last_name AS "Employee Last Name", e1.employee_id AS "Employee Number",COALESCE(e2.last_name, 'No Manager') AS "Manager Last Name", COALESCE(e2.employee_id, 'N/A') AS "Manager Number"FROM employees e1 LEFT JOIN employees e2 ON e1.manager_id = e2.employee_id;
-- Create a query that displays employees last name,department number,and all the employees who work in the same department as a given employee.
select e.last_name,d.department_id from employees e join departments d on e.department_id = d.department_id order by e.last_name,d.department_id;
-- Create a query that displays the name,job,department name,salary,grade for all employees. Derive grade based on salary(>=50000=A, >=30000=B,<30000=C)
select e.first_name,e.job_id,d.department_name,e.salary,case WHEN e.salary >= 50000 THEN 'A' WHEN e.salary >= 30000 THEN 'B'else 'c' end as grade from employees e join departments d on e.department_id = d.department_id;
-- Display the names and hire date for all employees who were hired before their managers along withe their manager names and hire date. Label the columns as Employee name, emp_hire_date,manager name,man_hire_date 
select e1.first_name AS "Employee name",e1.hire_date AS "emp_hire_date", e2.first_name AS "Manager name",e2.hire_date AS "man_hire_date" from employees e1 join employees e2 ON e1.manager_id = e2.employee_id where e1.hire_date < e2.hire_date;
-- Write a query to display the last name and hire date of any employee in the same department as SALES.
select e.last_name,e.hire_date from employees e join departments d on e.department_id = d.department_id where department_name = "sales";
-- Create a query to display the employee numbers and last names of all employees who earn more than the average salary. Sort the results in ascending order of salary
select employee_id,last_name,salary from employees where salary > (select avg(salary) from employees) order by salary asc;
-- Write a query that displays the employee numbers and last names of all employees who work in a department with any employee whose last name contains a'
select e.employee_id,e.last_name,d.department_name from employees e join departments d on e.department_id = d.department_id where e.last_name like '%u%';
-- Display the last name, department number, and job ID of all employees whose department location is LONDON.
select e.last_name,e.job_id,d.department_id from employees e join departments d on e.department_id = d.department_id join locations l on d.location_id = l.location_id where l.city = 'london';
-- Display the department number, last name, and job ID for every employee in the OPERATIONS department
select d.department_id,e.last_name,e.job_id from employees e join departments d on e.department_id = d.department_id where d.department_name ='operations';
-- Display the names of all employees whose job title is the same as anyone in the sales dept.
select e.first_name from employees e join departments d on e.department_id = d.department_id where department_name = 'sales';
--  Write a query to display the top three earners in the EMPLOYEES table. Display their last names and salaries.
select last_name,salary from employees order by salary desc limit 3;
-- Display the names of all employees with their salary and commission earned. Employees with a null commission should have O in the commission column	
SELECT first_name,salary,COALESCE(commission_pct, 0) AS commission_earned FROM employees;
-- Display the Managers (name) with top three salaries along with their salaries and department information
select CONCAT(e.first_name, ' ', e.last_name) AS manager_name,e.salary,d.department_name from employees e join departments d on e.department_id = d.department_id join jobs j on e.job_id = j.job_id where j.job_title like '%manager%' order by e.salary desc limit 3;
-- Find the date difference between the hire date and resignation_date for all the employees. Display in no. of days, months and year(1 year 3 months 5 days).Emp_ID Hire Date Resignation_Date
SELECT 
    employee_id,
    start_date,
    end_date,
    CONCAT(
        FLOOR(DATEDIFF(end_date, start_date) / 365), ' years ',
        FLOOR((DATEDIFF(end_date, start_date) % 365) / 30), ' months ',
        (DATEDIFF(end_date, start_date) % 365) % 30, ' days'
    ) AS duration
FROM 
    job_history;
-- Format the hire date as mm/dd/yyyy(09/22/2003) and resignation_date as mon dd, yyyy(Aug 12th, 2004). Display the null as (DEC, 01th 1900)
SELECT CASE WHEN start_date IS NULL THEN '(DEC, 01th 1900)'ELSE DATE_FORMAT(start_date, '%m/%d/%Y')END AS formatted_hire_date, CASE WHEN end_date IS NULL THEN '(DEC, 01th 1900)'ELSE DATE_FORMAT(end_date, '%b %e, %Y')END AS formatted_resignation_date FROM job_history;
-- Calcuate experience of the employee till date in Years and months(example 1 year and 3 months)
SELECT employee_id,start_date,end_date,CONCAT(FLOOR(TIMESTAMPDIFF(MONTH, start_date, COALESCE(end_date, CURRENT_DATE())) / 12), ' years ',TIMESTAMPDIFF(MONTH, end_date, COALESCE(end_date, CURRENT_DATE())) % 12, ' months') AS experience FROM job_history;
