-- Branch insertion 
INSERT INTO Branch(vlocation, city) 
VALUES ('Burrad Street', 'Vancouver');

INSERT INTO Branch(vlocation, city) 
VALUES ('Raw Street', 'Vancouver');

INSERT INTO Branch(vlocation, city) 
VALUES ('Arts Road', 'Langley');

INSERT INTO Branch(vlocation, city) 
VALUES ('Shine Street', 'Langley');

INSERT INTO Branch(vlocation, city) 
VALUES ('Scott Road', 'Surrey');

INSERT INTO Branch(vlocation, city) 
VALUES ('Alberta Street', 'Delta');

INSERT INTO Branch(vlocation, city) 
VALUES ('Mia Street', 'Langley');

INSERT INTO Branch(vlocation, city) 
VALUES ('Barnet Road', 'Delta');

INSERT INTO Branch(vlocation, city) 
VALUES ('Albrey Street', 'Burnaby');

-- VehicleType insertion total: 21 
INSERT INTO  VehicleType (vtname, features, wrate, drate, hrate, wirate, dirate, hirate, krate)
VALUES ('EconomyGasoline', 'AC', 200.5, 63.5, 4.1, 49.5, 4.5, 2.1, 1.8); 

INSERT INTO  VehicleType(vtname, features, wrate, drate, hrate, wirate, dirate , hirate, krate) 
VALUES( 'EconomyHybrid', 'hybrid',210.2, 60.2, 4.05, 50.4, 7.3, 2.2, 2.1);

INSERT INTO  VehicleType(vtname, features, wrate, drate, hrate, wirate, dirate , hirate, krate) 
VALUES( 'EconomyElectric', 'fully electric',220.1,70.1,6.3,60.5,9.8,3.2,3.1);

INSERT INTO  VehicleType(vtname, features, wrate, drate, hrate, wirate, dirate , hirate, krate) 
VALUES( 'CompactGasoline', 'regular gasoline',250.3,80.1,8.3,40.5,5.6,1.3,1.5);

INSERT INTO  VehicleType(vtname, features, wrate, drate, hrate, wirate, dirate , hirate, krate) 
VALUES( 'CompactHybrid', 'hybrid',260.4,90.5,10.4,50.6,7.8,2.9,2.3);

INSERT INTO  VehicleType(vtname, features, wrate, drate, hrate, wirate, dirate , hirate, krate) 
VALUES( 'CompactElectric', 'fully electric',270.3,100.5,12.6,60.7,9.8,3.2,3.1);

INSERT INTO  VehicleType(vtname, features, wrate, drate, hrate, wirate, dirate , hirate, krate) 
VALUES( 'Mid-sizeGasoline', 'regular gasoline',280.1,110.2,14.3,40.4,5.5,1.6,1.7);

INSERT INTO  VehicleType(vtname, features, wrate, drate, hrate, wirate, dirate , hirate, krate) 
VALUES( 'Mid-sizeHybrid', 'hybrid',290.9,120.8,16.7,50.6,7.5,2.4,2.3);

INSERT INTO  VehicleType(vtname, features, wrate, drate, hrate, wirate, dirate , hirate, krate) 
VALUES( 'Mid-sizeElectric', 'fully electric',300.1,130.0,18.8,60.4,9.7,3.7,3.4);

INSERT INTO  VehicleType(vtname, features, wrate, drate, hrate, wirate, dirate , hirate, krate) 
VALUES( 'StandardGasoline','regular gasoline', 310.3,140.1,20.2,40.4,5.5,1.5,1.7);

INSERT INTO  VehicleType(vtname, features, wrate, drate, hrate, wirate, dirate , hirate, krate) 
VALUES( 'StandardHybrid', 'hybrid',320.4,150.5,22.6,50.2,7.5,2.2,2.1);

INSERT INTO  VehicleType(vtname, features, wrate, drate, hrate, wirate, dirate , hirate, krate) 
VALUES( 'StandardElectric', 'fully electric',330.3,160.4,24.5,60.2,9.7,3.6,3.9);

INSERT INTO  VehicleType(vtname, features, wrate, drate, hrate, wirate, dirate , hirate, krate) 
VALUES( 'Full-sizeGasoline', 'regular gasoline',340.6,170.5,26.6,40.7,5.8,1.9,1.0); 

INSERT INTO  VehicleType(vtname, features, wrate, drate, hrate, wirate, dirate , hirate, krate) 
VALUES( 'Full-sizeHybrid', 'hybrid',350.7,180.7,28.4,50.4,7.3,2.2,2.5);

INSERT INTO  VehicleType(vtname, features, wrate, drate, hrate, wirate, dirate , hirate, krate) 
VALUES( 'Full-sizeElectric', 'fully electric',360.3,190.2,30.6,60.6,9.7,3.1,3.2);

INSERT INTO  VehicleType(vtname, features, wrate, drate, hrate, wirate, dirate , hirate, krate) 
VALUES( 'SUVGasoline','regular gasoline',370,200,32,40,5,1,1);

INSERT INTO  VehicleType(vtname, features, wrate, drate, hrate, wirate, dirate , hirate, krate) 
VALUES( 'SUVHybrid', 'hybrid',380,210,34,50,7,2,2);

INSERT INTO  VehicleType(vtname, features, wrate, drate, hrate, wirate, dirate , hirate, krate) 
VALUES( 'SUVElectric', 'fully electric',390,220,36,60,9,3,3);

INSERT INTO  VehicleType(vtname, features, wrate, drate, hrate, wirate, dirate , hirate, krate) 
VALUES( 'TruckGasoline','regular gasoline',400,230,38,40,5,1,1);

INSERT INTO  VehicleType(vtname, features, wrate, drate, hrate, wirate, dirate , hirate, krate) 
VALUES( 'TruckHybrid','hybrid',410,240,40,50,7,2,2);

INSERT INTO  VehicleType(vtname, features, wrate, drate, hrate, wirate, dirate , hirate, krate) 
VALUES( 'TruckElectric','fully electric',420,250,42,60,9,3,3);


-- Customer insertion total:16
INSERT INTO  Customer(cellphone, cname, caddress, dlicense) 
VALUES('604123450', 'Oliver', '48 University Blvd', '1234560');

INSERT INTO  Customer(cellphone, cname, caddress, dlicense) 
VALUES('604123451', 'Arata', '160 Agronomy Rd', '1234561');

INSERT INTO  Customer(cellphone, cname, caddress, dlicense) 
VALUES('604123452', 'Mark', '280 Dunbar', '1234562');

INSERT INTO  Customer(cellphone, cname, caddress, dlicense) 
VALUES('604123453', 'Zain', '94 Crescent Heights', '1234563');

INSERT INTO  Customer(cellphone, cname, caddress, dlicense) 
VALUES('604123454', 'Gurveer', '76 Smithe', '1234564');

INSERT INTO  Customer(cellphone, cname, caddress, dlicense) 
VALUES('604123455', 'Anju', '98 Granville', '1234565');

INSERT INTO  Customer(cellphone, cname, caddress, dlicense) 
VALUES('604123456', 'Mitch', '190 English Bay', '1234566');

INSERT INTO  Customer(cellphone, cname, caddress, dlicense) 
VALUES('604123457', 'Vitor', '38 West 4th', '1234567');

INSERT INTO  Customer(cellphone, cname, caddress, dlicense) 
VALUES('604123458', 'Kittipod', '28 Fraser', '1234568');

INSERT INTO  Customer(cellphone, cname, caddress, dlicense) 
VALUES('604123459', 'Manal', '163 Blanca', '1234569');

INSERT INTO  Customer(cellphone, cname, caddress, dlicense) 
VALUES('604123550', 'Trevor', '83 Bernie', '1234570');

INSERT INTO  Customer(cellphone, cname, caddress, dlicense) 
VALUES('604123551', 'Sarah', '47 Westbrook', '1234571');

INSERT INTO  Customer(cellphone, cname, caddress, dlicense) 
VALUES('604123552', 'Perry', '61 Sasamat', '1234572');

INSERT INTO  Customer(cellphone, cname, caddress, dlicense) 
VALUES('604123553', 'Ambrosia', '523 Alma', '1234573');

INSERT INTO  Customer(cellphone, cname, caddress, dlicense) 
VALUES('604123554', 'Kelly', '857 Macdonald', '1234574');

INSERT INTO  Customer(cellphone, cname, caddress, dlicense) 
VALUES('604123555', 'Adam', '728 Cornwall', '1234575');


-- Vehicle insertion total: 20
INSERT INTO  Vehicle(vid, vlicense, make, model, vyear, color, odometer, vstatus, vtname, vlocation, city) 
VALUES (1,101,'Honda', 'Accord',2010,'White', 1000, 'for_rent', 'EconomyGasoline', 'Burrad Street', 'Vancouver');

INSERT INTO Vehicle(vid, vlicense, make, model, vyear, color, odometer, vstatus, vtname, vlocation, city)  
VALUES(2,102,'Honda', 'Passport',2011,'Black',2000, 'for_rent', 'SUVGasoline', 'Burrad Street', 'Vancouver');

INSERT INTO Vehicle(vid, vlicense, make, model, vyear, color, odometer, vstatus, vtname, vlocation, city)  
VALUES(3,103,'Honda', 'Civic',2015,'Red', 3000, 'for_rent', 'CompactElectric', 'Raw Street', 'Vancouver');

INSERT INTO Vehicle(vid, vlicense, make, model, vyear, color, odometer, vstatus, vtname, vlocation, city)  
VALUES(4,104,'Honda', 'Fit',2014,'Grey', 4000, 'for_rent', 'EconomyGasoline', 'Arts Road', 'Langley');

INSERT INTO Vehicle(vid, vlicense, make, model, vyear, color, odometer, vstatus, vtname, vlocation, city)  
VALUES(5,105,'Honda', 'Civic',2019,'Black', 1000, 'for_rent', 'EconomyHybrid', 'Shine Street', 'Langley' );

INSERT INTO Vehicle(vid, vlicense, make, model, vyear, color, odometer, vstatus, vtname, vlocation, city)  
VALUES(6,106,'Honda', 'Ridgeline',2012,'Red', 2000, 'for_rent', 'TruckGasoline', 'Burrad Street', 'Vancouver');

INSERT INTO Vehicle(vid, vlicense, make, model, vyear, color, odometer, vstatus, vtname, vlocation, city)  
VALUES(7,107,'Honda', 'Pilot',2010,'White', 4000, 'for_rent', 'Full-sizeElectric', 'Scott Road', 'Surrey');

INSERT INTO Vehicle(vid, vlicense, make, model, vyear, color, odometer, vstatus, vtname, vlocation, city)  
VALUES(8,108,'Honda', 'Insight',2015,'Black', 4000, 'for_rent', 'Full-sizeGasoline', 'Burrad Street', 'Vancouver');

INSERT INTO Vehicle(vid, vlicense, make, model, vyear, color, odometer, vstatus, vtname, vlocation, city)  
VALUES(9,109,'Honda', 'Jazz',2016,'Red', 6000, 'for_rent', 'StandardGasoline', 'Alberta Street', 'Delta');

INSERT INTO Vehicle(vid, vlicense, make, model, vyear, color, odometer, vstatus, vtname, vlocation, city)  
VALUES(10,110,'Honda', 'CR-V',2017,'White', 5000, 'for_rent', 'StandardElectric','Scott Road', 'Surrey');

-- INSERT INTO Vehicle(vid, vlicense, make, model, vyear, color, odometer, vstatus, vtname, vlocation, city)  
-- VALUES(11,111,'Toyota', 'Camry',2018,'Black', 7000, 'for_rent', 'Mid-sizeGasoline', 'Shine Street', 'Langley');

INSERT INTO Vehicle(vid, vlicense, make, model, vyear, color, odometer, vstatus, vtname, vlocation, city)  
VALUES(11,111,'Toyota', 'Camry',2018,'Black', 7000, 'for_rent', 'StandardElectric','Scott Road', 'Surrey');

-- INSERT INTO Vehicle(vid, vlicense, make, model, vyear, color, odometer, vstatus, vtname, vlocation, city) 
-- VALUES(12,112,'Toyota', 'Camry',2012,'Grey', 8000, 'for_rent', 'Mid-sizeHybrid', 'Shine Street', 'Langley');

INSERT INTO Vehicle(vid, vlicense, make, model, vyear, color, odometer, vstatus, vtname, vlocation, city) 
VALUES(12,112,'Toyota', 'Camry',2012,'Grey', 8000, 'for_rent', 'EconomyGasoline','Scott Road', 'Surrey');

INSERT INTO Vehicle(vid, vlicense, make, model, vyear, color, odometer, vstatus, vtname, vlocation, city)  
VALUES(13,113,'Toyota', 'Prius',2014,'Red', 4000, 'for_rent', 'Mid-sizeGasoline', 'Alberta Street', 'Delta');

INSERT INTO Vehicle(vid, vlicense, make, model, vyear, color, odometer, vstatus, vtname, vlocation, city)  
VALUES(14,114,'Toyota', 'Mirai',2016,'White', 1000, 'for_rent', 'Mid-sizeGasoline', 'Burrad Street', 'Vancouver');

INSERT INTO Vehicle(vid, vlicense, make, model, vyear, color, odometer, vstatus, vtname, vlocation, city)  
VALUES(15,115,'Toyota', 'Tacoma',2017,'Red', 2000, 'for_rent', 'TruckGasoline', 'Shine Street', 'Langley');

INSERT INTO Vehicle(vid, vlicense, make, model, vyear, color, odometer, vstatus, vtname, vlocation, city)  
VALUES(16,116,'Toyota', 'Tundra',2017,'Black', 9000, 'for_rent', 'TruckHybrid', 'Raw Street', 'Vancouver');

INSERT INTO Vehicle(vid, vlicense, make, model, vyear, color, odometer, vstatus, vtname, vlocation, city)  
VALUES(17,117,'Toyota', 'Highlander',2018,'Grey', 4000, 'for_rent', 'SUVGasoline', 'Mia Street', 'Langley');

INSERT INTO Vehicle(vid, vlicense, make, model, vyear, color, odometer, vstatus, vtname, vlocation, city)  
VALUES(18,118,'Toyota', 'Land Cruiser',2019,'White', 5000, 'for_rent', 'SUVGasoline', 'Mia Street', 'Langley');

INSERT INTO Vehicle(vid, vlicense, make, model, vyear, color, odometer, vstatus, vtname, vlocation, city)  
VALUES(19,119,'Toyota', 'Avalon',2012,'Red', 3000, 'for_rent', 'Full-sizeHybrid', 'Raw Street', 'Vancouver');

INSERT INTO Vehicle(vid, vlicense, make, model, vyear, color, odometer, vstatus, vtname, vlocation, city)  
VALUES(20,120,'Toyota', 'Yaris',2013,'Black', 8000, 'for_rent', 'CompactGasoline', 'Albrey Street', 'Burnaby');

-- extra data
INSERT INTO Vehicle(vid, vlicense, make, model, vyear, color, odometer, vstatus, vtname, vlocation, city)  
VALUES(21,120,'Toyota', 'Yaris',2013,'Black', 8000, 'for_rent', 'EconomyGasoline', 'Burrad Street', 'Vancouver');

INSERT INTO Vehicle(vid, vlicense, make, model, vyear, color, odometer, vstatus, vtname, vlocation, city)  
VALUES(22,120,'Toyota', 'Avalon',2011,'Black', 8000, 'for_rent', 'Full-sizeGasoline', 'Burrad Street', 'Vancouver');

INSERT INTO Vehicle(vid, vlicense, make, model, vyear, color, odometer, vstatus, vtname, vlocation, city)  
VALUES(23,120,'Toyota', 'Land Cruiser',2009,'Silver', 8000, 'for_rent', 'EconomyGasoline', 'Burrad Street', 'Vancouver');

-- Reservation insertion total: 16
-- INSERT INTO  Reservation(confNo, vtname, cellphone, fromDate, fromTime, toDate, toTime)
-- VALUES (1001, 'EconomyGasoline', '604123450', TO_DATE('2019-10-01', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-10-01 09:25:16', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-10-11', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-10-11 15:15:06', 'YYYY-MM-DD HH24:MI:SS'));

-- INSERT INTO  Reservation(confNo, vtname, cellphone, fromDate, fromTime, toDate, toTime)
-- VALUES (1002, 'CompactGasoline', '604123451', TO_DATE('2019-10-02', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-10-02 10:25:16', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-10-12', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-10-12 17:25:16', 'YYYY-MM-DD HH24:MI:SS'));

-- INSERT INTO  Reservation(confNo, vtname, cellphone, fromDate, fromTime, toDate, toTime)
-- VALUES (1003, 'Mid-sizeHybrid', '604123452', TO_DATE('2019-10-03', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-10-03 11:25:16', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-10-13', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-10-13 18:25:16', 'YYYY-MM-DD HH24:MI:SS'));

-- INSERT INTO  Reservation(confNo, vtname, cellphone, fromDate, fromTime, toDate, toTime)
-- VALUES (1004, 'SUVGasoline', '604123453', TO_DATE('2019-10-04', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-10-04 12:25:16', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-10-14', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-10-14 19:25:16', 'YYYY-MM-DD HH24:MI:SS'));

-- INSERT INTO  Reservation(confNo, vtname, cellphone, fromDate, fromTime, toDate, toTime)
-- VALUES (1005, 'TruckHybrid', '604123454', TO_DATE('2019-10-05', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-10-05 13:25:16', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-10-15', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-10-15 20:25:16', 'YYYY-MM-DD HH24:MI:SS'));

-- INSERT INTO  Reservation(confNo, vtname, cellphone, fromDate, fromTime, toDate, toTime)
-- VALUES (1006, 'SUVElectric', '604123455', TO_DATE('2019-10-06', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-10-06 14:25:16', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-10-16', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-10-16 21:25:16', 'YYYY-MM-DD HH24:MI:SS'));

-- INSERT INTO  Reservation(confNo, vtname, cellphone, fromDate, fromTime, toDate, toTime)
-- VALUES (1007, 'Full-sizeGasoline', '604123456', TO_DATE('2019-10-07', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-10-07 15:25:16', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-10-17', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-10-17 22:25:16', 'YYYY-MM-DD HH24:MI:SS'));

-- INSERT INTO  Reservation(confNo, vtname, cellphone, fromDate, fromTime, toDate, toTime)
-- VALUES (1008, 'EconomyElectric', '604123457', TO_DATE('2019-10-08', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-10-08 16:25:16', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-10-18', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-10-18 23:25:16', 'YYYY-MM-DD HH24:MI:SS'));

-- INSERT INTO  Reservation(confNo, vtname, cellphone, fromDate, fromTime, toDate, toTime)
-- VALUES (1009, 'Full-sizeHybrid', '604123458', TO_DATE('2019-10-09', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-10-09 17:25:16', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-10-19', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-10-19 00:25:16', 'YYYY-MM-DD HH24:MI:SS'));

-- INSERT INTO  Reservation(confNo, vtname, cellphone, fromDate, fromTime, toDate, toTime)
-- VALUES (1010, 'Mid-sizeGasoline', '604123459', TO_DATE('2019-10-10', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-10-10 18:25:16', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-10-20', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-10-20 01:25:16', 'YYYY-MM-DD HH24:MI:SS'));

-- INSERT INTO  Reservation(confNo, vtname, cellphone, fromDate, fromTime, toDate, toTime)
-- VALUES (1011, 'TruckGasoline', '604123550', TO_DATE('2019-10-11', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-10-11 19:25:16', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-10-21', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-10-21 02:25:16', 'YYYY-MM-DD HH24:MI:SS'));

-- INSERT INTO  Reservation(confNo, vtname, cellphone, fromDate, fromTime, toDate, toTime)
-- VALUES (1012, 'SUVHybrid', '604123551', TO_DATE('2019-10-12', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-10-12 20:25:16', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-10-22', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-10-22 03:25:16', 'YYYY-MM-DD HH24:MI:SS'));

-- INSERT INTO  Reservation(confNo, vtname, cellphone, fromDate, fromTime, toDate, toTime)
-- VALUES (1013, 'EconomyHybrid', '604123552', TO_DATE('2019-10-13', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-10-13 21:25:16', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-10-23', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-10-23 04:25:16', 'YYYY-MM-DD HH24:MI:SS'));

-- INSERT INTO  Reservation(confNo, vtname, cellphone, fromDate, fromTime, toDate, toTime)
-- VALUES (1014, 'StandardGasoline', '604123553', TO_DATE('2019-10-14', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-10-14 22:25:16', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-10-24', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-10-24 05:25:16', 'YYYY-MM-DD HH24:MI:SS'));

-- INSERT INTO  Reservation(confNo, vtname, cellphone, fromDate, fromTime, toDate, toTime)
-- VALUES (1015, 'Full-sizeElectric', '604123554', TO_DATE('2019-10-15', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-10-15 23:25:16', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-10-25', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-10-25 06:25:16', 'YYYY-MM-DD HH24:MI:SS'));

-- INSERT INTO  Reservation(confNo, vtname, cellphone, fromDate, fromTime, toDate, toTime)
-- VALUES (1016, 'EconomyGasoline', '604123555', TO_DATE('2019-10-16', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-10-16 00:25:16', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-10-26', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-10-26 07:25:16', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO  Reservation(confNo, vtname, cellphone, fromDate, fromTime, toDate, toTime, vlocation, city)
VALUES (1001, 'EconomyGasoline', '604123450', TO_DATE('2019-10-01', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-10-01 09:25:16', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-10-11', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-10-11 15:15:06', 'YYYY-MM-DD HH24:MI:SS'), 'Burrad Street', 'Vancouver');

INSERT INTO  Reservation(confNo, vtname, cellphone, fromDate, fromTime, toDate, toTime, vlocation, city)
VALUES (1002, 'CompactGasoline', '604123451', TO_DATE('2019-10-02', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-10-02 10:25:16', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-10-12', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-10-12 17:25:16', 'YYYY-MM-DD HH24:MI:SS'), 'Burrad Street', 'Vancouver');

INSERT INTO  Reservation(confNo, vtname, cellphone, fromDate, fromTime, toDate, toTime, vlocation, city)
VALUES (1003, 'Mid-sizeHybrid', '604123452', TO_DATE('2019-10-03', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-10-03 11:25:16', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-10-13', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-10-13 18:25:16', 'YYYY-MM-DD HH24:MI:SS'), 'Arts Road', 'Langley');

INSERT INTO  Reservation(confNo, vtname, cellphone, fromDate, fromTime, toDate, toTime, vlocation, city)
VALUES (1004, 'SUVGasoline', '604123453', TO_DATE('2019-10-04', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-10-04 12:25:16', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-10-14', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-10-14 19:25:16', 'YYYY-MM-DD HH24:MI:SS'), 'Shine Street', 'Langley');

INSERT INTO  Reservation(confNo, vtname, cellphone, fromDate, fromTime, toDate, toTime, vlocation, city)
VALUES (1005, 'TruckHybrid', '604123454', TO_DATE('2019-10-05', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-10-05 13:25:16', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-10-15', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-10-15 20:25:16', 'YYYY-MM-DD HH24:MI:SS'), 'Scott Road', 'Surrey');

INSERT INTO  Reservation(confNo, vtname, cellphone, fromDate, fromTime, toDate, toTime, vlocation, city)
VALUES (1006, 'SUVElectric', '604123455', TO_DATE('2019-10-06', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-10-06 14:25:16', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-10-16', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-10-16 21:25:16', 'YYYY-MM-DD HH24:MI:SS'), 'Shine Street', 'Langley');

INSERT INTO  Reservation(confNo, vtname, cellphone, fromDate, fromTime, toDate, toTime, vlocation, city)
VALUES (1007, 'Full-sizeGasoline', '604123456', TO_DATE('2019-10-07', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-10-07 15:25:16', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-10-17', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-10-17 22:25:16', 'YYYY-MM-DD HH24:MI:SS'), 'Shine Street', 'Langley');

INSERT INTO  Reservation(confNo, vtname, cellphone, fromDate, fromTime, toDate, toTime, vlocation, city)
VALUES (1008, 'EconomyElectric', '604123457', TO_DATE('2019-10-08', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-10-08 16:25:16', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-10-18', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-10-18 23:25:16', 'YYYY-MM-DD HH24:MI:SS'), 'Alberta Street', 'Delta');

INSERT INTO  Reservation(confNo, vtname, cellphone, fromDate, fromTime, toDate, toTime, vlocation, city)
VALUES (1009, 'Full-sizeHybrid', '604123458', TO_DATE('2019-10-09', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-10-09 17:25:16', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-10-19', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-10-19 00:25:16', 'YYYY-MM-DD HH24:MI:SS'), 'Shine Street', 'Langley');

INSERT INTO  Reservation(confNo, vtname, cellphone, fromDate, fromTime, toDate, toTime, vlocation, city)
VALUES (1010, 'Mid-sizeGasoline', '604123459', TO_DATE('2019-10-10', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-10-10 18:25:16', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-10-20', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-10-20 01:25:16', 'YYYY-MM-DD HH24:MI:SS'), 'Raw Street', 'Vancouver');

INSERT INTO  Reservation(confNo, vtname, cellphone, fromDate, fromTime, toDate, toTime, vlocation, city)
VALUES (1011, 'TruckGasoline', '604123550', TO_DATE('2019-10-11', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-10-11 19:25:16', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-10-21', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-10-21 02:25:16', 'YYYY-MM-DD HH24:MI:SS'), 'Mia Street', 'Langley');

INSERT INTO  Reservation(confNo, vtname, cellphone, fromDate, fromTime, toDate, toTime, vlocation, city)
VALUES (1012, 'SUVHybrid', '604123551', TO_DATE('2019-10-12', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-10-12 20:25:16', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-10-22', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-10-22 03:25:16', 'YYYY-MM-DD HH24:MI:SS'), 'Barnet Road', 'Delta');

INSERT INTO  Reservation(confNo, vtname, cellphone, fromDate, fromTime, toDate, toTime, vlocation, city)
VALUES (1013, 'EconomyHybrid', '604123552', TO_DATE('2019-10-13', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-10-13 21:25:16', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-10-23', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-10-23 04:25:16', 'YYYY-MM-DD HH24:MI:SS'), 'Albrey Street', 'Burnaby');

INSERT INTO  Reservation(confNo, vtname, cellphone, fromDate, fromTime, toDate, toTime, vlocation, city)
VALUES (1014, 'StandardGasoline', '604123553', TO_DATE('2019-10-14', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-10-14 22:25:16', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-10-24', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-10-24 05:25:16', 'YYYY-MM-DD HH24:MI:SS'), 'Arts Road', 'Langley');

INSERT INTO  Reservation(confNo, vtname, cellphone, fromDate, fromTime, toDate, toTime, vlocation, city)
VALUES (1015, 'Full-sizeElectric', '604123554', TO_DATE('2019-10-15', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-10-15 23:25:16', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-10-25', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-10-25 06:25:16', 'YYYY-MM-DD HH24:MI:SS'), 'Burrad Street', 'Vancouver');

INSERT INTO  Reservation(confNo, vtname, cellphone, fromDate, fromTime, toDate, toTime, vlocation, city)
VALUES (1016, 'EconomyGasoline', '604123555', TO_DATE('2019-10-16', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-10-16 00:25:16', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-10-26', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-10-26 07:25:16', 'YYYY-MM-DD HH24:MI:SS'), 'Burrad Street', 'Vancouver');

INSERT INTO  Reservation(confNo, vtname, cellphone, fromDate, fromTime, toDate, toTime, vlocation, city)
VALUES (1017, 'EconomyGasoline', '604123555', TO_DATE('2019-10-14', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-10-14 00:25:16', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-10-26', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-10-26 07:25:16', 'YYYY-MM-DD HH24:MI:SS'), 'Burrad Street', 'Vancouver');

INSERT INTO  Reservation(confNo, vtname, cellphone, fromDate, fromTime, toDate, toTime, vlocation, city)
VALUES (1018, 'EconomyGasoline', '604123555', TO_DATE('2019-10-14', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-10-14 00:25:16', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-10-26', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-10-26 07:25:16', 'YYYY-MM-DD HH24:MI:SS'), 'Burrad Street', 'Vancouver');

-- Rent insertion total: 16
INSERT INTO  Rent(rid, vid, cellphone, fromDate, fromTime, toDate, toTime, odometer, cardName, cardNo, expDate, confNo)
VALUES (10001, 1, '604123450', TO_DATE('2019-10-01', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-10-01 09:25:16', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-10-11', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-10-11 15:15:06', 'YYYY-MM-DD HH24:MI:SS'), 120, 'VISA', 1111111111, TO_DATE('2021-10-31', 'YYYY-MM-DD'), 1001);

INSERT INTO  Rent(rid, vid, cellphone, fromDate, fromTime, toDate, toTime, odometer, cardName, cardNo, expDate, confNo)
VALUES (10002, 2, '604123451', TO_DATE('2019-10-02', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-10-02 10:25:16', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-10-12', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-10-12 17:25:16', 'YYYY-MM-DD HH24:MI:SS'), 121, 'VISA', 1111111112, TO_DATE('2021-11-01', 'YYYY-MM-DD'), 1002);

INSERT INTO  Rent(rid, vid, cellphone, fromDate, fromTime, toDate, toTime, odometer, cardName, cardNo, expDate, confNo)
VALUES (10003, 3, '604123452', TO_DATE('2019-10-03', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-10-03 11:25:16', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-10-13', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-10-13 18:25:16', 'YYYY-MM-DD HH24:MI:SS'), 122, 'VISA', 1111111113, TO_DATE('2021-11-02', 'YYYY-MM-DD'), 1003);

INSERT INTO  Rent(rid, vid, cellphone, fromDate, fromTime, toDate, toTime, odometer, cardName, cardNo, expDate, confNo)
VALUES (10004, 4, '604123453', TO_DATE('2019-10-04', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-10-04 12:25:16', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-10-14', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-10-14 19:25:16', 'YYYY-MM-DD HH24:MI:SS'), 123, 'VISA', 1111111114, TO_DATE('2021-11-03', 'YYYY-MM-DD'), 1004);

INSERT INTO  Rent(rid, vid, cellphone, fromDate, fromTime, toDate, toTime, odometer, cardName, cardNo, expDate, confNo)
VALUES (10005, 5, '604123454', TO_DATE('2019-10-05', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-10-05 13:25:16', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-10-15', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-10-15 20:25:16', 'YYYY-MM-DD HH24:MI:SS'), 124, 'VISA', 1111111115, TO_DATE('2021-11-04', 'YYYY-MM-DD'), 1005);

INSERT INTO  Rent(rid, vid, cellphone, fromDate, fromTime, toDate, toTime, odometer, cardName, cardNo, expDate, confNo)
VALUES (10006, 6, '604123455', TO_DATE('2019-10-06', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-10-06 14:25:16', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-10-16', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-10-16 21:25:16', 'YYYY-MM-DD HH24:MI:SS'), 125, 'VISA', 1111111116, TO_DATE('2021-11-05', 'YYYY-MM-DD'), 1006);

INSERT INTO  Rent(rid, vid, cellphone, fromDate, fromTime, toDate, toTime, odometer, cardName, cardNo, expDate, confNo)
VALUES (10007, 7, '604123456', TO_DATE('2019-10-07', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-10-07 15:25:16', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-10-17', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-10-17 22:25:16', 'YYYY-MM-DD HH24:MI:SS'), 126, 'VISA', 1111111117, TO_DATE('2021-11-06', 'YYYY-MM-DD'), 1007);

INSERT INTO  Rent(rid, vid, cellphone, fromDate, fromTime, toDate, toTime, odometer, cardName, cardNo, expDate, confNo)
VALUES (10008, 8, '604123457', TO_DATE('2019-10-08', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-10-08 16:25:16', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-10-18', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-10-18 23:25:16', 'YYYY-MM-DD HH24:MI:SS'), 127, 'VISA', 1111111118, TO_DATE('2021-11-07', 'YYYY-MM-DD'), 1008);

INSERT INTO  Rent(rid, vid, cellphone, fromDate, fromTime, toDate, toTime, odometer, cardName, cardNo, expDate, confNo)
VALUES (10009, 9, '604123458', TO_DATE('2019-10-09', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-10-09 17:25:16', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-10-19', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-10-19 00:25:16', 'YYYY-MM-DD HH24:MI:SS'), 128, 'VISA', 1111111119, TO_DATE('2021-11-08', 'YYYY-MM-DD'), 1009);

INSERT INTO  Rent(rid, vid, cellphone, fromDate, fromTime, toDate, toTime, odometer, cardName, cardNo, expDate, confNo)
VALUES (10010, 10, '604123459', TO_DATE('2019-10-10', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-10-10 18:25:16', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-10-20', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-10-20 01:25:16', 'YYYY-MM-DD HH24:MI:SS'), 129, 'VISA', 1111111120, TO_DATE('2021-11-09', 'YYYY-MM-DD'), 1010);

INSERT INTO  Rent(rid, vid, cellphone, fromDate, fromTime, toDate, toTime, odometer, cardName, cardNo, expDate, confNo)
VALUES (10011, 11, '604123550', TO_DATE('2019-10-11', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-10-11 19:25:16', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-10-21', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-10-21 02:25:16', 'YYYY-MM-DD HH24:MI:SS'), 130, 'VISA', 1111111121, TO_DATE('2021-11-10', 'YYYY-MM-DD'), 1011);

INSERT INTO  Rent(rid, vid, cellphone, fromDate, fromTime, toDate, toTime, odometer, cardName, cardNo, expDate, confNo)
VALUES (10012, 12, '604123551', TO_DATE('2019-10-12', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-10-12 20:25:16', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-10-22', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-10-22 03:25:16', 'YYYY-MM-DD HH24:MI:SS'), 131, 'VISA', 1111111122, TO_DATE('2021-11-11', 'YYYY-MM-DD'), 1012);

INSERT INTO  Rent(rid, vid, cellphone, fromDate, fromTime, toDate, toTime, odometer, cardName, cardNo, expDate, confNo)
VALUES (10013, 13, '604123552', TO_DATE('2019-10-13', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-10-13 21:25:16', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-10-23', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-10-23 04:25:16', 'YYYY-MM-DD HH24:MI:SS'), 132, 'VISA', 1111111123, TO_DATE('2021-11-12', 'YYYY-MM-DD'), 1013);

INSERT INTO  Rent(rid, vid, cellphone, fromDate, fromTime, toDate, toTime, odometer, cardName, cardNo, expDate, confNo)
VALUES (10014, 14, '604123553', TO_DATE('2019-10-14', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-10-14 22:25:16', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-10-24', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-10-24 05:25:16', 'YYYY-MM-DD HH24:MI:SS'), 133, 'VISA', 1111111124, TO_DATE('2021-11-13', 'YYYY-MM-DD'), 1014);

INSERT INTO  Rent(rid, vid, cellphone, fromDate, fromTime, toDate, toTime, odometer, cardName, cardNo, expDate, confNo)
VALUES (10015, 15, '604123554', TO_DATE('2019-10-15', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-10-15 23:25:16', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-10-25', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-10-25 06:25:16', 'YYYY-MM-DD HH24:MI:SS'), 134, 'VISA', 1111111125, TO_DATE('2021-11-14', 'YYYY-MM-DD'), 1015);

INSERT INTO  Rent(rid, vid, cellphone, fromDate, fromTime, toDate, toTime, odometer, cardName, cardNo, expDate, confNo)
VALUES (10016, 16, '604123555', TO_DATE('2019-10-16', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-10-16 00:25:16', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-10-26', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-10-26 07:25:16', 'YYYY-MM-DD HH24:MI:SS'), 135, 'VISA', 1111111126, TO_DATE('2021-11-15', 'YYYY-MM-DD'), 1016);

INSERT INTO  Rent(rid, vid, cellphone, fromDate, fromTime, toDate, toTime, odometer, cardName, cardNo, expDate, confNo)
VALUES (10017, 17, '604123555', TO_DATE('2019-10-14', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-10-14 00:25:16', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-10-26', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-10-26 07:25:16', 'YYYY-MM-DD HH24:MI:SS'), 135, 'VISA', 1111111126, TO_DATE('2021-11-15', 'YYYY-MM-DD'), 1017);

INSERT INTO  Rent(rid, vid, cellphone, fromDate, fromTime, toDate, toTime, odometer, cardName, cardNo, expDate, confNo)
VALUES (10018, 18, '604123555', TO_DATE('2019-10-14', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-10-14 00:25:16', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-10-26', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-10-26 07:25:16', 'YYYY-MM-DD HH24:MI:SS'), 135, 'VISA', 1111111126, TO_DATE('2021-11-15', 'YYYY-MM-DD'), 1018);


-- Return insertion total: 10
INSERT INTO Return_(rid, rdate, rtime, odometer, fulltank, valueit) 
VALUES (10001, TO_DATE('2019-10-09', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-10-09 10:15:06', 'YYYY-MM-DD HH24:MI:SS'), 130, 0, 1000);

INSERT INTO Return_(rid, rdate, rtime, odometer, fulltank, valueit) 
VALUES (10002, TO_DATE('2019-10-10', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-10-10 11:15:06', 'YYYY-MM-DD HH24:MI:SS'), 131, 0, 1015);

INSERT INTO Return_(rid, rdate, rtime, odometer, fulltank, valueit) 
VALUES (10003, TO_DATE('2019-10-11', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-10-11 13:45:13', 'YYYY-MM-DD HH24:MI:SS'), 98, 1, 830);

INSERT INTO Return_(rid, rdate, rtime, odometer, fulltank, valueit) 
VALUES (10004, TO_DATE('2019-10-12', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-10-12 15:24:09', 'YYYY-MM-DD HH24:MI:SS'), 103, 1, 871);

INSERT INTO Return_(rid, rdate, rtime, odometer, fulltank, valueit) 
VALUES (10005, TO_DATE('2019-10-13', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-10-13 12:13:06', 'YYYY-MM-DD HH24:MI:SS'), 111, 0, 933);

INSERT INTO Return_(rid, rdate, rtime, odometer, fulltank, valueit) 
VALUES (10006, TO_DATE('2019-10-14', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-10-14 12:19:10', 'YYYY-MM-DD HH24:MI:SS'), 105, 1, 890);

INSERT INTO Return_(rid, rdate, rtime, odometer, fulltank, valueit) 
VALUES (10007, TO_DATE('2019-10-15', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-10-15 17:02:54', 'YYYY-MM-DD HH24:MI:SS'), 95, 0, 893);

INSERT INTO Return_(rid, rdate, rtime, odometer, fulltank, valueit) 
VALUES (10008, TO_DATE('2019-10-16', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-10-16 19:02:44', 'YYYY-MM-DD HH24:MI:SS'), 94, 1, 899);

INSERT INTO Return_(rid, rdate, rtime, odometer, fulltank, valueit) 
VALUES (10009, TO_DATE('2019-10-17', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-10-17 17:36:04', 'YYYY-MM-DD HH24:MI:SS'), 85, 0, 858);

INSERT INTO Return_(rid, rdate, rtime, odometer, fulltank, valueit) 
VALUES (10010, TO_DATE('2019-10-18', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-10-18 10:03:14', 'YYYY-MM-DD HH24:MI:SS'), 80, 0, 823);

INSERT INTO Return_(rid, rdate, rtime, odometer, fulltank, valueit) 
VALUES (10011, TO_DATE('2019-10-18', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-10-18 10:03:14', 'YYYY-MM-DD HH24:MI:SS'), 85, 1, 827);

INSERT INTO Return_(rid, rdate, rtime, odometer, fulltank, valueit) 
VALUES (10012, TO_DATE('2019-10-18', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-10-18 10:03:14', 'YYYY-MM-DD HH24:MI:SS'), 75, 1, 800);





