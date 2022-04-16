SET SERVEROUTPUT ON;
----------------------------------------------------------------------
DECLARE nCount NUMBER;
BEGIN
SELECT 
  count(*) into nCount 
FROM 
  user_tables 
where 
  table_name = 'COUNTRY';
IF(nCount > 0)
THEN
   dbms_output.put_line('TABLE COUNTRY EXISTS');
ELSE
    dbms_output.put_line('TABLE COUNTRY DOES NOT EXIST, CREATING TABLE');
    EXECUTE IMMEDIATE 'create table COUNTRY (
    id int GENERATED ALWAYS AS IDENTITY START WITH 1 INCREMENT BY 1,
    name varchar(50) unique not null)';
    EXECUTE IMMEDIATE 'alter table country add constraint country_pk primary key(id)';
END IF;
    EXECUTE IMMEDIATE 'Insert into COUNTRY (NAME) values (''US'')';
    EXECUTE IMMEDIATE 'Insert into COUNTRY (NAME) values (''UK'')';
    EXECUTE IMMEDIATE 'Insert into COUNTRY (NAME) values (''MX'')';
    

----------------------------------------------------------------------

SELECT 
  count(*) into nCount 
FROM 
  user_tables 
where 
  table_name = 'STATE';
IF(nCount > 0)
THEN
   dbms_output.put_line('TABLE STATE EXISTS');
ELSE
    dbms_output.put_line('TABLE STATE DOES NOT EXIST, CREATING TABLE');
    EXECUTE IMMEDIATE 'create table state (id int GENERATED ALWAYS AS IDENTITY START WITH 1 INCREMENT BY 1, name varchar2(50) unique not null)';
    EXECUTE IMMEDIATE 'alter table state add constraint state_pk primary key(id)';
END IF;
    EXECUTE IMMEDIATE 'Insert into STATE (NAME) values (''MA'')';
    EXECUTE IMMEDIATE 'Insert into STATE (NAME) values (''NY'')';
    EXECUTE IMMEDIATE 'Insert into STATE (NAME) values (''CA'')';
    EXECUTE IMMEDIATE 'Insert into STATE (NAME) values (''NC'')';
    EXECUTE IMMEDIATE 'Insert into STATE (NAME) values (''TX'')';

----------------------------------------------------------------------

SELECT 
  count(*) into nCount 
FROM 
  user_tables 
where 
  table_name = 'AREA';
IF(nCount > 0) 
THEN 
dbms_output.put_line('TABLE AREA EXISTS');
ELSE
    dbms_output.put_line('TABLE AREA DOES NOT EXIST, CREATING TABLE');
    EXECUTE IMMEDIATE 'create table area (
id int GENERATED ALWAYS AS IDENTITY START WITH 1 INCREMENT BY 1,
min_area int,
max_area int)';

EXECUTE IMMEDIATE 'alter table area add constraint area_pk primary key(id)';
END IF;
    EXECUTE IMMEDIATE 'Insert into AREA (MIN_AREA,MAX_AREA) values (100,200)';
    EXECUTE IMMEDIATE 'Insert into AREA (MIN_AREA,MAX_AREA) values (200,300)';
    EXECUTE IMMEDIATE 'Insert into AREA (MIN_AREA,MAX_AREA) values (300,400)';
    EXECUTE IMMEDIATE 'Insert into AREA (MIN_AREA,MAX_AREA) values (400,500)';
    EXECUTE IMMEDIATE 'Insert into AREA (MIN_AREA,MAX_AREA) values (500,600)';
    EXECUTE IMMEDIATE 'Insert into AREA (MIN_AREA,MAX_AREA) values (600,700)';
    EXECUTE IMMEDIATE 'Insert into AREA (MIN_AREA,MAX_AREA) values (700,800)';

----------------------------------------------------------------------
SELECT 
  count(*) into nCount 
FROM 
  user_tables 
where 
  table_name = 'LEASE_TYPE';
IF(nCount > 0) 
THEN 
dbms_output.put_line('TABLE LEASE_TYPE EXISTS');
ELSE
    dbms_output.put_line('TABLE LEASE_TYPE DOES NOT EXIST, CREATING TABLE');
     EXECUTE IMMEDIATE 'create table lease_type (
id int GENERATED ALWAYS AS IDENTITY START WITH 1 INCREMENT BY 1,
lease_period varchar(30),
max_cosigners int)';

    EXECUTE IMMEDIATE 'alter table lease_type add constraint lease_type_pk primary key(id)';
END IF;
    EXECUTE IMMEDIATE 'Insert into LEASE_TYPE (LEASE_PERIOD,MAX_COSIGNERS) values (''6m'',2)';
    EXECUTE IMMEDIATE 'Insert into LEASE_TYPE (LEASE_PERIOD,MAX_COSIGNERS) values (''12m'',4)';
    EXECUTE IMMEDIATE 'Insert into LEASE_TYPE (LEASE_PERIOD,MAX_COSIGNERS) values (''18m'',2)';
    EXECUTE IMMEDIATE 'Insert into LEASE_TYPE (LEASE_PERIOD,MAX_COSIGNERS) values (''6m'',3)';
    EXECUTE IMMEDIATE 'Insert into LEASE_TYPE (LEASE_PERIOD,MAX_COSIGNERS) values (''2y'',2)';


SELECT 
  count(*) into nCount 
FROM 
  user_tables 
where 
  table_name = 'PROPERTY_TYPE';
IF(nCount > 0) 
THEN 
dbms_output.put_line('TABLE PROPERTY_TYPE EXISTS');
ELSE
    dbms_output.put_line('TABLE PROPERTY_TYPE DOES NOT EXIST, CREATING TABLE');
    EXECUTE IMMEDIATE 'create table property_type (
id int GENERATED ALWAYS AS IDENTITY START WITH 1 INCREMENT BY 1,
type varchar(50),
beds int,
baths int)';
    EXECUTE IMMEDIATE 'alter table property_type add constraint property_type_pk primary key(id)';
END IF;
    EXECUTE IMMEDIATE 'Insert into PROPERTY_TYPE (TYPE,BEDS,BATHS) values (''APARTMENT'',2,1)';
    EXECUTE IMMEDIATE 'Insert into PROPERTY_TYPE (TYPE,BEDS,BATHS) values (''APARTMENT'',2,2)';
    EXECUTE IMMEDIATE 'Insert into PROPERTY_TYPE (TYPE,BEDS,BATHS) values (''APARTMENT'',3,2)';
    EXECUTE IMMEDIATE 'Insert into PROPERTY_TYPE (TYPE,BEDS,BATHS) values (''HOUSE'',4,2)';
    EXECUTE IMMEDIATE 'Insert into PROPERTY_TYPE (TYPE,BEDS,BATHS) values (''OUTHOUSE'',1,1)';



SELECT 
  count(*) into nCount 
FROM 
  user_tables 
where 
  table_name = 'TAGS';
IF(nCount > 0) 
THEN 
dbms_output.put_line('TABLE TAGS EXISTS');
ELSE
    dbms_output.put_line('TABLE TAGS DOES NOT EXIST, CREATING TABLE');
    EXECUTE IMMEDIATE 'create table tags (
id int GENERATED ALWAYS AS IDENTITY START WITH 1 INCREMENT BY 1,
tag varchar2(50))';
EXECUTE IMMEDIATE 'alter table tags add constraint tags_pk primary key(id)';
END IF;
    EXECUTE IMMEDIATE 'Insert into TAGS (TAG) values (''STUDENT_FRIENDLY'')';
    EXECUTE IMMEDIATE 'Insert into TAGS (TAG) values (''PROFESSIONALS ONLY'')';
    EXECUTE IMMEDIATE 'Insert into TAGS (TAG) values (''PET FRIENDLY'')';
    EXECUTE IMMEDIATE 'Insert into TAGS (TAG) values (''RECENTLY RENOVATED'')';

SELECT 
  count(*) into nCount 
FROM 
  user_tables 
where 
  table_name = 'CITY';
IF(nCount > 0) 
THEN 
dbms_output.put_line('TABLE CITY EXISTS');
ELSE
    dbms_output.put_line('TABLE CITY DOES NOT EXIST, CREATING TABLE');
    EXECUTE IMMEDIATE 'create table city (
id int GENERATED ALWAYS AS IDENTITY START WITH 1 INCREMENT BY 1,
name varchar(50) not null,
state_id int references state(id))';
EXECUTE IMMEDIATE 'alter table city add constraint city_pk primary key(id)';
END IF;
    EXECUTE IMMEDIATE 'Insert into CITY (NAME,STATE_ID) values (''Boston'',(select id from state where name = ''MA''))';
    EXECUTE IMMEDIATE 'Insert into CITY (NAME,STATE_ID) values (''New York'',(select id from state where name = ''NY''))';
    EXECUTE IMMEDIATE 'Insert into CITY (NAME,STATE_ID) values (''Los Angeles'',(select id from state where name = ''CA''))';
    EXECUTE IMMEDIATE 'Insert into CITY (NAME,STATE_ID) values (''Charlotte'',(select id from state where name = ''NC''))';
    EXECUTE IMMEDIATE 'Insert into CITY (NAME,STATE_ID) values (''Dallas'',(select id from state where name = ''TX''))';

SELECT 
  count(*) into nCount 
FROM 
  user_tables 
where 
  table_name = 'STREET';
IF(nCount > 0) 
THEN 
dbms_output.put_line('TABLE STREET EXISTS');
ELSE
    dbms_output.put_line('TABLE STREET DOES NOT EXIST, CREATING TABLE');
    EXECUTE IMMEDIATE 'create table street (
id int GENERATED ALWAYS AS IDENTITY START WITH 1 INCREMENT BY 1,
name varchar(50) not null,
city_id int references city(id))';
EXECUTE IMMEDIATE 'alter table street add constraint street_pk primary key(id)';
END IF;
    EXECUTE IMMEDIATE 'Insert into STREET (NAME,CITY_ID) values (''Huntington Ave'',(select id from city where name = ''Boston''))';
    EXECUTE IMMEDIATE 'Insert into STREET (NAME,CITY_ID) values (''Bedford St'',(select id from city where name = ''New York''))';
    EXECUTE IMMEDIATE 'Insert into STREET (NAME,CITY_ID) values (''Hollywood Boulevard'',(select id from city where name = ''Los Angeles''))';
    EXECUTE IMMEDIATE 'Insert into STREET (NAME,CITY_ID) values (''Josh Birmingham Pkwy'',(select id from city where name = ''Charlotte''))';
    EXECUTE IMMEDIATE 'Insert into STREET (NAME,CITY_ID) values (''Mountain Creek Pkwy'',(select id from city where name = ''Dallas''))';


SELECT 
  count(*) into nCount 
FROM 
  user_tables 
where 
  table_name = 'ADDRESS';
IF(nCount > 0) 
THEN 
dbms_output.put_line('TABLE ADDRESS EXISTS');
ELSE
    dbms_output.put_line('TABLE ADDRESS DOES NOT EXIST, CREATING TABLE');
    EXECUTE IMMEDIATE 'create table address (
id int GENERATED ALWAYS AS IDENTITY START WITH 1 INCREMENT BY 1,
door_no int,
State_id int references state(id),
city_id int references city(id), 
street_id int references street(id),
country_id int references country(id))';

EXECUTE IMMEDIATE 'alter table address add constraint address_pk primary key(id)';
END IF;
    EXECUTE IMMEDIATE 'Insert into ADDRESS (DOOR_NO, STATE_ID, CITY_ID, STREET_ID, COUNTRY_ID) values (76, (select id from STATE where name = ''MA''), (select id from CITY where name = ''Boston''), (select id from STREET where name = ''Huntington Ave''), (select id from COUNTRY where name = ''US''))';
    EXECUTE IMMEDIATE 'Insert into ADDRESS (DOOR_NO, STATE_ID, CITY_ID, STREET_ID, COUNTRY_ID) values (90,(select id from STATE where name = ''NY''), (select id from CITY where name = ''New York''), (select id from STREET where name = ''Bedford St''), (select id from COUNTRY where name = ''US''))';
    EXECUTE IMMEDIATE 'Insert into ADDRESS (DOOR_NO, STATE_ID, CITY_ID, STREET_ID, COUNTRY_ID) values (12,(select id from STATE where name = ''CA''), (select id from CITY where name = ''Los Angeles''), (select id from STREET where name = ''Hollywood Boulevard''), (select id from COUNTRY where name = ''US''))';
    EXECUTE IMMEDIATE 'Insert into ADDRESS (DOOR_NO, STATE_ID, CITY_ID, STREET_ID, COUNTRY_ID) values (3000,(select id from STATE where name = ''TX''), (select id from CITY where name = ''Dallas''), (select id from STREET where name = ''Mountain Creek Pkwy''), (select id from COUNTRY where name = ''US''))';
    EXECUTE IMMEDIATE 'Insert into ADDRESS (DOOR_NO, STATE_ID, CITY_ID, STREET_ID, COUNTRY_ID) values (5501,(select id from STATE where name = ''NC''), (select id from CITY where name = ''Charlotte''), (select id from STREET where name = ''Josh Birmingham Pkwy''), (select id from COUNTRY where name = ''US''))';


SELECT
count(*) into nCount
FROM
user_tables
where
table_name = 'MANAGEMENT';
IF(nCount > 0) THEN
dbms_output.put_line('TABLE MANAGEMENT EXISTS');
ELSE
    dbms_output.put_line('TABLE MANAGEMENT DOES NOT EXIST, CREATING TABLE');
    EXECUTE IMMEDIATE 'create table management (
id int GENERATED ALWAYS AS IDENTITY START WITH 1 INCREMENT BY 1,
first_name varchar2(50),
last_name varchar2(50) not null,
zip_code number(5) not null,
pay decimal,
contact number(10) not null,
password varchar2(30) not null,
door_no int,
State_id int references state(id),
city_id int references city(id), 
street_id int references street(id),
country_id int references country(id))';
EXECUTE IMMEDIATE 'alter table management add constraint management_pk primary key(id)';
END IF;
EXECUTE IMMEDIATE 'Insert into MANAGEMENT (first_name,last_name,zip_code,pay,contact, password, door_no, State_id, city_id, street_id, country_id) VALUES (''Scott'', ''black'', 02122, 1000, 6172435672, ''asdfg'', 76, (select ID from STATE where NAME=''MA''), (select ID from CITY where NAME=''Boston''), (select ID from STREET where NAME=''Huntington Ave''), (select ID from COUNTRY where NAME=''US''))';
EXECUTE IMMEDIATE 'Insert into MANAGEMENT (first_name,last_name,zip_code,pay,contact, password, door_no, State_id, city_id, street_id, country_id) VALUES (''Maria'', ''Chen'', 02124, 2000,6174238932, ''ghjkl'', 90, (select ID from STATE where NAME=''NC''), (select ID from CITY where NAME=''Charlotte''), (select ID from STREET where NAME=''Beresford Road''), (select ID from COUNTRY where NAME=''US''))';
EXECUTE IMMEDIATE 'Insert into MANAGEMENT (first_name,last_name,zip_code,pay,contact, password, door_no, State_id, city_id, street_id, country_id) VALUES (''Jeff'', ''Blue'', 02123, 1500,6172346575, ''poiuy'', 12, (select ID from STATE where NAME=''TX''), (select ID from CITY where NAME=''Dallas''), (select ID from STREET where NAME=''Main Street District''), (select ID from COUNTRY where NAME=''US''))';


SELECT count(*) into nCount FROM user_tables where table_name = 'USERS';
IF(nCount > 0)
THEN
dbms_output.put_line('TABLE USERS EXISTS');
ELSE
    dbms_output.put_line('TABLE USERS DOES NOT EXIST, CREATING TABLE');
    EXECUTE IMMEDIATE 'create table USERS (
id int GENERATED ALWAYS AS IDENTITY START WITH 1 INCREMENT BY 1,
first_name varchar2(40),
last_name varchar2(40) not null,
zip_code number not null,
contact number(10) not null, 
email varchar2(100) not null,
password varchar(50) not null,
is_poster number(1) not null check(is_poster in (0,1)),
is_buyer number(1) not null check(is_buyer in (0,1)),
is_owner number(1) not null check(is_owner in (0,1)), 
date_joined date not null,
last_activity date,
door_no int,
State_id int references state(id),
city_id int references city(id), 
street_id int references street(id),
country_id int references country(id))';
EXECUTE IMMEDIATE 'alter table USERS add constraint cust_pk primary key(id)';
END IF;
EXECUTE IMMEDIATE ' Insert into USERS(first_name,last_name, zip_code, contact, email, password, is_poster, is_buyer,is_owner, date_joined, last_activity, door_no, State_id, city_id, street_id, country_id) VALUES (''Jake'', ''chiz'', 03130, 6174379802, ''jakechiz@gmail.com'', ''qwert'', 0,0,1, ''23-FEB-13'', ''18-mar-22'', 76, (select ID from STATE where NAME=''MA''), (select ID from CITY where NAME=''Boston''), (select ID from STREET where NAME=''Huntington Ave''), (select ID from COUNTRY where NAME=''US''))';
EXECUTE IMMEDIATE ' Insert into USERS(first_name,last_name, zip_code, contact, email, password, is_poster, is_buyer,is_owner, date_joined, last_activity, door_no, State_id, city_id, street_id, country_id) VALUES (''Jen'', ''Lopez'', 03131, 6174379803, ''jen@gmail.com'', ''trewq'', 0,0,1, ''12-mar-17'', ''10-mar-21'', 90, (select ID from STATE where NAME=''NC''), (select ID from CITY where NAME=''Charlotte''), (select ID from STREET where NAME=''Beresford Road''), (select ID from COUNTRY where NAME=''US''))';
EXECUTE IMMEDIATE ' Insert into USERS(first_name,last_name, zip_code, contact, email, password, is_poster, is_buyer,is_owner, date_joined, last_activity, door_no, State_id, city_id, street_id, country_id) VALUES (''Rana '', ''red '', 03132, 6164378902, ''rana@gmail.com'', ''yhnmju'', 0,0,0, ''23-aug-15'', ''19-jan-22'', 12, (select ID from STATE where NAME=''TX''), (select ID from CITY where NAME=''Dallas''), (select ID from STREET where NAME=''Main Street District''), (select ID from COUNTRY where NAME=''US''))';
EXECUTE IMMEDIATE ' Insert into USERS(first_name,last_name, zip_code, contact, email, password, is_poster, is_buyer,is_owner, date_joined, last_activity, door_no, State_id, city_id, street_id, country_id) VALUES (''shar'', ''Mary '', 03133, 6172379812, ''shar@yahoo.com'', ''nmbvc'', 1,1,0, ''3-oct-13'', ''18-mar-15'', 77, (select ID from STATE where NAME=''MA''), (select ID from CITY where NAME=''Boston''), (select ID from STREET where NAME=''Huntington Ave''), (select ID from COUNTRY where NAME=''US''))';
EXECUTE IMMEDIATE ' Insert into USERS(first_name,last_name, zip_code, contact, email, password, is_poster, is_buyer,is_owner, date_joined, last_activity, door_no, State_id, city_id, street_id, country_id) VALUES (''pink'', ''bhara'', 03134, 6874397820, ''pink@yahoo.com'', ''ijnmkl'', 0,1,1, ''5-dec-09'', ''8-jun-22'', 91, (select ID from STATE where NAME=''NC''), (select ID from CITY where NAME=''Charlotte''), (select ID from STREET where NAME=''Beresford Road''), (select ID from COUNTRY where NAME=''US'') )';
EXECUTE IMMEDIATE ' Insert into USERS(first_name,last_name, zip_code, contact, email, password, is_poster, is_buyer,is_owner, date_joined, last_activity, door_no, State_id, city_id, street_id, country_id) VALUES (''mouk'', ''mana'', 03120, 6564736212, ''mouk@gmail.com'', ''sdfgtbt'', 0,1,1, ''23-feb-13'', ''15-apr-22 '', 13, (select ID from STATE where NAME=''TX''), (select ID from CITY where NAME=''Dallas''), (select ID from STREET where NAME=''Main Street District''), (select ID from COUNTRY where NAME=''US''))';
EXECUTE IMMEDIATE ' Insert into USERS(first_name,last_name, zip_code, contact, email, password, is_poster, is_buyer,is_owner, date_joined, last_activity, door_no, State_id, city_id, street_id, country_id) VALUES (''sam'', ''kodu'', 04130, 6178321899, ''samk@gmail.com'', ''nmxzc'', 0,1,0, ''14-nov-20'', ''6-feb-22'', 78, (select ID from STATE where NAME=''MA''), (select ID from CITY where NAME=''Boston''), (select ID from STREET where NAME=''Huntington Ave''), (select ID from COUNTRY where NAME=''US''))';
EXECUTE IMMEDIATE ' Insert into USERS(first_name,last_name, zip_code, contact, email, password, is_poster, is_buyer,is_owner, date_joined, last_activity, door_no, State_id, city_id, street_id, country_id) VALUES (''percy'', ''jack'', 03310, 6178929983, ''percy@gmail.com'', ''bhnjm'', 0,1,1, ''17-July-21'', ''1-apr-22 '', 92, (select ID from STATE where NAME=''NC''), (select ID from CITY where NAME=''Charlotte''), (select ID from STREET where NAME=''Beresford Road''), (select ID from COUNTRY where NAME=''US''))';
EXECUTE IMMEDIATE ' Insert into USERS(first_name,last_name, zip_code, contact, email, password, is_poster, is_buyer,is_owner, date_joined, last_activity, door_no, State_id, city_id, street_id, country_id) VALUES (''jack'', ''chiz'', 08930, 7174338102, ''jack@gmail.com'', ''cvfdrt'', 1,0,0, ''5-sep-19'', ''18-may-21 '', 14, (select ID from STATE where NAME=''TX''), (select ID from CITY where NAME=''Dallas''), (select ID from STREET where NAME=''Main Street District''), (select ID from COUNTRY where NAME=''US''))';
EXECUTE IMMEDIATE ' Insert into USERS(first_name,last_name, zip_code, contact, email, password, is_poster, is_buyer,is_owner, date_joined, last_activity, door_no, State_id, city_id, street_id, country_id) VALUES (''ju'', ''lee'', 03480, 6179279002, ''julee@gmail.com'', ''qazxw'', 1,0,1, ''2-feb-22'', ''14-apr-22 '', 79, (select ID from STATE where NAME=''MA''), (select ID from CITY where NAME=''Boston''), (select ID from STREET where NAME=''Huntington Ave''), (select ID from COUNTRY where NAME=''US''))';
EXECUTE IMMEDIATE ' Insert into USERS(first_name,last_name, zip_code, contact, email, password, is_poster, is_buyer,is_owner, date_joined, last_activity, door_no, State_id, city_id, street_id, country_id) VALUES (''jai'', ''kolla'', 03210, 6174659866, ''jaikolla@gmail.com'', ''mliop'', 1,1,0, ''12-dec-11'', ''18-mar-20 '', 93, (select ID from STATE where NAME=''NC''), (select ID from CITY where NAME=''Charlotte''), (select ID from STREET where NAME=''Beresford Road''), (select ID from COUNTRY where NAME=''US''))';
EXECUTE IMMEDIATE ' Insert into USERS(first_name,last_name, zip_code, contact, email, password, is_poster, is_buyer,is_owner, date_joined, last_activity, door_no, State_id, city_id, street_id, country_id) VALUES (''seth'', ''Rodriguez'', 03130, 6177863302, ''sethr@gmail.com'', ''bgtvfr'', 1,1,1, ''5-feb-17'', ''18-jul-20 '', 15, (select ID from STATE where NAME=''TX''), (select ID from CITY where NAME=''Dallas''), (select ID from STREET where NAME=''Main Street District''), (select ID from COUNTRY where NAME=''US''))';
EXECUTE IMMEDIATE ' Insert into USERS(first_name,last_name, zip_code, contact, email, password, is_poster, is_buyer,is_owner, date_joined, last_activity, door_no, State_id, city_id, street_id, country_id) VALUES (''mako'', ''xu'', 03310, 6178219642, ''thalia@yahoo.com'', ''yhgtf'', 0,0,1, ''2-feb-21'', ''18-jan-22 '', 80, (select ID from STATE where NAME=''MA''), (select ID from CITY where NAME=''Boston''), (select ID from STREET where NAME=''Huntington Ave''), (select ID from COUNTRY where NAME=''US''))';
EXECUTE IMMEDIATE ' Insert into USERS(first_name,last_name, zip_code, contact, email, password, is_poster, is_buyer,is_owner, date_joined, last_activity, door_no, State_id, city_id, street_id, country_id) VALUES (''monica'', ''geller'', 03130, 8274389806, ''mgeller@yahoo.com'', ''fderst'', 0,1,0, ''3-sep-21'', ''1-mar-22'', 94, (select ID from STATE where NAME=''NC''), (select ID from CITY where NAME=''Charlotte''), (select ID from STREET where NAME=''Beresford Road''), (select ID from COUNTRY where NAME=''US'') )';
EXECUTE IMMEDIATE ' Insert into USERS(first_name,last_name, zip_code, contact, email, password, is_poster, is_buyer,is_owner, date_joined, last_activity, door_no, State_id, city_id, street_id, country_id) VALUES (''ross'', ''geller'', 03130, 5478379442, ''gross@gmail.com'', ''mkofgt'', 1,1,0, ''23-nov-19'', ''18-feb-22 '', 16, (select ID from STATE where NAME=''TX''), (select ID from CITY where NAME=''Dallas''), (select ID from STREET where NAME=''Main Street District''), (select ID from COUNTRY where NAME=''US''))';
EXECUTE IMMEDIATE ' Insert into USERS(first_name,last_name, zip_code, contact, email, password, is_poster, is_buyer,is_owner, date_joined, last_activity, door_no, State_id, city_id, street_id, country_id) VALUES (''chandler'', ''bing'', 03113, 6874879882, ''cbing@yahoo.com'', ''qscvgy'', 1,1,0, ''16-sep-13'', ''18-mar-15 '', 81, (select ID from STATE where NAME=''MA''), (select ID from CITY where NAME=''Boston''), (select ID from STREET where NAME=''Huntington Ave''), (select ID from COUNTRY where NAME=''US''))';
EXECUTE IMMEDIATE ' Insert into USERS(first_name,last_name, zip_code, contact, email, password, is_poster, is_buyer,is_owner, date_joined, last_activity, door_no, State_id, city_id, street_id, country_id) VALUES (''Rachel'', ''green'', 03230, 5264334672, ''rachg@gmail.com'', ''bvgdjs'', 0,1,0, ''4-jan-19'', ''18-feb-21 '', 95, (select ID from STATE where NAME=''NC''), (select ID from CITY where NAME=''Charlotte''), (select ID from STREET where NAME=''Beresford Road''), (select ID from COUNTRY where NAME=''US''))';
EXECUTE IMMEDIATE ' Insert into USERS(first_name,last_name, zip_code, contact, email, password, is_poster, is_buyer,is_owner, date_joined, last_activity, door_no, State_id, city_id, street_id, country_id) VALUES (''Eric'', ''ping'', 07120, 6174129853, ''Eric@yahoo.com'', ''dhfwot'', 1,0,1, ''23-feb-20'', ''20-aug-20 '', 17, (select ID from STATE where NAME=''TX''), (select ID from CITY where NAME=''Dallas''), (select ID from STREET where NAME=''Main Street District''), (select ID from COUNTRY where NAME=''US''))';
EXECUTE IMMEDIATE ' Insert into USERS(first_name,last_name, zip_code, contact, email, password, is_poster, is_buyer,is_owner, date_joined, last_activity, door_no, State_id, city_id, street_id, country_id) VALUES (''james'', ''buck'', 05133, 8123379867, ''buck@gmail.com'', ''njsdh'', 0,1,1, ''8-jun-18'', ''18-jan-21'', 82, (select ID from STATE where NAME=''MA''), (select ID from CITY where NAME=''Boston''), (select ID from STREET where NAME=''Huntington Ave''), (select ID from COUNTRY where NAME=''US''))';
EXECUTE IMMEDIATE ' Insert into USERS(first_name,last_name, zip_code, contact, email, password, is_poster, is_buyer,is_owner, date_joined, last_activity, door_no, State_id, city_id, street_id, country_id) VALUES (''kyle'', ''downing'', 06133, 6114344833, ''kyled@gmail.com'', ''galsk'', 1,1,0, ''10-oct-21'', ''8-apr-22'', 96, (select ID from STATE where NAME=''NC''), (select ID from CITY where NAME=''Charlotte''), (select ID from STREET where NAME=''Beresford Road''), (select ID from COUNTRY where NAME=''US''))';
EXECUTE IMMEDIATE ' Insert into USERS(first_name,last_name, zip_code, contact, email, password, is_poster, is_buyer,is_owner, date_joined, last_activity, door_no, State_id, city_id, street_id, country_id) VALUES (''karthik'', ''challa'', 03133, 6174234805, ''kchalla@yahoo.com'', ''berthj'', 1,0,0, ''7-oct-21'', ''1-jan-22'', 18, (select ID from STATE where NAME=''TX''), (select ID from CITY where NAME=''Dallas''), (select ID from STREET where NAME=''Main Street District''), (select ID from COUNTRY where NAME=''US''))';
EXECUTE IMMEDIATE ' Insert into USERS(first_name,last_name, zip_code, contact, email, password, is_poster, is_buyer,is_owner, date_joined, last_activity, door_no, State_id, city_id, street_id, country_id) VALUES (''Phani'', ''kasuba'', 03130, 6177903503, ''phanik@gmail.com'', ''uiqwcn'', 0,0,1, ''15-dec-11'', ''8-nov-15'', 83, (select ID from STATE where NAME=''MA''), (select ID from CITY where NAME=''Boston''), (select ID from STREET where NAME=''Huntington Ave''), (select ID from COUNTRY where NAME=''US''))';
EXECUTE IMMEDIATE ' Insert into USERS(first_name,last_name, zip_code, contact, email, password, is_poster, is_buyer,is_owner, date_joined, last_activity, door_no, State_id, city_id, street_id, country_id) VALUES (''lola'', ''Jensen'', 02133, 9276274114, ''lola@yahoo.com'', ''juqlzi'', 1,0,1, ''19-jan-22'', ''18-feb-22'', 97, (select ID from STATE where NAME=''NC''), (select ID from CITY where NAME=''Charlotte''), (select ID from STREET where NAME=''Beresford Road''), (select ID from COUNTRY where NAME=''US''))';
EXECUTE IMMEDIATE ' Insert into USERS(first_name,last_name, zip_code, contact, email, password, is_poster, is_buyer,is_owner, date_joined, last_activity, door_no, State_id, city_id, street_id, country_id) VALUES (''ben'', ''schmitt'', 02133, 6192179822, ''bens@gmail.com'', ''yjdopl'', 1,1,1, ''30-sep-12'', ''1-jun-17'', 19, (select ID from STATE where NAME=''TX''), (select ID from CITY where NAME=''Dallas''), (select ID from STREET where NAME=''Main Street District''), (select ID from COUNTRY where NAME=''US''))';
EXECUTE IMMEDIATE ' Insert into USERS(first_name,last_name, zip_code, contact, email, password, is_poster, is_buyer,is_owner, date_joined, last_activity, door_no, State_id, city_id, street_id, country_id) VALUES (''Kim'', ''shaw'', 03140, 6174007818, ''shaw@gmail.com'', ''nkwofn'', 0,1,0, ''31-july-19'', ''18-jan-20'', 84, (select ID from STATE where NAME=''MA''), (select ID from CITY where NAME=''Boston''), (select ID from STREET where NAME=''Huntington Ave''), (select ID from COUNTRY where NAME=''US''))';


SELECT count(*) into nCount FROM user_tables where table_name = 'SUBSCRIPTIONS';
IF(nCount > 0)
THEN
dbms_output.put_line('TABLE SUBSCRIPTIONS EXISTS');
ELSE
    dbms_output.put_line('TABLE SUBSCRIPTIONS DOES NOT EXIST, CREATING TABLE');
    EXECUTE IMMEDIATE 'create table subscriptions (
subscription_id int GENERATED ALWAYS AS IDENTITY START WITH 1 INCREMENT BY 1,
START_DATE date,
subscription_end_date date,
status number(1) check(status in (0,1)),
user_id int references USERS(id))';

EXECUTE IMMEDIATE 'alter table subscriptions add constraint subscriptions_pk primary key(subscription_id)';
END IF;
EXECUTE IMMEDIATE ' Insert into SUBSCRIPTIONS(START_DATE,SUBSCRIPTION_END_DATE,STATUS,USER_ID) VALUES (''23-aug-15'',''23-aug-15'',1,(SELECT ID FROM USERS WHERE EMAIL=''jakechiz@gmail.com''))';
EXECUTE IMMEDIATE ' Insert into SUBSCRIPTIONS(START_DATE,SUBSCRIPTION_END_DATE,STATUS,USER_ID) VALUES (''23-aug-15'',''23-aug-15'',1,(SELECT ID FROM USERS WHERE EMAIL=''jen@gmail.com''))';
EXECUTE IMMEDIATE ' Insert into SUBSCRIPTIONS(START_DATE,SUBSCRIPTION_END_DATE,STATUS,USER_ID) VALUES (''23-aug-15'',''23-aug-15'',1,(SELECT ID FROM USERS WHERE EMAIL=''rana@gmail.com''))';
EXECUTE IMMEDIATE ' Insert into SUBSCRIPTIONS(START_DATE,SUBSCRIPTION_END_DATE,STATUS,USER_ID) VALUES (''23-aug-15'',''23-aug-15'',1,(SELECT ID FROM USERS WHERE EMAIL=''shar@yahoo.com''))';
EXECUTE IMMEDIATE ' Insert into SUBSCRIPTIONS(START_DATE,SUBSCRIPTION_END_DATE,STATUS,USER_ID) VALUES (''23-aug-15'',''23-aug-15'',1,(SELECT ID FROM USERS WHERE EMAIL=''pink@yahoo.com''))';
EXECUTE IMMEDIATE ' Insert into SUBSCRIPTIONS(START_DATE,SUBSCRIPTION_END_DATE,STATUS,USER_ID) VALUES (''23-aug-15'',''23-aug-15'',1,(SELECT ID FROM USERS WHERE EMAIL=''mouk@gmail.com''))';
EXECUTE IMMEDIATE ' Insert into SUBSCRIPTIONS(START_DATE,SUBSCRIPTION_END_DATE,STATUS,USER_ID) VALUES (''23-aug-15'',''23-aug-15'',1,(SELECT ID FROM USERS WHERE EMAIL=''samk@gmail.com''))';
EXECUTE IMMEDIATE ' Insert into SUBSCRIPTIONS(START_DATE,SUBSCRIPTION_END_DATE,STATUS,USER_ID) VALUES (''23-aug-15'',''23-aug-15'',1,(SELECT ID FROM USERS WHERE EMAIL=''percy@gmail.com''))';
EXECUTE IMMEDIATE ' Insert into SUBSCRIPTIONS(START_DATE,SUBSCRIPTION_END_DATE,STATUS,USER_ID) VALUES (''23-aug-15'',''23-aug-15'',1,(SELECT ID FROM USERS WHERE EMAIL=''jack@gmail.com''))';
EXECUTE IMMEDIATE ' Insert into SUBSCRIPTIONS(START_DATE,SUBSCRIPTION_END_DATE,STATUS,USER_ID) VALUES (''23-aug-15'',''23-aug-15'',1,(SELECT ID FROM USERS WHERE EMAIL=''julee@gmail.com''))';
EXECUTE IMMEDIATE ' Insert into SUBSCRIPTIONS(START_DATE,SUBSCRIPTION_END_DATE,STATUS,USER_ID) VALUES (''23-aug-15'',''23-aug-15'',1,(SELECT ID FROM USERS WHERE EMAIL=''jaikolla@gmail.com''))';
EXECUTE IMMEDIATE ' Insert into SUBSCRIPTIONS(START_DATE,SUBSCRIPTION_END_DATE,STATUS,USER_ID) VALUES (''23-aug-15'',''23-aug-15'',1,(SELECT ID FROM USERS WHERE EMAIL=''sethr@gmail.com''))';


SELECT count(*) into nCount FROM user_tables where table_name = 'LISTING';
IF(nCount > 0)
THEN
dbms_output.put_line('TABLE LISTING EXISTS');
ELSE
    dbms_output.put_line('TABLE LISTING DOES NOT EXIST, CREATING TABLE');
    EXECUTE IMMEDIATE 'create table LISTING (
id int GENERATED ALWAYS AS IDENTITY START WITH 1 INCREMENT BY 1,
user_id int references USERS(id),
is_premium char(1) check(is_premium in (''Y'',''N'')),
banner varchar2(40) not null,
descript varchar2(40) not null,
address_id int references address(id),
zip_code number not null,
rent number(9,2) not null,
deposit number(9,2),
brokerage number(10),
area_id int references area(id),
heat char(1) check(heat in (''Y'',''N'')),
hot_water char(1) check(hot_water in (''Y'',''N'')),
laundry char(1) check(laundry in (''Y'',''N'')),
date_available DATE,
lease_id int references lease_type(id),
property_type_id int references property_type(id),
date_posted DATE)';
EXECUTE IMMEDIATE 'alter table LISTING add constraint listID_pk primary key(id)';
END IF;
--EXECUTE IMMEDIATE 'Insert into LISTING(date_added, date_resolved, listing_id, comments, addressed_by, user_id) VALUES(''12-MAY-21'', ''15-MAY-21'', 2, ''issue with hot water'', 1, 4)';
EXECUTE IMMEDIATE 'Insert into LISTING ( user_id, is_premium, banner, descript, address_id, zip_code, rent, deposit, brokerage, area_id, heat, hot_water, laundry, date_available, lease_id, property_type_id, date_posted) VALUES ((SELECT ID FROM USERS WHERE EMAIL=''jakechiz@gmail.com''), ''Y'', ''LODHA'', ''3BHK'', (select ID from ADDRESS where DOOR_NO=76), 04140, 3000, 1500, 1500, (select ID from AREA where MIN_AREA = 100 AND MAX_AREA = 200), ''Y'', ''Y'', ''Y'',''13-may-22'', (select ID from LEASE_TYPE WHERE LEASE_PERIOD=''6m'' AND MAX_COSIGNERS=2), (select ID from PROPERTY_TYPE WHERE TYPE=''HOUSE'' AND BEDS = 4 AND BATHS=2), ''15-apr-22'')';
EXECUTE IMMEDIATE 'Insert into LISTING ( user_id, is_premium, banner, descript, address_id, zip_code, rent, deposit, brokerage, area_id, heat, hot_water, laundry, date_available, lease_id, property_type_id, date_posted) VALUES ((SELECT ID FROM USERS WHERE EMAIL=''mouk@gmail.com''), ''Y'', ''LODHA'', ''2BHK'', (select ID from ADDRESS where DOOR_NO=90), 04140, 2000, 1000, 1000, (select ID from AREA where MIN_AREA = 600 AND MAX_AREA = 700), ''Y'', ''Y'', ''N'', ''1-may-22'', (select ID from LEASE_TYPE WHERE LEASE_PERIOD=''12m''), (select ID from PROPERTY_TYPE WHERE TYPE=''APARTMENT'' AND BEDS = 2 AND BATHS = 2), ''15-apr-22'')';
EXECUTE IMMEDIATE 'Insert into LISTING ( user_id, is_premium, banner, descript, address_id, zip_code, rent, deposit, brokerage, area_id, heat, hot_water, laundry, date_available, lease_id, property_type_id, date_posted) VALUES ((SELECT ID FROM USERS WHERE EMAIL=''kyled@gmail.com''), ''Y'', ''MYHOME'', ''3BHK'', (select ID from ADDRESS where DOOR_NO=3000), 04141, 4000, 500, 2500, (select ID from AREA where MIN_AREA = 400 AND MAX_AREA = 500), ''Y'', ''Y'', ''Y'',''3-JUNE-20'', (select ID from LEASE_TYPE WHERE LEASE_PERIOD=''2y''), (select ID from PROPERTY_TYPE WHERE TYPE=''APARTMENT'' AND BEDS = 2 AND BATHS = 1), ''5-JAN-20'')';
EXECUTE IMMEDIATE 'Insert into LISTING ( user_id, is_premium, banner, descript, address_id, zip_code, rent, deposit, brokerage, area_id, heat, hot_water, laundry, date_available, lease_id, property_type_id, date_posted) VALUES ((SELECT ID FROM USERS WHERE EMAIL=''pink@yahoo.com''), ''Y'', ''MYHOME'', ''2BHK'', (select ID from ADDRESS where DOOR_NO=5501), 04141, 2500, 500, 1000, (select ID from AREA where MIN_AREA = 600 AND MAX_AREA = 700), ''Y'', ''Y'', ''N'', ''8-AUG-20'', (select ID from LEASE_TYPE WHERE LEASE_PERIOD=''18m''), (select ID from PROPERTY_TYPE WHERE TYPE=''HOUSE'' AND BEDS = 4 AND BATHS=2), ''12-MAR-20'')';
EXECUTE IMMEDIATE 'Insert into LISTING ( user_id, is_premium, banner, descript, address_id, zip_code, rent, deposit, brokerage,area_id, heat, hot_water, laundry, date_available, lease_id, property_type_id, date_posted) VALUES ((SELECT ID FROM USERS WHERE EMAIL=''lola@yahoo.com''), ''Y'', ''JVUE'', ''1BHK'', (select ID from ADDRESS where DOOR_NO=12), 02120, 2000, 1000, 1000, (select ID from AREA where MIN_AREA = 400 AND MAX_AREA = 500), ''Y'', ''Y'', ''N'', ''18-JUNE-22'', (select ID from LEASE_TYPE WHERE LEASE_PERIOD=''2y''), (select ID from PROPERTY_TYPE WHERE TYPE=''APARTMENT'' AND BEDS = 3 AND BATHS = 2), ''5-apr-22'')';


SELECT count(*) into nCount FROM user_tables where table_name = 'LISTING_STATUS';
IF(nCount > 0)
THEN
dbms_output.put_line('TABLE LISTING_STATUS EXISTS');
ELSE
    dbms_output.put_line('TABLE LISTING_STATUS DOES NOT EXIST, CREATING TABLE');
     EXECUTE IMMEDIATE 'create table listing_status (
id int GENERATED ALWAYS AS IDENTITY START WITH 1 INCREMENT BY 1,
is_available CHAR(1) DEFAULT ''Y'',
date_updated DATE,
updated_by int references management(id),
listing_id int references listing(id))';

EXECUTE IMMEDIATE 'alter table listing_status add constraint listing_status_pk primary key(id)';
EXECUTE IMMEDIATE 'alter table listing_status add constraint ck_available check(is_available in (''Y'',''N''))';

END IF;
EXECUTE IMMEDIATE 'Insert into LISTING_STATUS(IS_AVAILABLE, DATE_UPDATED, UPDATED_BY, LISTING_ID) VALUES(''Y'', ''15-MAY-21'',(SELECT ID FROM MANAGEMENT WHERE ZIP_CODE=02122), 1)';
EXECUTE IMMEDIATE 'Insert into LISTING_STATUS(IS_AVAILABLE, DATE_UPDATED, UPDATED_BY, LISTING_ID) VALUES(''N'', ''15-MAY-21'',(SELECT ID FROM MANAGEMENT WHERE ZIP_CODE=02124), 2)';
EXECUTE IMMEDIATE 'Insert into LISTING_STATUS(IS_AVAILABLE, DATE_UPDATED, UPDATED_BY, LISTING_ID) VALUES(''Y'', ''15-MAY-21'',(SELECT ID FROM MANAGEMENT WHERE ZIP_CODE=02123), 3)';
EXECUTE IMMEDIATE 'Insert into LISTING_STATUS(IS_AVAILABLE, DATE_UPDATED, UPDATED_BY, LISTING_ID) VALUES(''Y'', ''15-MAY-21'',(SELECT ID FROM MANAGEMENT WHERE ZIP_CODE=02123), 4)';
EXECUTE IMMEDIATE 'Insert into LISTING_STATUS(IS_AVAILABLE, DATE_UPDATED, UPDATED_BY, LISTING_ID) VALUES(''Y'', ''15-MAY-21'',(SELECT ID FROM MANAGEMENT WHERE ZIP_CODE=02122), 5)';

SELECT count(*) into nCount FROM user_tables where table_name = 'COMPLAINTS';
IF(nCount > 0)
THEN
dbms_output.put_line('TABLE COMPLAINTS EXISTS');
ELSE
    dbms_output.put_line('TABLE COMPLAINTS DOES NOT EXIST, CREATING TABLE');
    EXECUTE IMMEDIATE 'create table complaints(
id int GENERATED ALWAYS AS IDENTITY START WITH 1 INCREMENT BY 1,
date_added DATE,
date_resolved DATE,
listing_id int references listing(id) not null,
comments varchar2(100) not null,
addressed_by int references management(id) not null,
user_id int references USERS(id))';

EXECUTE IMMEDIATE 'alter table complaints add constraint complaints_pk primary key(id)';
END IF;
EXECUTE IMMEDIATE 'Insert into COMPLAINTS(date_added, date_resolved, listing_id, comments, addressed_by, user_id) VALUES(''12-MAY-21'', ''15-MAY-21'', 1, ''issue with hot water'', (SELECT ID FROM MANAGEMENT WHERE ZIP_CODE=02122), 4)';
EXECUTE IMMEDIATE 'Insert into COMPLAINTS(date_added, date_resolved, listing_id, comments, addressed_by, user_id) VALUES(''12-MAY-21'', ''15-MAY-21'', 3, ''issue with hot water'', (SELECT ID FROM MANAGEMENT WHERE ZIP_CODE=02123), 5)';


SELECT count(*) into nCount FROM user_tables where table_name = 'OFFER';
IF(nCount > 0)
THEN
dbms_output.put_line('TABLE OFFER EXISTS');
ELSE
    dbms_output.put_line('TABLE OFFER DOES NOT EXIST, CREATING TABLE');
END IF;
EXECUTE IMMEDIATE 'Insert into OFFER(USER_ID,LISTING_ID, DATE_ADDED, RENT, LEASE_PERIOD, MOVE_IN, STATUS,DATE_ADDRESSED,COMMENTS,DEAL) 
VALUES(4,1,''15-APR-22'', 2500, 24,''15-MAY-22'',''Y'',''15-APR-22'',''can be negotiated'', 0)';
EXECUTE IMMEDIATE 'Insert into OFFER(USER_ID,LISTING_ID, DATE_ADDED, RENT, LEASE_PERIOD, MOVE_IN, STATUS,DATE_ADDRESSED,COMMENTS,DEAL) 
VALUES(5,2,''15-APR-22'', 1500, 24,''15-JUN-22'',''Y'',''15-APR-22'',''can be negotiated'', 0)';
EXECUTE IMMEDIATE 'Insert into OFFER(USER_ID,LISTING_ID, DATE_ADDED, RENT, LEASE_PERIOD, MOVE_IN, STATUS,DATE_ADDRESSED,COMMENTS,DEAL) 
VALUES(6,3,''15-APR-22'', 1500, 24,''15-JUL-22'',''Y'',''15-APR-22'',''can be negotiated'', 0)';


SELECT count(*) into nCount FROM user_tables where table_name = 'LISTING_TAGS';
IF(nCount > 0)
THEN
dbms_output.put_line('TABLE LISITNG_TAGS EXISTS');
ELSE
    dbms_output.put_line('TABLE LISTING_TAGS DOES NOT EXIST, CREATING TABLE');
      EXECUTE IMMEDIATE 'create table listing_tags (
tag_id int NOT NULL REFERENCES TAGS(id),
listing_id int not null references listing(id))';
END IF;
EXECUTE IMMEDIATE 'Insert into LISTING_TAGS(listing_id, TAG_ID) VALUES(1, (select ID FROM TAGS WHERE TAG=''STUDENT_FRIENDLY''))';
EXECUTE IMMEDIATE 'Insert into LISTING_TAGS(listing_id, TAG_ID) VALUES(1, (select ID FROM TAGS WHERE TAG=''PROFESSIONALS ONLY''))';
EXECUTE IMMEDIATE 'Insert into LISTING_TAGS(listing_id, TAG_ID) VALUES(2, (select ID FROM TAGS WHERE TAG=''STUDENT_FRIENDLY''))';
EXECUTE IMMEDIATE 'Insert into LISTING_TAGS(listing_id, TAG_ID) VALUES(3, (select ID FROM TAGS WHERE TAG=''PET FRIENDLY''))';
EXECUTE IMMEDIATE 'Insert into LISTING_TAGS(listing_id, TAG_ID) VALUES(4, (select ID FROM TAGS WHERE TAG=''RECENTLY RENOVATED''))';
EXECUTE IMMEDIATE 'Insert into LISTING_TAGS(listing_id, TAG_ID) VALUES(4, (select ID FROM TAGS WHERE TAG=''PROFESSIONALS ONLY''))';

END;
