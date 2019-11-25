CREATE TABLE branch(location char(30) , city char(20), PRIMARY KEY (location,city));
CREATE TABLE VehicleType(vtname char(30), features char(30), wrate float(10), drate float(10), hrate float(10), wirate float(10), dirate float(10), hirate float(10), krate float(10), PRIMARY KEY (vtname));
CREATE TABLE Vehicle(vid int, vlicense int, make char(30), model char(30), vyear int, color char(30), odometer int, status char(30), vtname char(30), location char(30), city char(30), PRIMARY KEY (vid), FOREIGN KEY(vtname) REFERENCES VehicleType);
CREATE TABLE ForSale (vid int, vlicense int, make char(30), model char(30), year int, color char(30), odometer int,status char(30), vtname char(30), location char(30), city char(30), PRIMARY KEY (vid), FOREIGN KEY (vid) REFERENCES Vehicle, FOREIGN KEY (location, city) REFERENCES branch,FOREIGN KEY(vtname) REFERENCES VehicleType);
CREATE TABLE ForRent (vid int, vlicense int, make char(30), model char(30), year int, color char(30), odometer int, status char(30), vtname char(30), location char(30), city char(30), PRIMARY KEY (vid), FOREIGN KEY (vid) REFERENCES Vehicle, FOREIGN KEY (location, city) REFERENCES branch,FOREIGN KEY(vtname) REFERENCES VehicleType);
CREATE TABLE EquipType(etname char(30), drate float(10), hrate float(10),PRIMARY KEY (etname));
CREATE TABLE Equipment(eid int, etname char(30), status char(30), location char(30), city char(30), PRIMARY KEY (eid),FOREIGN KEY (etname) REFERENCES EquipType, FOREIGN KEY (location, city) REFERENCES branch);
CREATE TABLE Is_for(etname char(30), vtname char(30), PRIMARY KEY (etname, vtname), FOREIGN KEY (etname) REFERENCES EquipType, FOREIGN KEY(vtname) REFERENCES VehicleType); 
CREATE TABLE Customer (cellphone char(30), name char(30), address char(30), dlicense char(30), PRIMARY KEY (cellphone)); 
CREATE TABLE ClubMember (cellphone char(30), points int, fees float(10),PRIMARY KEY (cellphone), FOREIGN KEY (cellphone) REFERENCES Customer); 
CREATE TABLE Reservation (confNo int, vtname char(30), cellphone char(30), fromDate DATE, fromTime TIMESTAMP, toDate DATE, toTime TIMESTAMP, PRIMARY KEY(confNo),FOREIGN KEY(vtname) REFERENCES VehicleType, FOREIGN KEY(cellphone) REFERENCES Customer); 
CREATE TABLE TimePeriod(from_Date DATE, from_Time TIMESTAMP, to_Date DATE, to_Time TIMESTAMP, PRIMARY KEY (from_Date,from_Time,to_Date,to_Time));
CREATE TABLE Reserve_Includes (confNo int, etname char(30),PRIMARY KEY (confNo,etname),
 FOREIGN KEY(confNo) REFERENCES Reservation, FOREIGN KEY(etname) REFERENCES EquipType);
CREATE TABLE Rent(rid int, vid int, cellphone char(30), fromDate DATE, fromTime TIMESTAMP, toDate DATE, toTime TIMESTAMP, odometer int,cardName char(30), cardNo int,ExpDate DATE, confNo int, PRIMARY KEY (rid), FOREIGN KEY(cellphone) REFERENCES Customer, FOREIGN KEY(confNo) REFERENCES Reservation);
CREATE TABLE Rent_Includes (rid int, eid int, PRIMARY KEY (rid,eid), FOREIGN KEY(rid) REFERENCES Rent, FOREIGN KEY(eid) REFERENCES Equipment);
CREATE TABLE Return_ (rid int, rdate DATE, rtime TIMESTAMP, odometer int, fulltank char(30), valueit float(10),PRIMARY KEY (rid), FOREIGN KEY(rid) REFERENCES Rent);
Insert into branch(location, city) values ('Burrad Street', 'Vancouver');
Insert into branch(location, city) values ('Raw Street', 'Vancouver'); 
Insert into branch(location, city) values ('Scott Road', 'Surrey'); 
Insert into branch(location, city) values ('Alberta Street', 'Delta'); 
Insert into branch(location, city) values ('Barnet Road', 'Delta'); 
Insert into branch(location, city) values ('Albrey Street', 'Burnaby'); 
Insert into branch(location, city) values ('Austin Road', 'Burnaby'); 
Insert into branch(location, city) values ('Shine Street', 'Langley'); 
Insert into branch(location, city) values ('Mia Street', 'Langley'); 
Insert into branch(location, city) values ('Arts Road', 'Langley'); 
select * from branch;
Insert into VehicleType(vtname, features, wrate, drate, hrate, wirate, dirate , hirate, krate) values( 'EconomyGasoline', 'ac',200,50,2,40,5,1,1);
Insert into VehicleType(vtname, features, wrate, drate, hrate, wirate, dirate , hirate, krate) values( 'EconomyHybrid', 'Dual Front Airbags ',210,60,4,50,7,2,2);
Insert into VehicleType(vtname, features, wrate, drate, hrate, wirate, dirate , hirate, krate) values( 'EconomyElectric', 'Anti-lock Braking System',220,70,6,60,9,3,3);
Insert into VehicleType(vtname, features, wrate, drate, hrate, wirate, dirate , hirate, krate) values( 'CompactGasoline', 'Rear Defogger',250,80,8,40,5,1,1);
Insert into VehicleType(vtname, features, wrate, drate, hrate, wirate, dirate , hirate, krate) values( 'CompactHybrid', 'ac',260,90,10,50,7,2,2);
Insert into VehicleType(vtname, features, wrate, drate, hrate, wirate, dirate , hirate, krate) values( 'CompactElectric', 'Dual Front Airbags ',270,100,12,60,9,3,3);
Insert into VehicleType(vtname, features, wrate, drate, hrate, wirate, dirate , hirate, krate) values( 'Mid-sizeGasoline', 'Anti-lock Braking System',280,110,14,40,5,1,1);
Insert into VehicleType(vtname, features, wrate, drate, hrate, wirate, dirate , hirate, krate) values( 'Mid-sizeHybrid', 'Rear Defogger',290,120,16,50,7,2,2);
Insert into VehicleType(vtname, features, wrate, drate, hrate, wirate, dirate , hirate, krate) values( 'Mid-sizeElectric', 'ac',300,130,18,60,9,3,3);
Insert into VehicleType(vtname, features, wrate, drate, hrate, wirate, dirate , hirate, krate) values( 'StandardGasoline','Dual Front Airbags ', 310,140,20,40,5,1,1);
Insert into VehicleType(vtname, features, wrate, drate, hrate, wirate, dirate , hirate, krate) values( 'StandardHybrid', 'Anti-lock Braking System',320,150,22,50,7,2,2);
Insert into VehicleType(vtname, features, wrate, drate, hrate, wirate, dirate , hirate, krate) values( 'StandardElectric', 'Rear Defogger',330,160,24,60,9,3,3);
Insert into VehicleType(vtname, features, wrate, drate, hrate, wirate, dirate , hirate, krate) values( 'FullsizeGasoline', 'ac',340,170,26,40,5,1,1); 
Insert into VehicleType(vtname, features, wrate, drate, hrate, wirate, dirate , hirate, krate) values( 'FullsizeHybrid', 'Dual Front Airbags ',350,180,28,50,7,2,2);
Insert into VehicleType(vtname, features, wrate, drate, hrate, wirate, dirate , hirate, krate) values( 'FullsizeElectric', 'Anti-lock Braking System',360,190,30,60,9,3,3);
Insert into VehicleType(vtname, features, wrate, drate, hrate, wirate, dirate , hirate, krate) values( 'SUVGasoline','Rear Defogger',370,200,32,40,5,1,1);
Insert into VehicleType(vtname, features, wrate, drate, hrate, wirate, dirate , hirate, krate) values( 'SUVHybrid', 'ac',380,210,34,50,7,2,2);
Insert into VehicleType(vtname, features, wrate, drate, hrate, wirate, dirate , hirate, krate) values( 'SUVElectric', 'Dual Front Airbags ',390,220,36,60,9,3,3);
Insert into VehicleType(vtname, features, wrate, drate, hrate, wirate, dirate , hirate, krate) values( 'TruckGasoline','Anti-lock Braking System',400,230,38,40,5,1,1);
Insert into VehicleType(vtname, features, wrate, drate, hrate, wirate, dirate , hirate, krate) values( 'TruckHybrid','Rear Defogger',410,240,40,50,7,2,2);
Insert into VehicleType(vtname, features, wrate, drate, hrate, wirate, dirate , hirate, krate) values( 'TruckElectric','ac',420,250,42,60,9,3,3);
select * from VehicleType;

Insert into Vehicle(vid, vlicense, make, model, vyear, color, odometer, status, vtname, location, city) values(1,101,'Honda', 'Accord',2010,'White', 1000, 'for_rent', 'StandardHybrid', 'Alberta Street', 'Delta');
Insert into Vehicle(vid, vlicense, make, model, vyear, color, odometer, status, vtname, location, city) values(2,102,'Honda', 'Passport',2011,'Black',2000, 'for_sale', 'SUVGasoline', 'Burrad Street', 'Vancouver');
Insert into Vehicle(vid, vlicense, make, model, vyear, color, odometer, status, vtname, location, city)  values(3,103,'Honda', 'Civic',2015,'Red', 3000, 'for_rent', 'CompactElectric', 'Raw Street', 'Vancouver');
Insert into Vehicle(vid, vlicense, make, model, vyear, color, odometer, status, vtname, location, city)  values(4,104,'Honda', 'Fit',2014,'Grey', 4000, 'for_rent', 'EconomyGasoline', 'Arts Road', 'Langley');
Insert into Vehicle(vid, vlicense, make, model, vyear, color, odometer, status, vtname, location, city)  values(5,105,'Honda', 'Civic',2019,'Black', 1000, 'for_sale', 'EconomyHybrid', 'Shine Street', 'Langley' );
Insert into Vehicle(vid, vlicense, make, model, vyear, color, odometer, status, vtname, location, city)  values(6,106,'Honda', 'Ridgeline',2012,'Red', 2000, 'for_rent', 'TruckGasoline', 'Burrad Street', 'Vancouver');
Insert into Vehicle(vid, vlicense, make, model, vyear, color, odometer, status, vtname, location, city)  values(7,107,'Honda', 'Pilot',2010,'White', 4000, 'for_rent', 'FullsizeElectric', 'Scott Road', 'Surrey');
Insert into Vehicle(vid, vlicense, make, model, vyear, color, odometer, status, vtname, location, city)  values(8,108,'Honda', 'Insight',2015,'Black', 4000, 'for_rent', 'FullsizeGasoline', 'Burrad Street', 'Vancouver');
Insert into Vehicle(vid, vlicense, make, model, vyear, color, odometer, status, vtname, location, city)  values(9,109,'Honda', 'Jazz',2016,'Red', 6000, 'for_rent', 'StandardGasoline', 'Alberta Street', 'Delta');
Insert into Vehicle(vid, vlicense, make, model, vyear, color, odometer, status, vtname, location, city)  values(10,110,'Honda', 'CR-V',2017,'White', 5000, 'for_rent', 'StandardElectric','Scott Road', 'Surrey');
Insert into Vehicle(vid, vlicense, make, model, vyear, color, odometer, status, vtname, location, city)  values(11,111,'Toyota', 'Camry',2018,'Black', 7000, 'for_rent', 'Mid-sizeGasoline', 'Shine Street', 'Langley');
Insert into Vehicle(vid, vlicense, make, model, vyear, color, odometer, status, vtname, location, city)  values(12,112,'Toyota', 'Camry',2012,'Grey', 8000, 'for_rent', 'Mid-sizeHybrid', 'Shine Street', 'Langley');
Insert into Vehicle(vid, vlicense, make, model, vyear, color, odometer, status, vtname, location, city)  values(13,113,'Toyota', 'Prius',2014,'Red', 4000, 'for_rent', 'Mid-sizeGasoline', 'Alberta Street', 'Delta');
Insert into Vehicle(vid, vlicense, make, model, vyear, color, odometer, status, vtname, location, city)  values(14,114,'Toyota', 'Mirai',2016,'White', 1000, 'for_sale', 'Mid-sizeGasoline', 'Burrad Street', 'Vancouver');
Insert into Vehicle(vid, vlicense, make, model, vyear, color, odometer, status, vtname, location, city)  values(15,115,'Toyota', 'Tacoma',2017,'Red', 2000, 'for_rent', 'TruckGasoline', 'Shine Street', 'Langley');
Insert into Vehicle(vid, vlicense, make, model, vyear, color, odometer, status, vtname, location, city)  values(16,116,'Toyota', 'Tundra',2017,'Black', 9000, 'for_rent', 'TruckHybrid', 'Raw Street', 'Vancouver');
Insert into Vehicle(vid, vlicense, make, model, vyear, color, odometer, status, vtname, location, city)  values(17,117,'Toyota', 'Highlander',2018,'Grey', 4000, 'for_rent', 'SUVGasoline', 'Mia Street', 'Langley');
Insert into Vehicle(vid, vlicense, make, model, vyear, color, odometer, status, vtname, location, city)  values(18,118,'Toyota', 'Land Cruiser',2019,'White', 5000, 'for_rent', 'SUVHybrid', 'Barnet Road', 'Delta');
Insert into Vehicle(vid, vlicense, make, model, vyear, color, odometer, status, vtname, location, city)  values(19,119,'Toyota', 'Avalon',2012,'Red', 3000, 'for_rent', 'FullsizeHybrid', 'Raw Street', 'Vancouver');
Insert into Vehicle(vid, vlicense, make, model, vyear, color, odometer, status, vtname, location, city)  values(20,120,'Toyota', 'Yaris',2013,'Black', 8000, 'for_rent', 'CompactGasoline', 'Albrey Street', 'Burnaby');
Insert into Customer(cellphone, name, address, dlicense) values(9854645767,'Aaarti', '#200 Raw Street, Vancouver', 'VT345');
Insert into Customer(cellphone, name, address, dlicense) values(9854645768,'Jason', '#201 Alberta Street, Delta', 'VT346');
Insert into Customer(cellphone, name, address, dlicense) values(9854645769,'Barti', '#202 Burrad Street, Vancouver', 'VT347');
Insert into Customer(cellphone, name, address, dlicense) values(9854645770,'Frida', '#203 Arts Road, Langley', 'VT348');
Insert into Customer(cellphone, name, address, dlicense) values(9854645771,'Enni', '#204 Shine Street Langley', 'VT349');
Insert into Customer(cellphone, name, address, dlicense) values(9854645772,'Karan', '#205 Scott Road,Surrey', 'VT350');
Insert into Customer(cellphone, name, address, dlicense) values(9854645773,'Kareena', '#206 Alberta Street, Delta', 'VT351');
Insert into Customer(cellphone, name, address, dlicense) values(9854645774,'Anushka', '#207 Raw Street, Vancouver', 'VT352');
Insert into Customer(cellphone, name, address, dlicense) values(9854645775,'Shahid', '#208 Shine Street, Langley', 'VT353');
Insert into Customer(cellphone, name, address, dlicense) values(9854645776,'Hritik', '#209 Raw Street, Vancouver', 'VT354');
Insert into Customer(cellphone, name, address, dlicense) values(9854645777,'Peter', '#210 Mia Street, Langley', 'VT355');
Insert into Customer(cellphone, name, address, dlicense) values(9854645778,'Nick', '#211 Barnet Road, Delta', 'VT356');
Insert into Customer(cellphone, name, address, dlicense) values(9854645779,'Avin', '#212 Albrey Street Burnaby', 'VT357');
Insert into Customer(cellphone, name, address, dlicense) values(9854645780,'Kelly', '#213 Arts Road, Langley', 'VT358');
Insert into Customer(cellphone, name, address, dlicense) values(9854645781,'Katson', '#214 Barnet Road, Delta', 'VT359');


INSERT INTO  Reservation(confNo, vtname, cellphone, fromDate, fromTime, toDate, toTime) VALUES (1000, 'EconomyGasoline', '9854645781', TO_DATE('2019-09-01', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-01 01:15:05', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-09-02', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-02 01:16:06', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO  Reservation(confNo, vtname, cellphone, fromDate, fromTime, toDate, toTime) VALUES (1001, 'StandardHybrid', '9854645780', TO_DATE('2019-09-01', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-01 02:15:05', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-09-03', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-03 02:16:06', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO  Reservation(confNo, vtname, cellphone, fromDate, fromTime, toDate, toTime) VALUES (1002, 'SUVGasoline', '9854645779', TO_DATE('2019-09-01', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-01 03:15:05', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-09-04', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-04 03:16:06', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO  Reservation(confNo, vtname, cellphone, fromDate, fromTime, toDate, toTime) VALUES (1003, 'CompactElectric', '9854645778', TO_DATE('2019-09-01', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-01 04:15:05', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-09-05', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-05 04:16:06', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO  Reservation(confNo, vtname, cellphone, fromDate, fromTime, toDate, toTime) VALUES (1004, 'TruckGasoline', '9854645777', TO_DATE('2019-09-02', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-1 05:15:05', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-09-07', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-07 05:16:06', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO  Reservation(confNo, vtname, cellphone, fromDate, fromTime, toDate, toTime) VALUES (1005, 'FullsizeElectric', '9854645776', TO_DATE('2019-09-02', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-02 06:15:05', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-09-08', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-08 06:16:06', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO  Reservation(confNo, vtname, cellphone, fromDate, fromTime, toDate, toTime) VALUES (1006, 'FullsizeGasoline', '9854645775', TO_DATE('2019-09-02', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-02 07:15:05', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-09-09', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-09 07:16:06', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO  Reservation(confNo, vtname, cellphone, fromDate, fromTime, toDate, toTime) VALUES (1007, 'StandardGasoline', '9854645774', TO_DATE('2019-09-03', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-03 08:15:05', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-09-11', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-11 08:16:06', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO  Reservation(confNo, vtname, cellphone, fromDate, fromTime, toDate, toTime) VALUES (1008, 'StandardElectric', '9854645773', TO_DATE('2019-09-03', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-03 09:15:05', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-09-12', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-12 09:16:06', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO  Reservation(confNo, vtname, cellphone, fromDate, fromTime, toDate, toTime) VALUES (1009, 'Mid-sizeGasoline', '9854645772', TO_DATE('2019-09-03', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-03 10:15:05', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-09-13', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-13 10:16:06', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO  Reservation(confNo, vtname, cellphone, fromDate, fromTime, toDate, toTime) VALUES (1010, 'Mid-sizeGasoline', '9854645771', TO_DATE('2019-09-04', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-04 11:15:05', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-09-15', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-15 11:16:06', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO  Reservation(confNo, vtname, cellphone, fromDate, fromTime, toDate, toTime) VALUES (1011, 'TruckHybrid', '9854645770', TO_DATE('2019-09-04', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-04 12:15:05', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-09-16', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-16 12:16:06', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO  Reservation(confNo, vtname, cellphone, fromDate, fromTime, toDate, toTime) VALUES (1012, 'TruckGasoline', '9854645769', TO_DATE('2019-09-04', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-04 13:15:05', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-09-17', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-17 13:16:06', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO  Reservation(confNo, vtname, cellphone, fromDate, fromTime, toDate, toTime) VALUES (1013, 'Mid-sizeGasoline', '9854645768', TO_DATE('2019-09-04', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-04 14:15:05', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-09-18', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-18 14:16:06', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO  Reservation(confNo, vtname, cellphone, fromDate, fromTime, toDate, toTime) VALUES (1014, 'SUVHybrid', '9854645767', TO_DATE('2019-09-05', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-05 15:15:05', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-09-20', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-20 15:16:06', 'YYYY-MM-DD HH24:MI:SS'));

select * from reservation where to_char(fromTime,'HH24:MI:SS') > '03:15:03';

INSERT INTO Rent(rid, cellphone, fromDate, fromTime, toDate, toTime, odometer, cardName, cardNo, expDate, confNo) VALUES (2000, '9854645781', TO_DATE('2019-09-01', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-01 01:15:05', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-09-02', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-02 01:16:06', 'YYYY-MM-DD HH24:MI:SS'),4000, 'VISA', 11111, TO_DATE('2021-10-31', 'YYYY-MM-DD'), 1000);
INSERT INTO Rent(rid, cellphone, fromDate, fromTime, toDate, toTime, odometer, cardName, cardNo, expDate, confNo) VALUES (2001, '9854645780', TO_DATE('2019-09-01', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-01 02:15:05', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-09-03', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-03 02:16:06', 'YYYY-MM-DD HH24:MI:SS'),1000, 'VISA', 11112, TO_DATE('2021-10-20', 'YYYY-MM-DD'), 1001);
INSERT INTO Rent(rid, cellphone, fromDate, fromTime, toDate, toTime, odometer, cardName, cardNo, expDate, confNo) VALUES (2002, '9854645779', TO_DATE('2019-09-01', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-01 03:15:05', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-09-04', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-04 03:16:06', 'YYYY-MM-DD HH24:MI:SS'),4000, 'VISA', 11113, TO_DATE('2021-10-21', 'YYYY-MM-DD'), 1002);
INSERT INTO Rent(rid, cellphone, fromDate, fromTime, toDate, toTime, odometer, cardName, cardNo, expDate, confNo) VALUES (2003, '9854645778', TO_DATE('2019-09-01', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-01 04:15:05', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-09-05', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-05 04:16:06', 'YYYY-MM-DD HH24:MI:SS'),3000, 'VISA', 11114, TO_DATE('2021-10-22', 'YYYY-MM-DD'), 1003);
INSERT INTO Rent(rid, cellphone, fromDate, fromTime, toDate, toTime, odometer, cardName, cardNo, expDate, confNo) VALUES (2004, '9854645777', TO_DATE('2019-09-02', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-1 05:15:05', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-09-07', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-07 05:16:06', 'YYYY-MM-DD HH24:MI:SS'),2000, 'VISA', 11115, TO_DATE('2021-10-23', 'YYYY-MM-DD'), 1004);
INSERT INTO Rent(rid, cellphone, fromDate, fromTime, toDate, toTime, odometer, cardName, cardNo, expDate, confNo) VALUES (2005,  '9854645776', TO_DATE('2019-09-02', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-02 06:15:05', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-09-08', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-08 06:16:06', 'YYYY-MM-DD HH24:MI:SS'),4000, 'VISA', 11116, TO_DATE('2021-10-24', 'YYYY-MM-DD'), 1005);
INSERT INTO Rent(rid, cellphone, fromDate, fromTime, toDate, toTime, odometer, cardName, cardNo, expDate, confNo) VALUES (2006, '9854645775', TO_DATE('2019-09-02', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-02 07:15:05', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-09-09', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-09 07:16:06', 'YYYY-MM-DD HH24:MI:SS'),4000, 'VISA', 11117, TO_DATE('2021-10-25', 'YYYY-MM-DD'), 1006);
INSERT INTO Rent(rid, cellphone, fromDate, fromTime, toDate, toTime, odometer, cardName, cardNo, expDate, confNo) VALUES (2007, '9854645774', TO_DATE('2019-09-03', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-03 08:15:05', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-09-11', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-11 08:16:06', 'YYYY-MM-DD HH24:MI:SS'),6000, 'VISA', 11118, TO_DATE('2021-10-26', 'YYYY-MM-DD'), 1007);
INSERT INTO Rent(rid, cellphone, fromDate, fromTime, toDate, toTime, odometer, cardName, cardNo, expDate, confNo) VALUES (2008, '9854645771', TO_DATE('2019-09-04', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-04 11:15:05', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-09-15', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-15 11:16:06', 'YYYY-MM-DD HH24:MI:SS'),4000, 'VISA', 11119, TO_DATE('2021-10-27', 'YYYY-MM-DD'), 1010);
INSERT INTO Rent(rid, cellphone, fromDate, fromTime, toDate, toTime, odometer, cardName, cardNo, expDate, confNo) VALUES (2009, '9854645770', TO_DATE('2019-09-04', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-04 12:15:05', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-09-16', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-16 12:16:06', 'YYYY-MM-DD HH24:MI:SS'),9000, 'VISA', 11120, TO_DATE('2021-10-28', 'YYYY-MM-DD'), 1011);



INSERT INTO Return_ (rid, rdate, rtime, odometer, fulltank, valueit) VALUES (2009, TO_DATE('2019-09-16', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-16 12:16:06', 'YYYY-MM-DD HH24:MI:SS'),10000, 'Yes', Null);
INSERT INTO Return_ (rid, rdate, rtime, odometer, fulltank, valueit) VALUES (2008, TO_DATE('2019-09-15', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-15 11:16:06', 'YYYY-MM-DD HH24:MI:SS'),6000, 'No', Null);
INSERT INTO Return_ (rid, rdate, rtime, odometer, fulltank, valueit) VALUES (2007, TO_DATE('2019-09-11', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-11 08:16:06', 'YYYY-MM-DD HH24:MI:SS'),10000, 'Yes', Null);
INSERT INTO Return_ (rid, rdate, rtime, odometer, fulltank, valueit) VALUES (2006, TO_DATE('2019-09-09', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-09 07:16:06', 'YYYY-MM-DD HH24:MI:SS'),9000, 'No', Null);
INSERT INTO Return_ (rid, rdate, rtime, odometer, fulltank, valueit) VALUES (2005, TO_DATE('2019-09-08', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-08 06:16:06', 'YYYY-MM-DD HH24:MI:SS'),8000, 'Yes', Null);
INSERT INTO Return_ (rid, rdate, rtime, odometer, fulltank, valueit) VALUES (2004, TO_DATE('2019-09-07', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-07 05:16:06', 'YYYY-MM-DD HH24:MI:SS'),5000, 'No', Null);
INSERT INTO Return_ (rid, rdate, rtime, odometer, fulltank, valueit) VALUES (2003, TO_DATE('2019-09-05', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-05 04:16:06', 'YYYY-MM-DD HH24:MI:SS'),6000, 'Yes', Null);
INSERT INTO Return_ (rid, rdate, rtime, odometer, fulltank, valueit) VALUES (2002, TO_DATE('2019-09-04', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-04 03:16:06', 'YYYY-MM-DD HH24:MI:SS'),7000, 'No', Null);
INSERT INTO Return_ (rid, rdate, rtime, odometer, fulltank, valueit) VALUES (2001, TO_DATE('2019-09-03', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-03 02:16:06', 'YYYY-MM-DD HH24:MI:SS'),10000, 'Yes', Null);
INSERT INTO Return_ (rid, rdate, rtime, odometer, fulltank, valueit) VALUES (2000, TO_DATE('2019-09-02', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-02 01:16:06', 'YYYY-MM-DD HH24:MI:SS'),9000,'No', Null);

ALTER TABLE Vehicle
ADD FOREIGN KEY (location, city) REFERENCES branch(location, city);
DROP CONSTRAINT location, city;










