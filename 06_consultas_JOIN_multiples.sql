-- Ejercicio 10 – JOIN múltiple con historial 
-- Consulta que muestre todas las entradas del historial clínico con: 
--   Nombre y especie de la mascota  
--   Nombre completo del dueño  
--   Nombre completo del veterinario  
--   Fecha de registro  
--   Descripción  
-- Ordenados por fecha de registro descendente (DESC).
SELECT
    m.nombre AS mascota,
    m.especie,
    CONCAT (d.nombre, " ", d.apellido) AS dueno,
    CONCAT (v.nombre, " ", v.apellido) AS doctor,
    h.fecha_registro,
    h.descripcion AS consulta
FROM
    historial_clinico h
    JOIN mascotas m ON h.id_mascota = m.id
    JOIN duenos d ON m.id = d.id
    JOIN veterinarios v ON h.id_veterinario = v.id;