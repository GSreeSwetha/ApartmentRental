set serveroutput on;

--synonyms are session dependant

--select 'Create Synonym ' || table_name|| ' for ADMIN.' ||table_name||';' from all_tables where OWNER = 'ADMIN';
Create Synonym ADDRESS for ADMIN.ADDRESS;
Create Synonym AREA for ADMIN.AREA;
Create Synonym CITY for ADMIN.CITY;
Create Synonym CONCERNS for ADMIN.CONCERNS;
Create Synonym COUNTRY for ADMIN.COUNTRY;
Create Synonym LEASE_TYPE for ADMIN.LEASE_TYPE;
Create Synonym LISTING for ADMIN.LISTING;
Create Synonym LISTING_STATUS for ADMIN.LISTING_STATUS;
Create Synonym LISTING_TAGS for ADMIN.LISTING_TAGS;
Create Synonym MANAGEMENT for ADMIN.MANAGEMENT;
Create Synonym OFFER for ADMIN.OFFER;
Create Synonym PROPERTY_TYPE for ADMIN.PROPERTY_TYPE;
Create Synonym STATE for ADMIN.STATE;
Create Synonym STREET for ADMIN.STREET;
Create Synonym SUBSCRIPTIONS for ADMIN.SUBSCRIPTIONS;
Create Synonym TAGS for ADMIN.TAGS;
Create Synonym USERS for ADMIN.USERS;

--select 'Drop Synonym ' || table_name|| ';' from all_tables where OWNER = 'ADMIN';
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


--select * from all_tables where OWNER= 'ADMIN';
--select * from all_procedures where OWNER = 'ADMIN';

create synonym user_signup for ADMIN.user_signup;
create synonym user_login for ADMIN.user_login;
create synonym Premium_signup for ADMIN.Premium_signup;
create synonym Abandon_premium for ADMIN.Abandon_premium;


---execute user related operations
begin
user_signup('Pratt','Candy',3193,6173776781,'prattc@gmail.com','preoqpi',0,1,0,79,1,101,401,251,'Y');
end;

set serveroutput on;
begin
user_login('shar@yahoo.com','nmbvc');
user_login('sharyy@yahoo.com','nmbvc');
end;

set serveroutput on;
begin
premium_signup('shar@yahoo.com');
end;

set serveroutput on;
begin
Abandon_premium('shar@yahoo.com');
Abandon_premium('pink@yahoo.com');
end;

set serveroutput on;
begin
Update_ListingStatus('management','mariechen@gmail.com',3004,'Y');
end;

select * from users where email = 'shar@yahoo.com';
select * from subscriptions;





--
--select * from listing;
--update listing set Descript = '2BHK' where id = 3005;
--commit;
--select * from users;
--update users set last_name = 'chiza' where id = 2000;
--commit;



--Declare 
--cursor cur is SELECT table_name FROM all_tables where OWNER = 'ADMIN';
--begin
--FOR x IN cur
--    LOOP
--        EXECUTE IMMEDIATE 'CREATE SYNONYM ' ||x.table_name|| 'for ADMIN.' || x.table_name ;
--    END LOOP;
--    commit;
--end;
--
--declare
--tname all_tables.table_name%type;
--cursor cur is
--select table_name FROM all_tables where OWNER = 'ADMIN';
--begin
--open cur;
--loop
--    fetch cur into tname;
--    exit when cur%NOTFOUND;
--    EXECUTE IMMEDIATE 'CREATE SYNONYM ' ||tname|| 'for ADMIN.' || tname ;    
--end loop;
--close cur;
--end;
