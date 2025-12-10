-- Ejercicio 7 – Actualizar registros
--Realizar las siguientes actualizaciones: 
-- 1.  Cambiar la dirección de un dueño (por ID o nombre).  
UPDATE duenos
SET
    direccion = "Av. Olascoaga 225"
WHERE
    nombre = "Francisco"
    AND apellido = "Salinas";

-- 2.  Actualizar la especialidad de un veterinario (por ID o matrícula). 
UPDATE veterinarios
SET
    especialidad = "Cirujano en animales domesticos"
WHERE
    id = 1;

-- 3.  Editar la descripción de un historial clínico (por ID).
UPDATE historial_clinico
SET
    descripcion = "Paciente presenta sarpullido en el lomo, patas y cola"
WHERE
    id = 3;