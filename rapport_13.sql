SELECT ticket_id "Numéro du billet", CONCAT(CONCAT(UPPER(last_name), ' '), first_name) "Client de moins de 25 ans", class_type "Numéro de classe", 
tr.train_id || ' ' || s1.city || ' (' || departure_time || ' ' || TO_CHAR(departure_time, 'HH24:MI') || ') - ' || s2.city || ' (' || arrival_time || ' ' || TO_CHAR(arrival_time, 'HH24:MI') || ')' "Trajet"
FROM t_wagon_train wt
JOIN t_train tr
	ON wt.train_id = tr.train_id
JOIN t_station s1
	ON tr.departure_station_id = s1.station_id
JOIN t_station s2
	ON tr.arrival_station_id = s2.station_id
JOIN t_wagon w
	ON wt.wagon_id = w.wagon_id
JOIN t_ticket ti
	ON wt.wag_tr_id = ti.wag_tr_id
JOIN t_customer c
	ON ti.customer_id = c.customer_id
JOIN t_reservation r
	ON ti.reservation_id = r.reservation_id
WHERE class_type = 1
	AND MONTHS_BETWEEN(SYSDATE,birth_date)/12 < 25
	AND departure_time BETWEEN '20/10/20' AND '26/10/20'
	AND departure_time - creation_date < 20
	AND r.price IS NOT NULL
ORDER BY r.creation_date
/
