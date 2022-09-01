SELECT *
FROM (SELECT tr.train_id || ' ' || s1.city || ' - ' || s2.city "Numéro de train et Trajet", 
		COUNT(reservation_id) "Nombre de billets réservés"
		FROM t_wagon_train wt
		JOIN t_ticket ti
			ON wt.wag_tr_id = ti.wag_tr_id
		JOIN t_train tr
			ON wt.train_id = tr.train_id
		JOIN t_station s1
			ON tr.departure_station_id = s1.station_id
		JOIN t_station s2
			ON tr.arrival_station_id = s2.station_id
		GROUP BY tr.train_id, s1.city, s2.city
		ORDER BY COUNT(reservation_id) DESC)
WHERE ROWNUM <=5
/
