SELECT m.nombre, COUNT(r.id_receta) AS cantidad_prescripciones
FROM recetas r
INNER JOIN medicamentos ON r.id_medicamento = m.id_medicamento
WHERE r.id_medico = 2
GROUP BY m.nombre
HAVING
	COUNT(r.id_receta) > 1;
