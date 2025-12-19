-- Ejercicio 8 – Eliminar registros 
-- 1.  Eliminar una mascota (por ID o nombre).
-- Selecciona la base de datos vaterinaria_patitas_felices
USE veterinaria_patitas_felices;

DELETE FROM mascotas -- Elimina la entrada de la tabla mascotas cuyo id es igual a 3
WHERE
    id = 3;

-- 2.  Verificar que se eliminen automáticamente los registros del historial clínico asociados (ON DELETE CASCADE).
-- Muestra la tabla mascotas (para chequear que se elimino el registro correctamente)
SELECT
    *
FROM
    mascotas;

-- Muestra la tabla historial_clinico (para chequear que se elimino el registro correctamente)
SELECT
    *
FROM
    historial_clinico;