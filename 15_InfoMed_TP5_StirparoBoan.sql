SELECT p.id_paciente, p.nombre, c.fecha AS ultima_consulta, c.diagnostico
FROM pacientes p
INNER JOIN consultas c ON  p.id_paciente = c.id_paciente
WHERE 
    c.fecha = (
        SELECT 
            MAX(c2.fecha)
        FROM 
            consultas c2
        WHERE 
            c2.id_paciente = c.id_paciente
    )
ORDER BY p.id_paciente;