-- Ejercicio 1 – Crear Base de Datos
CREATE DATABASE veterinaria_patitas_felices;

-- Selecciona la base de datos vaterinaria_patitas_felices
USE veterinaria_patitas_felices;

-- Ejercicio 2 – Crear tabla duenos
CREATE TABLE
    duenos (
        id INT PRIMARY KEY AUTO_INCREMENT,
        nombre VARCHAR(50) NOT NULL,
        apellido VARCHAR(50) NOT NULL,
        telefono VARCHAR(20) NOT NULL,
        direccion VARCHAR(100)
    );

-- Ejercicio 3 – Crear tabla mascotas
CREATE TABLE
    mascotas (
        id INT PRIMARY KEY AUTO_INCREMENT,
        nombre VARCHAR(50) NOT NULL,
        especie VARCHAR(30) NOT NULL,
        fecha_nacimiento DATE,
        id_dueno INT,
        FOREIGN KEY (id_dueno) REFERENCES duenos (id),
        INDEX idx_mascota_dueno (id_dueno) -- Se agrega index para mejorar performance
    );

-- Ejercicio 4 – Crear tabla veterinarios
CREATE TABLE
    veterinarios (
        id INT PRIMARY KEY AUTO_INCREMENT,
        nombre VARCHAR(50) NOT NULL,
        apellido VARCHAR(50) NOT NULL,
        matricula VARCHAR(20) NOT NULL UNIQUE,
        especialidad VARCHAR(50) NOT NULL
    );

-- Ejercicio 5 – Crear tabla historial_clinico
CREATE TABLE
    historial_clinico (
        id INT PRIMARY KEY AUTO_INCREMENT,
        id_mascota INT,
        id_veterinario INT,
        fecha_registro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
        descripcion VARCHAR(250) NOT NULL,
        FOREIGN KEY (id_mascota) REFERENCES mascotas (id) ON DELETE CASCADE, -- Se agrega el CASCADE para que cuando se elimine el registro de la mascota, tambien se elimine el historial clinico relacionado.
        FOREIGN KEY (id_veterinario) REFERENCES veterinarios (id),
        INDEX idx_historial_mascota (id_mascota),
        INDEX idx_historial_veterinario (id_veterinario)
    );

-- Ejercicio 6 – Insertar registros
-- Insertar: 
--  3 dueños con información completa
INSERT INTO
    duenos (nombre, apellido, telefono, direccion)
VALUES
    (
        "Francisco",
        "Salinas",
        "299-684-0349",
        "Osa Mayor 123"
    ),
    (
        "Caterine",
        "Stephens",
        "294-684-2799",
        "Pasaje de la Paz 281"
    ),
    (
        "Gaston",
        "Diaz",
        "297-655-8274",
        "Los Alerces 1215"
    );

SELECT
    *
FROM
    duenos;

--  3 mascotas, cada una asociada a un dueño  
INSERT INTO
    mascotas (nombre, especie, fecha_nacimiento, id_dueno)
VALUES
    ("Shiro", "Gato", "2017-06-06", 1),
    ("Firulais", "Perro", "2024-07-15", 2),
    ("Manchita", "Perro", "2010-05-02", 3);

SELECT
    *
FROM
    mascotas;

--  2 veterinarios con especialidades distintas 
INSERT INTO
    veterinarios (nombre, apellido, matricula, especialidad)
VALUES
    ("Victor", "Gonzales", "WH8C474", "Cirugia"),
    ("Patricia", "Martinez", "KL66PH7", "Dermatologia");

SELECT
    *
FROM
    veterinarios;

--  3 registros de historial clínico
INSERT INTO
    historial_clinico (
        id_mascota,
        id_veterinario,
        fecha_registro,
        descripcion
    )
VALUES
    (
        1,
        1,
        "2024-11-26 10:30:00",
        "Paciente produce bolas de pelos descomunalmente grandes"
    ),
    (2, 1, DEFAULT, "Paciente para castracion"),
    (
        3,
        2,
        "2023-03-02 15:45:00",
        "Paciente presenta sarpullido en el lomo"
    );

SELECT
    *
FROM
    historial_clinico;

-- Ejercicio 7 – Actualizar registros
-- Realizar las siguientes actualizaciones: 
-- 1.  Cambiar la dirección de un dueño (por ID o nombre).
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

-- Ejercicio 8 – Eliminar registros 
-- 1.  Eliminar una mascota (por ID o nombre).
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
    mascotas m
    JOIN duenos d ON m.id_dueno = d.id;

-- Une los datos de las tablas mascotas y duenos siempre y cuando coincidan los id del dueño
-- Ejercicio 10 – JOIN múltiple con historial 
-- Consulta que muestre todas las entradas del historial clínico con: 
--   Nombre y especie de la mascota  
--   Nombre completo del dueño  
--   Nombre completo del veterinario  
--   Fecha de registro  
--   Descripción  
-- Ordenados por fecha de registro descendente (DESC).
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