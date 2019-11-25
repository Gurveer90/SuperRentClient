-- VehileType insertion
INSERT INTO VehicleType(vtname, features, wrate, drate, hrate, wirate, dirate , hirate, krate) VALUES( 'EconomyHybrid', 'hybrid',210,60,4,50,7,2,2);
INSERT INTO VehicleType(vtname, features, wrate, drate, hrate, wirate, dirate , hirate, krate) VALUES( 'EconomyElectric', 'fully electric',220,70,6,60,9,3,3);
INSERT INTO VehicleType(vtname, features, wrate, drate, hrate, wirate, dirate , hirate, krate) VALUES( 'EconomyGasoline', 'regular gasoline',230,73,5,61,10,4,2);
INSERT INTO VehicleType(vtname, features, wrate, drate, hrate, wirate, dirate , hirate, krate) VALUES( 'CompactGasoline', 'regular gasoline',250,80,8,40,5,1,1);
INSERT INTO VehicleType(vtname, features, wrate, drate, hrate, wirate, dirate , hirate, krate) VALUES( 'CompactHybrid', 'hybrid',260,90,10,50,7,2,2);
INSERT INTO VehicleType(vtname, features, wrate, drate, hrate, wirate, dirate , hirate, krate) VALUES( 'CompactElectric', 'fully electric',270,100,12,60,9,3,3);
INSERT INTO VehicleType(vtname, features, wrate, drate, hrate, wirate, dirate , hirate, krate) VALUES( 'Mid-sizeGasoline', 'regular gasoline',280,110,14,40,5,1,1);
INSERT INTO VehicleType(vtname, features, wrate, drate, hrate, wirate, dirate , hirate, krate) VALUES( 'Mid-sizeHybrid', 'hybrid',290,120,16,50,7,2,2);
INSERT INTO VehicleType(vtname, features, wrate, drate, hrate, wirate, dirate , hirate, krate) VALUES( 'Mid-sizeElectric', 'fully electric',300,130,18,60,9,3,3);
INSERT INTO VehicleType(vtname, features, wrate, drate, hrate, wirate, dirate , hirate, krate) VALUES( 'StandardGasoline','regular gasoline', 310,140,20,40,5,1,1);
INSERT INTO VehicleType(vtname, features, wrate, drate, hrate, wirate, dirate , hirate, krate) VALUES( 'StandardHybrid', 'hybrid',320,150,22,50,7,2,2);
INSERT INTO VehicleType(vtname, features, wrate, drate, hrate, wirate, dirate , hirate, krate) VALUES( 'StandardElectric', 'fully electric',330,160,24,60,9,3,3);
INSERT INTO VehicleType(vtname, features, wrate, drate, hrate, wirate, dirate , hirate, krate) VALUES( 'FullsizeGasoline', 'regular gasoline',340,170,26,40,5,1,1);
INSERT INTO VehicleType(vtname, features, wrate, drate, hrate, wirate, dirate , hirate, krate) VALUES( 'FullsizeHybrid', 'hybrid',350,180,28,50,7,2,2);
INSERT INTO VehicleType(vtname, features, wrate, drate, hrate, wirate, dirate , hirate, krate) VALUES( 'FullsizeElectric', 'fully electric',360,190,30,60,9,3,3);
INSERT INTO VehicleType(vtname, features, wrate, drate, hrate, wirate, dirate , hirate, krate) VALUES( 'SUVGasoline','regular gasoline',370,200,32,40,5,1,1);
INSERT INTO VehicleType(vtname, features, wrate, drate, hrate, wirate, dirate , hirate, krate) VALUES( 'SUVHybrid', 'hybrid',380,210,34,50,7,2,2);
INSERT INTO VehicleType(vtname, features, wrate, drate, hrate, wirate, dirate , hirate, krate) VALUES( 'SUVElectric', 'fully electric',390,220,36,60,9,3,3);
INSERT INTO VehicleType(vtname, features, wrate, drate, hrate, wirate, dirate , hirate, krate) VALUES( 'TruckGasoline','regular gasoline',400,230,38,40,5,1,1);
INSERT INTO VehicleType(vtname, features, wrate, drate, hrate, wirate, dirate , hirate, krate) VALUES( 'TruckHybrid','hybrid',410,240,40,50,7,2,2);
INSERT INTO VehicleType(vtname, features, wrate, drate, hrate, wirate, dirate , hirate, krate) VALUES( 'TruckElectric','fully electric',420,250,42,60,9,3,3);

-- Customer insertion
INSERT INTO Customer(dlicense, cellphone, cname, caddress) VALUES('VT345', 9854645767,'Aaarti', '#200 Raw Street, Vancouver');
INSERT INTO Customer(dlicense, cellphone, cname, caddress) VALUES('VT346', 9854645768,'Jason', '#201 Alberta Street, Delta' );
INSERT INTO Customer(dlicense, cellphone, cname, caddress) VALUES('VT347',9854645769,'Barti', '#202 Burrad Street, Vancouver');
INSERT INTO Customer(dlicense, cellphone, cname, caddress) VALUES('VT348', 9854645770,'Frida', '#203 Arts Road, Langley');
INSERT INTO Customer(dlicense, cellphone, cname, caddress) VALUES('VT349',9854645771,'Enni', '#204 Shine Street Langley');
INSERT INTO Customer(dlicense, cellphone, cname, caddress) VALUES('VT350', 9854645772,'Karan', '#205 Scott Road,Surrey');
INSERT INTO Customer(dlicense, cellphone, cname, caddress) VALUES('VT351', 9854645773,'Kareena', '#206 Alberta Street, Delta');
INSERT INTO Customer(dlicense, cellphone, cname, caddress) VALUES('VT352', 9854645774,'Anushka', '#207 Raw Street, Vancouver');
INSERT INTO Customer(dlicense, cellphone, cname, caddress) VALUES('VT353', 9854645775,'Shahid', '#208 Shine Street, Langley');
INSERT INTO Customer(dlicense, cellphone, cname, caddress) VALUES('VT354', 9854645776,'Hritik', '#209 Raw Street, Vancouver');
INSERT INTO Customer(dlicense, cellphone, cname, caddress) VALUES('VT355', 9854645777,'Peter', '#210 Mia Street, Langley');
INSERT INTO Customer(dlicense, cellphone, cname, caddress) VALUES('VT356', 9854645778,'Nick', '#211 Barnet Road, Delta');
INSERT INTO Customer(dlicense, cellphone, cname, caddress) VALUES('VT357', 9854645779,'Avin', '#212 Albrey Street Burnaby');
INSERT INTO Customer(dlicense, cellphone, cname, caddress) VALUES('VT358', 9854645780,'Kelly', '#213 Arts Road, Langley');
INSERT INTO Customer(dlicense, cellphone, cname, caddress) VALUES('VT359', 9854645781,'Katson', '#214 Barnet Road, Delta');

-- Vehicle insertion
INSERT INTO Vehicle(vlicense, make, model, vyear, color, odometer, vstatus, vtname, vlocation, city) VALUES(101,'Honda', 'Accord',2010,'White', 1000, 'for_rent', 'StandardHybrid', 'Alberta Street', 'Delta');
INSERT INTO Vehicle(vlicense, make, model, vyear, color, odometer, vstatus, vtname, vlocation, city) VALUES(102,'Honda', 'Passport',2011,'Black',2000, 'for_sale', 'SUVGasoline', 'Burrad Street', 'Vancouver');
INSERT INTO Vehicle(vlicense, make, model, vyear, color, odometer, vstatus, vtname, vlocation, city)  VALUES(103,'Honda', 'Civic',2015,'Red', 3000, 'for_rent', 'CompactElectric', 'Raw Street', 'Vancouver');
INSERT INTO Vehicle(vlicense, make, model, vyear, color, odometer, vstatus, vtname, vlocation, city)  VALUES(104,'Honda', 'Fit',2014,'Grey', 4000, 'for_rent', 'EconomyGasoline', 'Arts Road', 'Langley');
INSERT INTO Vehicle(vlicense, make, model, vyear, color, odometer, vstatus, vtname, vlocation, city)  VALUES(105,'Honda', 'Civic',2019,'Black', 1000, 'for_sale', 'EconomyHybrid', 'Shine Street', 'Langley' );
INSERT INTO Vehicle(vlicense, make, model, vyear, color, odometer, vstatus, vtname, vlocation, city)  VALUES(106,'Honda', 'Ridgeline',2012,'Red', 2000, 'for_rent', 'TruckGasoline', 'Burrad Street', 'Vancouver');
INSERT INTO Vehicle(vlicense, make, model, vyear, color, odometer, vstatus, vtname, vlocation, city)  VALUES(107,'Honda', 'Pilot',2010,'White', 4000, 'for_rent', 'FullsizeElectric', 'Scott Road', 'Surrey');
INSERT INTO Vehicle(vlicense, make, model, vyear, color, odometer, vstatus, vtname, vlocation, city)  VALUES(108,'Honda', 'Insight',2015,'Black', 4000, 'for_rent', 'FullsizeGasoline', 'Burrad Street', 'Vancouver');
INSERT INTO Vehicle(vlicense, make, model, vyear, color, odometer, vstatus, vtname, vlocation, city)  VALUES(109,'Honda', 'Jazz',2016,'Red', 6000, 'for_rent', 'StandardGasoline', 'Alberta Street', 'Delta');
INSERT INTO Vehicle(vlicense, make, model, vyear, color, odometer, vstatus, vtname, vlocation, city)  VALUES(110,'Honda', 'CR-V',2017,'White', 5000, 'for_rent', 'StandardElectric','Scott Road', 'Surrey');
INSERT INTO Vehicle(vlicense, make, model, vyear, color, odometer, vstatus, vtname, vlocation, city)  VALUES(111,'Toyota', 'Camry',2018,'Black', 7000, 'for_rent', 'Mid-sizeGasoline', 'Shine Street', 'Langley');
INSERT INTO Vehicle(vlicense, make, model, vyear, color, odometer, vstatus, vtname, vlocation, city)  VALUES(112,'Toyota', 'Camry',2012,'Grey', 8000, 'for_rent', 'Mid-sizeHybrid', 'Shine Street', 'Langley');
INSERT INTO Vehicle(vlicense, make, model, vyear, color, odometer, vstatus, vtname, vlocation, city)  VALUES(113,'Toyota', 'Prius',2014,'Red', 4000, 'for_rent', 'Mid-sizeGasoline', 'Alberta Street', 'Delta');
INSERT INTO Vehicle(vlicense, make, model, vyear, color, odometer, vstatus, vtname, vlocation, city)  VALUES(114,'Toyota', 'Mirai',2016,'White', 1000, 'for_sale', 'Mid-sizeGasoline', 'Burrad Street', 'Vancouver');
INSERT INTO Vehicle(vlicense, make, model, vyear, color, odometer, vstatus, vtname, vlocation, city)  VALUES(115,'Toyota', 'Tacoma',2017,'Red', 2000, 'for_rent', 'TruckGasoline', 'Shine Street', 'Langley');
INSERT INTO Vehicle(vlicense, make, model, vyear, color, odometer, vstatus, vtname, vlocation, city)  VALUES(116,'Toyota', 'Tundra',2017,'Black', 9000, 'for_rent', 'TruckHybrid', 'Raw Street', 'Vancouver');
INSERT INTO Vehicle(vlicense, make, model, vyear, color, odometer, vstatus, vtname, vlocation, city)  VALUES(117,'Toyota', 'Highlander',2018,'Grey', 4000, 'for_rent', 'SUVGasoline', 'Mia Street', 'Langley');
INSERT INTO Vehicle(vlicense, make, model, vyear, color, odometer, vstatus, vtname, vlocation, city)  VALUES(118,'Toyota', 'Land Cruiser',2019,'White', 5000, 'for_rent', 'SUVHybrid', 'Barnet Road', 'Delta');
INSERT INTO Vehicle(vlicense, make, model, vyear, color, odometer, vstatus, vtname, vlocation, city)  VALUES(119,'Toyota', 'Avalon',2012,'Red', 3000, 'for_rent', 'FullsizeHybrid', 'Raw Street', 'Vancouver');
INSERT INTO Vehicle(vlicense, make, model, vyear, color, odometer, vstatus, vtname, vlocation, city)  VALUES(120,'Toyota', 'Yaris',2013,'Black', 8000, 'for_rent', 'CompactGasoline', 'Albrey Street', 'Burnaby');

-- Reservation insertion
INSERT INTO  Reservation(confNo, vtname, dlicense, fromDate, fromTime, toDate, toTime) VALUES (1000, 'EconomyGasoline', 'VT345', TO_DATE('2019-09-01', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-01 01:15:05', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-09-02', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-02 01:16:06', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO  Reservation(confNo, vtname, dlicense, fromDate, fromTime, toDate, toTime) VALUES (1001, 'StandardHybrid', 'VT346', TO_DATE('2019-09-01', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-01 02:15:05', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-09-03', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-03 02:16:06', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO  Reservation(confNo, vtname, dlicense, fromDate, fromTime, toDate, toTime) VALUES (1002, 'SUVGasoline', 'VT347', TO_DATE('2019-09-01', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-01 03:15:05', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-09-04', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-04 03:16:06', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO  Reservation(confNo, vtname, dlicense, fromDate, fromTime, toDate, toTime) VALUES (1003, 'CompactElectric', 'VT348', TO_DATE('2019-09-01', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-01 04:15:05', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-09-05', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-05 04:16:06', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO  Reservation(confNo, vtname, dlicense, fromDate, fromTime, toDate, toTime) VALUES (1004, 'TruckGasoline', 'VT349', TO_DATE('2019-09-02', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-1 05:15:05', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-09-07', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-07 05:16:06', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO  Reservation(confNo, vtname, dlicense, fromDate, fromTime, toDate, toTime) VALUES (1005, 'FullsizeElectric', 'VT350', TO_DATE('2019-09-02', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-02 06:15:05', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-09-08', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-08 06:16:06', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO  Reservation(confNo, vtname, dlicense, fromDate, fromTime, toDate, toTime) VALUES (1006, 'FullsizeGasoline', 'VT351', TO_DATE('2019-09-02', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-02 07:15:05', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-09-09', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-09 07:16:06', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO  Reservation(confNo, vtname, dlicense, fromDate, fromTime, toDate, toTime) VALUES (1007, 'StandardGasoline', 'VT352', TO_DATE('2019-09-03', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-03 08:15:05', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-09-11', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-11 08:16:06', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO  Reservation(confNo, vtname, dlicense, fromDate, fromTime, toDate, toTime) VALUES (1008, 'StandardElectric', 'VT353', TO_DATE('2019-09-03', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-03 09:15:05', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-09-12', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-12 09:16:06', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO  Reservation(confNo, vtname, dlicense, fromDate, fromTime, toDate, toTime) VALUES (1009, 'Mid-sizeGasoline', 'VT354', TO_DATE('2019-09-03', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-03 10:15:05', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-09-13', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-13 10:16:06', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO  Reservation(confNo, vtname, dlicense, fromDate, fromTime, toDate, toTime) VALUES (1010, 'Mid-sizeGasoline', 'VT355', TO_DATE('2019-09-04', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-04 11:15:05', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-09-15', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-15 11:16:06', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO  Reservation(confNo, vtname, dlicense, fromDate, fromTime, toDate, toTime) VALUES (1011, 'TruckHybrid', 'VT356', TO_DATE('2019-09-04', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-04 12:15:05', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-09-16', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-16 12:16:06', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO  Reservation(confNo, vtname, dlicense, fromDate, fromTime, toDate, toTime) VALUES (1012, 'TruckGasoline', 'VT357', TO_DATE('2019-09-04', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-04 13:15:05', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-09-17', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-17 13:16:06', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO  Reservation(confNo, vtname, dlicense, fromDate, fromTime, toDate, toTime) VALUES (1013, 'Mid-sizeGasoline', 'VT358', TO_DATE('2019-09-04', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-04 14:15:05', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-09-18', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-18 14:16:06', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO  Reservation(confNo, vtname, dlicense, fromDate, fromTime, toDate, toTime) VALUES (1014, 'SUVHybrid', 'VT359', TO_DATE('2019-09-05', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-05 15:15:05', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-09-20', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-20 15:16:06', 'YYYY-MM-DD HH24:MI:SS'));

-- Rent insertion
INSERT INTO Rent(rid, vlicense, dlicense, fromDate, fromTime, toDate, toTime, odometer, cardName, cardNo, expDate, confNo) VALUES (2000, 101, 'VT345', TO_DATE('2019-09-01', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-01 01:15:05', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-09-05', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-05 11:16:10', 'YYYY-MM-DD HH24:MI:SS'),4000, 'VISA', 11111, TO_DATE('2021-10-31', 'YYYY-MM-DD'), 1000);
INSERT INTO Rent(rid, vlicense, dlicense, fromDate, fromTime, toDate, toTime, odometer, cardName, cardNo, expDate, confNo) VALUES (2001, 102, 'VT346', TO_DATE('2019-09-01', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-04 02:15:05', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-09-10', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-03 23:16:09', 'YYYY-MM-DD HH24:MI:SS'),1000, 'VISA', 11112, TO_DATE('2021-10-20', 'YYYY-MM-DD'), 1001);
INSERT INTO Rent(rid, vlicense, dlicense, fromDate, fromTime, toDate, toTime, odometer, cardName, cardNo, expDate, confNo) VALUES (2002, 103, 'VT347', TO_DATE('2019-09-01', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-01 03:15:05', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-09-04', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-04 16:16:08', 'YYYY-MM-DD HH24:MI:SS'),4000, 'VISA', 11113, TO_DATE('2021-10-21', 'YYYY-MM-DD'), 1002);
INSERT INTO Rent(rid, vlicense, dlicense, fromDate, fromTime, toDate, toTime, odometer, cardName, cardNo, expDate, confNo) VALUES (2003, 104, 'VT348', TO_DATE('2019-09-01', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-01 04:15:05', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-09-05', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-05 15:16:04', 'YYYY-MM-DD HH24:MI:SS'),3000, 'VISA', 11114, TO_DATE('2021-10-22', 'YYYY-MM-DD'), 1003);
INSERT INTO Rent(rid, vlicense, dlicense, fromDate, fromTime, toDate, toTime, odometer, cardName, cardNo, expDate, confNo) VALUES (2004, 105, 'VT349', TO_DATE('2019-09-02', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-1 05:15:05', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-09-07', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-07  14:16:05', 'YYYY-MM-DD HH24:MI:SS'),2000, 'VISA', 11115, TO_DATE('2021-10-23', 'YYYY-MM-DD'), 1004);
INSERT INTO Rent(rid, vlicense, dlicense, fromDate, fromTime, toDate, toTime, odometer, cardName, cardNo, expDate, confNo) VALUES (2005, 106, 'VT350', TO_DATE('2019-09-02', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-02 06:15:05', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-09-08', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-08 16:16:06', 'YYYY-MM-DD HH24:MI:SS'),4000, 'VISA', 11116, TO_DATE('2021-10-24', 'YYYY-MM-DD'), 1005);
INSERT INTO Rent(rid, vlicense, dlicense, fromDate, fromTime, toDate, toTime, odometer, cardName, cardNo, expDate, confNo) VALUES (2006, 107, 'VT351', TO_DATE('2019-09-02', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-02 07:15:05', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-09-09', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-09 17:16:07', 'YYYY-MM-DD HH24:MI:SS'),4000, 'VISA', 11117, TO_DATE('2021-10-25', 'YYYY-MM-DD'), 1006);
INSERT INTO Rent(rid, vlicense, dlicense, fromDate, fromTime, toDate, toTime, odometer, cardName, cardNo, expDate, confNo) VALUES (2007, 108, 'VT352', TO_DATE('2019-09-03', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-03 08:15:05', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-09-11', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-11 18:16:03', 'YYYY-MM-DD HH24:MI:SS'),6000, 'VISA', 11118, TO_DATE('2021-10-26', 'YYYY-MM-DD'), 1007);
INSERT INTO Rent(rid, vlicense, dlicense, fromDate, fromTime, toDate, toTime, odometer, cardName, cardNo, expDate, confNo) VALUES (2008, 109, 'VT353', TO_DATE('2019-09-04', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-04 11:15:05', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-09-15', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-15 11:16:02', 'YYYY-MM-DD HH24:MI:SS'),4000, 'VISA', 11119, TO_DATE('2021-10-27', 'YYYY-MM-DD'), 1010);
INSERT INTO Rent(rid, vlicense, dlicense, fromDate, fromTime, toDate, toTime, odometer, cardName, cardNo, expDate, confNo) VALUES (2009, 110, 'VT354', TO_DATE('2019-09-04', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-04 12:15:05', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-09-16', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-16 12:16:01', 'YYYY-MM-DD HH24:MI:SS'),9000, 'VISA', 11120, TO_DATE('2021-10-28', 'YYYY-MM-DD'), 1011);

-- Return_ insertion
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

commit;



