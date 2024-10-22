SELECT p.nombre, c.fecha, c.diagnostico
FROM consultas c
INNER JOIN pacientes p ON ic.id_paciente = p.id_paciente
WHERE c.fecha >= '2024-08-01' AND c.fecha < '2024-09-01'
