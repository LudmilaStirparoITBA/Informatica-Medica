SELECT ciudad, COUNT(*) AS cantidad
FROM pacientes
GROUP BY ciudad
ORDER BY cantidad DESC;

CREATE TABLE ciudades_correctas (
	variante VARCHAR(100),
	ciudad_correcta VARCHAR(100)
);

INSERT INTO ciudades_correctas (variante, ciudad_correcta) VALUES
('buenos aires', 'Buenos Aires'),
('bs as', 'Buenos Aires'),
('Buenos aires', 'Buenos Aires'),
('Bs aires', 'Buenos Aires'),
--aca iban otros que no recuerdo porque no había guardado esta query, pero eran varias opciones
('Cordoba', 'Córdoba'),
('Córdoba', 'Córdoba'),
('Mendzoa', 'Mendoza'),
('Rosario', 'Santa Fe');

UPDATE pacientes p
SET ciudad = c.ciudad_correcta 
FROM ciudades_correctas c
WHERE p.ciudad ILIKE c.variante;
