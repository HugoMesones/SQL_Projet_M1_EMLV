SELECT t.reservation_id "N° de réservation", r.price "Prix de la réservation", c.customer_id "N° client", UPPER(c.last_name) || ' ' || c.first_name "Client", t.ticket_id "N° ticket", ROUND((tr.price) + ((tr.price*NVL(w.class_pct, 0))/100) -  (((tr.price+((tr.price*NVL(w.class_pct, 0))/100))*NVL(CASE
                                    WHEN TO_CHAR(tr.departure_time, 'D') BETWEEN 1 AND 5 THEN discount_pct
                                    ELSE discount_we_pct
                                    END, 0))/100), 2) "Prix ticket", p.pass_name "Abonnement", r.buy_method "Moyen de paiement", d.city || ' - ' || a.city "Trajet", w.class_type "Classe", TO_CHAR(tr.departure_time, 'Day') "Jour"
FROM t_reservation r
JOIN t_ticket t
ON r.reservation_id = t.reservation_id
JOIN t_customer c
ON t.customer_id = c.customer_id
LEFT JOIN t_pass p
ON c.pass_id = p.pass_id
JOIN t_wagon_train wt
ON t.wag_tr_id = wt.wag_tr_id
JOIN t_wagon w
ON wt.wagon_id = w.wagon_id
JOIN t_train tr
ON wt.train_id = tr.train_id
JOIN t_station d
ON tr.departure_station_id = d.station_id
JOIN t_station a
ON tr.arrival_station_id = a.station_id
AND r.reservation_id = &&num_de_reservation
ORDER BY r.reservation_id
/
