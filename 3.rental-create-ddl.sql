set serveroutput on;
DECLARE
nCount NUMBER;
BEGIN

SELECT count(1) into nCount FROM user_tables where table_name = 'STATE';
IF(nCount > 0)
THEN
    DBMS_OUTPUT.PUT_LINE('TABLE STATE ALREADY EXISTS');
    EXECUTE IMMEDIATE 'DROP table STATE CASCADE CONSTRAINTS';
    DBMS_OUTPUT.PUT_LINE('DROPPED TABLE STATE');
END IF;
    EXECUTE IMMEDIATE 'create table state (id int GENERATED ALWAYS AS IDENTITY START WITH 1 INCREMENT BY 1,
    name varchar2(50) unique not null)';
    EXECUTE IMMEDIATE 'alter table state add constraint state_pk primary key(id)';

SELECT count(1) into nCount FROM user_tables where table_name = 'CITY';
IF(nCount > 0)
THEN
    DBMS_OUTPUT.PUT_LINE('TABLE CITY ALREADY EXISTS');
     EXECUTE IMMEDIATE 'DROP table CITY CASCADE CONSTRAINTS';
     DBMS_OUTPUT.PUT_LINE('DROPPED TABLE CITY');
END IF;
EXECUTE IMMEDIATE 'create table city (
id int GENERATED ALWAYS AS IDENTITY START WITH 101 INCREMENT BY 1,
name varchar(50) not null,
state_id int references state(id))';
EXECUTE IMMEDIATE 'alter table city add constraint city_pk primary key(id)';

SELECT count(1) into nCount FROM user_tables where table_name = 'COUNTRY';
IF(nCount > 0)
THEN
    DBMS_OUTPUT.PUT_LINE('TABLE COUNTRY ALREADY EXISTS');
     EXECUTE IMMEDIATE 'DROP table COUNTRY CASCADE CONSTRAINTS';
     DBMS_OUTPUT.PUT_LINE('DROPPED TABLE COUNTRY');
END IF;
EXECUTE IMMEDIATE 'create table COUNTRY (
id int GENERATED ALWAYS AS IDENTITY START WITH 251 INCREMENT BY 1,
name varchar(50) unique not null)';
EXECUTE IMMEDIATE 'alter table country add constraint country_pk primary key(id)';

SELECT
count(1) into nCount
FROM
user_tables
where
table_name = 'STREET';
IF(nCount > 0)
THEN
    DBMS_OUTPUT.PUT_LINE('TABLE STREET ALREADY EXISTS');
    EXECUTE IMMEDIATE 'DROP table STREET CASCADE CONSTRAINTS';
    DBMS_OUTPUT.PUT_LINE('DROPPED TABLE STREET');
END IF;
EXECUTE IMMEDIATE 'create table street (
id int GENERATED ALWAYS AS IDENTITY START WITH 401 INCREMENT BY 1,
name varchar(50) not null,
city_id int references city(id))';
EXECUTE IMMEDIATE 'alter table street add constraint street_pk primary key(id)';

SELECT count(1) into nCount FROM user_tables where table_name = 'ADDRESS';
IF(nCount > 0)
THEN
    DBMS_OUTPUT.PUT_LINE('TABLE ADDRESS ALREADY EXISTS');
     EXECUTE IMMEDIATE 'DROP table ADDRESS CASCADE CONSTRAINTS';
     DBMS_OUTPUT.PUT_LINE('DROPPED TABLE ADDRESS');
END IF;
    EXECUTE IMMEDIATE 'create table address (
id int GENERATED ALWAYS AS IDENTITY START WITH 600 INCREMENT BY 1,
door_no int,
State_id int references state(id),
city_id int references city(id), 
street_id int references street(id),
country_id int references country(id))';

EXECUTE IMMEDIATE 'alter table address add constraint address_pk primary key(id)';


SELECT count(1) into nCount FROM user_tables where table_name = 'AREA';
IF(nCount > 0)
THEN
    DBMS_OUTPUT.PUT_LINE('TABLE AREA ALREADY EXISTS');
     EXECUTE IMMEDIATE 'DROP table AREA CASCADE CONSTRAINTS';
     DBMS_OUTPUT.PUT_LINE('DROPPED TABLE AREA');
END IF;
    EXECUTE IMMEDIATE 'create table area (
id int GENERATED ALWAYS AS IDENTITY START WITH 900 INCREMENT BY 1,
min_area int,
max_area int)';

EXECUTE IMMEDIATE 'alter table area add constraint area_pk primary key(id)';

SELECT count(1) into nCount FROM user_tables where table_name = 'LEASE_TYPE';
IF(nCount > 0)
THEN
    DBMS_OUTPUT.PUT_LINE('TABLE LEASE_TYPE ALREADY EXISTS');
    EXECUTE IMMEDIATE 'DROP table LEASE_TYPE CASCADE CONSTRAINTS';
    DBMS_OUTPUT.PUT_LINE('DROPPED TABLE LEASE_TYPE');
END IF;
    EXECUTE IMMEDIATE 'create table lease_type (
id int GENERATED ALWAYS AS IDENTITY START WITH 1000 INCREMENT BY 1,
lease_period varchar(30),
max_cosigners int)';

EXECUTE IMMEDIATE 'alter table lease_type add constraint lease_type_pk primary key(id)';

SELECT count(1) into nCount FROM user_tables where table_name = 'PROPERTY_TYPE';
IF(nCount > 0)
THEN
    DBMS_OUTPUT.PUT_LINE('TABLE PROPERTY_TYPE ALREADY EXISTS');
    EXECUTE IMMEDIATE 'DROP table PROPERTY_TYPE CASCADE CONSTRAINTS';
     DBMS_OUTPUT.PUT_LINE('DROPPED PROPERT_TYPE TABLE');
END IF;
    EXECUTE IMMEDIATE 'create table property_type (
id int GENERATED ALWAYS AS IDENTITY START WITH 1200 INCREMENT BY 1,
type varchar(50),
beds int,
baths int)';

EXECUTE IMMEDIATE 'alter table property_type add constraint property_type_pk primary key(id)';


--Declare
--ncount number;
--BEGIN
SELECT count(1) into nCount FROM user_tables where table_name = 'MANAGEMENT';
IF(nCount > 0)
THEN
    DBMS_OUTPUT.PUT_LINE('TABLE MANAGEMENT ALREADY EXISTS');
    EXECUTE IMMEDIATE 'DROP table MANAGEMENT CASCADE CONSTRAINTS';
    DBMS_OUTPUT.PUT_LINE('DROPPED TABLE MANAGEMENT');
END IF;
EXECUTE IMMEDIATE 'create table management (
id int GENERATED ALWAYS AS IDENTITY START WITH 1400 INCREMENT BY 1,
first_name varchar2(50),
last_name varchar2(50) not null,
zip_code number not null,
pay decimal,
contact number(10) not null,
email varchar2(100) not null,
password varchar2(30) not null,
door_no int,
State_id int references state(id),
city_id int references city(id), 
street_id int references street(id),
country_id int references country(id))';

EXECUTE IMMEDIATE 'alter table management add constraint management_pk primary key(id)';
--end;

SELECT count(1) into nCount FROM user_tables where table_name = 'USERS';
IF(nCount > 0)
THEN
    DBMS_OUTPUT.PUT_LINE('TABLE USERS ALREADY EXISTS');
     EXECUTE IMMEDIATE 'DROP table USERS CASCADE CONSTRAINTS';
     DBMS_OUTPUT.PUT_LINE('DROPPED TABLE USERS');
END IF;
    EXECUTE IMMEDIATE 'create table USERS (
id int GENERATED ALWAYS AS IDENTITY START WITH 2000 INCREMENT BY 1,
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

SELECT
count(1) into nCount
FROM
user_tables
where
table_name = 'TAGS';
IF(nCount > 0)
THEN
DBMS_OUTPUT.PUT_LINE('TABLE TAGS ALREADY EXISTS');
EXECUTE IMMEDIATE 'DROP table TAGS CASCADE CONSTRAINTS';
DBMS_OUTPUT.PUT_LINE('TABLE TAGS DROPPED');
END IF;
EXECUTE IMMEDIATE 'create table tags (
id int GENERATED ALWAYS AS IDENTITY START WITH 1 INCREMENT BY 1,
tag varchar2(50))';
EXECUTE IMMEDIATE 'alter table tags add constraint tags_pk primary key(id)';

SELECT count(1) into nCount FROM user_tables where table_name = 'LISTING';
IF(nCount > 0)
THEN
    DBMS_OUTPUT.PUT_LINE('TABLE LISTING ALREADY EXISTS');
     EXECUTE IMMEDIATE 'DROP table LISTING CASCADE CONSTRAINTS';
 DBMS_OUTPUT.PUT_LINE('DROPPED TABLE LISTING');
END IF;
EXECUTE IMMEDIATE 'create table LISTING (
id int GENERATED ALWAYS AS IDENTITY START WITH 3001 INCREMENT BY 1,
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
--EXECUTE IMMEDIATE 'alter table LISTING add constraint ck_premium check(is_premium in (''Y'',''N''))';

SELECT count(1) into nCount FROM user_tables where table_name = 'LISTING_STATUS';
IF(nCount > 0)
THEN
    DBMS_OUTPUT.PUT_LINE('TABLE LISTING_STATUS ALREADY EXISTS');
     EXECUTE IMMEDIATE 'DROP table LISTING_STATUS CASCADE CONSTRAINTS';
     DBMS_OUTPUT.PUT_LINE('DROPPED TABLE LISTING_STATUS');
END IF;
    EXECUTE IMMEDIATE 'create table listing_status (
id int GENERATED ALWAYS AS IDENTITY START WITH 4001 INCREMENT BY 1,
is_available CHAR(1),
date_updated DATE,
updated_by int,
listing_id int references listing(id))';

EXECUTE IMMEDIATE 'alter table listing_status add constraint listing_status_pk primary key(id)';
EXECUTE IMMEDIATE 'alter table listing_status add constraint ck_available check(is_available in (''Y'',''N''))';

SELECT count(1) into nCount FROM user_tables where table_name = 'LISTING_TAGS';
IF(nCount > 0)
THEN
    DBMS_OUTPUT.PUT_LINE('TABLE Listing_TAGS ALREADY EXISTS');
     EXECUTE IMMEDIATE 'DROP table LISTING_TAGS CASCADE CONSTRAINTS';
     DBMS_OUTPUT.PUT_LINE('TABLE LISTING_TAGS DROPPED');
END IF;
    EXECUTE IMMEDIATE 'create table listing_tags (
listing_id int not null references listing(id),
tag_id int NOT NULL REFERENCES TAGS(id))';


SELECT count(1) into nCount FROM user_tables where table_name = 'SUBSCRIPTIONS';
IF(nCount > 0)
THEN
    DBMS_OUTPUT.PUT_LINE('TABLE SUBSCRIPTIONS ALREADY EXISTS');
     EXECUTE IMMEDIATE 'DROP table SUBSCRIPTIONS CASCADE CONSTRAINTS';
     DBMS_OUTPUT.PUT_LINE('TABLE SUBSCRIPTIONS DROPPED');
END IF;
    EXECUTE IMMEDIATE 'create table subscriptions (
subscription_id int GENERATED ALWAYS AS IDENTITY START WITH 4201 INCREMENT BY 1,
START_DATE date,
subscription_end_date date,
status number(1) check(status in (0,1)),
user_id int references USERS(id))';

EXECUTE IMMEDIATE 'alter table subscriptions add constraint subscriptions_pk primary key(subscription_id)';

--DECLARE
--nCount NUMBER;
--BEGIN
SELECT count(1) into nCount FROM user_tables where table_name = 'CONCERNS';
IF(nCount > 0) 
    THEN DBMS_OUTPUT.PUT_LINE('TABLE CONCERNS ALREADY EXISTS');
         EXECUTE IMMEDIATE 'DROP table CONCERNS CASCADE CONSTRAINTS';
         DBMS_OUTPUT.PUT_LINE('TABLE CONCERNS DROPPED');
END IF;
EXECUTE IMMEDIATE 'create table CONCERNS(
id int GENERATED ALWAYS AS IDENTITY START WITH 5201 INCREMENT BY 1,
date_added DATE,
date_resolved DATE,
listing_id int references listing(id) not null,
comments varchar2(100),
ctype varchar2(1) check(ctype in (''Q'',''C'')),
addressed_by int ,
solution varchar2(100),
user_id int references USERS(id))';

EXECUTE IMMEDIATE 'alter table CONCERNS add constraint concerns_pk primary key(id)';
--addressed_by int references management(id),
--end;

SELECT count(1) into nCount FROM user_tables where table_name = 'OFFER';
IF(nCount > 0) THEN 
     DBMS_OUTPUT.PUT_LINE('TABLE OFFER ALREADY EXISTS');
     EXECUTE IMMEDIATE 'DROP table OFFER CASCADE CONSTRAINTS';
     DBMS_OUTPUT.PUT_LINE('DROPPED TABLE OFFER');
END IF;
EXECUTE IMMEDIATE 'create table offer(
id int GENERATED ALWAYS AS IDENTITY START WITH 6001 INCREMENT BY 1,
user_id int references USERS(id) not null,
listing_id int references listing(id) not null,
date_added date,
rent number(9,2),
lease_period NUMBER(3),
move_in DATE,
status CHAR(1),
date_addressed DATE,
comments varchar2(100),
DEAL number(1) check(DEAL in (1,0)))';

EXECUTE IMMEDIATE 'alter table offer add constraint offer_pk primary key(id)';
EXECUTE IMMEDIATE 'alter table offer add constraint ck_status check(status in (''Y'',''N''))';

END;
