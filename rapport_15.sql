SELECT LPAD(UPPER(e.last_name)||' '||e.first_name,LENGTH(e.last_name||' '||e.first_name)+(LEVEL)*3,'+') "NOM Prenom",
NVL(r.cr, 0) "Nombre de reservations"
FROM t_employee e
LEFT JOIN (SELECT employee_id, COUNT(reservation_id) cr
			FROM t_reservation
			GROUP BY employee_id) r
	ON e.employee_id = r.employee_id
START WITH e.manager_id = 1
CONNECT BY PRIOR e.employee_id = e.manager_id
ORDER BY LEVEL
/
