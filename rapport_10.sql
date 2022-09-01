SELECT COUNT(DISTINCT(customer_id)) "Nombre de clients uniques ayant bénéficiés de la réduction Séniors - Octobre 2020"
FROM t_customer c
JOIN t_pass p
	USING(pass_id)
JOIN t_ticket ti
	USING(customer_id)
JOIN t_reservation r
	USING(reservation_id)
JOIN t_wagon_train wt
	USING(wag_tr_id)
JOIN t_train tr
	USING(train_id)
WHERE pass_id = 2
AND r.price IS NOT NULL
AND departure_time BETWEEN '01/10/20' AND LAST_DAY('01/10/20')
AND departure_time-c.pass_date < 365
/
