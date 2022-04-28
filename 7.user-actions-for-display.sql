--Procedures list
--1.Seller_Actions
--2.Buye Actions


CREATE OR replace PROCEDURE Management_Welcome
is
BEGIN
dbms_output.Put_line('HELLO '
                         ||Sys_context('USERENV', 'SESSION_USER')
                         ||' !');

dbms_output.Put_line('OPERATIONS ALLOWED:');    

dbms_output.Put_line('');

dbms_output.Put_line('-------------LISTING RELATED ACTIONS-------------');

dbms_output.Put_line('1. TO view listings : select * from vw_ListingsSummary');

dbms_output.Put_line('2. TO view concerns : select * from concerns');

dbms_output.Put_line('3. TO update listing status: EXECUTE Management_OPERATIONS.Update_ListStatus(LISTING_ID,status);  status is Y for active and N for inactive');

dbms_output.Put_line('4. To address a complaint/query : EXECUTE Management_OPERATIONS.Address_complaint(complaint_id, answer)');

dbms_output.Put_line('');

EXCEPTION
  WHEN OTHERS THEN
             dbms_output.Put_line(SQLERRM);

             dbms_output.Put_line(dbms_utility.format_error_backtrace);

             ROLLBACK;
END Management_Welcome;
/

CREATE OR replace PROCEDURE Seller_Welcome
is
BEGIN
dbms_output.Put_line('HELLO '
                         ||Sys_context('USERENV', 'SESSION_USER')
                         ||' !');

dbms_output.Put_line('OPERATIONS ALLOWED:');    

dbms_output.Put_line('');

dbms_output.Put_line('-----ADDRESS and property related details--------');

dbms_output.Put_line('VIEW property type : select * from property_type ');

dbms_output.Put_line('VIEW avialable apartment area range: select * from area');

dbms_output.Put_line('VIEW property type : select * from property_type');

dbms_output.Put_line('VIEW tags using :SELECT * FROM tags');
dbms_output.Put_line('for country info: select * from COUNTRY');
dbms_output.Put_line('for state info: select * from STATE');
dbms_output.Put_line('for city info: select * from CITY');
dbms_output.Put_line('for street info: select * from STREET');

dbms_output.Put_line('-------------LISTING RELATED ACTIONS-------------');

dbms_output.Put_line('2. ADD A NEW LISTING USING LISTNG_OPERATIONS.ADD_LISTING(IS_PREMIUM,BANNER,DESCRIPT,ADDRESS_ID,ZIP_CODE,RENT,DEPOSIT,BROKERAGE,AREA_ID,HEAT,HOT_WATER,LAUNDRY,DATE_AVAILABLE,LEASE_ID,PROPERTY_TYPE_ID)');

dbms_output.Put_line('3. REMOVE A LISTING USING LISTNG_OPERATIONS.DELETE_LISTING(MY_LISTING_ID number) ');

dbms_output.Put_line('4. VIEW YOUR LISTINGS USING SELECT * FROM MY_LISTINGS_<user_name>');

dbms_output.Put_line('5. ADDRESS A QUERY OR COMPLAINT FOR THEIR LISTINGS USING ADDREES_COMPLAINT()');

dbms_output.Put_line('6. ADD/UPDATE APPROPRIATE TAGS TO LISTINGS');


dbms_output.Put_line('');

EXCEPTION
  WHEN OTHERS THEN
             dbms_output.Put_line(SQLERRM);

             dbms_output.Put_line(dbms_utility.format_error_backtrace);

             ROLLBACK;
END Seller_Welcome;
/

CREATE OR replace PROCEDURE Buyer_Welcome
is
BEGIN
    dbms_output.Put_line('HELLO '
                         ||Sys_context('USERENV', 'SESSION_USER')
                         ||' !');

    dbms_output.Put_line('OPERATIONS ALLOWED:');

    dbms_output.Put_line('------------- PERSONAL INFORMATION -------------');

dbms_output.Put_line('1. VIEW YOUR INFORMATION USING SELECT * FROM POSTER_<YOUR_USER_NAME>');

dbms_output.Put_line('');

dbms_output.Put_line('-------------LISTING RELATED ACTIONS-------------');

dbms_output.Put_line('2. MAKE A DEAL USING MAKE_DEAL(IS_PREMIUM,BANNER,DESCRIPT,ADDRESS_ID,ZIP_CODE,RENT,DEPOSIT,BROKERAGE,AREA_ID,HEAT,HOT_WATER,LAUNDRY,DATE_AVAILABLE,LEASE_ID,PROPERTY_TYPE_ID)');

dbms_output.Put_line('3. RAISE A COMPLAINT FOR A LISTING USING BUYER_OPERATIONS.MAKE_COMPLAINT(LISTING_ID,COMMENTS)) ');

dbms_output.Put_line('4. VIEW YOUR LISTINGS USING SELECT * FROM MY_LISTINGS_<user_name>');

dbms_output.Put_line('5. MAKE A QUERY FOR A LISTING USING BUYER_OPERATIONS.QUESTION (LISTING_ID,QUERY)) ');

dbms_output.Put_line('');

EXCEPTION
  WHEN OTHERS THEN
             dbms_output.Put_line(SQLERRM);

             dbms_output.Put_line(dbms_utility.format_error_backtrace);

             ROLLBACK;
END Buyer_Welcome;
/
