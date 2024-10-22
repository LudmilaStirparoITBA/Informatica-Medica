ALTER TABLE pacientes ADD COLUMN edad INT;
UPDATE pacientes
SET edad = EXTRACT(YEAR FROM AGE(CURRENT_DATE, fecha_nacimiento));
--Crear la funcion para actualizar la edad
CREATE OR REPLACE FUNCTION actualizar_edad()
RETURNS TRIGGER AS $$
BEGIN
	NEW.edad := EXTRACT(YEAR FROM AGE(CURRENT_DATE, NEW.fecha_nacimiento));
	RETURN NEW;
END; 
$$ LANGUAGE plpgsql;

--Crear el trigger que llamara a la funcion antes de insertar o actualizar
CREATE TRIGGER trigger_actualizar_edad
BEFORE INSERT OR UPDATE ON pacientes
FOR EACH ROW EXECUTE FUNCTION actualizar_edad();