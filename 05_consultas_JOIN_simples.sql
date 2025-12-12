-- Ejercicio 9 – JOIN simple 
-- Consulta que muestre: 
--  Nombre de la mascota  
--  Especie  
--  Nombre completo del dueño (nombre + apellido)
SELECT
    m.nombre AS mascota, -- Muestra el nombre de la mascota como "mascota"
    m.especie, -- Muestra la especie
    CONCAT (d.nombre, " ", d.apellido) AS dueno -- Muestra el nombre completo del dueño como "dueno"
FROM
    mascotas m JOIN duenos d ON m.id_dueno = d.id; -- Une los datos de las tablas mascotas y duenos siempre y cuando coincidan los id del dueño