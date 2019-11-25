
CREATE TABLE VehicleType(
    vtname char(30),
    features char(30),
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
    dlicense char(30)  NOT NULL,
    cellphone char(30)  NOT NULL UNIQUE,
    cname char(30),
    caddress char(30),
    PRIMARY KEY (dlicense)
);

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
    PRIMARY KEY (vlicense),
    FOREIGN KEY(vtname) REFERENCES VehicleType ON DELETE CASCADE
);

CREATE TABLE Reservation (
    confNo integer,
    vtname char(30),
    dlicense char(30),
    fromDate DATE,
    fromTime TIMESTAMP,
    toDate DATE,
    toTime TIMESTAMP,
    PRIMARY KEY(confNo),
    FOREIGN KEY(vtname) REFERENCES VehicleType ON DELETE CASCADE,
    FOREIGN KEY(dlicense) REFERENCES Customer ON DELETE CASCADE
);

CREATE TABLE Rent(
    rid int  NOT NULL,
    vlicense int,
    dlicense char(30),
    fromDate DATE,
    fromTime TIMESTAMP,
    toDate DATE,
    toTime TIMESTAMP,
    odometer int,
    cardName char(30),
    cardNo int,
    ExpDate char(30),
    confNo int,
    PRIMARY KEY (rid),
    FOREIGN KEY(dlicense) REFERENCES Customer  ON DELETE CASCADE,
    FOREIGN KEY(vlicense) REFERENCES Vehicle  ON DELETE CASCADE,
    FOREIGN KEY(confNo) REFERENCES Reservation  ON DELETE CASCADE
);

 CREATE TABLE Return_(
    rid int  NOT NULL,
    rdate DATE,
    rtime TIMESTAMP,
    odometer int,
    fulltank char(30),
    valueit float(10),
    PRIMARY KEY (rid), 
    FOREIGN KEY(rid) REFERENCES Rent ON DELETE CASCADE
);

commit;
