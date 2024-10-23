SELECT p.nombre AS nombre_paciente, m.nombre AS nombre_medico,
COUNT(c.id_consulta) AS cantidad_consultas
FROM consultas c
INNER JOIN medicos m ON c.id_medico = m.id_medico
INNER JOIN pacientes p ON c.id_paciente = p.id_paciente
GROUP BY m.nombre, p.nombre
ORDER BY m.nombre, p.nombre;