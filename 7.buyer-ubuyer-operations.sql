set SERVEROUT on;
--Buyer Actions
--1.Makean offer on a listing using BUYER_ACTIONS.Make_Offer(email,listingId,sysdate,rent,lease_period,move_in,status,comments,deal)
--2.RAISE A COMPLAINT FOR A LISTING USING BUYER_ACTIONS.MAKE_COMPLAINT(EMAIL,LISTINGID,COMMENTS)
--3.MAKE A QUERY FOR A LISTING USING BUYER_ACTIONS.QUESTION (EMAIL,LISTINGID,QUERY)


--select 'Create Synonym ' || table_name|| ' for RENTALADMIN.' ||table_name||';' from all_tables where OWNER = 'RENTALADMIN';
Create Synonym ADDRESS for RENTALADMIN.ADDRESS;
Create Synonym AREA for RENTALADMIN.AREA;
Create Synonym CITY for RENTALADMIN.CITY;
Create Synonym COUNTRY for RENTALADMIN.COUNTRY;
Create Synonym LEASE_TYPE for RENTALADMIN.LEASE_TYPE;
Create Synonym LISTING for RENTALADMIN.LISTING;
Create Synonym LISTING_STATUS for RENTALADMIN.LISTING_STATUS;
Create Synonym LISTING_TAGS for RENTALADMIN.LISTING_TAGS;
Create Synonym OFFER for RENTALADMIN.OFFER;
Create Synonym PROPERTY_TYPE for RENTALADMIN.PROPERTY_TYPE;
Create Synonym STATE for RENTALADMIN.STATE;
Create Synonym SUBSCRIPTIONS for RENTALADMIN.SUBSCRIPTIONS;
Create Synonym TAGS for RENTALADMIN.TAGS;
Create Synonym CONCERNS for RENTALADMIN.CONCERNS;


drop synonym concerns;
--table or view does not exist even after creating synonym if no access

Create Synonym Buyer_Actions for RENTALADMIN.Buyer_Actions;
Create Synonym INSERTDATA for RENTALADMIN.INSERTDATA;

select * from listing;
select * from offer;
select * from CONCERNS;

set serveroutput on;
execute Buyer_Actions.Make_Offer('sethr@gmail.com',3002,2000,24,'01-JUL-2022','Y','wish to make this offer',0);
execute Buyer_Actions.Make_Offer('rachg@gmail.com',3005,2011,24,'01-JUL-2022','Y','wish to make this offer',0);

select * from offer;

set serveroutput on;
execute BUYER_ACTIONS.MAKE_COMPLAINT('sethr@gmail.com',3003,'lights dont function well');

set serveroutput on;
execute BUYER_ACTIONS.QUESTION ('bens@gmail.com',3002,'What is floor size?');