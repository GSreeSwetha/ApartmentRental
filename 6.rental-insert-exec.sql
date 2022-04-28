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
execute INSERTDATA.INSERT_STATE('OH');
execute INSERTDATA.INSERT_STATE('AZ');
execute INSERTDATA.INSERT_STATE('CO');
execute INSERTDATA.INSERT_STATE('WA');
execute INSERTDATA.INSERT_STATE('LA');
execute INSERTDATA.INSERT_STATE('IA');
execute INSERTDATA.INSERT_STATE('FL');
execute INSERTDATA.INSERT_STATE('ME');
execute INSERTDATA.INSERT_STATE('KS');
execute INSERTDATA.INSERT_STATE('OR');
execute INSERTDATA.INSERT_STATE('NV');
execute INSERTDATA.INSERT_STATE('NM');
execute INSERTDATA.INSERT_STATE('WI');
execute INSERTDATA.INSERT_STATE('MI');
execute INSERTDATA.INSERT_STATE('IL');
execute INSERTDATA.INSERT_STATE('IN');
execute INSERTDATA.INSERT_STATE('MS');
execute INSERTDATA.INSERT_STATE('TN');
execute INSERTDATA.INSERT_STATE('PA');
execute INSERTDATA.INSERT_STATE('SC');
execute INSERTDATA.INSERT_STATE('NH');
execute INSERTDATA.INSERT_STATE('CT');
execute INSERTDATA.INSERT_STATE('DE');
execute INSERTDATA.INSERT_STATE('VA');
execute INSERTDATA.INSERT_STATE('OK');

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
execute INSERTDATA.INSERT_CITY('New Orleans',giveId('id','name','LA',null,'state'));
execute INSERTDATA.INSERT_CITY('Richmond',giveId('id','name','VA',null,'state'));
execute INSERTDATA.INSERT_CITY('Pittsburgh',giveId('id','name','PA',null,'state'));
execute INSERTDATA.INSERT_CITY('Denver',giveId('id','name','CO',null,'state'));
execute INSERTDATA.INSERT_CITY('Hartford',giveId('id','name','CT',null,'state'));
execute INSERTDATA.INSERT_CITY('Chicago',giveId('id','name','IL',null,'state'));
execute INSERTDATA.INSERT_CITY('Wichita',giveId('id','name','KS',null,'state'));
execute INSERTDATA.INSERT_CITY('Detroit',giveId('id','name','MI',null,'state'));
execute INSERTDATA.INSERT_CITY('Las Vegas',giveId('id','name','NV',null,'state'));
execute INSERTDATA.INSERT_CITY('Columbus',giveId('id','name','OH',null,'state'));

execute INSERTDATA.INSERT_STREET('Huntington Ave',giveId('id','name','Boston',null,'city'));
execute INSERTDATA.INSERT_STREET('Bedford St',giveId('id','name','New York',null,'city'));
execute INSERTDATA.INSERT_STREET('Hollywood Boulevard',giveId('id','name','Los Angeles',null,'city'));
execute INSERTDATA.INSERT_STREET('Josh Birmingham Pkwy',giveId('id','name','Charlotte',null,'city'));
execute INSERTDATA.INSERT_STREET('Mountain Creek Pkwy',giveId('id','name','Dallas',null,'city'));
execute INSERTDATA.INSERT_STREET('Bourbon Street',giveId('id','name','New Orleans',null,'city'));
execute INSERTDATA.INSERT_STREET('Aberdeen Street ',giveId('id','name','Richmond',null,'city'));
execute INSERTDATA.INSERT_STREET('Baum Boulevard',giveId('id','name','Pittsburgh',null,'city'));
execute INSERTDATA.INSERT_STREET('East Colfax Avenue',giveId('id','name','Denver',null,'city'));
execute INSERTDATA.INSERT_STREET('Adelaide St',giveId('id','name','Hartford',null,'city'));
execute INSERTDATA.INSERT_STREET('North Milwaukee Avenue',giveId('id','name','Chicago',null,'city'));
execute INSERTDATA.INSERT_STREET('Kailer Dr',giveId('id','name','Wichita',null,'city'));
execute INSERTDATA.INSERT_STREET('Woodward Avenue',giveId('id','name','Detroit',null,'city'));
execute INSERTDATA.INSERT_STREET('Las Vegas Boulevard',giveId('id','name','Las Vegas',null,'city'));
execute INSERTDATA.INSERT_STREET('Polaris Crossing',giveId('id','name','Columbus',null,'city'));
execute INSERTDATA.INSERT_STREET('Marconi Boulevard',giveId('id','name','Columbus',null,'city'));

execute INSERTDATA.INSERT_ADDRESS(76, giveId('id','name','MA',null,'state'), giveId('id','name','Boston',null,'city'), giveId('id','name','Huntington Ave',null,'street'), giveId('id','name','US',null,'country'));
execute INSERTDATA.INSERT_ADDRESS(90, giveId('id','name','NY',null,'state'), giveId('id','name','New York',null,'city'), giveId('id','name','Bedford St',null,'street'), giveId('id','name','US',null,'country'));
execute INSERTDATA.INSERT_ADDRESS(12, giveId('id','name','CA',null,'state'), giveId('id','name','Los Angeles',null,'city'), giveId('id','name','Hollywood Boulevard',null,'street'), giveId('id','name','US',null,'country'));
execute INSERTDATA.INSERT_ADDRESS(3000, giveId('id','name','TX',null,'state'), giveId('id','name','Charlotte',null,'city'), giveId('id','name','Mountain Creek Pkwy',null,'street'), giveId('id','name','US',null,'country'));
execute INSERTDATA.INSERT_ADDRESS(5501, giveId('id','name','NC',null,'state'), giveId('id','name','Dallas',null,'city'), giveId('id','name','Josh Birmingham Pkwy',null,'street'), giveId('id','name','US',null,'country'));
execute INSERTDATA.INSERT_ADDRESS(23, giveId('id','name','OH',null,'state'), giveId('id','name','Columbus',null,'city'), giveId('id','name','Polaris Crossing',null,'street'), giveId('id','name','US',null,'country'));
execute INSERTDATA.INSERT_ADDRESS(26, giveId('id','name','LA',null,'state'), giveId('id','name','New Orleans',null,'city'), giveId('id','name','Bourbon Street',null,'street'), giveId('id','name','US',null,'country'));
execute INSERTDATA.INSERT_ADDRESS(1210, giveId('id','name','TX',null,'state'), giveId('id','name','Dallas',null,'city'), giveId('id','name','Mountain Creek Pkwy',null,'street'), giveId('id','name','US',null,'country'));
execute INSERTDATA.INSERT_ADDRESS(1712, giveId('id','name','CO',null,'state'), giveId('id','name','Denver',null,'city'), giveId('id','name','East Colfax Avenue',null,'street'), giveId('id','name','US',null,'country'));
execute INSERTDATA.INSERT_ADDRESS(2623, giveId('id','name','IL',null,'state'), giveId('id','name','Chicago',null,'city'), giveId('id','name','North Milwaukee Avenue',null,'street'), giveId('id','name','US',null,'country'));
execute INSERTDATA.INSERT_ADDRESS(286, giveId('id','name','NV',null,'state'), giveId('id','name','Las Vegas',null,'city'), giveId('id','name','Las Vegas Boulevard',null,'street'), giveId('id','name','US',null,'country'));
execute INSERTDATA.INSERT_ADDRESS(701, giveId('id','name','MI',null,'state'), giveId('id','name','Detroit',null,'city'), giveId('id','name','Woodward Avenue',null,'street'), giveId('id','name','US',null,'country'));
execute INSERTDATA.INSERT_ADDRESS(2123, giveId('id','name','PA',null,'state'), giveId('id','name','Pittsburgh',null,'city'), giveId('id','name','Baum Boulevard',null,'street'), giveId('id','name','US',null,'country'));
execute INSERTDATA.INSERT_ADDRESS(7, giveId('id','name','VA',null,'state'), giveId('id','name','Richmond',null,'city'), giveId('id','name','Aberdeen Street ',null,'street'), giveId('id','name','US',null,'country'));
execute INSERTDATA.INSERT_ADDRESS(43, giveId('id','name','KS',null,'state'), giveId('id','name','Wichita',null,'city'), giveId('id','name','Kailer Dr',null,'street'), giveId('id','name','US',null,'country'));
execute INSERTDATA.INSERT_ADDRESS(62, giveId('id','name','OH',null,'state'), giveId('id','name','Columbus',null,'city'), giveId('id','name','Marconi Boulevard',null,'street'), giveId('id','name','US',null,'country'));
execute INSERTDATA.INSERT_ADDRESS(1302, giveId('id','name','LA',null,'state'), giveId('id','name','New Orleans',null,'city'), giveId('id','name','Bourbon Street',null,'street'), giveId('id','name','US',null,'country'));
execute INSERTDATA.INSERT_ADDRESS(320, giveId('id','name','MA',null,'state'), giveId('id','name','Boston',null,'city'), giveId('id','name','Huntington Ave',null,'street'), giveId('id','name','US',null,'country'));


execute INSERTDATA.INSERT_MANAGEMENT('Scott', 'B', 02122, 1000, 6172435672,'scottb@yahoo.com', 'asdfg', 76, giveId('id','name','MA',null,'state'), giveId('id','name','Boston',null,'city'), giveId('id','name','Huntington Ave',null,'street'), giveId('id','name','US',null,'country'));
execute INSERTDATA.INSERT_MANAGEMENT('Maria', 'Chen', 02124, 2000,6174238932,'mariechen@gmail.com','ghjkl', 90,  giveId('id','name','NC',null,'state'), giveId('id','name','Charlotte',null,'city'), giveId('id','name','Beresford Road',null,'street'), giveId('id','name','US',null,'country'));
execute INSERTDATA.INSERT_MANAGEMENT('Jeff', 'Blue', 02123, 1500,6172346575,'bluejeff@hotmail.com','poiuy', 12, giveId('id','name','TX',null,'state'), giveId('id','name','Dallas',null,'city'), giveId('id','name','Main Street District',null,'street'), giveId('id','name','US',null,'country'));
execute INSERTDATA.INSERT_MANAGEMENT('Thalia ', 'Grace',3130,3000,6362475672,'kilom',1302, giveId('id','name','LA',null,'state'), giveId('id','name','New Orleans',null,'city'), giveId('id','name','Bourbon Street',null,'street'), giveId('id','name','US',null,'country'));
execute INSERTDATA.INSERT_MANAGEMENT('Anna ', 'Chase',2316,5000,6173680243,'fghnb',23, giveId('id','name','OH',null,'state'), giveId('id','name','Columbus',null,'city'), giveId('id','name','Polaris Crossing',null,'street'), giveId('id','name','US',null,'country'));
execute INSERTDATA.INSERT_MANAGEMENT('Anna ', 'Chase',2316,5000,6173680243,'fghnb',62, giveId('id','name','OH',null,'state'), giveId('id','name','Columbus',null,'city'), giveId('id','name','Huntington Ave',null,'street'), giveId('id','name','US',null,'country'));
execute INSERTDATA.INSERT_MANAGEMENT('Thalia ', 'Grace',3130,3000,6362475672,'kilom',26, giveId('id','name','LA',null,'state'), giveId('id','name','New Orleans',null,'city'), giveId('id','name','Bourbon Street',null,'street'), giveId('id','name','US',null,'country'));

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
execute INSERTDATA.INSERT_LISTING(giveId('id','email','rana@gmail.com',null,'users'), 'N', 'JVUE', '4BHK', giveId('id','door_no',null,320,'address'),2120,4000,1500,3000, giveidspectabs(700,800,null,null,null,null,null,'Area'), 'Y ', 'Y ', 'Y','9-dec-21', giveidspectabs(null,null,'6m',3,null,null,null,'lease_type'), giveidspectabs(null,null,null,null,'APARTMENT',4,2,'property_type'),  '22-OCT-21');
execute INSERTDATA.INSERT_LISTING(giveId('id','email','gross@gmail.com',null,'users'), 'N', 'MARRIOT', '1BHK', giveId('id','door_no',null,26,'address'),6160,2500,500,500, giveidspectabs(300,400,null,null,null,null,null,'Area'), 'Y ', 'N ', 'Y','23-FEB-20', giveidspectabs(null,null,'12m',4,null,null,null,'lease_type'), giveidspectabs(null,null,null,null,'OUTHOUSE',1,1,'property_type'),  '7-AUG-19');
execute INSERTDATA.INSERT_LISTING(giveId('id','email','gross@gmail.com',null,'users'), 'N', 'MARRIOT', '1BHK', giveId('id','door_no',null,26,'address'),6160,2700,500,500, giveidspectabs(300,400,null,null,null,null,null,'Area'), 'Y ', 'Y ', 'Y','3-MAR-20', giveidspectabs(null,null,'6m',2,null,null,null,'lease_type'), giveidspectabs(null,null,null,null,'OUTHOUSE',1,1,'property_type'),  '7-AUG-19');
execute INSERTDATA.INSERT_LISTING(giveId('id','email','gross@gmail.com',null,'users'), 'N', 'MARRIOT', '1BHK', giveId('id','door_no',null,26,'address'),6160,2500,500,500, giveidspectabs(300,400,null,null,null,null,null,'Area'), 'Y ', 'N ', 'Y','16-DEC-20', giveidspectabs(null,null,'2y',2,null,null,null,'lease_type'), giveidspectabs(null,null,null,null,'OUTHOUSE',1,1,'property_type'),  '7-AUG-19');
execute INSERTDATA.INSERT_LISTING(giveId('id','email','gross@gmail.com',null,'users'), 'N', 'SKYHY', '2BHK', giveId('id','door_no',null,286,'address'),6160,3000,1500,1500, giveidspectabs(500,600,null,null,null,null,null,'Area'), 'Y ', 'N ', 'N','5-OCT-22', giveidspectabs(null,null,'6m',2,null,null,null,'lease_type'), giveidspectabs(null,null,null,null,'APARTMENT',2,2,'property_type'),  '3-MAR-22');
execute INSERTDATA.INSERT_LISTING(giveId('id','email','percy@gmail.com',null,'users'), 'Y', 'WESTIN', '2BHK', giveId('id','door_no',null,2623,'address'),5670,5500,1700,2500, giveidspectabs(600,700,null,null,null,null,null,'Area'), 'N ', 'Y ', 'Y','4-APR-20', giveidspectabs(null,null,'12m',4,null,null,null,'lease_type'), giveidspectabs(null,null,null,null,'APARTMENT',2,1,'property_type'),  '10-FEB-20');
execute INSERTDATA.INSERT_LISTING(giveId('id','email','kyled@gmail.com',null,'users'), 'Y', 'HILTON', '3BHK', giveId('id','door_no',null,7,'address'),7830,4000,500,500, giveidspectabs(200,300,null,null,null,null,null,'Area'), 'Y ', 'Y ', 'Y','8-JUL-22', giveidspectabs(null,null,'2y',2,null,null,null,'lease_type'), giveidspectabs(null,null,null,null,'HOUSE',4,2,'property_type'),  '17-DEC-19');
execute INSERTDATA.INSERT_LISTING(giveId('id','email','sethr@gmail.com',null,'users'), 'N', 'ABODE', '4BHK', giveId('id','door_no',null,62,'address'),3130,3500,1500,1000, giveidspectabs(700,800,null,null,null,null,null,'Area'), 'N ', 'N ', 'Y','20-JAN-17', giveidspectabs(null,null,'12m',4,null,null,null,'lease_type'), giveidspectabs(null,null,null,null,'HOUSE',4,2,'property_type'),  '22-DEC-15');
execute INSERTDATA.INSERT_LISTING(giveId('id','email','sethr@gmail.com',null,'users'), 'N', 'ABODE', '3BHK', giveId('id','door_no',null,62,'address'),3130,2500,500,1000, giveidspectabs(600,700,null,null,null,null,null,'Area'), 'N ', 'N ', 'Y','12-MAY-17', giveidspectabs(null,null,'12m',4,null,null,null,'lease_type'), giveidspectabs(null,null,null,null,'HOUSE',3,2,'property_type'),  '22-DEC-15');
execute INSERTDATA.INSERT_LISTING(giveId('id','email','sethr@gmail.com',null,'users'), 'N', 'ABODE', '2BHK', giveId('id','door_no',null,62,'address'),3130,2000,500,500, giveidspectabs(500,600,null,null,null,null,null,'Area'), 'N ', 'N ', 'Y','17-MAR-17', giveidspectabs(null,null,'6m',2,null,null,null,'lease_type'), giveidspectabs(null,null,null,null,'HOUSE',2,1,'property_type'),  '22-DEC-15');
execute INSERTDATA.INSERT_LISTING(giveId('id','email','Eric@yahoo.com',null,'users'), 'Y', 'LWOOD', '2BHK', giveId('id','door_no',null,23,'address'),3838,3500,1500,1500, giveidspectabs(500,600,null,null,null,null,null,'Area'), 'Y ', 'N ', 'Y','20-JAN-16', giveidspectabs(null,null,'6m',2,null,null,null,'lease_type'), giveidspectabs(null,null,null,null,'APARTMENT',2,2,'property_type'),  '14-NOV-15');
execute INSERTDATA.INSERT_LISTING(giveId('id','email','Eric@yahoo.com',null,'users'), 'Y', 'LWOOD', '3BHK', giveId('id','door_no',null,23,'address'),3838,5000,2500,2500, giveidspectabs(600,700,null,null,null,null,null,'Area'), 'Y ', 'Y ', 'Y','20-JAN-16', giveidspectabs(null,null,'6m',2,null,null,null,'lease_type'), giveidspectabs(null,null,null,null,'APARTMENT',3,2,'property_type'),  '14-NOV-15');
execute INSERTDATA.INSERT_LISTING(giveId('id','email','Eric@yahoo.com',null,'users'), 'Y', 'LWOOD', '3BHK', giveId('id','door_no',null,23,'address'),3838,5000,2500,2500, giveidspectabs(600,700,null,null,null,null,null,'Area'), 'Y ', 'Y ', 'Y','20-JAN-16', giveidspectabs(null,null,'6m',2,null,null,null,'lease_type'), giveidspectabs(null,null,null,null,'APARTMENT',3,2,'property_type'),  '14-NOV-15');
execute INSERTDATA.INSERT_LISTING(giveId('id','email','jack@gmail.com',null,'users'), 'N', 'SHERATON', '1BHK', giveId('id','door_no',null,701,'address'),89326,4500,2700,1500, giveidspectabs(600,700,null,null,null,null,null,'Area'), 'N ', 'Y ', 'N','13-FEB-22', giveidspectabs(null,null,'6m',2,null,null,null,'lease_type'), giveidspectabs(null,null,null,null,'OUTHOUSE',1,1,'property_type'),  '6-SEP-21');
execute INSERTDATA.INSERT_LISTING(giveId('id','email','jack@gmail.com',null,'users'), 'N', 'SHERATON', '1BHK', giveId('id','door_no',null,701,'address'),89326,4500,2700,1500, giveidspectabs(600,700,null,null,null,null,null,'Area'), 'N ', 'Y ', 'N','13-FEB-22', giveidspectabs(null,null,'6m',2,null,null,null,'lease_type'), giveidspectabs(null,null,null,null,'OUTHOUSE',1,1,'property_type'),  '6-SEP-21');
execute INSERTDATA.INSERT_LISTING(giveId('id','email','jen@gmail.com',null,'users'), 'Y', 'SANDS', '2BHK', giveId('id','door_no',null,43,'address'),90321,6000,2500,1500, giveidspectabs(700,800,null,null,null,null,null,'Area'), 'N ', 'N ', 'Y','24-SEP-21', giveidspectabs(null,null,'12m',4,null,null,null,'lease_type'), giveidspectabs(null,null,null,null,'HOUSE',2,1,'property_type'),  '17-JUN-21');
execute INSERTDATA.INSERT_LISTING(giveId('id','email','jen@gmail.com',null,'users'), 'Y', 'SANDS', '2BHK', giveId('id','door_no',null,43,'address'),90321,6000,2500,1500, giveidspectabs(700,800,null,null,null,null,null,'Area'), 'N ', 'N ', 'Y','24-SEP-21', giveidspectabs(null,null,'12m',4,null,null,null,'lease_type'), giveidspectabs(null,null,null,null,'HOUSE',2,1,'property_type'),  '17-JUN-21');
execute INSERTDATA.INSERT_LISTING(giveId('id','email','jen@gmail.com',null,'users'), 'Y', 'SANDS', '2BHK', giveId('id','door_no',null,43,'address'),90321,6000,2500,1500, giveidspectabs(700,800,null,null,null,null,null,'Area'), 'N ', 'N ', 'Y','24-SEP-21', giveidspectabs(null,null,'12m',4,null,null,null,'lease_type'), giveidspectabs(null,null,null,null,'HOUSE',2,1,'property_type'),  '17-JUN-21');
execute INSERTDATA.INSERT_LISTING(giveId('id','email','julee@gmail.com',null,'users'), 'N', 'WAVES', '2BHK', giveId('id','door_no',null,1302,'address'),3450,2500,1200,700, giveidspectabs(500,600,null,null,null,null,null,'Area'), 'Y ', 'Y ', 'N','19-JAN-21', giveidspectabs(null,null,'6m',2,null,null,null,'lease_type'), giveidspectabs(null,null,null,null,'APARTMENT',2,2,'property_type'),  '8-OCT-20');
execute INSERTDATA.INSERT_LISTING(giveId('id','email','julee@gmail.com',null,'users'), 'N', 'WAVES', '2BHK', giveId('id','door_no',null,1302,'address'),3450,2500,1200,700, giveidspectabs(500,600,null,null,null,null,null,'Area'), 'Y ', 'Y ', 'N','30-JAN-21', giveidspectabs(null,null,'6m',2,null,null,null,'lease_type'), giveidspectabs(null,null,null,null,'APARTMENT',2,2,'property_type'),  '8-OCT-20');
execute INSERTDATA.INSERT_LISTING(giveId('id','email','julee@gmail.com',null,'users'), 'N', 'WAVES', '2BHK', giveId('id','door_no',null,1302,'address'),3450,2500,1200,700, giveidspectabs(500,600,null,null,null,null,null,'Area'), 'Y ', 'Y ', 'N','30-JAN-21', giveidspectabs(null,null,'6m',2,null,null,null,'lease_type'), giveidspectabs(null,null,null,null,'APRTMENT',2,2,'property_type'),  '8-OCT-20');
execute INSERTDATA.INSERT_LISTING(giveId('id','email','cbing@yahoo.com',null,'users'), 'Y', 'NILAYAM', '3BHK', giveId('id','door_no',null,2123,'address'),43130,4700,1300,1200, giveidspectabs(400,500,null,null,null,null,null,'Area'), 'Y ', 'N ', 'Y','21-JUN-20', giveidspectabs(null,null,'12m',4,null,null,null,'lease_type'), giveidspectabs(null,null,null,null,'HOUSE',3,2,'property_type'),  '3-DEC-19');
execute INSERTDATA.INSERT_LISTING(giveId('id','email','cbing@yahoo.com',null,'users'), 'Y', 'NILAYAM', '3BHK', giveId('id','door_no',null,2123,'address'),43130,4700,1300,1200, giveidspectabs(400,500,null,null,null,null,null,'Area'), 'Y ', 'N ', 'Y','21-JUN-20', giveidspectabs(null,null,'12m',4,null,null,null,'lease_type'), giveidspectabs(null,null,null,null,'HOUSE',3,2,'property_type'),  '3-DEC-19');
execute INSERTDATA.INSERT_LISTING(giveId('id','email','bens@gmail.com',null,'users'), 'N', 'ABODE', '4BHK', giveId('id','door_no',null,1210,'address'),3130,3500,1500,1000, giveidspectabs(700,800,null,null,null,null,null,'Area'), 'N ', 'N ', 'Y','2-DEC-22', giveidspectabs(null,null,'2y',2,null,null,null,'lease_type'), giveidspectabs(null,null,null,null,'HOUSE',4,2,'property_type'),  '15-MAY-22');
execute INSERTDATA.INSERT_LISTING(giveId('id','email','bens@gmail.com',null,'users'), 'N', 'ABODE', '4BHK', giveId('id','door_no',null,1210,'address'),3130,3500,1500,1000, giveidspectabs(700,800,null,null,null,null,null,'Area'), 'N ', 'N ', 'Y','2-DEC-22', giveidspectabs(null,null,'2y',2,null,null,null,'lease_type'), giveidspectabs(null,null,null,null,'HOUSE',4,2,'property_type'),  '15-MAY-22');


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