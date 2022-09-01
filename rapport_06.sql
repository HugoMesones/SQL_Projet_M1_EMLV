SELECT nb_employee "Nombre d'employés", nb_customer "Nombre de clients", pct_sub "Pourcentage d'abonnés", 
nb_train "Nombre de trains", nb_station "Nombre de gares", nb_reservation "Nombre de réservations", nb_ticket "Nombre de billets"
FROM (SELECT COUNT(employee_id) AS nb_employee
		FROM t_employee), 
(SELECT COUNT(customer_id) AS nb_customer
		FROM t_customer),
(SELECT ROUND(nb_abo*100/COUNT(customer_id),2) || '%' AS pct_sub
		FROM t_customer, 
	(SELECT COUNT(pass_id) AS nb_abo
		FROM t_customer
		WHERE ADD_MONTHS(pass_date,12) >= SYSDATE)
		GROUP BY nb_abo),
(SELECT COUNT(train_id) AS nb_train
		FROM t_train),
(SELECT COUNT(station_id) AS nb_station
		FROM t_station),
(SELECT COUNT(reservation_id) AS nb_reservation
		FROM t_reservation),
(SELECT COUNT(ticket_id) AS nb_ticket
		FROM t_ticket)
/
