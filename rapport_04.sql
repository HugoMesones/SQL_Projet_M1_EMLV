SELECT UPPER(last_name) || ' ' || first_name "Client", pass_date "Date d'achat",
	CASE
		WHEN pass_date <= '14/10/19' THEN 'Périmé !'
		WHEN pass_date IS NULL THEN 'Aucun'
		ELSE p.pass_name
	END "Titre d'abonnement"
FROM t_customer c
LEFT JOIN t_pass p
ON c.pass_id = p.pass_id
ORDER BY "Client"
/
