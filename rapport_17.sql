UPDATE t_reservation
SET buy_method = INITCAP('&type_de_paiement'),
   price = (SELECT SUM((tr.price)+
                           ((tr.price*NVL(w.class_pct, 0))/100)-
                           (((tr.price+((tr.price*NVL(w.class_pct, 0))/100))*NVL(CASE
          WHEN TO_CHAR(tr.departure_time, 'D') BETWEEN 1 AND 5 THEN discount_pct
          ELSE discount_we_pct
          END, 0))/100))
                   FROM t_reservation r
                   JOIN t_ticket t
                   ON (r.reservation_id = t.reservation_id)
                   JOIN t_customer c
                   ON (t.customer_id = c.customer_id)
                   LEFT JOIN t_pass p
                   ON (c.pass_id = p.pass_id)
                   JOIN t_wagon_train wt
                   ON (t.wag_tr_id = wt.wag_tr_id)
                   JOIN t_train tr
                   ON (wt.train_id = tr.train_id)
                   JOIN t_wagon w
                   ON (wt.wagon_id = w.wagon_id)
       WHERE r.reservation_id = &&num_de_reservation
                   GROUP BY r.reservation_id)
WHERE reservation_id = &num_de_reservation
/
