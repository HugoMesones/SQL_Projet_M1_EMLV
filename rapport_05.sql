SELECT train_id || ' ' || s1.city || ' (' || departure_time || ' ' || 
	TO_CHAR(departure_time, 'HH24:MI') || ') - ' || s2.city || ' (' || arrival_time || ' ' || 
	TO_CHAR(arrival_time, 'HH24:MI') || ')' "Numéro de train et Trajet", distance "Distance", price || '€' "Prix initial"
FROM t_train t
JOIN t_station s1
ON t.departure_station_id = s1.station_id
JOIN t_station s2
ON t.arrival_station_id = s2.station_id
ORDER BY train_id
/
