-- view the # of available vehicles for specific car type, location, and time interval
SELECT vid - confNo 
FROM (SELECT COUNT(*) vid FROM Vehicle WHERE vtname = 'EconomyGasoline' AND vlocation = 'Burrad Street' AND city = 'Vancouver'), 
(SELECT COUNT(*) confNo FROM Reservation WHERE vtname = 'EconomyGasoline' AND vlocation = 'Burrad Street' AND city = 'Vancouver' AND ((TO_TIMESTAMP('2019-11-16 17:25:16', 'YYYY-MM-DD HH24:MI:SS') > fromTime AND TO_TIMESTAMP('2019-11-16 17:25:16', 'YYYY-MM-DD HH24:MI:SS') < toTime) OR (TO_TIMESTAMP('2019-11-24 17:25:16', 'YYYY-MM-DD HH24:MI:SS') > fromTime AND TO_TIMESTAMP('2019-11-24 17:25:16', 'YYYY-MM-DD HH24:MI:SS') < toTime)));

-- the details of vehicles are shown when the user clicks on the number of available vehicles
-- creates temporaly view that has all the vid from Vehicles minus vid in Rent (if the vid is in Rent table, it means the car is out for rental)
CREATE VIEW tmpvid AS (SELECT vid FROM Vehicle MINUS (SELECT vid FROM Rent));
SELECT v.vid, v.vtname, v.vlocation, v.city, v.make, v.model, v.vyear, v.color FROM Vehicle v, tmpvid t WHERE v.vtname = 'EconomyGasoline' AND v.vlocation = 'Burrad Street' AND v.city = 'Vancouver' AND v.vid = t.vid;

-- showing the reservation detail after making one
SELECT confNo, vtname, fromTime, toTime, vlocation, city 
FROM Reservation 
WHERE confNo = 1001;

-- renting a vehicle - printing out the receipt
SELECT r.rid, v.vtname, v.vlocation, r.fromTime, r.toTime
FROM Rent r, Reservation s, Vehicle v
WHERE r.confNo = 1001 AND r.confNo = s.confNo AND r.vid = v.vid;

-- returning a vehicle - printing out the receipt 
-- how do we show how the total was calculated?
SELECT r.confNo, n.rdate, n.rtime, n.valueit
FROM Return_ n, Rent r
WHERE n.rid = 10001 AND n.rid = r.rid;

-- daily rental report for the entire company: shows each branch and each vehicle type
SELECT r.fromDate AS "DATE",
       v.vlocation AS "LOCATION", 
       SUM (COUNT (v.vid)) OVER (PARTITION BY v.vlocation ORDER BY v.vlocation ASC) AS "TOTAL RENTALS AT BRANCH", 
       v.vtname AS "VEHICLE TYPE", 
       SUM (COUNT (v.vid)) OVER (PARTITION BY v.vtname) AS "NUMBER RENTED OUT"
FROM Vehicle v, Rent r
WHERE r.vid = V.vid
GROUP BY v.vlocation, v.vtname, r.fromDate
HAVING r.fromDate = TO_TIMESTAMP('2019-10-14', 'YYYY-MM-DD') 
ORDER BY r.fromDate ASC, v.vlocation ASC;

-- daily rental report for the specific branch
SELECT r.fromDate AS "DATE",
       v.vlocation AS "LOCATION", 
       SUM (COUNT (v.vid)) OVER (PARTITION BY v.vlocation ORDER BY v.vlocation ASC) AS "TOTAL RENTALS AT BRANCH", 
       v.vtname AS "VEHICLE TYPE", 
       SUM (COUNT (v.vid)) OVER (PARTITION BY v.vtname) AS "NUMBER RENTED OUT"
FROM Vehicle v, Rent r
WHERE v.vlocation = 'Mia Street' AND r.vid = V.vid
GROUP BY v.vlocation, v.vtname, r.fromDate
HAVING r.fromDate = TO_TIMESTAMP('2019-10-14', 'YYYY-MM-DD') 
ORDER BY r.fromDate ASC, v.vlocation ASC;

-- daily return report for the entire company
SELECT t.rDate AS "Return DATE",
       v.vlocation AS "LOCATION", 
       SUM (COUNT (v.vid)) OVER (PARTITION BY v.vlocation ORDER BY v.vlocation ASC) AS "TOTAL RETURNED AT BRANCH", 
       v.vtname AS "VEHICLE TYPE", 
       SUM (COUNT (DISTINCT v.vid)) OVER (PARTITION BY v.vtname) AS "NUMBER RETURNED",
       SUM (t.valueit) AS "TOTAL REVENUE",
       SUM (SUM (t.valueit)) OVER (PARTITION BY v.vlocation) AS "TOTAL REVENUE AT BRANCH"
FROM Vehicle v, Rent r, Return_ t
WHERE t.rid = r.rid AND r.vid = V.vid
GROUP BY v.vlocation, v.vtname, t.rDate
HAVING t.rDate = TO_TIMESTAMP('2019-10-18', 'YYYY-MM-DD') 
ORDER BY t.rDate ASC, v.vlocation ASC;

-- daily return report for the specific branch
SELECT t.rDate AS "Return DATE",
       v.vlocation AS "LOCATION", 
       SUM (COUNT (v.vid)) OVER (PARTITION BY v.vlocation ORDER BY v.vlocation ASC) AS "TOTAL RETURNED AT BRANCH", 
       v.vtname AS "VEHICLE TYPE", 
       SUM (COUNT (DISTINCT v.vid)) OVER (PARTITION BY v.vtname) AS "NUMBER RETURNED",
       SUM (t.valueit) AS "TOTAL REVENUE",
       SUM (SUM (t.valueit)) OVER (PARTITION BY v.vlocation) AS "TOTAL REVENUE AT BRANCH"
FROM Vehicle v, Rent r, Return_ t
WHERE v.vlocation = 'Scott Road' AND t.rid = r.rid AND r.vid = V.vid
GROUP BY v.vlocation, v.vtname, t.rDate
HAVING t.rDate = TO_TIMESTAMP('2019-10-18', 'YYYY-MM-DD') 
ORDER BY t.rDate ASC, v.vlocation ASC;

