SELECT t.train_id || ' ' || s1.city || ' - ' || s2.city "Trains au départ de Paris", 
pass_name "Titre d'abonnement", ROUND(t.price-t.price*discount_pct/100,2) "Tarif en semaine", 
ROUND(t.price-t.price*discount_we_pct/100,2) "Tarif en week-end"
FROM t_train t
CROSS JOIN t_pass p
JOIN t_station s1
	ON t.departure_station_id = s1.station_id
JOIN t_station s2
	ON t.arrival_station_id = s2.station_id
WHERE s1.city = 'Paris'
ORDER BY train_id, pass_id
/
