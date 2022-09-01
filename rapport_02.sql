SELECT DISTINCT(CONCAT(CONCAT(UPPER(last_name), ' '), first_name)) "Acheteurs réservistes sans billet"
FROM t_customer c
JOIN t_ticket t
ON c.customer_id = t.customer_id
JOIN t_reservation r
ON t.reservation_id = r.reservation_id
WHERE c.customer_id != buyer_id
ORDER BY "Acheteurs réservistes sans billet"
/
