--Procedures list
--1.Welcome
-------------------User Related Actions for Management-----------------------------
--2.User_Signup
--3.User_Login
--4.Premium_Signup
--5.Abadon_Premium
-------------------Listing Related Actions for Management---------------------------
--6.Address_Complaint
--7.Update_ListingStatus


CREATE OR replace PROCEDURE Welcome
AS
BEGIN
dbms_output.Put_line('WELCOME USER!');
dbms_output.Put_line('EXECUTE THE BELOW PROCEDURE TO SIGNUP AS CUSTOMER');
dbms_output.Put_line('USER_SIGNUP(FIRST_NAME,LAST_NAME,IS_POSTER,IS_OWNER,IS_BUYER,CONTACT,EMAIL,PASSWORD,DOOR_NO,STREET_ID,STATE_ID,COUNTRY_ID,CITY_ID,ZIP_CODE,SUBSCRIBE)');
dbms_output.put_line('if already a user: please execute the following command to login:  EXECUTE USER_LOGIN(EMAIL,PASSWORD)');
dbms_output.Put_line('FOR ALL INFO NEEDED TO SIGN UP, RUN THE FOLLOWING ');
dbms_output.Put_line('select * from COUNTRY');
dbms_output.Put_line('select * from STATE');
dbms_output.Put_line('select * from CITY');
dbms_output.Put_line('select * from STREET');
dbms_output.Put_line('If you would like to sign_up as a buyer: enter values for IS_BUYER : 1 else 0, If you would like to signup as a seller:enter values for IS_POSTER : 1 else 0, if you are a owner :enter values for IS_OWNER : 1 else 0, If you would like to subscribe as a premium member enter values for SUBSCRIBE :''Y'' else ''N'' ');
dbms_output.Put_line('AFTER LOGGING IN AS A SELLER OR BUYER, EXECUTE EITHER OF SELLER_Welcome OR BUYER_Welcome or MANAGEMENT_WELCOME TO SEE THE LIST OF AVAILABLE ACTIONS');
EXCEPTION
  WHEN OTHERS THEN
             dbms_output.Put_line(SQLERRM);

             dbms_output.Put_line(dbms_utility.format_error_backtrace);

             ROLLBACK;
END welcome;
/

--USER_SIGNUP
--condition to check to see if the user already exists.
create or replace procedure User_Signup(firstName in varchar2,lastname in varchar2,zipCode in number,contactIn in number,emailIn in varchar2 ,passwd in varchar2,isPoster in number,isBuyer in number,isOwner in number,doorNo in number,stateId in number,cityId in number,streetId in number,countryId in number, subscribe in VARCHAR)
is
    uid users.id%type;
    uemail users.email%type;
    cnt_usr number;
begin
select count(1) into cnt_usr from users where email = emailIn;
if (cnt_usr >0) then
	dbms_output.put_line('User already exists.');
else
	INSERTDATA.INSERT_USERS(firstName ,lastname,zipCode ,contactIn,emailIn  ,passwd ,isPoster ,isBuyer ,isOwner ,sysdate,sysdate,doorNo,stateId ,cityId ,streetId ,countryId );
	dbms_output.put_line('User: ' ||firstName||' '||lastName|| ' ,with all details added.');
    commit;
	select id into uid from users where email = emailIn;
	if( subscribe = 'Y') then
        INSERTDATA.INSERT_SUBSCRIPTIONS(sysdate,SYSDATE + 365,1,uid); --insert into subscriptions(start_date,subscription_end_date,status,user_id) values(sysdate,SYSDATE + 365,1,uid);--premium_signup(uemail);
        commit; -- insertdata pkg takes care of commit
	end if;
end if;
end User_Signup;
/
--LOGIN
create or replace procedure User_Login(emailIn VARCHAR, PASSWORD VARCHAR)
AS
FLAG BOOLEAN:= FALSE;
MAIL VARCHAR(50);
PWD VARCHAR2(20);
BEGIN
SELECT COUNT(EMAIL) INTO MAIL FROM USERS WHERE EMAIL=emailIn;
IF(MAIL = 0 ) THEN
    FLAG:=FALSE;
    dbms_output.Put_line('USER WITH GIVEN EMAIL DOESNOT EXIST.PLEASE USE VALID CREDENTIALS ELSE EXECUTE SIGNUP');
ELSE
 SELECT PASSWORD INTO PWD FROM USERS WHERE EMAIL=emailIn;
 IF (PASSWORD=PWD) THEN 
    FLAG:=TRUE;
    dbms_output.Put_line('Successful login');
 ELSE FLAG:=FALSE;
dbms_output.Put_line('INVALID PASSWORD.PLEASE USE VALID CREDENTIALS');
END IF;
END IF;
END User_Login;
/

--PREMIUM_SIGNUP
CREATE OR replace PROCEDURE Premium_signup(emailIn in varchar2)
IS
  ncount NUMBER;
  usr_id NUMBER;
BEGIN
	SELECT id into usr_id
      FROM   USERS
     WHERE  email= emailIn;

    SELECT Count(1)
    INTO   ncount
    FROM   subscriptions
    WHERE  user_id in (SELECT id
                          FROM   users
                          WHERE  user_id = usr_id) and status = 1;

    IF( ncount > 0 ) THEN
      dbms_output.Put_line('User is already a Premium member.');
    ELSE
      Update Subscriptions set status=1, start_date=sysdate, subscription_end_date= SYSDATE + 365 where user_id=usr_id;
      dbms_output.Put_line('User Subscription successful!');
      --assign permissions accordingly
      --EXECUTE IMMEDIATE 'GRANT SELECT ON PREMIUM_LISTINGS TO '||USER;
     --dbms_output.Put_line('Premium Listings view granted');
      --EXECUTE IMMEDIATE 'GRANT EXECUTE ON ABANDON_PREMIUM TO '||USER;
 -- dbms_output.Put_line('Customer VIEW created');
  COMMIT;
END IF;
EXCEPTION
  WHEN OTHERS THEN
             dbms_output.Put_line(SQLERRM);
             dbms_output.Put_line(dbms_utility.format_error_backtrace);
             ROLLBACK;
END premium_signup;
/

CREATE OR replace PROCEDURE Abandon_premium(emailIn in varchar2)
IS
  ncount NUMBER;
  cus_id NUMBER;
BEGIN
	SELECT id into cus_id
      FROM   USERS
     WHERE  EMAIL= emailIn;
    SELECT Count(1)
    INTO   ncount
    FROM   subscriptions
    WHERE  user_id = cus_id and status =0;

    IF( ncount = 1 ) THEN
      dbms_output.Put_line('User is NOT a Premium member.');
    ELSE  
      EXECUTE IMMEDIATE 'UPDATE SUBSCRIPTIONS SET STATUS=0 WHERE user_id =  '|| cus_id;
      commit;
      dbms_output.Put_line('Customer Subscription Dropped');
--      EXECUTE IMMEDIATE 'REVOKE SELECT ON PREMIUM_LISTINGS FROM '||USER;
--      dbms_output.Put_line('Customer VIEW created');
    END IF;
EXCEPTION
  WHEN OTHERS THEN
             dbms_output.Put_line(SQLERRM);
             dbms_output.Put_line(dbms_utility.format_error_backtrace);
             ROLLBACK;
END abandon_premium;
/
Create or replace PROCEDURE Address_Complaint(emailIn in varchar2,complaint_id NUMBER, ans VARCHAR)
AS
UID number;
mgr_cnt number;
user_cnt number;
mail varchar2(50);
BEGIN
dbms_output.put_line(USER);
select count(1) into mgr_cnt from management where email = emailIn;
select count(1) into user_cnt from users where email = emailIn;
if(mgr_cnt >0 ) then
    select id into uid from management where email=emailIn;
    update concerns set Date_resolved=sysdate, addressed_by=UID, solution= ans where id=complaint_id;
    commit;
    dbms_output.put_line('Concerns details addressed and updated');
elsif(user_cnt>0) then
    select email into mail from users where id=(select user_id from listing where id=(select listing_id from concerns where id=5202));
    if(mail = emailIn) then
    select id into uid from users where email=emailIn;
    update concerns set Date_resolved=sysdate, addressed_by=UID, solution= ans where id=complaint_id;
    commit;
    dbms_output.put_line('Concerns details addressed and updated');
    else dbms_output.put_line('This seller cannot address the complaint as he did not post the listing.');
    end if;
else
    dbms_output.put_line('Invalid User');
end if;

COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line(SQLERRM);
        rollback;
        raise;
END Address_complaint;
--commit;
/

