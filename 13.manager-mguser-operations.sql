set serveroutput on;

--synonyms are session dependant

--select 'Create Synonym ' || table_name|| ' for RENTALADMIN.' ||table_name||';' from all_tables where OWNER = 'RENTALADMIN';
Create Synonym ADDRESS for RENTALADMIN.ADDRESS;
Create Synonym AREA for RENTALADMIN.AREA;
Create Synonym CITY for RENTALADMIN.CITY;
Create Synonym CONCERNS for RENTALADMIN.CONCERNS;
Create Synonym COUNTRY for RENTALADMIN.COUNTRY;
Create Synonym LEASE_TYPE for RENTALADMIN.LEASE_TYPE;
Create Synonym LISTING for RENTALADMIN.LISTING;
Create Synonym LISTING_STATUS for RENTALADMIN.LISTING_STATUS;
Create Synonym LISTING_TAGS for RENTALADMIN.LISTING_TAGS;
Create Synonym MANAGEMENT for RENTALADMIN.MANAGEMENT;
Create Synonym OFFER for RENTALADMIN.OFFER;
Create Synonym PROPERTY_TYPE for RENTALADMIN.PROPERTY_TYPE;
Create Synonym STATE for RENTALADMIN.STATE;
Create Synonym STREET for RENTALADMIN.STREET;
Create Synonym SUBSCRIPTIONS for RENTALADMIN.SUBSCRIPTIONS;
Create Synonym TAGS for RENTALADMIN.TAGS;
Create Synonym USERS for RENTALADMIN.USERS;



--select 'Drop Synonym ' || table_name|| ';' from all_tables where OWNER = 'RENTALADMIN';
--Drop Synonym ADDRESS;
--Drop Synonym AREA;
--Drop Synonym CITY;
--Drop Synonym CONCERNS;
--Drop Synonym COUNTRY;
--Drop Synonym LEASE_TYPE;
--Drop Synonym LISTING;
--Drop Synonym LISTING_STATUS;
--Drop Synonym LISTING_TAGS;
--Drop Synonym MANAGEMENT;
--Drop Synonym OFFER;
--Drop Synonym PROPERTY_TYPE;
--Drop Synonym STATE;
--Drop Synonym STREET;
--Drop Synonym SUBSCRIPTIONS;
--Drop Synonym TAGS;
--Drop Synonym USERS;
--Drop Synonym GRID;
--Drop Synonym NYC_PARKING_LOT;
--Drop Synonym PTURN;


--select * from all_tables where OWNER= 'RENTALADMIN';
--select * from all_procedures where OWNER = 'RENTALADMIN';

create synonym user_signup for RENTALADMIN.user_signup;
create synonym user_login for RENTALADMIN.user_login;
create synonym Premium_signup for RENTALADMIN.Premium_signup;
create synonym Abandon_premium for RENTALADMIN.Abandon_premium;
create synonym Listing_actions for RENTALADMIN.Listing_actions;
create synonym Address_Complaint for RENTALADMIN.Address_Complaint;

---execute user related operations
begin
user_signup('Pratt','Candy',3193,6173776781,'prattc@gmail.com','preoqpi',0,1,0,79,1,101,401,251,'Y');
end;
select * from users;

set serveroutput on;
begin
--user_login('shar@yahoo.com','nmbvc');
--user_login('sharyy@yahoo.com','nmbvc');
user_login('shar@yahoo.com','fsfghfg');
end;

set serveroutput on;
begin
premium_signup('shar@yahoo.com');
end;

set serveroutput on;
begin
--Abandon_premium('shar@yahoo.com');
Abandon_premium('pink@yahoo.com');
end;

set serveroutput on;
begin
Listing_actions.Update_ListingStatus('management','mariechen@gmail.com',3004,'Y');
end;

select * from users where email = 'shar@yahoo.com';
select * from subscriptions;


select  * from listing_status;
select * from management;

set serveroutput on;
begin
Listing_actions.Update_ListingTags(3004,'RIVERSIDE VIEW');
end;

select * from listing_tags;
select * from tags;



set serveroutput on;
begin
Address_Complaint('mariechen@gmail.com',5201,'KLM');
end;


select * from concerns;
--
--select * from listing;
--update listing set Descript = '2BHK' where id = 3005;
--commit;
--select * from users;
--update users set last_name = 'chiza' where id = 2000;
--commit;



--Declare 
--cursor cur is SELECT table_name FROM all_tables where OWNER = 'RENTALADMIN';
--begin
--FOR x IN cur
--    LOOP
--        EXECUTE IMMEDIATE 'CREATE SYNONYM ' ||x.table_name|| 'for RENTALADMIN.' || x.table_name ;
--    END LOOP;
--    commit;
--end;
--
--declare
--tname all_tables.table_name%type;
--cursor cur is
--select table_name FROM all_tables where OWNER = 'RENTALADMIN';
--begin
--open cur;
--loop
--    fetch cur into tname;
--    exit when cur%NOTFOUND;
--    EXECUTE IMMEDIATE 'CREATE SYNONYM ' ||tname|| 'for RENTALADMIN.' || tname ;    
--end loop;
--close cur;
--end;
