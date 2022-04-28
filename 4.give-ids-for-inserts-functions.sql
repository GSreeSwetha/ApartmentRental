create or replace function giveId(colName in varchar2,colPredicateName in varchar2,colStrVal in varchar2,colIntVal in number, tableIn in varchar2)
return number
is
v_val number;
--v_po varchar2(300) := 'select ' || colName || ' from '||  tableIn  || ' where ' ||colPredicateName || ' = ' || chr(39) || colStrVal || chr(39);
begin

if (colIntVal is null) then 
    execute immediate 'select ' || colName || ' from '||  tableIn  || ' where ' ||colPredicateName || ' = ' || chr(39) || colStrVal || chr(39) into v_val;
elsif (colStrVal is null) then
    execute immediate 'select ' || colName || ' from '||  tableIn  || ' where ' ||colPredicateName || ' = ' || colIntVal into v_val;
else raise no_data_found;
end if;
return v_val;
exception
    when no_data_found then
        v_val:= null;
    return v_val;
end;
/
create or replace function giveIdSpecTabs(colMinArea in number, colMaxArea in number, colLeasePeriod in varchar2, colCosigners in number, colPropType in varchar2, colBeds in number, colBaths in number, tableIn in varchar2)
return number
is
v_val number;
begin
if(upper(tableIn) = 'AREA') then
    execute immediate 'select id from Area where min_area = ' || colMinArea || ' and max_area = ' || colMaxArea into v_val; 
elsif(upper(tableIn) = 'PROPERTY_TYPE' ) then
    execute immediate 'select id from property_type where type = ' || chr(39) || colPropType || chr(39) || ' and beds = ' || colBeds || ' and baths = ' || colBaths into v_val; 
elsif(upper(tableIn) = 'LEASE_TYPE') then
    execute immediate 'select id from lease_type where lease_period = ' || chr(39) || colLeasePeriod || chr(39)  || ' and max_cosigners = ' || colCosigners into v_val; 
else raise no_data_found;
end if;
return v_val;
exception
    when no_data_found then
        v_val:= null;
    return v_val;
end;
/
