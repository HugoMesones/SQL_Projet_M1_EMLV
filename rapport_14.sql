SELECT t.train_id || ' ' || s1.city || ' - ' || s2.city "Numéro et nom du train", sumst.st-cntr.cr "Nombre de places disponibles", 
TO_CHAR(departure_time, 'DD/MM/YYYY') "Date de départ", distance "Distance"
FROM t_train t
JOIN (SELECT train_id, SUM(nb_seat) st
		FROM t_wagon_train wt
		JOIN t_wagon w
			ON wt.wagon_id = w.wagon_id
		GROUP BY train_id
		ORDER BY train_id) sumst
	ON t.train_id = sumst.train_id
JOIN (SELECT train_id, COUNT(reservation_id) cr
		FROM t_wagon_train wt2
		JOIN t_ticket ti
			ON wt2.wag_tr_id = ti.wag_tr_id
		GROUP BY train_id
		ORDER BY train_id) cntr
	ON t.train_id = cntr.train_id
JOIN t_station s1
	ON t.departure_station_id = s1.station_id
JOIN t_station s2
	ON t.arrival_station_id = s2.station_id
WHERE distance > 300
AND TO_CHAR(departure_time, 'DD/MM/YYYY') = '22/10/2020'
/
