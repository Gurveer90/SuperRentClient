-- CREATE TABLE Vehicle (
--     vid integer NOT NULL, 
--     vlicense integer, 
--     make varchar2(30), 
--     model varchar2(30), 
--     vyear integer, 
--     color varchar2(30),
--     odometer integer,
--     vstatus varchar2(30), 
--     vtname varchar2(30), 
--     vlocation varchar2(30), 
--     city varchar2(30), 
--     PRIMARY KEY (vid),
--     FOREIGN KEY(vtname) REFERENCES VehicleType ON DELETE CASCADE
-- );

CREATE TABLE Vehicle(
    vlicense int NOT NULL, 
make char(30),
 model char(30),
  vyear int, 
  color char(30),
   odometer int, 
   vstatus char(30),
    vtname char(30), 
    vlocation char(30), 
    city char(30),
     PRIMARY KEY (vlicense), FOREIGN KEY(vtname) REFERENCES VehicleType ON DELETE CASCADE);

CREATE TABLE VehicleType (
    vtname varchar2(30) NOT NULL, 
    features varchar2(30), 
    wrate float(10), 
    drate float(10), 
    hrate float(10), 
    wirate float(10), 
    dirate float(10), 
    hirate float(10), 
    krate float(10), 
    PRIMARY KEY (vtname)
);
CREATE TABLE VehicleType(vtname char(30), features char(30), wrate float(10), 
drate float(10), 
hrate float(10), 
wirate float(10), 
dirate float(10), 
hirate float(10), 
krate float(10), PRIMARY KEY (vtname));


CREATE TABLE Customer (
    cellphone varchar2(30) NOT NULL, 
    cname varchar2(30), 
    caddress varchar2(30), 
    dlicense varchar2(30), 
    PRIMARY KEY (cellphone)
); 

CREATE TABLE Reservation (
    confNo integer NOT NULL, 
    vtname varchar2(30), 
    cellphone varchar2(30), 
    fromDate date, 
    fromTime timestamp, 
    toDate date, 
    toTime timestamp, 
    vlocation varchar2(30),
    city varchar(20), 
    PRIMARY KEY (confNo),
    FOREIGN KEY (vtname) REFERENCES VehicleType ON DELETE CASCADE,
    FOREIGN KEY (cellphone) REFERENCES Customer ON DELETE CASCADE,
    FOREIGN KEY (vlocation, city) REFERENCES Branch ON DELETE CASCADE
); 
select confNo from Reservation ORDER BY confNo DESC FETCH FIRST 1 ROWS ONLY;
  SELECT * FROM (SELECT confNo FROM Reservation ORDER BY confNo DESC) WHERE ROWNUM = 1;
CREATE TABLE Rent (
    rid integer NOT NULL, 
    vid integer, 
    cellphone varchar2(30), 
    fromDate date, 
    fromTime timestamp, 
    toDate date, 
    toTime timestamp, 
    odometer integer, 
    cardName varchar2(30), 
    cardNo integer,
    expDate date, 
    confNo integer, 
    PRIMARY KEY (rid), 
    FOREIGN KEY (vid) REFERENCES Vehicle ON DELETE CASCADE, 
    FOREIGN KEY(cellphone) REFERENCES Customer ON DELETE CASCADE, 
    FOREIGN KEY(confNo) REFERENCES Reservation ON DELETE CASCADE
);

CREATE TABLE Return_ (
    rid integer NOT NULL, 
    rdate date, 
    rtime timestamp, 
    odometer integer, 
    fulltank varchar2(30), 
    valueit float(10),
    PRIMARY KEY (rid), 
    FOREIGN KEY(rid) REFERENCES Rent ON DELETE CASCADE
);

CREATE TABLE Rent(rid int  NOT NULL, 
vlicense int, dlicense char(30),
 fromDate DATE, fromTime TIMESTAMP, 
 toDate DATE, toTime TIMESTAMP, 
 odometer int,cardName char(30), 
 cardNo int,ExpDate char(30), 
 confNo int, 
 PRIMARY KEY (rid), FOREIGN KEY(dlicense) REFERENCES Customer  ON DELETE CASCADE, 
 FOREIGN KEY(vlicense) REFERENCES Vehicle  ON DELETE CASCADE, FOREIGN KEY(confNo) REFERENCES Reservation  ON DELETE CASCADE);

ALTER TABLE Rent ALTER COLUMN ExpDate char(30) [NULL | NOT NULL];

CREATE TABLE VehicleType(vtname char(30)  NOT NULL, features char(30), wrate float(10), drate float(10), hrate float(10), wirate float(10), dirate float(10), hirate float(10), krate float(10), PRIMARY KEY (vtname));

CREATE TABLE Customer (
    dlicense char(30)  NOT NULL, 
cellphone char(30)  NOT NULL UNIQUE,
 cname char(30), 
 caddress char(30),
  PRIMARY KEY (dlicense)); 

CREATE TABLE Reservation (confNo int , 
vtname char(30), 
dlicense char(30),
 fromDate DATE, fromTime TIMESTAMP, 
 toDate DATE, 
 toTime TIMESTAMP, PRIMARY KEY(confNo),FOREIGN KEY(vtname) REFERENCES VehicleType ON DELETE CASCADE, FOREIGN KEY(dlicense) REFERENCES Customer ON DELETE CASCADE); 

CREATE TABLE RentInderpal(vlicense int, fromDate DATE, fromTime TIMESTAMP, toDate DATE, toTime TIMESTAMP);
INSERT INTO RentInderpal(vlicense, fromDate, fromTime, toDate, toTime) VALUES (2009,TO_DATE('2019-09-01', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-01 01:15:05', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-09-15', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-15 11:16:10', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO RentInderpal(vlicense, fromDate, fromTime, toDate, toTime) VALUES (2010,TO_DATE('2019-09-02', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-02 02:15:05', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-09-16', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-16 23:16:09', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO RentInderpal(vlicense, fromDate, fromTime, toDate, toTime) VALUES (103, TO_DATE('2019-09-03', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-03 03:15:05', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-09-17', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-17 16:16:08', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO RentInderpal(vlicense, fromDate, fromTime, toDate, toTime) VALUES (104, TO_DATE('2019-09-04', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-04 04:15:05', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-09-18', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-18 15:16:04', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO RentInderpal(vlicense, fromDate, fromTime, toDate, toTime) VALUES (105, TO_DATE('2019-09-05', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-05 05:15:05', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-09-19', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-19  14:16:05', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO RentInderpal(vlicense, fromDate, fromTime, toDate, toTime) VALUES (106, TO_DATE('2019-09-06', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-06 06:15:05', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-09-20', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-20 16:16:06', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO RentInderpal(vlicense, fromDate, fromTime, toDate, toTime) VALUES (107, TO_DATE('2019-09-07', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-07 07:15:05', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-09-21', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-21 17:16:07', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO RentInderpal(vlicense, fromDate, fromTime, toDate, toTime) VALUES (108, TO_DATE('2019-09-08', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-08 08:15:05', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-09-22', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-22 18:16:03', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO RentInderpal(vlicense, fromDate, fromTime, toDate, toTime) VALUES (109, TO_DATE('2019-09-09', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-09 11:15:05', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-09-23', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-23 11:16:02', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO RentInderpal(vlicense, fromDate, fromTime, toDate, toTime) VALUES (110, TO_DATE('2019-09-10', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-10 12:15:05', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-09-25', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-24 12:16:01', 'YYYY-MM-DD HH24:MI:SS'));



CREATE TABLE Return_ (rid int  NOT NULL, rdate DATE, rtime TIMESTAMP, odometer int, fulltank char(30), valueit float(10),PRIMARY KEY (rid), FOREIGN KEY(rid) REFERENCES Rent ON DELETE CASCADE);
Insert into Vehicle(vlicense, make, model, vyear, color, odometer, vstatus, vtname, vlocation, city) values(101,'Honda', 'Accord',2010,'White', 1000, 'for_rent', 'StandardHybrid', 'Alberta Street', 'Delta');
Insert into Vehicle(vlicense, make, model, vyear, color, odometer, vstatus, vtname, vlocation, city) values(102,'Honda', 'Passport',2011,'Black',2000, 'for_sale', 'SUVGasoline', 'Burrad Street', 'Vancouver');
Insert into Vehicle(vlicense, make, model, vyear, color, odometer, vstatus, vtname, vlocation, city)  values(103,'Honda', 'Civic',2015,'Red', 3000, 'for_rent', 'CompactElectric', 'Raw Street', 'Vancouver');
Insert into Vehicle(vlicense, make, model, vyear, color, odometer, vstatus, vtname, vlocation, city)  values(104,'Honda', 'Fit',2014,'Grey', 4000, 'for_rent', 'EconomyGasoline', 'Arts Road', 'Langley');
Insert into Vehicle(vlicense, make, model, vyear, color, odometer, vstatus, vtname, vlocation, city)  values(105,'Honda', 'Civic',2019,'Black', 1000, 'for_sale', 'EconomyHybrid', 'Shine Street', 'Langley' );
Insert into Vehicle(vlicense, make, model, vyear, color, odometer, vstatus, vtname, vlocation, city)  values(106,'Honda', 'Ridgeline',2012,'Red', 2000, 'for_rent', 'TruckGasoline', 'Burrad Street', 'Vancouver');
Insert into Vehicle(vlicense, make, model, vyear, color, odometer, vstatus, vtname, vlocation, city)  values(107,'Honda', 'Pilot',2010,'White', 4000, 'for_rent', 'FullsizeElectric', 'Scott Road', 'Surrey');
Insert into Vehicle(vlicense, make, model, vyear, color, odometer, vstatus, vtname, vlocation, city)  values(108,'Honda', 'Insight',2015,'Black', 4000, 'for_rent', 'FullsizeGasoline', 'Burrad Street', 'Vancouver');
Insert into Vehicle(vlicense, make, model, vyear, color, odometer, vstatus, vtname, vlocation, city)  values(109,'Honda', 'Jazz',2016,'Red', 6000, 'for_rent', 'StandardGasoline', 'Alberta Street', 'Delta');
Insert into Vehicle(vlicense, make, model, vyear, color, odometer, vstatus, vtname, vlocation, city)  values(110,'Honda', 'CR-V',2017,'White', 5000, 'for_rent', 'StandardElectric','Scott Road', 'Surrey');
Insert into Vehicle(vlicense, make, model, vyear, color, odometer, vstatus, vtname, vlocation, city)  values(111,'Toyota', 'Camry',2018,'Black', 7000, 'for_rent', 'Mid-sizeGasoline', 'Shine Street', 'Langley');
Insert into Vehicle(vlicense, make, model, vyear, color, odometer, vstatus, vtname, vlocation, city)  values(112,'Toyota', 'Camry',2012,'Grey', 8000, 'for_rent', 'Mid-sizeHybrid', 'Shine Street', 'Langley');
Insert into Vehicle(vlicense, make, model, vyear, color, odometer, vstatus, vtname, vlocation, city)  values(113,'Toyota', 'Prius',2014,'Red', 4000, 'for_rent', 'Mid-sizeGasoline', 'Alberta Street', 'Delta');
Insert into Vehicle(vlicense, make, model, vyear, color, odometer, vstatus, vtname, vlocation, city)  values(114,'Toyota', 'Mirai',2016,'White', 1000, 'for_sale', 'Mid-sizeGasoline', 'Burrad Street', 'Vancouver');
Insert into Vehicle(vlicense, make, model, vyear, color, odometer, vstatus, vtname, vlocation, city)  values(115,'Toyota', 'Tacoma',2017,'Red', 2000, 'for_rent', 'TruckGasoline', 'Shine Street', 'Langley');
Insert into Vehicle(vlicense, make, model, vyear, color, odometer, vstatus, vtname, vlocation, city)  values(116,'Toyota', 'Tundra',2017,'Black', 9000, 'for_rent', 'TruckHybrid', 'Raw Street', 'Vancouver');
Insert into Vehicle(vlicense, make, model, vyear, color, odometer, vstatus, vtname, vlocation, city)  values(117,'Toyota', 'Highlander',2018,'Grey', 4000, 'for_rent', 'SUVGasoline', 'Mia Street', 'Langley');
Insert into Vehicle(vlicense, make, model, vyear, color, odometer, vstatus, vtname, vlocation, city)  values(118,'Toyota', 'Land Cruiser',2019,'White', 5000, 'for_rent', 'SUVHybrid', 'Barnet Road', 'Delta');
Insert into Vehicle(vlicense, make, model, vyear, color, odometer, vstatus, vtname, vlocation, city)  values(119,'Toyota', 'Avalon',2012,'Red', 3000, 'for_rent', 'FullsizeHybrid', 'Raw Street', 'Vancouver');
Insert into Vehicle(vlicense, make, model, vyear, color, odometer, vstatus, vtname, vlocation, city)  values(120,'Toyota', 'Yaris',2013,'Black', 8000, 'for_rent', 'CompactGasoline', 'Albrey Street', 'Burnaby');
Insert into Customer(dlicense, cellphone, cname, caddress) values('VT345', 9854645767,'Aaarti', '#200 Raw Street, Vancouver');
Insert into Customer(dlicense, cellphone, cname, caddress) values('VT346', 9854645768,'Jason', '#201 Alberta Street, Delta' );
Insert into Customer(dlicense, cellphone, cname, caddress) values('VT347',9854645769,'Barti', '#202 Burrad Street, Vancouver');
Insert into Customer(dlicense, cellphone, cname, caddress) values('VT348', 9854645770,'Frida', '#203 Arts Road, Langley');
Insert into Customer(dlicense, cellphone, cname, caddress) values('VT349',9854645771,'Enni', '#204 Shine Street Langley');
Insert into Customer(dlicense, cellphone, cname, caddress) values('VT350', 9854645772,'Karan', '#205 Scott Road,Surrey');
Insert into Customer(dlicense, cellphone, cname, caddress) values('VT351', 9854645773,'Kareena', '#206 Alberta Street, Delta');
Insert into Customer(dlicense, cellphone, cname, caddress) values('VT352', 9854645774,'Anushka', '#207 Raw Street, Vancouver');
Insert into Customer(dlicense, cellphone, cname, caddress) values('VT353', 9854645775,'Shahid', '#208 Shine Street, Langley');
Insert into Customer(dlicense, cellphone, cname, caddress) values('VT354', 9854645776,'Hritik', '#209 Raw Street, Vancouver');
Insert into Customer(dlicense, cellphone, cname, caddress) values('VT355', 9854645777,'Peter', '#210 Mia Street, Langley');
Insert into Customer(dlicense, cellphone, cname, caddress) values('VT356', 9854645778,'Nick', '#211 Barnet Road, Delta');
Insert into Customer(dlicense, cellphone, cname, caddress) values('VT357', 9854645779,'Avin', '#212 Albrey Street Burnaby');
Insert into Customer(dlicense, cellphone, cname, caddress) values('VT358', 9854645780,'Kelly', '#213 Arts Road, Langley');
Insert into Customer(dlicense, cellphone, cname, caddress) values('VT359', 9854645781,'Katson', '#214 Barnet Road, Delta');

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


INSERT INTO Rent(rid, vlicense, dlicense, fromDate, fromTime, toDate, toTime, odometer, cardName, cardNo, expDate, confNo) VALUES (2000, 2009, 'VT345', TO_DATE('2019-09-01', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-01 01:15:05', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-09-05', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-05 11:16:10', 'YYYY-MM-DD HH24:MI:SS'),4000, 'VISA', 11111, TO_DATE('2021-10-31', 'YYYY-MM-DD'), 1000);
INSERT INTO Rent(rid, vlicense, dlicense, fromDate, fromTime, toDate, toTime, odometer, cardName, cardNo, expDate, confNo) VALUES (2001, 2007, 'VT346', TO_DATE('2019-09-01', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-04 02:15:05', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-09-10', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-03 23:16:09', 'YYYY-MM-DD HH24:MI:SS'),1000, 'VISA', 11112, TO_DATE('2021-10-20', 'YYYY-MM-DD'), 1001);
INSERT INTO Rent(rid, vlicense, dlicense, fromDate, fromTime, toDate, toTime, odometer, cardName, cardNo, expDate, confNo) VALUES (2002, 103, 'VT347', TO_DATE('2019-09-01', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-01 03:15:05', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-09-04', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-04 16:16:08', 'YYYY-MM-DD HH24:MI:SS'),4000, 'VISA', 11113, TO_DATE('2021-10-21', 'YYYY-MM-DD'), 1002);
INSERT INTO Rent(rid, vlicense, dlicense, fromDate, fromTime, toDate, toTime, odometer, cardName, cardNo, expDate, confNo) VALUES (2003, 104, 'VT348', TO_DATE('2019-09-01', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-01 04:15:05', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-09-05', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-05 15:16:04', 'YYYY-MM-DD HH24:MI:SS'),3000, 'VISA', 11114, TO_DATE('2021-10-22', 'YYYY-MM-DD'), 1003);
INSERT INTO Rent(rid, vlicense, dlicense, fromDate, fromTime, toDate, toTime, odometer, cardName, cardNo, expDate, confNo) VALUES (2004, 105, 'VT349', TO_DATE('2019-09-02', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-1 05:15:05', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-09-07', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-07  14:16:05', 'YYYY-MM-DD HH24:MI:SS'),2000, 'VISA', 11115, TO_DATE('2021-10-23', 'YYYY-MM-DD'), 1004);
INSERT INTO Rent(rid, vlicense, dlicense, fromDate, fromTime, toDate, toTime, odometer, cardName, cardNo, expDate, confNo) VALUES (2005, 106, 'VT350', TO_DATE('2019-09-02', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-02 06:15:05', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-09-08', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-08 16:16:06', 'YYYY-MM-DD HH24:MI:SS'),4000, 'VISA', 11116, TO_DATE('2021-10-24', 'YYYY-MM-DD'), 1005);
INSERT INTO Rent(rid, vlicense, dlicense, fromDate, fromTime, toDate, toTime, odometer, cardName, cardNo, expDate, confNo) VALUES (2006, 107, 'VT351', TO_DATE('2019-09-02', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-02 07:15:05', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-09-09', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-09 17:16:07', 'YYYY-MM-DD HH24:MI:SS'),4000, 'VISA', 11117, TO_DATE('2021-10-25', 'YYYY-MM-DD'), 1006);
INSERT INTO Rent(rid, vlicense, dlicense, fromDate, fromTime, toDate, toTime, odometer, cardName, cardNo, expDate, confNo) VALUES (2007, 108, 'VT352', TO_DATE('2019-09-03', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-03 08:15:05', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-09-11', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-11 18:16:03', 'YYYY-MM-DD HH24:MI:SS'),6000, 'VISA', 11118, TO_DATE('2021-10-26', 'YYYY-MM-DD'), 1007);
INSERT INTO Rent(rid, vlicense, dlicense, fromDate, fromTime, toDate, toTime, odometer, cardName, cardNo, expDate, confNo) VALUES (2008, 109, 'VT353', TO_DATE('2019-09-04', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-04 11:15:05', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-09-15', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-15 11:16:02', 'YYYY-MM-DD HH24:MI:SS'),4000, 'VISA', 11119, TO_DATE('2021-10-27', 'YYYY-MM-DD'), 1010);
INSERT INTO Rent(rid, vlicense, dlicense, fromDate, fromTime, toDate, toTime, odometer, cardName, cardNo, expDate, confNo) VALUES (2009, 110, 'VT354', TO_DATE('2019-09-04', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-04 12:15:05', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-09-16', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-09-16 12:16:01', 'YYYY-MM-DD HH24:MI:SS'),9000, 'VISA', 11120, TO_DATE('2021-10-28', 'YYYY-MM-DD'), 1011);


INSERT INTO Rent1(rid, vlicense, dlicense, fromDate, fromTime, toDate, toTime, odometer, cardName, cardNo, expDate, confNo) VALUES (1, 2003, 'VT351', TO_DATE('2019-09-01', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-11-20 01:15:05', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-11-25', 'YYYY-MM-DD'), TO_TIMESTAMP('2019-11-25 01:15:05', 'YYYY-MM-DD HH24:MI:SS'),4000, 'VISA', 11111, TO_DATE('2019-11-25', 'YYYY-MM-DD'), 1000);
