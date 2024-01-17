create database Assesment;
use Assesment;
create table workers (
worker_id int NOT NULL,
first_name varchar(20),
last_name varchar(20),
salary int,
joining_date date NOT NULL,
department varchar(10));
insert into workers value (1,"Monika","Arora",100000, STR_TO_DATE('24-Jan-2014', '%d-%M-%Y'),"HR"),
(2,"Niharika","Verma",80000,STR_TO_DATE('11-Jun-2014', '%d-%M-%Y'),"Admin"),
(3,"Vishal","Singhal",300000,STR_TO_DATE('20-Feb-2014', '%d-%M-%Y'),"HR"),
(4,"Amitabh","Singh",5000000,STR_TO_DATE('20-Feb-2014', '%d-%M-%Y'),"Admin");
insert into workers value (5,"Vivek","Bhati",500000,STR_TO_DATE('11-Nov-2000', '%d-%M-%Y'),"Admin"),
(6,"Vipul","Diwan",200000,STR_TO_DATE('11-Nov-2014', '%d-%M-%Y'),"Account"),
(7,"Satish","Kumar",75000,STR_TO_DATE('20-Jan-1998', '%d-%M-%Y'),"Account"),
(8,"Geetika","Chauhan",90000,STR_TO_DATE('11-Apr-1998', '%d-%M-%Y'),"Admin");
create table student(
std_id int,
stdName varchar(20),
Sex varchar(10),
perc int,
class int,
sec char(5),
branch varchar(20),
dob date NOT NULL);
insert into student value (1001,"surekha joshi","female",82,12,"A","science",STR_TO_DATE('11-Apr-1998', '%d-%M-%Y')),
(1002,"maahi agrwal","female",56,11,"C","commerce",STR_TO_DATE('11-Nov-1998', '%d-%M-%Y')),
(1003,"sanam verma","male",59,11,"C","commerce",STR_TO_DATE('20-Jun-1998', '%d-%M-%Y')),
(1004,"ronit kumar","male",63,11,"C","commerce",STR_TO_DATE('30-Apr-1998', '%d-%M-%Y')),
(1005,"dipesh pulkit","male",78,11,"B","science",STR_TO_DATE('23-Oct-1998', '%d-%M-%Y')),
(1006,"jahnvu puri","female",60,11,"B","commerce",STR_TO_DATE('18-Jan-1998', '%d-%M-%Y')),
(1007,"sanam kumar","male",23,12,"F","commerce",STR_TO_DATE('11-Dec-1998', '%d-%M-%Y'));
insert into student value (1008,"sahil saras","male",56,11,"C","commerce",STR_TO_DATE('11-Apr-1998', '%d-%M-%Y')),
(1009,"akshara agarwal","female",72,12,"B","commerce",STR_TO_DATE('11-Apr-1998', '%d-%M-%Y')),
(1010,"stuti mishra","female",39,11,"F","science",STR_TO_DATE('11-Apr-1998', '%d-%M-%Y')),
(1011,"harsh agarwal","male",42,11,"C","science",STR_TO_DATE('11-Apr-1998', '%d-%M-%Y')),
(1012,"nikunj agarwal","male",49,12,"C","commerce",STR_TO_DATE('11-Apr-1998', '%d-%M-%Y')),
(1013,"ankita saxena","female",89,12,"A","science",STR_TO_DATE('11-Apr-1998', '%d-%M-%Y')),
(1014,"tani roshtogi","female",82,12,"A","science",STR_TO_DATE('11-Apr-1998', '%d-%M-%Y'));
-- Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending and DEPARTMENT Descending. 
select * from workers order by first_name,department desc;
-- Write an SQL query to print details for Workers with the first names “Vipul” and “Satish” from the Worker table.
select * from workers where first_name in ("vipul","satish");
-- Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets.
select * from workers where first_name like '%h' and length(first_name)=6;
-- Write an SQL query to print details of the Workers whose SALARY lies between 10000 and 100000.
select * from workers where salary between 10000 and 100000;
--  Write an SQL query to fetch duplicate records having matching data in some fields of a table. 
SELECT department, COUNT(*) FROM Workers GROUP BY department HAVING COUNT(*) > 1;
-- Write an SQL query to show the top 6 records of a table
select * from workers limit 6;
-- Write an SQL query to fetch the departments that have less than five people in them. 
SELECT department, COUNT(*) FROM Workers GROUP BY department HAVING COUNT(*) < 5;
-- Write an SQL query to show all departments along with the number of people in there.
SELECT department, COUNT(first_name) as total_employee FROM Workers GROUP BY department;
-- Write an SQL query to print the name of employees having the highest salary in each department. 
select first_name, salary, department from workers where salary in(select max(salary) from workers group by department);

-- To display all the records form STUDENT table. SELECT * FROM student
SELECT * FROM student;
-- To display any name and date of birth from the table STUDENT. SELECT StdName, DOB FROM student ; 
SELECT StdName, DOB FROM student ; 
-- To display all students record where percentage is greater of equal to 80 FROM student table. SELECT * FROM student WHERE percentage >= 80;
SELECT * FROM student WHERE perc >= 80;
-- To display student name, stream and percentage where percentage of student is more than 80 SELECT StdName, Stream, Percentage WHERE percentage > 80;
SELECT StdName, branch, Perc from student WHERE perc > 80;
--  To display all records of science students whose percentage is more than 75 form student table. SELECT * FORM student WHERE stream = ‘Science’ AND percentage > 75; 
SELECT * From student WHERE branch="science" AND perc > 75; 