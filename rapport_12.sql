SELECT p.pass_id "Numéro d'abonnement", p.pass_name "Titre d'abonnement", COUNT(c.pass_date) AS "Nb d'abonnements vendus"
FROM t_pass p
JOIN t_customer c
	ON p.pass_id = c.pass_id
GROUP BY p.pass_id, p.pass_name
ORDER BY "Nb d'abonnements vendus" DESC
/
