-- Ejercicio 10 – JOIN múltiple con historial 
-- Consulta que muestre todas las entradas del historial clínico con: 
--   Nombre y especie de la mascota  
--   Nombre completo del dueño  
--   Nombre completo del veterinario  
--   Fecha de registro  
--   Descripción  
-- Ordenados por fecha de registro descendente (DESC).
-- Selecciona la base de datos vaterinaria_patitas_felices
USE veterinaria_patitas_felices;

SELECT
    m.nombre AS mascota, -- Muestra el nombre de la mascota como "mascota"
    m.especie, -- Muestra la especia
    CONCAT (d.nombre, " ", d.apellido) AS dueno, -- Muestra el nombre completo del dueño como "dueno"
    CONCAT (v.nombre, " ", v.apellido) AS doctor, -- Muestra el nombre completo del veterinario como "doctor"
    h.fecha_registro, -- Muestra la fecha de registro
    h.descripcion AS consulta -- Muestra la descripción como "consulta"
FROM
    historial_clinico h -- Crea el shortcut a la tabla historial_clinico "h"
    JOIN mascotas m ON h.id_mascota = m.id -- Une a tabla mascotas cuando el id de la mascota coincide, y crea shortcut "m"
    JOIN duenos d ON m.id_dueno = d.id -- Une a tabla duenos cuando el id del dueño coincide y crea shortcut "m"
    JOIN veterinarios v ON h.id_veterinario = v.id -- Une a tabla veterinarios cuando el id del veterinario coincide y crea shortcut "v"
ORDER BY
    -- Ordena los resultados en forma descendente según la fecha de registro
    h.fecha_registro DESC;