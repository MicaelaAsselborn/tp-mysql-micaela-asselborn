-- Ejercicio 7 – Actualizar registros
-- Realizar las siguientes actualizaciones: 
-- 1.  Cambiar la dirección de un dueño (por ID o nombre).
-- Selecciona la base de datos vaterinaria_patitas_felices
USE veterinaria_patitas_felices;

-- Actualiza los datos en la tabla duenos, en el campo dirección, donde nombre + apellido es igual a Francisco Salinas
UPDATE duenos
SET
    direccion = "Av. Olascoaga 225"
WHERE
    nombre = "Francisco"
    AND apellido = "Salinas";

-- 2.  Actualizar la especialidad de un veterinario (por ID o matrícula). 
-- Actualiza los datos en la tabla veterinarios, en el campo especialidad, donde id = 1
UPDATE veterinarios
SET
    especialidad = "Cirujano en animales domesticos"
WHERE
    id = 1;

-- 3.  Editar la descripción de un historial clínico (por ID).
-- Actualiza los datos en la tabla historial_clinico, en el campo descripcion, donde id = 3
UPDATE historial_clinico
SET
    descripcion = "Paciente presenta sarpullido en el lomo, patas y cola"
WHERE
    id = 3;