set SERVEROUTPUT on;
--Seller Actions
--1.ADD A NEW LISTING USING LISTNG_ACTIONS.ADD_LISTING(IS_PREMIUM,BANNER,DESCRIPT,ADDRESS_ID,ZIP_CODE,RENT,DEPOSIT,BROKERAGE,AREA_ID,HEAT,HOT_WATER,LAUNDRY,DATE_AVAILABLE,LEASE_ID,PROPERTY_TYPE_ID)
--2.REMOVE A LISTING USING LISTNG_ACTIONS.DELETE_LISTING(MY_LISTING_ID number)
--3.ADDRESS A QUERY OR COMPLAINT FOR THEIR LISTINGS USING ADDREES_COMPLAINT()
--4.ADD APPROPRIATE TAGS TO LISTINGS
--5.Update Listing Status using Update_ListingStatus('seller',)
--6.Make a deal MAKE_DEAL(emailIn in varchar2,LISTINGID in NUMBER,OFFERID in NUMBER);

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
Create synonym CONCERNS for RENTALADMIN.CONCERNS;
create synonym tags for RENTALADMIN.tags;

create synonym listing_actions for RENTALADMIN.LISTING_ACTIONS;
create synonym Update_ListingStatus for RENTALADMIN.Update_ListingStatus;
create synonym ADDRESS_COMPLAINT for RENTALADMIN.ADDRESS_COMPLAINT;
create synonym vw_user_details for RENTALADMIN.vw_user_details;  -- to view user details --no access to users table
create synonym Seller_Welcome for RENTALADMIN.Seller_welcome;
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
--Drop Synonym OFFER;
--Drop Synonym PROPERTY_TYPE;
--Drop Synonym STATE;
--Drop Synonym TAGS;
--Drop Synonym CONCERNS;

select * from listing;
select * from listing_status;--user_id = 2019
select * from listing_tags;
select * from lease_type;
select * from property_type;
select * from CONCERNS;
select * from tags;


select * from vw_user_details;


begin
LISTING_ACTIONS.add_listing('kyled@gmail.com','Y','BORAD','2BHK',603,5617,2456,1000,200,904,'Y','Y','N','23-MAY-2022',1002,1204,sysdate);
end;

execute LISTING_ACTIONS.delete_listing(3007);
execute LISTING_ACTIONS.delete_listing(3009);
execute LISTING_ACTIONS.delete_listing(3010);--

--adress a concern
set serveroutput on;
execute Address_Complaint('pink@yahoo.com',5201,'issue resolved. best, pinky');
select * from concerns;

--add tags for a listing
execute LISTING_ACTIONS.update_listingtags(3004,'RIVERSIDE VIEW');
execute LISTING_ACTIONS.update_listingtags(3003,'PET FRIENDLY');

--Update listing status
begin
LISTING_ACTIONS.Update_ListingStatus('seller','mouk@gmail.com',3002,'N');
end;

--Make a deal
set serveroutput on;
execute LISTING_ACTIONS.MAKE_DEAL('jakechiz@gmail.com',3001,6001);
select * from listing_status;
select * from offer;


