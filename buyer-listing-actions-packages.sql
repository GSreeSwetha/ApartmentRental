--Package List
--1.Buyer_Actions
----a.Make an offer on a listing
----b.Raise a complaint for a listing
----c.Make a query for a listing

SET SERVEROUT ON;

CREATE OR REPLACE PACKAGE BUYER_ACTIONS
IS 
PROCEDURE Make_Offer(emailIn in varchar2, listingId in int, rent in decimal,lease_period in number,move_in in DATE,status in char,comments in varchar2, deal in number);
PROCEDURE Make_Complaint(emailIn in varchar2,listingId in int,comments in varchar2);
PROCEDURE Question(emailIn in varchar2,listingId in int,comments in  varchar2);
INVALID_USER EXCEPTION;
END BUYER_ACTIONS;
/

--conditions for existing user and listing, only then insert.
CREATE OR REPLACE PACKAGE BODY BUYER_ACTIONS
AS
PROCEDURE Make_Offer(emailIn in varchar2, listingId in int, rent in decimal,lease_period in NUMBER,move_in in DATE,status in char,comments in varchar2, deal in number)
is
uid number;
usr_cnt number;
begin
	SELECT id into uid FROM users WHERE  email = emailIn;
    select count(1) INTO usr_cnt FROM users WHERE  email = emailIn;
if(usr_cnt =1) then  
    INSERTDATA.INSERT_OFFER(uid,listingId,sysdate,rent,lease_period,move_in,status,null,comments,0);
    --insert into offer(user_id,listing_id,date_added,rent, lease_period,move_in,status,date_addressed,comments,deal) values (uid,listingId,sysdate,rent, lease_period,move_in,status,null,comments,0); --
    dbms_output.put_line('----------------------------OFFER DETAILS UPDATED-------------------------');
    --commit;
else raise INVALID_USER;
end if;
Exception 
when INVALID_USER then
  dbms_output.put_line('User does not exist. Please check your email');
when others then
  dbms_output.put_line('Error while making an offer');  
end Make_Offer;

PROCEDURE Make_Complaint(emailIn in varchar2,listingId in int,comments in varchar2)
is
uid number;
l_cnt int;
usr_cnt number;
begin
	SELECT id into uid FROM users WHERE  email = emailIn;
    dbms_output.put_line(USER);
    dbms_output.put_line('User id: '||uid);
    select count(1) INTO usr_cnt FROM users WHERE  email = emailIn;
    SELECT count(1) INTO l_cnt FROM listing WHERE id = listingId;
--     dbms_output.put_line(usr_cnt||l_cnt);
if(usr_cnt =1 and l_cnt = 1) then 
    INSERTDATA.INSERT_CONCERNS(sysdate,null,listingId,comments,null,null,null,uid); --
    --insert into concerns(date_added,date_resolved,listing_id,complaint,query,addressed_by,solution,user_id)values(sysdate,null,listingId,comments,null,null,null,uid); --
    dbms_output.put_line('----------------------------CONCERNS DETAILS UPDATED-------------------------');
--    commit;
else raise INVALID_USER;
end if;
Exception 
when INVALID_USER then
    dbms_output.put_line('User or Listing does not exist. Please check details entered again');
when others then
  dbms_output.put_line('Error while raising concern');  
END MAKE_COMPLAINT;

PROCEDURE QUESTION(emailIn in varchar2,listingId in int,comments in varchar2)
is
uid number;
l_cnt int;
usr_cnt number;
begin
 	SELECT id into uid FROM users WHERE  email = emailIn;
    select count(1) INTO usr_cnt FROM users WHERE  email = emailIn;
    SELECT count(1) INTO l_cnt FROM listing WHERE id = listingId;
if(usr_cnt =1 and l_cnt =1) then 
    INSERTDATA.INSERT_CONCERNS(sysdate,null,listingId,null,comments,null,null,uid); 
    --insert into concerns(date_added,date_resolved,listing_id,complaint,query,addressed_by,solution,user_id)values(sysdate,null,listingId,null,comments,null,null,uid); --
    dbms_output.put_line('----------------------------CONCERNS DETAILS UPDATED-------------------------');
    --commit;
else raise INVALID_USER;
end if;
Exception 
when INVALID_USER then
    dbms_output.put_line('User or Listing does not exist. Please check details entered again');
when others then
  dbms_output.put_line('Error while raising concern');  
END QUESTION;

END;
/

--2.Listing_actions
----a.Add a listing
----b.Drop a listing
----c.Make deal with a buyer for a listing

CREATE OR REPLACE PACKAGE LISTING_ACTIONS
IS 
PROCEDURE ADD_LISTING(emailIn in varchar2,IS_PREMIUM in char,BANNER in varchar,DESCRIPT in varchar,ADDRESS_ID in number,ZIP_CODE in number,RENT in number,DEPOSIT in number,BROKERAGE in number,AREA_ID in number,HEAT in char,HOT_WATER in char,LAUNDRY in char,DATE_AVAILABLE in DATE,LEASE_ID in number,PROPERTY_TYPE_ID in number,DATE_POSTED in DATE);
PROCEDURE DELETE_LISTING(LISTINGID in NUMBER);
PROCEDURE MAKE_DEAL(emailIn in varchar2,LISTINGID in NUMBER,OFFERID in NUMBER);
PROCEDURE UPDATE_LISTINGTAGS(listingid in number, tagin in varchar2);
PROCEDURE UPDATE_LISTINGSTATUS(USER_TYPE in varchar2,emailIn in varchar2,LISTINGID NUMBER,status VARCHAR);
INVALID_USER EXCEPTION;
END LISTING_ACTIONS;
/

CREATE OR REPLACE PACKAGE BODY LISTING_ACTIONS
IS

PROCEDURE ADD_LISTING(emailIn in varchar2,IS_PREMIUM in char,BANNER in varchar,DESCRIPT in varchar,ADDRESS_ID in number,ZIP_CODE in number,RENT in number,DEPOSIT in number,BROKERAGE in number,AREA_ID in number,HEAT in char,HOT_WATER in char,LAUNDRY in char,DATE_AVAILABLE in DATE,LEASE_ID in number,PROPERTY_TYPE_ID in number,DATE_POSTED in DATE)
AS
uid number;
usr_cnt number; 
BEGIN
	SELECT id into uid FROM users WHERE  email = emailIn;
    select count(1) INTO usr_cnt FROM users WHERE  email = emailIn;
if(usr_cnt =1) THEN  
INSERTDATA.INSERT_LISTING(uid,IS_PREMIUM,BANNER,DESCRIPT ,ADDRESS_ID,ZIP_CODE,RENT ,DEPOSIT ,BROKERAGE ,AREA_ID ,HEAT ,HOT_WATER ,LAUNDRY ,DATE_AVAILABLE ,LEASE_ID ,PROPERTY_TYPE_ID,sysdate);
--Insert into LISTING (USER_ID,IS_PREMIUM,BANNER,DESCRIPT,ADDRESS_ID,ZIP_CODE,RENT,DEPOSIT,BROKERAGE,AREA_ID,HEAT,HOT_WATER,LAUNDRY,DATE_AVAILABLE,LEASE_ID,PROPERTY_TYPE_ID,DATE_POSTED) values (uid,IS_PREMIUM,BANNER,DESCRIPT,ADDRESS_ID,ZIP_CODE,RENT,DEPOSIT,BROKERAGE,AREA_ID,HEAT,HOT_WATER,LAUNDRY,DATE_AVAILABLE,LEASE_ID,PROPERTY_TYPE_ID,sysdate);
dbms_output.put_line('Listing details added.');
--commit;
end if;
Exception 
when INVALID_USER then
  dbms_output.put_line('User does not exist. Please check your email');
when others then
  dbms_output.put_line('Error while adding Listing');  
END ADD_LISTING;

PROCEDURE DELETE_LISTING(LISTINGID in NUMBER)
AS
l_cnt number;
BEGIN
select count(1) into l_cnt from listing where id=listingid;
if(l_cnt>0) then
    DELETE FROM LISTING WHERE ID=LISTINGID;
    DELETE FROM LISTING_STATUS WHERE ID=LISTINGID;
--do we need to remove the related records from offer or make offer status inactive?
end if;
COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line(SQLERRM);
        dbms_output.put_line('Please provide the correct values according to the signature given in POSTER_ACTIONS..');
        rollback;
        raise;
END DELETE_LISTING;

PROCEDURE MAKE_DEAL(emailIn in varchar2,LISTINGID in NUMBER, OFFERID in NUMBER)
AS
UID NUMBER; 
OID NUMBER;
deal_cnt NUMBER;
BEGIN
select id into UID from users where email=emailIn;
select count(deal) into deal_cnt from offer where listing_id=listingid and deal = 0; -- 5 records
if(deal_cnt != 0) then
UPDATE OFFER SET DEAL='1' WHERE ID=OFFERID;
UPDATE OFFER SET STATUS='N' WHERE LISTING_ID=LISTINGID;
UPDATE LISTING_STATUS SET IS_AVAILABLE='N' WHERE LISTING_ID=LISTINGID;
dbms_output.put_line('Offer and Listing status details updated');
else 
 dbms_output.put_line('A DEAL IS ALREADY DONE FOR THIS LSITING!');
end if;
END MAKE_DEAL;

--seller/owner can add/edit tags. 
PROCEDURE UPDATE_LISTINGTAGS(listingId in number, tagIn in varchar2)
AS
tagid number;
tags_cnt number;
flag_check number;
listing_usr_id number;
begin
--check if the user trying to add/edit the tag is management/seller/owner
select count(1) into tags_cnt from tags where upper(trim(replace(tag,' ',''))) = upper(trim(replace(tagIn,' ','')));
    
--if tag already exists in tag table
if(tags_cnt >0) then
    select id into tagId from tags where upper(trim(replace(tag,' ',''))) = upper(trim(replace(tagIn,' ','')));
	select count(1) into flag_check from listing_tags where tag_id = tagId and listing_id = listingId;
	if(flag_check = 0) then
        INSERTDATA.INSERT_LISTINGTAGS(tagId,listingId);
		--insert into listing_tags(tag_Id,listing_Id) values(tagId,listingId); --
        --commit;
         dbms_output.Put_line('Listing Tags Updated');
    elsif(flag_check > 0) then
		dbms_output.put_line('This listing already has this tag');
    end if;
--if the tag is not already exisiting
elsif(tags_cnt =0) then
	insert into tags(tag) values(tagIn); --INSERTDATA.INSERT_TAGS(tagIn); 
     dbms_output.Put_line('Tag details added');
	select id into tagId from tags where upper(trim(replace(tag,' ',''))) = upper(trim(replace(tagIn,' ','')));
    INSERTDATA.INSERT_LISTINGTAGS(tagId,listingId);
	--insert into listing_tags(tag_Id,listing_Id) values(tagId,listingId); 
    --commit;
     dbms_output.Put_line('Listing Tags Updated');
end if;
exception
  when others then
             dbms_output.Put_line(SQLERRM);
             dbms_output.Put_line(dbms_utility.format_error_backtrace);
             rollback;
end UPDATE_LISTINGTAGS;

PROCEDURE UPDATE_LISTINGSTATUS(USER_TYPE in varchar2,emailIn in varchar2,LISTINGID NUMBER,status VARCHAR)
AS
UID number;
sllr_cnt number;
mgmt_cnt number;
BEGIN
dbms_output.put_line('USER DETAILS');
dbms_output.put_line(USER);
if(lower(USER_TYPE) = 'seller') then
    select count(1) into sllr_cnt from users where email = emailIn;
    if(sllr_cnt >0) then
        SELECT ID INTO UID FROM users  WHERE email=emailIn;
    end if;
elsif(lower(USER_TYPE) = 'management') then
    select count(1) into mgmt_cnt from management where email = emailIn;
    if(mgmt_cnt >0) then
        SELECT ID INTO UID FROM management WHERE email=emailIn;
    end if;
end if;
dbms_output.put_line('User Id: ' ||UID);
IF STATUS = 'Y' THEN
    UPDATE LISTING_STATUS SET IS_AVAILABLE='Y', updated_by=UID, date_updated=sysdate WHERE LISTING_ID=LISTINGID;
ELSE
    UPDATE LISTING_STATUS SET IS_AVAILABLE='N', updated_by=UID, date_updated=sysdate WHERE LISTING_ID=LISTINGID;
END IF;
dbms_output.put_line('Listing status details updated.');
--do we need to remove the related records from offer or make offer status inactive?
COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line(SQLERRM);
        rollback;
        raise;
END UPDATE_LISTINGSTATUS;

END;

/

--GRANT EXECUTE ON LISTING_ACTIONS TO POSTER_INFO6210;
--CREATE OR REPLACE PUBLIC SYNONYM LISTING_ACTIONS FOR ADMIN.LISTING_ACTIONS;



