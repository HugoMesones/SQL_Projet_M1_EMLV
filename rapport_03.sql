SELECT reservation_id "Numéro de réservation", creation_date "Date de la 1ère réservation", 
	UPPER(e.last_name) || ' ' || e.first_name AS "Employe", UPPER(c.last_name) || ' ' || c.first_name "Client"
FROM t_reservation r
JOIN t_employee e
ON r.employee_id = e.employee_id
JOIN t_customer c
ON r.buyer_id = c.customer_id
WHERE creation_date = (SELECT MIN(creation_date)
						FROM t_reservation)
/
