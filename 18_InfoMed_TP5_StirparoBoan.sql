SELECT med.nombre AS nombre_medico, COUNT(DISTINCT c.id_paciente) AS total_pacientes
FROM consultas c
INNER JOIN medicos med ON c.id_medico = med.id_medico
GROUP BY med.nombre
ORDER BY total_pacientes DESC;
