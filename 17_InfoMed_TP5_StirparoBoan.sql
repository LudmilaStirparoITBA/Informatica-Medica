SELECT m.nombre AS medicamento, COUNT(r.id_receta) AS cantidad_recetas,
med.nombre AS nombre_medico, p.nombre AS nombre_paciente
FROM recetas r
INNER JOIN medicos med ON r.id_medico = med.id_medico
INNER JOIN pacientes p ON r.id_paciente = p.id_paciente
INNER JOIN medicamentos m ON r.id_medicamento = m.id_medicamento
GROUP BY m.nombre, med.nombre, p.nombre
ORDER BY m.nombre, med.nombre, p.nombre DESC;