-- Add ON UPDATE CASCADE if possible

CREATE TABLE Branch(
    vlocation varchar2(30), 
    city varchar2(20), 
    PRIMARY KEY (vlocation, city));

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

CREATE TABLE Customer (
    cellphone varchar2(30) NOT NULL, 
    cname varchar2(30), 
    caddress varchar2(30), 
    dlicense varchar2(30), 
    PRIMARY KEY (cellphone)
); 

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
CREATE TABLE Vehicle (
     
);

-- CREATE TABLE Reservation (
--     confNo integer NOT NULL, 
--     vtname varchar2(30), 
--     cellphone varchar2(30), 
--     fromDate date, 
--     fromTime timestamp, 
--     toDate date, 
--     toTime timestamp, 
--     PRIMARY KEY (confNo),
--     FOREIGN KEY (vtname) REFERENCES VehicleType ON DELETE CASCADE,
--     FOREIGN KEY (cellphone) REFERENCES Customer ON DELETE CASCADE
-- ); 

-- CREATE TABLE Reservation (
--     confNo integer NOT NULL, 
--     vtname varchar2(30), 
--     cellphone varchar2(30), 
--     fromDate date, 
--     fromTime timestamp, 
--     toDate date, 
--     toTime timestamp, 
--     vlocation varchar2(30),
--     PRIMARY KEY (confNo),
--     FOREIGN KEY (vtname) REFERENCES VehicleType ON DELETE CASCADE,
--     FOREIGN KEY (cellphone) REFERENCES Customer ON DELETE CASCADE
--     -- FOREIGN KEY (vlocation) REFERENCES Vehicle ON DELETE CASCADE
-- ); 

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

commit;
