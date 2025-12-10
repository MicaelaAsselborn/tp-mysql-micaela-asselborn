-- Ejercicio 9 – JOIN simple 
-- Consulta que muestre: 
--  Nombre de la mascota  
--  Especie  
--  Nombre completo del dueño (nombre + apellido)
SELECT
    m.nombre AS mascota,
    m.especie,
    CONCAT (d.nombre, " ", d.apellido) AS dueno
FROM
    mascotas m
    JOIN duenos d ON m.id_dueno = d.id;