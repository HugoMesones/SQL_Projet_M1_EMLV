SELECT CONCAT(CONCAT(first_name, ' '), UPPER(last_name)) "Meilleur employé", COUNT(reservation_id) "Nombre de réservations"
FROM t_reservation r
JOIN t_employee e
ON r.employee_id = e.employee_id
GROUP BY r.employee_id, first_name, last_name
HAVING COUNT(reservation_id)=(SELECT MAX(meilleur_salarie)
								FROM (SELECT COUNT(reservation_id) meilleur_salarie
											FROM t_reservation
											GROUP BY employee_id))
/
