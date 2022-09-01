SELECT employee_id "Numéro de l'employé", UPPER(last_name) || ' ' || first_name "Nom et prénom du salarié", 
salary+100 "Salaire augmenté"
FROM t_employee
WHERE manager_id = 1
/
