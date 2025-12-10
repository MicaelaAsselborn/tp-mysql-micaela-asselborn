-- Ejercicio 1 – Crear Base de Datos
CREATE DATABASE patitas_felices;

USE patitas_felices;

-- Ejercicio 2 – Crear tabla duenos
CREATE TABLE
    duenos (
        id INT PRIMARY KEY AUTO_INCREMENT,
        nombre VARCHAR(50) NOT NULL,
        apellido VARCHAR(50) NOT NULL,
        telefono VARCHAR(20),
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
        FOREIGN KEY (id_dueno) REFERENCES duenos (id)
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
        FOREIGN KEY (id_mascota) REFERENCES mascotas (id),
        id_veterinario INT,
        FOREIGN KEY (id_veterinario) REFERENCES veterinarios (id),
        fecha_nacimiento DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
        descripcion VARCHAR(250) NOT NULL
    );

-- Ejercicio 6 – Insertar registros
--Insertar: 
--  3 dueños con información completa  
--  3 mascotas, cada una asociada a un dueño  
--  2 veterinarios con especialidades distintas  
--  3 registros de historial clínico
INSERT INTO
    duenos (nombre, apellido, telefono, direccion)
VALUES
    (
        "Francisco",
        "Salinas",
        "2996840349",
        "Osa Mayor 123"
    ),
    (
        "Caterine",
        "Stephens",
        "2946842799",
        "Pasaje de la Paz 281"
    ),
    (
        "Gaston",
        "Diaz",
        "2976558274",
        "Los Alerces 1215"
    );

INSERT INTO
    mascotas (nombre, especie, fecha_nacimiento, id_dueno)
VALUES
    ("Shiro", "Gato", "2017-06-06", 1),
    ("Firulais", "Perro", "2024-07-15", 2),
    ("Manchita", "Perro", "2010-05-02", 3);

INSERT INTO
    veterinarios (nombre, apellido, matricula, especialidad)
VALUES
    ("Victor", "Gonzales", "WH8C474", "Cirugia"),
    ("Patricia", "Martinez", "KL66PH7", "Dermatologia");

INSERT INTO
    historial_clinico (
        id_mascota,
        id_veterinario,
        fecha_nacimiento,
        descripcion
    )
VALUES
    (
        1,
        1,
        "2025-11-26",
        "Paciente produce bolas de pelos descomunalmente grandes"
    ),
    (2, 1, DEFAULT, "Paciente para castracion"),
    (
        3,
        2,
        "2024-03-02",
        "Paciente presenta sarpullido en el lomo"
    );

-- Ejercicio 7 – Actualizar registros