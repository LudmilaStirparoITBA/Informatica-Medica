SELECT id_medico, COUNT (id_recetas) AS cantidad_recetas
FROM recetas
GROUP BY id_medico
ORDER BY cantidad_recetas;
