-- Ejercicio 8 – Eliminar registros 
-- 1.  Eliminar una mascota (por ID o nombre).
DELETE FROM mascotas
WHERE
    id = 3;

-- 2.  Verificar que se eliminen automáticamente los registros del historial clínico asociados (ON DELETE CASCADE).
SELECT
    *
FROM
    mascotas;

SELECT
    *
FROM
    historial_clinico;