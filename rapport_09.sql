SELECT train_id || ' ' || s1.city || ' - ' || s2.city "Numéro de train et Trajet", 
ROUND(distance/((arrival_time - departure_time)*24),0) || ' km/h' AS "Vitesse Moyenne du train"
FROM t_train t
JOIN t_station s1
	ON t.departure_station_id = s1.station_id
JOIN t_station s2
	ON t.arrival_station_id = s2.station_id
ORDER BY train_id
/
