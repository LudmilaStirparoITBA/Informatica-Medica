SELECT m.nombre, COUNT(r.id_receta) AS cantidad_prescripciones
FROM medicamentos m
INNER JOIN recetas r ON m.id_medicamento = r.id_medicamento
GROUP BY m.nombre
HAVING
	COUNT(r.id_receta) = (
		SELECT
			MAX(cantidad)
		FROM (
			SELECT
				COUNT(r2.id_receta) AS cantidad
			FROM 
				recetas r2
			GROUP BY
				r2.id_medicamento
		) AS subquery
	);
