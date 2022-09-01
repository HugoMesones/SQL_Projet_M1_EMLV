SELECT UPPER(last_name) || ' ' || first_name "Clients sans abonnement", address "Adresse"
FROM t_customer c
WHERE c.pass_id IS NULL
ORDER BY last_name, first_name
/
