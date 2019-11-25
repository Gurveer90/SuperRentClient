-- TABLE
 
CREATE TABLE branch(location char(30) , city char(20), PRIMARY KEY (location,city));
CREATE TABLE VehicleType(vtname char(30), features char(30), wrate float(10), drate float(10), hrate float(10), wirate float(10), 
dirate float(10), hirate float(10), krate float(10), PRIMARY KEY (vtname));
CREATE TABLE Vehicle(vid int, vlicense int, make char(30), model char(30), year int, color char(30), odometer int, 
status char(30), vtname char(30), location char(30), city char(30), PRIMARY KEY (vid), FOREIGN KEY (location, city)
REFERENCES branch,FOREIGN KEY(vtname) REFERENCES VehicleType);
CREATE TABLE ForSale (vid int, vlicense int, make char(30), model char(30), year int, color char(30), odometer int, 
status char(30), vtname char(30), location char(30), city char(30), PRIMARY KEY (vid), FOREIGN KEY (vid) REFERENCES Vehicle, FOREIGN KEY (location, city)
REFERENCES branch,FOREIGN KEY(vtname) REFERENCES VehicleType);
CREATE TABLE ForRent (vid int, vlicense int, make char(30), model char(30), year int, color char(30), odometer int, 
status char(30), vtname char(30), location char(30), city char(30), PRIMARY KEY (vid), FOREIGN KEY (vid) REFERENCES Vehicle, FOREIGN KEY (location, city)
REFERENCES branch,FOREIGN KEY(vtname) REFERENCES VehicleType);
CREATE TABLE EquipType(etname char(30), drate float(10), hrate float(10));
CREATE TABLE Equipment(eid int, etname char(30), status char(30), location char(30), city char(30), PRIMARY KEY (eid),FOREIGN KEY (etname) REFERENCES EquipType, FOREIGN KEY (location, city)
REFERENCES branch);
CREATE TABLE Is_for(etname char(30), vtname char(30), PRIMARY KEY (etname, vtname), FOREIGN KEY (etname) REFERENCES EquipType, FOREIGN KEY(vtname) REFERENCES VehicleType); 
CREATE TABLE Customer (cellphone char(30), name char(30), address char(30), dlicense char(30), PRIMARY KEY (cellphone)); 
CREATE TABLE ClubMember (cellphone char(30), points int, fees float(10),PRIMARY KEY (cellphone), FOREIGN KEY (cellphone) REFERENCES Customer); 
CREATE TABLE Reservation (confNo int, vtname char(30), cellphone char(30), fromDate date, fromTime time, toDate date, toTime time, 
FOREIGN KEY(vtname) REFERENCES VehicleType, FOREIGN KEY(cellphone) REFERENCES Customer, FOREIGN KEY(fromDate, fromTime, toDate, toTime) REFERENCES TimePeriod); 
CREATE TABLE Reserve_Includes (confNo int, etname char(30),PRIMARY KEY (confNo,etname), FOREIGN KEY(confNo) REFERENCES Reservation, 
FOREIGN KEY(etname) REFERENCES EquipType); 
CREATE TABLE Rent(rid int, vid int, cellphone char(30), fromDate date, fromTime time, toDate date, toTime time, odometer int, cardName char(30), cardNo int,
ExpDate date, confNo int, PRIMARY KEY (rid), FOREIGN KEY(vid) REFERENCES ForRent, FOREIGN KEY(cellphone) REFERENCES Customer, 
FOREIGN KEY(fromDate, fromTime, toDate, toTime) REFERENCES TimePeriod, FOREIGN KEY(confNo) REFERENCES Reservation);
CREATE TABLE Rent_Includes (rid int, eid int, PRIMARY KEY (rid,eid), FOREIGN KEY(rid) REFERENCES Rent, FOREIGN KEY(eid) REFERENCES Equipment);
CREATE TABLE Return_ (rid int, rdate date, rtime time, odometer int, fulltank char(30), valueit float(10),PRIMARY KEY (rid), FOREIGN KEY(rid) REFERENCES Rent);
CREATE TABLE TimePeriod(fromDate date, fromTime time, toDate date, toTime time, PRIMARY KEY (fromDate,fromTime,toDate,toTime)); 

CREATE TABLE VehicleType(vtname char(30), features char(30), wrate float(10), drate float(10), hrate float(10), wirate float(10), dirate float(10), hirate float(10), krate float(10), PRIMARY KEY (vtname));

CREATE TABLE Vehicle(vid int, vlicense int, make char(30), model char(30), vyear int, color char(30), odometer int, status char(30), vtname char(30), location char(30), city char(30), PRIMARY KEY (vid), FOREIGN KEY(vtname) REFERENCES VehicleType);

CREATE TABLE Customer (cellphone char(30), name char(30), address char(30), dlicense char(30), PRIMARY KEY (cellphone));

CREATE TABLE Reservation (confNo int, vtname char(30), cellphone char(30), fromDate DATE, fromTime TIMESTAMP, toDate DATE, toTime TIMESTAMP, PRIMARY KEY(confNo), FOREIGN KEY(vtname) REFERENCES VehicleType, FOREIGN KEY(cellphone) REFERENCES Customer);

CREATE TABLE Rent(rid int, vid int, cellphone char(30), fromDate DATE, fromTime TIMESTAMP, toDate DATE, toTime TIMESTAMP, odometer int,cardName char(30), cardNo int,ExpDate DATE, confNo int, PRIMARY KEY (rid), FOREIGN KEY(cellphone) REFERENCES Customer, FOREIGN KEY(confNo) REFERENCES Reservation);

CREATE TABLE Return_ (rid int, rdate DATE, rtime TIMESTAMP, odometer int, fulltank char(30), valueit float(10),PRIMARY KEY (rid), FOREIGN KEY(rid) REFERENCES Rent);



