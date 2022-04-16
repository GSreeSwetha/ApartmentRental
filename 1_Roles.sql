set serveroutput on;

Declare 
ncount number;
BEGIN
	select count(1) into ncount from all_users where username = 'RENTALADMIN';
	if (ncount>0) THEN
		dbms_output.put_line('USER RENTALADMIN ALREADY EXISTS');
	else EXECUTE IMMEDIATE 'create user rentalAdmin identified by GCQiRbpWBk1q';
		 EXECUTE IMMEDIATE 'GRANT CONNECT,RESOURCE to rentalAdmin';
		 EXECUTE IMMEDIATE 'GRANT UNLIMITED TABLESPACE TO rentalAdmin';
		 EXECUTE IMMEDIATE 'Grant create view, create sequence,create trigger, create procedure to rentalAdmin';
		 EXECUTE IMMEDIATE 'GRANT CREATE user to rentalAdmin';
         EXECUTE IMMEDIATE 'GRANT CREATE role to rentalAdmin';
		 EXECUTE IMMEDIATE 'GRANT CREATE SESSION,connect TO rentalAdmin';
		 end if;
end;		 
/
---------------------------------------------------------------------------------------------

------------------------------------roles----------------------------------------------------

------------------------------------roleManager----------------------------------------------------
Declare
ncount number;
BEGIN
	select count(1) into ncount from DBA_ROLES where role = 'MANAGER';
	if (ncount>0) THEN
		dbms_output.put_line('ROLE MANAGER ALREADY EXISTS');
	else EXECUTE IMMEDIATE 'CREATE ROLE MANAGER';
		 FOR x IN (SELECT * FROM user_tables)
		 LOOP
		  EXECUTE IMMEDIATE 'GRANT SELECT,UPDATE ON ' || x.table_name || ' TO MANAGER';
		 END LOOP;
		 COMMIT;
		 END IF;
END;		 
/
------------------------------------roleSeller----------------------------------------------------
Declare
ncount number;
BEGIN
	select count(1) into ncount from DBA_ROLES where role = 'SELLER';
	if (ncount>0) THEN
		dbms_output.put_line('ROLE SELLER ALREADY EXISTS');
	else EXECUTE IMMEDIATE 'CREATE ROLE SELLER';
		 FOR x IN (SELECT * FROM user_tables where table_name in ('LISTING_TAGS','LISTING_STATUS','LISTING','LEASE_TYPE','COMPLAINTS','ADDRESS','AREA','PROPERTY_TYPE'))
		 LOOP
		  EXECUTE IMMEDIATE 'GRANT SELECT,UPDATE ON ' || x.table_name || ' TO SELLER';
		 END LOOP;
		 COMMIT;
		 FOR x IN (SELECT * FROM user_tables where table_name in ('STATE','CITY','COUNTRY','OFFER'))
		 LOOP
		  EXECUTE IMMEDIATE 'GRANT SELECT ON ' || x.table_name || ' TO SELLER';
		 END LOOP;
		 COMMIT;
		 END IF;
END;
/	
------------------------------------roleBuyer----------------------------------------------------
Declare
ncount number;
BEGIN
	select count(1) into ncount from DBA_ROLES where role = 'Buyer';
	if (ncount>0) THEN
		dbms_output.put_line('ROLE Buyer ALREADY EXISTS');
	else EXECUTE IMMEDIATE 'CREATE ROLE Buyer';
		 FOR x IN (SELECT * FROM user_tables where table_name in ('OFFER','COMPLAINTS','SUBSCRIPTIONS'))
		 LOOP
		  EXECUTE IMMEDIATE 'GRANT SELECT,UPDATE ON ' || x.table_name || ' TO Buyer';
		 END LOOP;
		 COMMIT;
		 FOR x IN (SELECT * FROM user_tables where table_name in ('TAGS','LISTING_TAGS','LISTING_STATUS','LISTING','LEASE_TYPE','COMPLAINTS','ADDRESS','AREA','PROPERTY_TYPE','STATE','CITY','COUNTRY'))
		 LOOP
		  EXECUTE IMMEDIATE 'GRANT SELECT ON ' || x.table_name || ' TO Buyer';
		 END LOOP;
		 COMMIT;
		 END IF;
END;	
/

---------------------------------------User Manager Creation and Role assignment-----------------------------
DECLARE nCount number;
BEGIN
SELECT
count(*) into nCount
FROM
ALL_USERS
where
USERNAME = 'mguser';
IF(nCount > 0) THEN dbms_output.put_line('mguser USER ALREADY EXISTS');
ELSE EXECUTE IMMEDIATE 'create user mguser identified by setuAer26328';
     EXECUTE IMMEDIATE 'GRANT CREATE SESSION,CONNECT TO mguser';
     EXECUTE IMMEDIATE 'Grant MANAGER to mguser';
END IF;
EXCEPTION WHEN OTHERS THEN dbms_output.put_line(dbms_utility.format_error_backtrace);
dbms_output.put_line(SQLERRM);
ROLLBACK;
RAISE;
COMMIT;
END;
/
-------------------------------------------User Poster Creation and Role assignment-----------------------------
DECLARE nCount number;
BEGIN
SELECT
count(*) into nCount
FROM
ALL_USERS
where
USERNAME = 'useller';
IF(nCount > 0) THEN dbms_output.put_line('useller USER ALREADY EXISTS');
ELSE EXECUTE IMMEDIATE 'create user useller identified by setuAer26328';
     EXECUTE IMMEDIATE 'GRANT CREATE SESSION,CONNECT TO useller';
     EXECUTE IMMEDIATE 'Grant seller to useller';
END IF;
EXCEPTION WHEN OTHERS THEN dbms_output.put_line(dbms_utility.format_error_backtrace);
dbms_output.put_line(SQLERRM);
ROLLBACK;
RAISE;
COMMIT;
END;
/
-------------------------------------------User Buyer Creation and Role assignment-----------------------------
DECLARE nCount number;
BEGIN
SELECT
count(*) into nCount
FROM
ALL_USERS
where
USERNAME = 'ubuyer';
IF(nCount > 0) THEN dbms_output.put_line('ubuyer USER ALREADY EXISTS');
ELSE EXECUTE IMMEDIATE 'create user ubuyer identified by setuAer26328';
     EXECUTE IMMEDIATE 'GRANT CREATE SESSION,CONNECT TO ubuyer';
     EXECUTE IMMEDIATE 'Grant Buyer to  ubuyer';
END IF;
EXCEPTION WHEN OTHERS THEN dbms_output.put_line(dbms_utility.format_error_backtrace);
dbms_output.put_line(SQLERRM);
ROLLBACK;
RAISE;
COMMIT;
END;
/