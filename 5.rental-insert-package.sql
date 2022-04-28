SET SERVEROUT ON;

CREATE OR REPLACE PACKAGE INSERTDATA
IS
PROCEDURE INSERT_STATE(name in varchar2);

PROCEDURE INSERT_CITY(name in VARCHAR2, state_id in int);

PROCEDURE INSERT_STREET(name in VARCHAR2, city_id in int);

PROCEDURE INSERT_COUNTRY(name in VARCHAR2);

PROCEDURE INSERT_ADDRESS(door_no in number,state_id in number,city_id in number,street_id in number, country_id in number);

PROCEDURE INSERT_AREA(min_area in int, max_area in int);

PROCEDURE INSERT_LEASETYPE(lease_period in varchar, max_cosigners in int);

PROCEDURE INSERT_PROPERTYTYPE(type in VARCHAR, beds in int, baths in int);

PROCEDURE INSERT_TAGS(tag in VARCHAR2);

PROCEDURE INSERT_MANAGEMENT(First_Name in VARCHAR2, Last_Name in VARCHAR2, zip_code in number, pay in decimal, contact in number,email in varchar2, password in varchar2, door_no number, state_id number, city_id number, street_id number, country_id number);

PROCEDURE INSERT_USERS(First_Name in VARCHAR2, Last_Name in VARCHAR2, zip_code in number,contact in number,email in varchar2,password in varchar,is_poster in number, is_buyer in number,is_owner in number,date_joined in date, last_activity in date, door_no number, state_id number, city_id number, street_id number, country_id number);

PROCEDURE INSERT_SUBSCRIPTIONS(start_date in date,subscription_end_date in date,status in number,user_id in int);

PROCEDURE INSERT_LISTING(user_id in int,is_premium in char,banner in varchar2, descript in varchar2,address_id in int,zip_code in number,rent in decimal,deposit in decimal,brokerage in number,area_id in int,heat in char,hot_water in char,laundry in char,date_available in DATE,lease_id in int,property_type_id in int,date_posted in DATE);

PROCEDURE INSERT_LISTINGTAGS( tag_id in number,listing_id  in number);

PROCEDURE INSERT_LISTINGSTATUS(is_available in char,date_updated in date, updated_by in number, listing_id in number);

PROCEDURE INSERT_CONCERNS(date_added in DATE,date_resolved in DATE,listing_id in int,comments in varchar2,ctype in varchar2,addressed_by in int,solution in varchar2,user_id in int);

PROCEDURE INSERT_OFFER(user_id in int,listing_id in int,date_added in date,rent in decimal,lease_period in NUMBER,move_in in DATE,status in char,date_addressed in DATE,comments in varchar2,DEAL in number);
end INSERTDATA;

/

CREATE OR REPLACE PACKAGE BODY INSERTDATA
IS

PROCEDURE INSERT_STATE(name in varchar2)
AS
BEGIN
        DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');
        INSERT INTO State(name) VALUES (name);
        DBMS_OUTPUT.PUT_LINE('Rows inserted in State Table');
        DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');
        COMMIT;
EXCEPTION
when dup_val_on_index then
dbms_output.put_line('Duplicate Value Found. Insert a Different Value');
when others then
dbms_output.put_line('Error while inserting data into State Table');
rollback;
dbms_output.put_line('Error: ');
dbms_output.put_line(dbms_utility.format_error_stack);
dbms_output.put_line('----------------------------------------------------------');
end INSERT_STATE;


PROCEDURE INSERT_CITY(name in VARCHAR2, state_id in int)
AS
BEGIN
        DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');
--        INSERT INTO CITY(name VARCHAR2,state_id int) VALUES (name, state_id); 
        INSERT INTO CITY(name, state_id ) values(name, state_id);
        DBMS_OUTPUT.PUT_LINE('Rows inserted in CITY Table');
        DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');
        COMMIT;
EXCEPTION
when dup_val_on_index then
dbms_output.put_line('Duplicate Value Found. Insert a Different Value');
when others then
dbms_output.put_line('Error while inserting data into City Table');
rollback;
dbms_output.put_line('Error: ');
dbms_output.put_line(dbms_utility.format_error_stack);
dbms_output.put_line('----------------------------------------------------------');
end INSERT_CITY;

PROCEDURE INSERT_STREET(name in VARCHAR2, city_id in int)
AS
BEGIN
        DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');
--        INSERT INTO CITY(name VARCHAR2,state_id int) VALUES (name, state_id); 
        INSERT INTO STREET(name, city_id ) values(name, city_id);
        DBMS_OUTPUT.PUT_LINE('Rows inserted in STREET Table');
        DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');
        COMMIT;
EXCEPTION
when dup_val_on_index then
dbms_output.put_line('Duplicate Value Found. Insert a Different Value');
when others then
dbms_output.put_line('Error while inserting data into Street Table');
rollback;
dbms_output.put_line('Error: ');
dbms_output.put_line(dbms_utility.format_error_stack);
dbms_output.put_line('----------------------------------------------------------');
end INSERT_STREET;


PROCEDURE INSERT_COUNTRY(name in VARCHAR2)
AS
BEGIN
        DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');
        INSERT INTO COUNTRY(name) VALUES (name); 
        DBMS_OUTPUT.PUT_LINE('Rows inserted in COUNTRY Table');
        DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');
        COMMIT;
EXCEPTION
when dup_val_on_index then
dbms_output.put_line('Duplicate Value Found. Insert a Different Value');
when others then
dbms_output.put_line('Error while inserting data into COUNTRY Table');
rollback;
dbms_output.put_line('Error: ');
dbms_output.put_line(dbms_utility.format_error_stack);
dbms_output.put_line('----------------------------------------------------------');
end INSERT_COUNTRY;

PROCEDURE INSERT_ADDRESS(door_no in number,state_id in number,city_id in number,street_id in number, country_id in number)
AS
BEGIN
        DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');
        INSERT INTO ADDRESS(door_no,state_id ,city_id ,street_id , country_id) VALUES (door_no,state_id ,city_id ,street_id , country_id); 
        DBMS_OUTPUT.PUT_LINE('Rows inserted in ADDRESS Table');
        DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');
        COMMIT;
EXCEPTION
when dup_val_on_index then
dbms_output.put_line('Duplicate Value Found. Insert a Different Value');
when others then
dbms_output.put_line('Error while inserting data into ADDRESS Table');
rollback;
dbms_output.put_line('Error: ');
dbms_output.put_line(dbms_utility.format_error_stack);
dbms_output.put_line('----------------------------------------------------------');
end INSERT_ADDRESS;

PROCEDURE INSERT_AREA(min_area in int, max_area in int)
AS
BEGIN
        DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');
        INSERT INTO AREA(min_area , max_area ) VALUES (min_area,max_area); 
        DBMS_OUTPUT.PUT_LINE('Rows inserted in AREA Table');
        DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');
        COMMIT;
EXCEPTION
when dup_val_on_index then
dbms_output.put_line('Duplicate Value Found. Insert a Different Value');
when others then
dbms_output.put_line('Error while inserting data into AREA Table');
rollback;
dbms_output.put_line('Error: ');
dbms_output.put_line(dbms_utility.format_error_stack);
dbms_output.put_line('----------------------------------------------------------');
end INSERT_AREA;


PROCEDURE INSERT_LEASETYPE(lease_period in varchar, max_cosigners in int)
AS
BEGIN
        DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');
        INSERT INTO LEASE_TYPE(lease_period , max_cosigners ) VALUES (lease_period,max_cosigners); 
        DBMS_OUTPUT.PUT_LINE('Rows inserted in LEASE_TYPE Table');
        DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');
        COMMIT;
EXCEPTION
when dup_val_on_index then
dbms_output.put_line('Duplicate Value Found. Insert a Different Value');
when others then
dbms_output.put_line('Error while inserting data into LEASE_TYPE Table');
rollback;
dbms_output.put_line('Error: ');
dbms_output.put_line(dbms_utility.format_error_stack);
dbms_output.put_line('----------------------------------------------------------');
end INSERT_LEASETYPE;


PROCEDURE INSERT_PROPERTYTYPE(type in VARCHAR, beds in int, baths in int)
AS
BEGIN
        DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');
        INSERT INTO PROPERTY_TYPE(type , beds ,baths ) VALUES (type,beds,baths); 
        DBMS_OUTPUT.PUT_LINE('Rows inserted in PROPERTY_TYPE Table');
        DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');
        COMMIT;
EXCEPTION
when dup_val_on_index then
dbms_output.put_line('Duplicate Value Found. Insert a Different Value');
when others then
dbms_output.put_line('Error while inserting data into PROPERTY_TYPE Table');
rollback;
dbms_output.put_line('Error: ');
dbms_output.put_line(dbms_utility.format_error_stack);
dbms_output.put_line('----------------------------------------------------------');
end INSERT_PROPERTYTYPE;


PROCEDURE INSERT_TAGS(tag in VARCHAR2)
AS
BEGIN
        DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');
        INSERT INTO TAGS(tag ) VALUES (tag); 
        DBMS_OUTPUT.PUT_LINE('Rows inserted in TAGS Table');
        DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');
        COMMIT;
EXCEPTION
when dup_val_on_index then
dbms_output.put_line('Duplicate Value Found. Insert a Different Value');
when others then
dbms_output.put_line('Error while inserting data into TAGS Table');
rollback;
dbms_output.put_line('Error: ');
dbms_output.put_line(dbms_utility.format_error_stack);
dbms_output.put_line('----------------------------------------------------------');
end INSERT_TAGS;


PROCEDURE INSERT_MANAGEMENT(First_Name in VARCHAR2, Last_Name in VARCHAR2, zip_code in number, pay in decimal, contact in number,email in varchar2, password in varchar2, door_no number, state_id number, city_id number, street_id number, country_id number)
AS
BEGIN
        DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');
        INSERT INTO MANAGEMENT(First_Name ,Last_Name , zip_code , pay , contact ,email, password, door_no, state_id, city_id, street_id, country_id ) VALUES (First_Name,Last_Name , zip_code , pay , contact ,email, password,door_no, state_id, city_id, street_id, country_id ); 
        DBMS_OUTPUT.PUT_LINE('Rows inserted in MANAGEMENT Table');
        DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');
        COMMIT;
EXCEPTION
when dup_val_on_index then
dbms_output.put_line('Duplicate Value Found. Insert a Different Value');
when others then
dbms_output.put_line('Error while inserting data into MANAGEMENT Table');
rollback;
dbms_output.put_line('Error: ');
dbms_output.put_line(dbms_utility.format_error_stack);
dbms_output.put_line('----------------------------------------------------------');
end INSERT_MANAGEMENT;

PROCEDURE INSERT_USERS(First_Name in VARCHAR2, Last_Name in VARCHAR2, zip_code in number,contact in number,email in varchar2,password in varchar,is_poster in number, is_buyer in number,is_owner in number,date_joined in date, last_activity in date, door_no number, state_id number, city_id number, street_id number, country_id number)
AS
BEGIN
		DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');
		INSERT INTO USERS(First_Name , Last_Name  , zip_code ,contact ,email ,password ,is_poster , is_buyer ,is_owner ,date_joined , last_activity, door_no, state_id, city_id, street_id, country_id ) VALUES(First_Name , Last_Name , zip_code ,contact ,email ,password ,is_poster , is_buyer ,is_owner ,date_joined , last_activity,door_no, state_id, city_id, street_id, country_id );
		DBMS_OUTPUT.PUT_LINE('Rows inserted in USERS Table');
        DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');
        COMMIT;
EXCEPTION
when dup_val_on_index then
dbms_output.put_line('Duplicate Value Found. Insert a Different Value');
when others then
dbms_output.put_line('Error while inserting data into USERS Table');
rollback;
dbms_output.put_line('Error: ');
dbms_output.put_line(dbms_utility.format_error_stack);
dbms_output.put_line('----------------------------------------------------------');
end INSERT_USERS;


PROCEDURE INSERT_SUBSCRIPTIONS(start_date in date,subscription_end_date in date,status in number,user_id in int)
AS
BEGIN
		DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');
		INSERT INTO SUBSCRIPTIONS(start_date ,subscription_end_date ,status ,user_id ) VALUES(start_date ,subscription_end_date ,status ,user_id );
		DBMS_OUTPUT.PUT_LINE('Rows inserted in SUBSCRIPTIONS Table');
        DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');
        COMMIT;
EXCEPTION
when dup_val_on_index then
dbms_output.put_line('Duplicate Value Found. Insert a Different Value');
when others then
dbms_output.put_line('Error while inserting data into SUBSCRIPTIONS Table');
rollback;
dbms_output.put_line('Error: ');
dbms_output.put_line(dbms_utility.format_error_stack);
dbms_output.put_line('----------------------------------------------------------');
end INSERT_SUBSCRIPTIONS;
		

PROCEDURE INSERT_LISTING(user_id in int,is_premium in char,banner in varchar2, descript in varchar2,address_id in int,zip_code in number,rent in decimal,deposit in decimal,brokerage in number,area_id in int,heat in char,hot_water in char,laundry in char,date_available in DATE,lease_id in int,property_type_id in int,date_posted in DATE )
AS
BEGIN
		DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');
		INSERT INTO LISTING(user_id ,is_premium ,banner , descript ,address_id ,zip_code ,rent,deposit ,brokerage ,area_id ,heat ,hot_water ,laundry ,date_available ,lease_id ,property_type_id ,date_posted  )VALUES(user_id ,is_premium ,banner , descript ,address_id ,zip_code ,rent,deposit ,brokerage ,area_id ,heat ,hot_water ,laundry ,date_available ,lease_id ,property_type_id ,date_posted  );
		DBMS_OUTPUT.PUT_LINE('Rows inserted in LISTING Table');
        DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');
        COMMIT;
EXCEPTION
when dup_val_on_index then
dbms_output.put_line('Duplicate Value Found. Insert a Different Value');
when others then
dbms_output.put_line('Error while inserting data into LISTING Table');
rollback;
dbms_output.put_line('Error: ');
dbms_output.put_line(dbms_utility.format_error_stack);
dbms_output.put_line('----------------------------------------------------------');
end INSERT_LISTING;


PROCEDURE INSERT_LISTINGTAGS( tag_id in number, listing_id in number)
AS
BEGIN
		DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');
		INSERT INTO LISTING_TAGS(tag_id , listing_id) VALUES(tag_id , listing_id);
		DBMS_OUTPUT.PUT_LINE('Rows inserted in LISTING_TAGS Table');
        DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');
        COMMIT;
EXCEPTION
when dup_val_on_index then
dbms_output.put_line('Duplicate Value Found. Insert a Different Value');
when others then
dbms_output.put_line('Error while inserting data into LISTING_TAGS Table');
rollback;
dbms_output.put_line('Error: ');
dbms_output.put_line(dbms_utility.format_error_stack);
dbms_output.put_line('----------------------------------------------------------');
end INSERT_LISTINGTAGS;


PROCEDURE INSERT_LISTINGSTATUS(is_available in char,date_updated in date, updated_by in number, listing_id number)
AS
BEGIN
		DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');
		INSERT INTO LISTING_STATUS(is_available ,date_updated , updated_by, listing_id ) VALUES(is_available ,date_updated , updated_by, listing_id);
		DBMS_OUTPUT.PUT_LINE('Rows inserted in LISTING_STATUS Table');
        DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');
        COMMIT;
EXCEPTION
when dup_val_on_index then
dbms_output.put_line('Duplicate Value Found. Insert a Different Value');
when others then
dbms_output.put_line('Error while inserting data into LISTING_STATUS Table');
rollback;
dbms_output.put_line('Error: ');
dbms_output.put_line(dbms_utility.format_error_stack);
dbms_output.put_line('----------------------------------------------------------');
end INSERT_LISTINGSTATUS;


PROCEDURE INSERT_CONCERNS(date_added in DATE,date_resolved in DATE,listing_id in int,comments in varchar2,ctype in varchar2,addressed_by in int,solution in varchar2,user_id in int)
AS
BEGIN
		DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');
		INSERT INTO CONCERNS(date_added ,date_resolved ,listing_id ,comments, ctype,addressed_by ,solution,user_id ) VALUES(date_added ,date_resolved ,listing_id ,comments, ctype ,addressed_by , solution,user_id );
		DBMS_OUTPUT.PUT_LINE('Rows inserted in CONCERNS Table');
        DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');
        COMMIT;
EXCEPTION
when dup_val_on_index then
dbms_output.put_line('Duplicate Value Found. Insert a Different Value');
when others then
dbms_output.put_line('Error while inserting data into CONCERNS Table');
rollback;
dbms_output.put_line('Error: ');
dbms_output.put_line(dbms_utility.format_error_stack);
dbms_output.put_line('----------------------------------------------------------');
end INSERT_CONCERNS;


PROCEDURE INSERT_OFFER(user_id in int,listing_id in int,date_added in date,rent in decimal,lease_period in NUMBER,move_in in DATE,status in char,date_addressed in DATE,comments in varchar2,DEAL in number)
AS
BEGIN
		DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');
		INSERT INTO OFFER(user_id ,listing_id ,date_added ,rent ,lease_period ,move_in ,status ,date_addressed ,comments ,DEAL  ) VALUES(user_id ,listing_id ,date_added ,rent ,lease_period ,move_in ,status ,date_addressed ,comments ,DEAL  );
		DBMS_OUTPUT.PUT_LINE('Rows inserted in OFFER Table');
        DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');
        COMMIT;
EXCEPTION
when dup_val_on_index then
dbms_output.put_line('Duplicate Value Found. Insert a Different Value');
when others then
dbms_output.put_line('Error while inserting data into OFFER Table');
rollback;
dbms_output.put_line('Error: ');
dbms_output.put_line(dbms_utility.format_error_stack);
dbms_output.put_line('----------------------------------------------------------');
end INSERT_OFFER;

END;