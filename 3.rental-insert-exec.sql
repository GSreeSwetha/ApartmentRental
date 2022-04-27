SET SERVEROUTPUT ON;

--Insert Data in COUNTRY
execute INSERTDATA.INSERT_COUNTRY('US');
execute INSERTDATA.INSERT_COUNTRY('UK');
execute INSERTDATA.INSERT_COUNTRY('MX');

--Insert Data in STATE
execute INSERTDATA.INSERT_STATE('MA');
execute INSERTDATA.INSERT_STATE('NY');
execute INSERTDATA.INSERT_STATE('CA');
execute INSERTDATA.INSERT_STATE('NC');
execute INSERTDATA.INSERT_STATE('TX');

--Insert Data in AREA
execute INSERTDATA.INSERT_AREA(100,200);
execute INSERTDATA.INSERT_AREA(200,300);
execute INSERTDATA.INSERT_AREA(300,400);
execute INSERTDATA.INSERT_AREA(400,500);
execute INSERTDATA.INSERT_AREA(500,600);
execute INSERTDATA.INSERT_AREA(600,700);
execute INSERTDATA.INSERT_AREA(700,800);

--
execute INSERTDATA.INSERT_LEASETYPE('6m',2);
execute INSERTDATA.INSERT_LEASETYPE('12m',4);
execute INSERTDATA.INSERT_LEASETYPE('18m',2);
execute INSERTDATA.INSERT_LEASETYPE('6m',3);
execute INSERTDATA.INSERT_LEASETYPE('2y',2);

execute INSERTDATA.INSERT_PROPERTYTYPE('APARTMENT',2,1);
execute INSERTDATA.INSERT_PROPERTYTYPE('APARTMENT',2,2);
execute INSERTDATA.INSERT_PROPERTYTYPE('APARTMENT',3,2);
execute INSERTDATA.INSERT_PROPERTYTYPE('HOUSE',4,2);
execute INSERTDATA.INSERT_PROPERTYTYPE('OUTHOUSE',1,1);

execute INSERTDATA.INSERT_TAGS('STUDENT_FRIENDLY');
execute INSERTDATA.INSERT_TAGS('PROFESSIONALS ONLY');
execute INSERTDATA.INSERT_TAGS('PET FRIENDLY');
execute INSERTDATA.INSERT_TAGS('RECENTLY RENOVATED');

execute INSERTDATA.INSERT_CITY('Boston',giveId('id','name','MA',null,'state'));
execute INSERTDATA.INSERT_CITY('New York',giveId('id','name','NY',null,'state'));
execute INSERTDATA.INSERT_CITY('Los Angeles',giveId('id','name','CA',null,'state'));
execute INSERTDATA.INSERT_CITY('Charlotte',giveId('id','name','NC',null,'state'));
execute INSERTDATA.INSERT_CITY('Dallas',giveId('id','name','TX',null,'state'));

execute INSERTDATA.INSERT_STREET('Huntington Ave',giveId('id','name','Boston',null,'city'));
execute INSERTDATA.INSERT_STREET('Bedford St',giveId('id','name','New York',null,'city'));
execute INSERTDATA.INSERT_STREET('Hollywood Boulevard',giveId('id','name','Los Angeles',null,'city'));
execute INSERTDATA.INSERT_STREET('Josh Birmingham Pkwy',giveId('id','name','Charlotte',null,'city'));
execute INSERTDATA.INSERT_STREET('Mountain Creek Pkwy',giveId('id','name','Dallas',null,'city'));

execute INSERTDATA.INSERT_ADDRESS(76, giveId('id','name','MA',null,'state'), giveId('id','name','Boston',null,'city'), giveId('id','name','Huntington Ave',null,'street'), giveId('id','name','US',null,'country'));
execute INSERTDATA.INSERT_ADDRESS(90, giveId('id','name','NY',null,'state'), giveId('id','name','New York',null,'city'), giveId('id','name','Bedford St',null,'street'), giveId('id','name','US',null,'country'));
execute INSERTDATA.INSERT_ADDRESS(12, giveId('id','name','CA',null,'state'), giveId('id','name','Los Angeles',null,'city'), giveId('id','name','Hollywood Boulevard',null,'street'), giveId('id','name','US',null,'country'));
execute INSERTDATA.INSERT_ADDRESS(3000, giveId('id','name','TX',null,'state'), giveId('id','name','Charlotte',null,'city'), giveId('id','name','Mountain Creek Pkwy',null,'street'), giveId('id','name','US',null,'country'));
execute INSERTDATA.INSERT_ADDRESS(5501, giveId('id','name','NC',null,'state'), giveId('id','name','Dallas',null,'city'), giveId('id','name','Josh Birmingham Pkwy',null,'street'), giveId('id','name','US',null,'country'));

execute INSERTDATA.INSERT_MANAGEMENT('Scott', 'B', 02122, 1000, 6172435672,'scottb@yahoo.com', 'asdfg', 76, giveId('id','name','MA',null,'state'), giveId('id','name','Boston',null,'city'), giveId('id','name','Huntington Ave',null,'street'), giveId('id','name','US',null,'country'));
execute INSERTDATA.INSERT_MANAGEMENT('Maria', 'Chen', 02124, 2000,6174238932,'mariechen@gmail.com','ghjkl', 90,  giveId('id','name','NC',null,'state'), giveId('id','name','Charlotte',null,'city'), giveId('id','name','Beresford Road',null,'street'), giveId('id','name','US',null,'country'));
execute INSERTDATA.INSERT_MANAGEMENT('Jeff', 'Blue', 02123, 1500,6172346575,'bluejeff@hotmail.com','poiuy', 12, giveId('id','name','TX',null,'state'), giveId('id','name','Dallas',null,'city'), giveId('id','name','Main Street District',null,'street'), giveId('id','name','US',null,'country'));


----yet to do------------------------
execute INSERTDATA.INSERT_USERS('Jake', 'chiz', 03130, 6174379802, 'jakechiz@gmail.com', 'qwert', 0,0,1, '23-FEB-13', '18-mar-22', 76, giveId('id','name','MA',null,'state'), giveId('id','name','Boston',null,'city'), giveId('id','name','Huntington Ave',null,'street'), giveId('id','name','US',null,'country'));
execute INSERTDATA.INSERT_USERS('Jen', 'Lopez', 03131, 6174379803, 'jen@gmail.com', 'trewq', 0,0,1, '12-mar-17', '10-mar-21', 90,  giveId('id','name','NC',null,'state'), giveId('id','name','Charlotte',null,'city'), giveId('id','name','Beresford Road',null,'street'), giveId('id','name','US',null,'country'));
execute INSERTDATA.INSERT_USERS('Rana ', 'red ', 03132, 6164378902, 'rana@gmail.com', 'yhnmju', 0,0,0, '23-aug-15', '19-jan-22', 12, giveId('id','name','TX',null,'state'), giveId('id','name','Dallas',null,'city'), giveId('id','name','Main Street District',null,'street'), giveId('id','name','US',null,'country'));
execute INSERTDATA.INSERT_USERS('shar', 'Mary ', 03133, 6172379812, 'shar@yahoo.com', 'nmbvc', 1,1,0, '3-oct-13', '18-mar-15', 77, giveId('id','name','MA',null,'state'), giveId('id','name','Boston',null,'city'), giveId('id','name','Huntington Ave',null,'street'), giveId('id','name','US',null,'country'));
execute INSERTDATA.INSERT_USERS('pink', 'bhara', 03134, 6874397820, 'pink@yahoo.com', 'ijnmkl', 0,1,1, '5-dec-09', '8-jun-22', 91,  giveId('id','name','NC',null,'state'), giveId('id','name','Charlotte',null,'city'), giveId('id','name','Beresford Road',null,'street'), giveId('id','name','US',null,'country') );
execute INSERTDATA.INSERT_USERS('mouk', 'mana', 03120, 6564736212, 'mouk@gmail.com', 'sdfgtbt', 0,1,1, '23-feb-13', '15-apr-22 ', 13, giveId('id','name','TX',null,'state'), giveId('id','name','Dallas',null,'city'), giveId('id','name','Main Street District',null,'street'), giveId('id','name','US',null,'country'));
execute INSERTDATA.INSERT_USERS('sam', 'kodu', 04130, 6178321899, 'samk@gmail.com', 'nmxzc', 0,1,0, '14-nov-20', '6-feb-22', 78, giveId('id','name','MA',null,'state'), giveId('id','name','Boston',null,'city'), giveId('id','name','Huntington Ave',null,'street'), giveId('id','name','US',null,'country'));
execute INSERTDATA.INSERT_USERS('percy', 'jack', 03310, 6178929983, 'percy@gmail.com', 'bhnjm', 0,1,1, '17-July-21', '1-apr-22 ', 92,  giveId('id','name','NC',null,'state'), giveId('id','name','Charlotte',null,'city'), giveId('id','name','Beresford Road',null,'street'), giveId('id','name','US',null,'country'));
execute INSERTDATA.INSERT_USERS('jack', 'chiz', 08930, 7174338102, 'jack@gmail.com', 'cvfdrt', 1,0,0, '5-sep-19', '18-may-21 ', 14, giveId('id','name','TX',null,'state'), giveId('id','name','Dallas',null,'city'), giveId('id','name','Main Street District',null,'street'), giveId('id','name','US',null,'country'));
execute INSERTDATA.INSERT_USERS('ju', 'lee', 03480, 6179279002, 'julee@gmail.com', 'qazxw', 1,0,1, '2-feb-22', '14-apr-22 ', 79, giveId('id','name','MA',null,'state'), giveId('id','name','Boston',null,'city'), giveId('id','name','Huntington Ave',null,'street'), giveId('id','name','US',null,'country'));
execute INSERTDATA.INSERT_USERS('jai', 'kolla', 03210, 6174659866, 'jaikolla@gmail.com', 'mliop', 1,1,0, '12-dec-11', '18-mar-20 ', 93,  giveId('id','name','NC',null,'state'), giveId('id','name','Charlotte',null,'city'), giveId('id','name','Beresford Road',null,'street'), giveId('id','name','US',null,'country'));
execute INSERTDATA.INSERT_USERS('seth', 'Rodriguez', 03130, 6177863302, 'sethr@gmail.com', 'bgtvfr', 1,1,1, '5-feb-17', '18-jul-20 ', 15, giveId('id','name','TX',null,'state'), giveId('id','name','Dallas',null,'city'), giveId('id','name','Main Street District',null,'street'), giveId('id','name','US',null,'country'));
execute INSERTDATA.INSERT_USERS('mako', 'xu', 03310, 6178219642, 'thalia@yahoo.com', 'yhgtf', 0,0,1, '2-feb-21', '18-jan-22 ', 80, giveId('id','name','MA',null,'state'), giveId('id','name','Boston',null,'city'), giveId('id','name','Huntington Ave',null,'street'), giveId('id','name','US',null,'country'));
execute INSERTDATA.INSERT_USERS('monica', 'geller', 03130, 8274389806, 'mgeller@yahoo.com', 'fderst', 0,1,0, '3-sep-21', '1-mar-22', 94,  giveId('id','name','NC',null,'state'), giveId('id','name','Charlotte',null,'city'), giveId('id','name','Beresford Road',null,'street'), giveId('id','name','US',null,'country') );
execute INSERTDATA.INSERT_USERS('ross', 'geller', 03130, 5478379442, 'gross@gmail.com', 'mkofgt', 1,1,0, '23-nov-19', '18-feb-22 ', 16, giveId('id','name','TX',null,'state'), giveId('id','name','Dallas',null,'city'), giveId('id','name','Main Street District',null,'street'), giveId('id','name','US',null,'country'));
execute INSERTDATA.INSERT_USERS('chandler', 'bing', 03113, 6874879882, 'cbing@yahoo.com', 'qscvgy', 1,1,0, '16-sep-13', '18-mar-15 ', 81, giveId('id','name','MA',null,'state'), giveId('id','name','Boston',null,'city'), giveId('id','name','Huntington Ave',null,'street'), giveId('id','name','US',null,'country'));
execute INSERTDATA.INSERT_USERS('Rachel', 'green', 03230, 5264334672, 'rachg@gmail.com', 'bvgdjs', 0,1,0, '4-jan-19', '18-feb-21 ', 95,  giveId('id','name','NC',null,'state'), giveId('id','name','Charlotte',null,'city'), giveId('id','name','Beresford Road',null,'street'), giveId('id','name','US',null,'country'));
execute INSERTDATA.INSERT_USERS('Eric', 'ping', 07120, 6174129853, 'Eric@yahoo.com', 'dhfwot', 1,0,1, '23-feb-20', '20-aug-20 ', 17, giveId('id','name','TX',null,'state'), giveId('id','name','Dallas',null,'city'), giveId('id','name','Main Street District',null,'street'), giveId('id','name','US',null,'country'));
execute INSERTDATA.INSERT_USERS('james', 'buck', 05133, 8123379867, 'buck@gmail.com', 'njsdh', 0,1,1, '8-jun-18', '18-jan-21', 82, giveId('id','name','MA',null,'state'), giveId('id','name','Boston',null,'city'), giveId('id','name','Huntington Ave',null,'street'), giveId('id','name','US',null,'country'));
execute INSERTDATA.INSERT_USERS('kyle', 'downing', 06133, 6114344833, 'kyled@gmail.com', 'galsk', 1,1,0, '10-oct-21', '8-apr-22', 96,  giveId('id','name','NC',null,'state'), giveId('id','name','Charlotte',null,'city'), giveId('id','name','Beresford Road',null,'street'), giveId('id','name','US',null,'country'));
execute INSERTDATA.INSERT_USERS('karthik', 'challa', 03133, 6174234805, 'kchalla@yahoo.com', 'berthj', 1,0,0, '7-oct-21', '1-jan-22', 18, giveId('id','name','TX',null,'state'), giveId('id','name','Dallas',null,'city'), giveId('id','name','Main Street District',null,'street'), giveId('id','name','US',null,'country'));
execute INSERTDATA.INSERT_USERS('Phani', 'kasuba', 03130, 6177903503, 'phanik@gmail.com', 'uiqwcn', 0,0,1, '15-dec-11', '8-nov-15', 83, giveId('id','name','MA',null,'state'), giveId('id','name','Boston',null,'city'), giveId('id','name','Huntington Ave',null,'street'), giveId('id','name','US',null,'country'));
execute INSERTDATA.INSERT_USERS('lola', 'Jensen', 02133, 9276274114, 'lola@yahoo.com', 'juqlzi', 1,0,1, '19-jan-22', '18-feb-22', 97,  giveId('id','name','NC',null,'state'), giveId('id','name','Charlotte',null,'city'), giveId('id','name','Beresford Road',null,'street'), giveId('id','name','US',null,'country'));
execute INSERTDATA.INSERT_USERS('ben', 'schmitt', 02133, 6192179822, 'bens@gmail.com', 'yjdopl', 1,1,1, '30-sep-12', '1-jun-17', 19, giveId('id','name','TX',null,'state'), giveId('id','name','Dallas',null,'city'), giveId('id','name','Main Street District',null,'street'), giveId('id','name','US',null,'country'));
execute INSERTDATA.INSERT_USERS('Kim', 'shaw', 03140, 6174007818, 'shaw@gmail.com', 'nkwofn', 0,1,0, '31-july-19', '18-jan-20', 84, giveId('id','name','MA',null,'state'), giveId('id','name','Boston',null,'city'), giveId('id','name','Huntington Ave',null,'street'), giveId('id','name','US',null,'country'));

execute INSERTDATA.INSERT_SUBSCRIPTIONS('23-aug-15','23-aug-15',1,giveId('id','email','jakechiz@gmail.com',null,'users'));
execute INSERTDATA.INSERT_SUBSCRIPTIONS('23-aug-15','23-aug-15',1,giveId('id','email','jen@gmail.com',null,'users'));
execute INSERTDATA.INSERT_SUBSCRIPTIONS('23-aug-15','23-aug-15',1,giveId('id','email','rana@gmail.com',null,'users'));
execute INSERTDATA.INSERT_SUBSCRIPTIONS('23-aug-15','23-aug-15',1,giveId('id','email','shar@yahoo.com',null,'users'));
execute INSERTDATA.INSERT_SUBSCRIPTIONS('23-aug-15','23-aug-15',1,giveId('id','email','pink@yahoo.com',null,'users'));
execute INSERTDATA.INSERT_SUBSCRIPTIONS('23-aug-15','23-aug-15',1,giveId('id','email','mouk@gmail.com',null,'users'));
execute INSERTDATA.INSERT_SUBSCRIPTIONS('23-aug-15','23-aug-15',1,giveId('id','email','samk@gmail.com',null,'users'));
execute INSERTDATA.INSERT_SUBSCRIPTIONS('23-aug-15','23-aug-15',1,giveId('id','email','percy@gmail.com',null,'users'));
execute INSERTDATA.INSERT_SUBSCRIPTIONS('23-aug-15','23-aug-15',1,giveId('id','email','jack@gmail.com',null,'users'));
execute INSERTDATA.INSERT_SUBSCRIPTIONS('23-aug-15','23-aug-15',1,giveId('id','email','julee@gmail.com',null,'users'));
execute INSERTDATA.INSERT_SUBSCRIPTIONS('23-aug-15','23-aug-15',1,giveId('id','email','jaikolla@gmail.com',null,'users'));
execute INSERTDATA.INSERT_SUBSCRIPTIONS('23-aug-15','23-aug-15',1,giveId('id','email','sethr@gmail.com',null,'users'));

execute INSERTDATA.INSERT_LISTING(giveId('id','email','jakechiz@gmail.com',null,'users'), 'Y', 'LODHA', '3BHK', giveId('id','door_no',null,76,'address'), 04140, 3000, 1500, 1500, giveidspectabs(100,200,null,null,null,null,null,'Area'), 'Y', 'Y', 'Y','13-may-22', giveidspectabs(null,null,'6m',2,null,null,null,'lease_type'), giveidspectabs(null,null,null,null,'HOUSE',4,2,'property_type'), '15-apr-22');
execute INSERTDATA.INSERT_LISTING(giveId('id','email','mouk@gmail.com',null,'users'), 'Y', 'LODHA', '2BHK', giveId('id','door_no',null,90,'address'), 04140, 2000, 1000, 1000, giveidspectabs(600,700,null,null,null,null,null,'Area'), 'Y', 'Y', 'N', '1-may-22', giveidspectabs(null,null,'12m',4,null,null,null,'lease_type'), giveidspectabs(null,null,null,null,'APARTMENT',2,2,'property_type'), '15-apr-22');
execute INSERTDATA.INSERT_LISTING(giveId('id','email','kyled@gmail.com',null,'users'), 'Y', 'MYHOME', '3BHK', giveId('id','door_no',null,3000,'address'), 04141, 4000, 500, 2500, giveidspectabs(400,500,null,null,null,null,null,'Area'), 'Y', 'Y', 'Y','3-JUNE-20', giveidspectabs(null,null,'2y',2,null,null,null,'lease_type'), giveidspectabs(null,null,null,null,'APARTMENT',2,1,'property_type'), '5-JAN-20');
execute INSERTDATA.INSERT_LISTING(giveId('id','email','pink@yahoo.com',null,'users'), 'Y', 'MYHOME', '2BHK', giveId('id','door_no',null,5501,'address'), 04141, 2500, 500, 1000, giveidspectabs(600,700,null,null,null,null,null,'Area'), 'Y', 'Y', 'N', '8-AUG-20', giveidspectabs(null,null,'18m',2,null,null,null,'lease_type'), giveidspectabs(null,null,null,null,'HOUSE',4,2,'property_type'), '12-MAR-20');
execute INSERTDATA.INSERT_LISTING(giveId('id','email','lola@yahoo.com',null,'users'), 'Y', 'JVUE', '1BHK', giveId('id','door_no',null,12,'address'), 02120, 2000, 1000, 1000, giveidspectabs(400,500,null,null,null,null,null,'Area'), 'Y', 'Y', 'N', '18-JUNE-22', giveidspectabs(null,null,'2y',2,null,null,null,'lease_type'), giveidspectabs(null,null,null,null,'APARTMENT',3,2,'property_type'), '5-apr-22');

execute INSERTDATA.INSERT_LISTINGSTATUS('Y', '15-may-21',giveId('id','zip_code',null,02122,'management'), 3001);
execute INSERTDATA.INSERT_LISTINGSTATUS('N', '15-MAY-21',giveId('id','zip_code',null,02124,'management'), 3002);
execute INSERTDATA.INSERT_LISTINGSTATUS('Y', '15-MAY-21',giveId('id','zip_code',null,02123,'management'), 3003);
execute INSERTDATA.INSERT_LISTINGSTATUS('Y', '15-MAY-21',giveId('id','zip_code',null,02123,'management'), 3004);
execute INSERTDATA.INSERT_LISTINGSTATUS('Y', '15-MAY-21',giveId('id','zip_code',null,02122,'management'), 3005);

execute INSERTDATA.INSERT_CONCERNS('12-MAY-21', '15-MAY-21', 3001, 'issue with hot water',null, giveId('id','zip_code',null,02122,'management'),'issue resolved', 2004);
execute INSERTDATA.INSERT_CONCERNS('12-MAY-21', '15-MAY-21', 3003, 'issue with hot water',null, giveId('id','zip_code',null,02123,'management'),'hot water issue to be fixed by May', 2005);

execute INSERTDATA.INSERT_OFFER(2004,3001,'15-APR-22', 2500, 24,'15-MAY-22','Y','15-APR-22','can be negotiated', 0);
execute INSERTDATA.INSERT_OFFER(2005,3002,'15-APR-22', 1500, 24,'15-JUN-22','Y','15-APR-22','can be negotiated', 0);
execute INSERTDATA.INSERT_OFFER(2006,3003,'15-APR-22', 1500, 24,'15-JUL-22','Y','15-APR-22','can be negotiated', 0);

execute INSERTDATA.INSERT_LISTINGTAGS(giveId('id','tag','STUDENT_FRIENDLY',null,'tags'), 3001);
execute INSERTDATA.INSERT_LISTINGTAGS(giveId('id','tag','PROFESSIONALS ONLY',null,'tags'), 3001);
execute INSERTDATA.INSERT_LISTINGTAGS(giveId('id','tag','STUDENT_FRIENDLY',null,'tags'), 3002);
execute INSERTDATA.INSERT_LISTINGTAGS(giveId('id','tag','PET FRIENDLY',null,'tags'), 3003);
execute INSERTDATA.INSERT_LISTINGTAGS(giveId('id','tag','RECENTLY RENOVATED',null,'tags'),3004);
execute INSERTDATA.INSERT_LISTINGTAGS(giveId('id','tag','PROFESSIONALS ONLY',null,'tags'),3005);

