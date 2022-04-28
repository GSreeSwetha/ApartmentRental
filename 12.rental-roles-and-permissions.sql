set serveroutput on;

---------------------------------------------------------------------------------------------

------------------------------------roles----------------------------------------------------
--select * from all_users;
------------------------------------roleManager----------------------------------------------------
Declare
ncount number;
BEGIN
	select count(1) into ncount from ROLE_TAB_PRIVS where role = 'MANAGER';
	if (ncount>0) THEN
		dbms_output.put_line('ROLE MANAGER ALREADY EXISTS');
	else EXECUTE IMMEDIATE 'CREATE ROLE MANAGER';
--         EXECUTE IMMEDIATE 'GRANT CREATE ANY SYNONYM TO MANAGER';
         EXECUTE IMMEDIATE 'GRANT EXECUTE ON INSERTDATA TO MANAGER';
         EXECUTE IMMEDIATE 'Grant execute on user_signup to MANAGER';
         EXECUTE IMMEDIATE 'Grant execute on user_login to MANAGER';
         EXECUTE IMMEDIATE 'Grant execute on Premium_signup to MANAGER';
         EXECUTE IMMEDIATE 'Grant execute on Abandon_premium to MANAGER';
         EXECUTE IMMEDIATE 'Grant execute on Address_Complaint to MANAGER';
         EXECUTE IMMEDIATE 'Grant execute on listing_actions to MANAGER';
--         EXECUTE IMMEDIATE 'GRANT EXECUTE ANY PROCEDURE TO MANAGER';
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
	select count(1) into ncount from ROLE_TAB_PRIVS where role = 'SELLER';
	if (ncount>0) THEN
		dbms_output.put_line('ROLE SELLER ALREADY EXISTS');
	else EXECUTE IMMEDIATE 'CREATE ROLE SELLER';
--         EXECUTE IMMEDIATE 'GRANT CREATE SYNONYM TO SELLER';
         EXECUTE IMMEDIATE 'GRANT EXECUTE ON INSERTDATA TO SELLER';
         EXECUTE IMMEDIATE 'GRANT UPDATE (deal,status) on OFFER to SELLER';
		 EXECUTE IMMEDIATE 'Grant execute on Listing_Actions to SELLER';
         --EXECUTE IMMEDIATE 'Grant execute on Update_ListingStatus to SELLER';
         EXECUTE IMMEDIATE 'GRANT EXECUTE on Address_Complaint to SELLER';
         FOR x IN (SELECT * FROM user_tables where table_name in ('LISTING_TAGS','LISTING_STATUS','LISTING','LEASE_TYPE','ADDRESS','AREA','PROPERTY_TYPE','TAGS','CONCERNS'))
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
	select count(1) into ncount from ROLE_TAB_PRIVS where role = 'Buyer';
	if (ncount>0) THEN
		dbms_output.put_line('ROLE Buyer ALREADY EXISTS');
	else EXECUTE IMMEDIATE 'CREATE ROLE Buyer';
--          EXECUTE IMMEDIATE 'GRANT CREATE SYNONYM TO BUYER';
          EXECUTE IMMEDIATE 'GRANT EXECUTE ON INSERTDATA TO BUYER';
          EXECUTE IMMEDIATE 'Grant execute on BUYER_ACTIONS to Buyer';
		 FOR x IN (SELECT * FROM user_tables where table_name in ('OFFER','CONCERNS','SUBSCRIPTIONS'))
		 LOOP
		  EXECUTE IMMEDIATE 'GRANT SELECT,UPDATE ON ' || x.table_name || ' TO Buyer';
		 END LOOP;
		 COMMIT;
		 FOR x IN (SELECT * FROM user_tables where table_name in ('TAGS','LISTING_TAGS','LISTING_STATUS','LISTING','LEASE_TYPE','ADDRESS','AREA','PROPERTY_TYPE','STATE','CITY','COUNTRY'))
		 LOOP
		  EXECUTE IMMEDIATE 'GRANT SELECT ON ' || x.table_name || ' TO Buyer';
		 END LOOP;
		 COMMIT;
		 END IF;
END;	
/

--Assigning roles and permissions
grant MANAGER to mguser;
grant SELLER to useller;
grant BUYER to ubuyer;
commit;

/
--View roles and permissions
GRANT SELECT ON vw_complaints to MANAGER,SELLER,BUYER;
GRANT SELECT ON vw_Listing_Summary to MANAGER,SELLER,BUYER;
GRANT SELECT ON vw_Address_Listing  to MANAGER,SELLER,BUYER;
GRANT SELECT ON vw_Address  to MANAGER,SELLER,BUYER;
GRANT SELECT ON vw_User_Activity_Summary to MANAGER,SELLER,BUYER; - function
GRANT SELECT ON vw_User_Details to MANAGER,SELLER,BUYER;
GRANT SELECT ON vw_Listing_User_Deal_Offering to MANAGER,SELLER,BUYER;
GRANT SELECT ON vw_Listing_Attributes to MANAGER,SELLER,BUYER;
GRANT SELECT ON vw_Listings_with_no_offers to MANAGER,SELLER,BUYER;
GRANT SELECT ON vw_Listings_with_deals to MANAGER,SELLER,BUYER;
GRANT SELECT ON vw_Listings_with_offers to MANAGER,SELLER,BUYER;
GRANT SELECT ON vw_Listings_with_concerns to MANAGER,SELLER,BUYER;
GRANT SELECT ON vw_Listings_with_no_concerns to MANAGER,SELLER,BUYER;
GRANT SELECT ON users_with_no_listing_postings to MANAGER,SELLER,BUYER;
GRANT SELECT ON users_with_listing_postings to MANAGER,SELLER,BUYER;
GRANT SELECT ON self_listings to SELLER;
/