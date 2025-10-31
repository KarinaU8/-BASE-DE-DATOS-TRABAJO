
USE MantenimientoVehicular;
GO

CREATE TABLE Clientes (
    codigo_cliente INT PRIMARY KEY,
    nombres NVARCHAR(100) NOT NULL,
    apellidos NVARCHAR(100) NOT NULL,
    razon_social NVARCHAR(150),
    direccion NVARCHAR(200),
    telefono NVARCHAR(20),
    correo NVARCHAR(100)
);

CREATE TABLE Vehiculos (
    codigo_vehiculo INT PRIMARY KEY,
    codigo_cliente INT NOT NULL,
    placa NVARCHAR(20) NOT NULL,
    marca NVARCHAR(50) NOT NULL,
    modelo NVARCHAR(50) NOT NULL,
    anio INT NOT NULL,
    tipo NVARCHAR(50),
    FOREIGN KEY (codigo_cliente) REFERENCES Clientes(codigo_cliente)
);

CREATE TABLE Tecnicos (
    codigo_tecnico INT PRIMARY KEY,
    nombres NVARCHAR(100) NOT NULL,
    apellidos NVARCHAR(100) NOT NULL,
    especialidad NVARCHAR(100),
    telefono NVARCHAR(20),
    correo NVARCHAR(100)
);

CREATE TABLE Mantenimientos (
    codigo_mantenimiento INT PRIMARY KEY,
    codigo_vehiculo INT NOT NULL,
    codigo_tecnico INT NOT NULL,
    tipo_mantenimiento NVARCHAR(100) NOT NULL,
    descripcion NVARCHAR(200),
    fecha_programada DATE NOT NULL,
    estado NVARCHAR(50) NOT NULL,
    FOREIGN KEY (codigo_vehiculo) REFERENCES Vehiculos(codigo_vehiculo),
    FOREIGN KEY (codigo_tecnico) REFERENCES Tecnicos(codigo_tecnico)
);

-- Insertacion de datos (clientes, veh�culos, t�cnicos y mantenimientos)
INSERT INTO Clientes VALUES
(1, 'Juan', 'P�rez', 'Transporte P�rez SAC', 'Av. Siempre Viva 123', '999111222', 'juanperez@email.com'),
(2, 'Mar�a', 'Gonzales', 'Log�stica Gonzales', 'Jr. Lima 456', '988777444', 'mariagonzales@email.com'),
(3, 'Luis', 'Ram�rez', 'Ram�rez Cargo', 'Calle Central 789', '977555333', 'luisramirez@email.com'),
(4, 'Carmen', 'Vargas', 'Vargas Transportes', 'Av. Principal 1020', '966111999', 'carmenvargas@email.com'),
(5, 'Jos�', 'Torres', 'Torres Distribuciones', 'Jr. Comercio 654', '955222888', 'josetorres@email.com'),
(6, 'Elena', 'Morales', 'Morales Express', 'Av. Industrial 202', '933444555', 'elenamorales@email.com'),
(7, 'Andr�s', 'Flores', 'Flores Cargo', 'Jr. Libertad 321', '944555666', 'andresflores@email.com'),
(8, 'Rosa', 'Mart�nez', 'Mart�nez SAC', 'Calle Uni�n 808', '955666777', 'rosamartinez@email.com'),
(9, 'Diego', 'Castillo', 'Castillo Transportes', 'Av. Sur 110', '977888999', 'diegocastillo@email.com'),
(10, 'Luc�a', 'Mendoza', 'Mendoza Logistics', 'Jr. Comercio 222', '988999000', 'luciamendoza@email.com');

INSERT INTO Vehiculos VALUES
(1, 1, 'ABC123', 'Toyota', 'Hilux', 2019, 'Camioneta'),
(2, 1, 'XYZ987', 'Hyundai', 'Santa Fe', 2020, 'SUV'),
(3, 2, 'LMN456', 'Volvo', 'FH16', 2018, 'Cami�n'),
(4, 3, 'QWE789', 'Mercedes', 'Sprinter', 2021, 'Van'),
(5, 4, 'JKL321', 'Nissan', 'Navara', 2017, 'Pick-up'),
(6, 5, 'OPQ654', 'Scania', 'R450', 2022, 'Cami�n'),
(7, 2, 'RST852', 'Isuzu', 'NQR', 2016, 'Cami�n Mediano'),
(8, 3, 'UVW963', 'Ford', 'Transit', 2019, 'Van'),
(9, 6, 'HJK741', 'Chevrolet', 'D-Max', 2020, 'Camioneta'),
(10, 7, 'BNM258', 'MAN', 'TGX', 2021, 'Cami�n'),
(11, 8, 'PLQ369', 'Renault', 'Kangoo', 2019, 'Furg�n'),
(12, 9, 'GHJ147', 'Kia', 'Sportage', 2018, 'SUV'),
(13, 10, 'VBN753', 'Mitsubishi', 'Fuso', 2022, 'Cami�n'),
(14, 6, 'YUI852', 'Peugeot', 'Partner', 2020, 'Furgoneta'),
(15, 7, 'TRE963', 'Volkswagen', 'Crafter', 2019, 'Van');

INSERT INTO Tecnicos VALUES
(1, 'Carlos', 'Lopez', 'Mec�nica General', '955111333', 'carloslopez@email.com'),
(2, 'Ana', 'Torres', 'Electr�nica', '955222444', 'anatorres@email.com'),
(3, 'Pedro', 'S�nchez', 'Motor Diesel', '955333555', 'pedrosanchez@email.com'),
(4, 'Luc�a', 'Fern�ndez', 'Frenos y Suspensi�n', '955444666', 'luciafernandez@email.com'),
(5, 'Miguel', 'Castro', 'Transmisiones', '955555777', 'miguelcastro@email.com'),
(6, 'Sof�a', 'Garc�a', 'Electricidad Automotriz', '955666888', 'sofiagarcia@email.com'),
(7, 'Hugo', 'Ram�rez', 'Chapa y Pintura', '955777999', 'hugoramirez@email.com'),
(8, 'Patricia', 'Reyes', 'Diagn�stico Computarizado', '955888000', 'patriciareyes@email.com');

INSERT INTO Mantenimientos VALUES
(1, 1, 1, 'Preventivo', 'Cambio de aceite y filtros', '2025-09-10', 'Pendiente'),
(2, 2, 2, 'Correctivo', 'Reparaci�n sistema el�ctrico', '2025-09-15', 'Pendiente'),
(3, 3, 3, 'Preventivo', 'Revisi�n general motor', '2025-09-20', 'Pendiente'),
(4, 4, 4, 'Correctivo', 'Cambio de frenos', '2025-09-25', 'Pendiente'),
(5, 5, 5, 'Preventivo', 'Revisi�n suspensi�n', '2025-09-28', 'Pendiente'),
(6, 6, 6, 'Correctivo', 'Reparaci�n transmisi�n', '2025-10-02', 'Pendiente'),
(7, 7, 2, 'Preventivo', 'Chequeo el�ctrico', '2025-10-05', 'Pendiente'),
(8, 8, 3, 'Correctivo', 'Cambio de inyectores', '2025-10-08', 'Pendiente'),
(9, 9, 7, 'Correctivo', 'Pintura general', '2025-10-12', 'Pendiente'),
(10, 10, 8, 'Preventivo', 'Diagn�stico computarizado', '2025-10-15', 'Pendiente'),
(11, 11, 1, 'Correctivo', 'Revisi�n de caja de cambios', '2025-10-18', 'Pendiente'),
(12, 12, 4, 'Preventivo', 'Cambio de pastillas de freno', '2025-10-20', 'Pendiente'),
(13, 13, 5, 'Correctivo', 'Reparaci�n de embrague', '2025-10-22', 'Pendiente'),
(14, 14, 6, 'Preventivo', 'Revisi�n el�ctrica', '2025-10-25', 'Pendiente'),
(15, 15, 8, 'Correctivo', 'Revisi�n computadora de abordo', '2025-10-28', 'Pendiente');


SELECT * FROM Clientes;
SELECT * FROM Vehiculos;
SELECT * FROM Tecnicos;
SELECT * FROM Mantenimientos;

SELECT c.nombres, c.apellidos, v.placa, v.marca, v.modelo
FROM Clientes c
INNER JOIN Vehiculos v ON c.codigo_cliente = v.codigo_cliente;

SELECT c.nombres, v.placa, m.tipo_mantenimiento, m.estado, t.nombres AS tecnico
FROM Mantenimientos m
INNER JOIN Vehiculos v ON m.codigo_vehiculo = v.codigo_vehiculo
INNER JOIN Clientes c ON v.codigo_cliente = c.codigo_cliente
INNER JOIN Tecnicos t ON m.codigo_tecnico = t.codigo_tecnico;

SELECT * FROM Mantenimientos
WHERE estado = 'Pendiente'
ORDER BY fecha_programada ASC;

SELECT v.placa, m.tipo_mantenimiento, m.descripcion, m.estado
FROM Mantenimientos m
INNER JOIN Vehiculos v ON m.codigo_vehiculo = v.codigo_vehiculo
WHERE m.tipo_mantenimiento = 'Correctivo';

SELECT placa, marca, modelo, anio
FROM Vehiculos
ORDER BY anio DESC;

SELECT estado, COUNT(*) AS total
FROM Mantenimientos
GROUP BY estado;

SELECT nombres, apellidos
FROM Clientes
WHERE razon_social IS NULL;

SELECT placa, marca, modelo
FROM Vehiculos
WHERE marca LIKE 'T%';

SELECT placa, marca
FROM Vehiculos
WHERE codigo_cliente IN (1,2,3);

SELECT codigo_mantenimiento, fecha_programada, estado
FROM Mantenimientos
WHERE fecha_programada BETWEEN '2025-09-10' AND '2025-09-25';

SELECT nombres, apellidos, 
    CASE 
        WHEN razon_social IS NULL THEN 'Desconocido'
        ELSE 'Registrado'
    END AS estado_razon_social
FROM Clientes;

SELECT tipo_mantenimiento, COUNT(*) AS total
FROM Mantenimientos
GROUP BY tipo_mantenimiento
HAVING COUNT(*) >= 3;

SELECT codigo_mantenimiento, tipo_mantenimiento,
    CASE 
        WHEN estado = 'Pendiente' THEN 'A�n no realizado'
        ELSE 'Finalizado'
    END AS detalle_estado
FROM Mantenimientos;


-- En esta parte estoy practicando c�mo usar subconsultas dentro de otras consultas
-- y c�mo unir resultados diferentes usando UNION y UNION ALL

-- Subconsulta en SELECT
-- Quiero ver cada cliente con la cantidad de veh�culos que tiene registrados
SELECT 
    c.nombres,
    c.apellidos,
    (SELECT COUNT(*) 
     FROM Vehiculos v 
     WHERE v.codigo_cliente = c.codigo_cliente) AS cantidad_vehiculos
FROM Clientes c;

-- Subconsulta en WHERE
-- Aqu� filtro los mantenimientos de los t�cnicos que tienen m�s de un trabajo asignado
SELECT *
FROM Mantenimientos
WHERE codigo_tecnico IN (
    SELECT codigo_tecnico
    FROM Mantenimientos
    GROUP BY codigo_tecnico
    HAVING COUNT(*) > 1
);

-- Subconsulta en FROM
-- Calculo el promedio del a�o de los veh�culos que tiene cada cliente
SELECT c.nombres, c.apellidos, datos.promedio_anio
FROM Clientes c
INNER JOIN (
    SELECT codigo_cliente, AVG(anio) AS promedio_anio
    FROM Vehiculos
    GROUP BY codigo_cliente
) AS datos ON c.codigo_cliente = datos.codigo_cliente;

-- UNION
-- Combino todas las marcas de veh�culos con los tipos de mantenimiento (sin duplicados)
SELECT marca AS elemento
FROM Vehiculos
UNION
SELECT tipo_mantenimiento
FROM Mantenimientos;

-- UNION ALL
-- Mismo caso que el anterior, pero aqu� s� se muestran los duplicados
SELECT marca AS elemento
FROM Vehiculos
UNION ALL
SELECT tipo_mantenimiento
FROM Mantenimientos;

-- Comparaci�n entre UNION y UNION ALL
-- Cuento cu�ntos resultados devuelve cada uno para ver la diferencia
SELECT COUNT(*) AS total_union
FROM (
    SELECT marca AS elemento
    FROM Vehiculos
    UNION
    SELECT tipo_mantenimiento
    FROM Mantenimientos
) AS u;

SELECT COUNT(*) AS total_union_all
FROM (
    SELECT marca AS elemento
    FROM Vehiculos
    UNION ALL
    SELECT tipo_mantenimiento
    FROM Mantenimientos
) AS ua;

-- En esta parte voy a practicar c�mo agregar, modificar y eliminar datos en las tablas
-- para mantener actualizada la base de datos seg�n los cambios reales del taller.

-- Insertar un nuevo cliente
INSERT INTO Clientes (codigo_cliente, nombres, apellidos, razon_social, direccion, telefono, correo)
VALUES (11, 'Fernando', 'Quispe', 'Quispe Transportes', 'Av. Arequipa 505', '987654321', 'fernandoquispe@email.com');

-- Insertar un nuevo veh�culo para ese cliente
INSERT INTO Vehiculos (codigo_vehiculo, codigo_cliente, placa, marca, modelo, anio, tipo)
VALUES (16, 11, 'JKP741', 'Toyota', 'RAV4', 2023, 'SUV');

-- Registrar un mantenimiento preventivo para ese veh�culo
INSERT INTO Mantenimientos (codigo_mantenimiento, codigo_vehiculo, codigo_tecnico, tipo_mantenimiento, descripcion, fecha_programada, estado)
VALUES (16, 16, 2, 'Preventivo', 'Cambio de filtros de aire y aceite', '2025-11-01', 'Pendiente');

-- Verifico que los nuevos registros se hayan insertado correctamente
SELECT * FROM Clientes WHERE codigo_cliente = 11;
SELECT * FROM Vehiculos WHERE codigo_cliente = 11;
SELECT * FROM Mantenimientos WHERE codigo_mantenimiento = 16;

-- Actualizar datos: cambio de tel�fono de Mar�a Gonzales
UPDATE Clientes
SET telefono = '999777555'
WHERE codigo_cliente = 2;

-- Actualizar mantenimiento completado
UPDATE Mantenimientos
SET estado = 'Completado'
WHERE codigo_mantenimiento = 3;

-- Verificar las actualizaciones
SELECT codigo_cliente, nombres, telefono FROM Clientes WHERE codigo_cliente = 2;
SELECT codigo_mantenimiento, estado FROM Mantenimientos WHERE codigo_mantenimiento = 3;

-- Eliminar un mantenimiento que se registr� por error
DELETE FROM Mantenimientos
WHERE codigo_mantenimiento = 15;

-- Consultar la tabla de mantenimientos para verificar que se elimin� el registro
SELECT * FROM Mantenimientos;