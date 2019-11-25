
SELECT COUNT(vlicense) FROM Vehicle WHERE vtname = 'EconomyGasoline' AND vlocation = 'Burrad Street' AND city = 'Vancouver'
AND vlicense NOT IN (SELECT vlicense FROM Rent WHERE 
 fromDate <= '2019-11-16' AND toDate >= '2019-11-16' 
 AND fromDate <= '2019-11-16' AND toDate >= '2019-11-16'
AND to_char(fromTime,'HH24:MI:SS') <= '03:15:03' AND to_char(toTime,'HH24:MI:SS') >= '03:15:03'
AND to_char(fromTime,'HH24:MI:SS') <= '03:15:03' AND to_char(toTime,'HH24:MI:SS') >= '03:15:03' )

(SELECT COUNT(*) confNo FROM Reservation WHERE vtname = 'EconomyGasoline' AND vlocation = 'Burrad Street' AND city = 'Vancouver' 
AND ((TO_TIMESTAMP('2019-11-16 17:25:16', 'YYYY-MM-DD HH24:MI:SS') > fromTime 
AND TO_TIMESTAMP('2019-11-16 17:25:16', 'YYYY-MM-DD HH24:MI:SS') < toTime) 
OR (TO_TIMESTAMP('2019-11-24 17:25:16', 'YYYY-MM-DD HH24:MI:SS') > fromTime 
AND TO_TIMESTAMP('2019-11-24 17:25:16', 'YYYY-MM-DD HH24:MI:SS') < toTime)));