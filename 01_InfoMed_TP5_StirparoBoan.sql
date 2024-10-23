CREATE INDEX idx_pacientes_ciudad ON pacientes (ciudad);
SELECT ciudad, COUNT(*) AS total_pacientes
FROM pacientes
GROUP BY ciudad;
