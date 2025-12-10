-- Ejercicio 6 – Insertar registros
--Insertar: 
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