CREATE DATABASE MantenimientoVehicular;
GO

USE MantenimientoVehicular;
GO

-- 1. Creaci�n de las tablas
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

-- 2. Inserci�n de datos de prueba
INSERT INTO Clientes VALUES
(1, 'Juan', 'P�rez', 'Transporte P�rez SAC', 'Av. Siempre Viva 123', '999111222', 'juanperez@email.com'),
(2, 'Mar�a', 'Gonz�lez', 'Log�stica Gonz�lez', 'Jr. Lima 456', '988777444', 'mariagonzalez@email.com'),
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
(1, 'Carlos', 'L�pez', 'Mec�nica General', '955111333', 'carloslopez@email.com'),
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


-- 3. Consultas b�sicas para verificar
SELECT * FROM Clientes;
SELECT * FROM Vehiculos;
SELECT * FROM Tecnicos;
SELECT * FROM Mantenimientos;

-- Clientes con sus veh�culos
SELECT c.nombres, c.apellidos, v.placa, v.marca, v.modelo
FROM Clientes c
INNER JOIN Vehiculos v ON c.codigo_cliente = v.codigo_cliente;

-- Mantenimientos con cliente, veh�culo y t�cnico
SELECT c.nombres, v.placa, m.tipo_mantenimiento, m.estado, t.nombres AS tecnico
FROM Mantenimientos m
INNER JOIN Vehiculos v ON m.codigo_vehiculo = v.codigo_vehiculo
INNER JOIN Clientes c ON v.codigo_cliente = c.codigo_cliente
INNER JOIN Tecnicos t ON m.codigo_tecnico = t.codigo_tecnico;

-- 4. Practicando filtros (WHERE, ORDER BY, GROUP BY, LIKE, IN, BETWEEN, CASE)

-- Mantenimientos pendientes ordenados por fecha
SELECT * FROM Mantenimientos
WHERE estado = 'Pendiente'
ORDER BY fecha_programada ASC;

-- Solo mantenimientos correctivos
SELECT v.placa, m.tipo_mantenimiento, m.descripcion, m.estado
FROM Mantenimientos m
INNER JOIN Vehiculos v ON m.codigo_vehiculo = v.codigo_vehiculo
WHERE m.tipo_mantenimiento = 'Correctivo';

-- Veh�culos ordenados por a�o (del m�s nuevo al m�s viejo)
SELECT placa, marca, modelo, anio
FROM Vehiculos
ORDER BY anio DESC;

-- Contar cu�ntos mantenimientos hay por estado
SELECT estado, COUNT(*) AS total
FROM Mantenimientos
GROUP BY estado;

-- Clientes que no tienen raz�n social registrada
SELECT nombres, apellidos
FROM Clientes
WHERE razon_social IS NULL;

-- Veh�culos cuya marca empieza con 'T'
SELECT placa, marca, modelo
FROM Vehiculos
WHERE marca LIKE 'T%';

-- Veh�culos de los primeros 3 clientes
SELECT placa, marca
FROM Vehiculos
WHERE codigo_cliente IN (1,2,3);

-- Mantenimientos programados para un rango de fechas espec�fico
SELECT codigo_mantenimiento, fecha_programada, estado
FROM Mantenimientos
WHERE fecha_programada BETWEEN '2025-09-10' AND '2025-09-25';

-- Usando CASE para clasificar clientes
SELECT nombres, apellidos, 
    CASE 
        WHEN razon_social IS NULL THEN 'Desconocido'
        ELSE 'Registrado'
    END AS estado_razon_social
FROM Clientes;

-- Contar tipos de mantenimiento, pero solo mostrar los que tengan 3 o m�s registros
SELECT tipo_mantenimiento, COUNT(*) AS total
FROM Mantenimientos
GROUP BY tipo_mantenimiento
HAVING COUNT(*) >= 3;

-- Otro ejemplo de CASE
SELECT codigo_mantenimiento, tipo_mantenimiento,
    CASE 
        WHEN estado = 'Pendiente' THEN 'A�n no realizado'
        ELSE 'Finalizado'
    END AS detalle_estado
FROM Mantenimientos;


-- 5. En esta parte estoy practicando c�mo usar subconsultas y UNION

-- Subconsulta en el SELECT: Contar veh�culos por cliente
SELECT 
    c.nombres,
    c.apellidos,
    (SELECT COUNT(*) 
     FROM Vehiculos v 
     WHERE v.codigo_cliente = c.codigo_cliente) AS cantidad_vehiculos
FROM Clientes c;

-- Subconsulta en el WHERE: Mantenimientos de t�cnicos que tienen m�s de 1 trabajo
SELECT *
FROM Mantenimientos
WHERE codigo_tecnico IN (
    SELECT codigo_tecnico
    FROM Mantenimientos
    GROUP BY codigo_tecnico
    HAVING COUNT(*) > 1
);

-- Subconsulta en el FROM: Calcular el a�o promedio de los veh�culos de cada cliente
SELECT c.nombres, c.apellidos, datos.promedio_anio
FROM Clientes c
INNER JOIN (
    SELECT codigo_cliente, AVG(anio) AS promedio_anio
    FROM Vehiculos
    GROUP BY codigo_cliente
) AS datos ON c.codigo_cliente = datos.codigo_cliente;

-- UNION (combina resultados sin duplicados)
-- Lista de marcas y tipos de mantenimiento
SELECT marca AS elemento
FROM Vehiculos
UNION
SELECT tipo_mantenimiento
FROM Mantenimientos;

-- UNION ALL (combina resultados con duplicados)
-- Mismo caso pero mostrando todo
SELECT marca AS elemento
FROM Vehiculos
UNION ALL
SELECT tipo_mantenimiento
FROM Mantenimientos;

-- Comparaci�n de conteo entre UNION y UNION ALL
SELECT COUNT(*) AS total_union -- Va a ser menor
FROM (
    SELECT marca AS elemento
    FROM Vehiculos
    UNION
    SELECT tipo_mantenimiento
    FROM Mantenimientos
) AS u;

SELECT COUNT(*) AS total_union_all -- Va a ser mayor
FROM (
    SELECT marca AS elemento
    FROM Vehiculos
    UNION ALL
    SELECT tipo_mantenimiento
    FROM Mantenimientos
) AS ua;

-- 6. Practicando DML (INSERT, UPDATE, DELETE)

-- Insertar un cliente nuevo
INSERT INTO Clientes (codigo_cliente, nombres, apellidos, razon_social, direccion, telefono, correo)
VALUES (11, 'Fernando', 'Quispe', 'Quispe Transportes', 'Av. Arequipa 505', '987654321', 'fernandoquispe@email.com');

-- Insertar su veh�culo
INSERT INTO Vehiculos (codigo_vehiculo, codigo_cliente, placa, marca, modelo, anio, tipo)
VALUES (16, 11, 'JKP741', 'Toyota', 'RAV4', 2023, 'SUV');

-- Registrarle un mantenimiento
INSERT INTO Mantenimientos (codigo_mantenimiento, codigo_vehiculo, codigo_tecnico, tipo_mantenimiento, descripcion, fecha_programada, estado)
VALUES (16, 16, 2, 'Preventivo', 'Cambio de filtros de aire y aceite', '2025-11-01', 'Pendiente');

-- Verifico que se grab� todo
SELECT * FROM Clientes WHERE codigo_cliente = 11;
SELECT * FROM Vehiculos WHERE codigo_cliente = 11;
SELECT * FROM Mantenimientos WHERE codigo_mantenimiento = 16;

-- Actualizar el tel�fono de un cliente
UPDATE Clientes
SET telefono = '999777555'
WHERE codigo_cliente = 2;

-- Actualizar un mantenimiento que ya se complet�
UPDATE Mantenimientos
SET estado = 'Completado'
WHERE codigo_mantenimiento = 3;

-- Verificar los UPDATES
SELECT codigo_cliente, nombres, telefono FROM Clientes WHERE codigo_cliente = 2;
SELECT codigo_mantenimiento, estado FROM Mantenimientos WHERE codigo_mantenimiento = 3;

-- Eliminar un mantenimiento que se registr� por error (el 15)
DELETE FROM Mantenimientos
WHERE codigo_mantenimiento = 15;

-- Verificar que se borr�
SELECT * FROM Mantenimientos;


-- 7. Practicando Procedimientos Almacenados (Stored Procedures), Funciones y Vistas

-- Voy a crear un SP (Stored Procedure) para registrar mantenimientos m�s r�pido
CREATE PROCEDURE RegistrarMantenimiento
    @codigo_mantenimiento INT,
    @codigo_vehiculo INT,
    @codigo_tecnico INT,
    @tipo_mantenimiento NVARCHAR(100),
    @descripcion NVARCHAR(200),
    @fecha_programada DATE,
    @estado NVARCHAR(50)
AS
BEGIN
    INSERT INTO Mantenimientos VALUES (@codigo_mantenimiento, @codigo_vehiculo, @codigo_tecnico, @tipo_mantenimiento, @descripcion, @fecha_programada, @estado);
    PRINT 'Mantenimiento registrado correctamente.';
END;
GO

-- Probando el SP...
EXEC RegistrarMantenimiento 17, 5, 1, 'Correctivo', 'Revisi�n de sistema de frenos', '2025-11-10', 'Pendiente';
SELECT * FROM Mantenimientos WHERE codigo_mantenimiento = 17;


-- Otro SP, este para actualizar el estado (ej. de 'Pendiente' a 'Completado')
CREATE PROCEDURE ActualizarEstadoMantenimiento
    @codigo_mantenimiento INT,
    @nuevo_estado NVARCHAR(50)
AS
BEGIN
    UPDATE Mantenimientos
    SET estado = @nuevo_estado
    WHERE codigo_mantenimiento = @codigo_mantenimiento;
    PRINT 'Estado actualizado correctamente.';
END;
GO

-- Probando la actualizaci�n...
EXEC ActualizarEstadoMantenimiento 17, 'Completado';
SELECT codigo_mantenimiento, estado FROM Mantenimientos WHERE codigo_mantenimiento = 17;


-- Ahora una funci�n. Le paso el ID del t�cnico y me dice cu�ntos trabajos tiene.
CREATE FUNCTION CantidadMantenimientosPorTecnico (@codigo_tecnico INT)
RETURNS INT
AS
BEGIN
    DECLARE @total INT;
    SELECT @total = COUNT(*) FROM Mantenimientos WHERE codigo_tecnico = @codigo_tecnico;
    RETURN @total;
END;
GO

-- Probando la funci�n con la tabla de T�cnicos
SELECT nombres, apellidos, dbo.CantidadMantenimientosPorTecnico(codigo_tecnico) AS total_mantenimientos
FROM Tecnicos;


-- Voy a crear una VISTA para no tener que escribir todo el JOIN cada vez que quiera ver el detalle.
CREATE VIEW VistaMantenimientosDetallada AS
SELECT 
    m.codigo_mantenimiento,
    c.nombres + ' ' + c.apellidos AS cliente,
    v.placa,
    t.nombres + ' ' + t.apellidos AS tecnico,
    m.tipo_mantenimiento,
    m.descripcion,
    m.fecha_programada,
    m.estado
FROM Mantenimientos m
INNER JOIN Vehiculos v ON m.codigo_vehiculo = v.codigo_vehiculo
INNER JOIN Clientes c ON v.codigo_cliente = c.codigo_cliente
INNER JOIN Tecnicos t ON m.codigo_tecnico = t.codigo_tecnico;
GO

-- Consultando la VISTA... deber�a salir todo combinado
SELECT * FROM VistaMantenimientosDetallada;

-- 8. En esta parte estoy practicando los diferentes tipos de JOIN

-- INNER JOIN (Solo los que coinciden en ambas tablas)
SELECT 
    c.nombres AS nombre_cliente,
    c.apellidos AS apellido_cliente,
    v.placa,
    v.marca,
    v.modelo
FROM Clientes c
INNER JOIN Vehiculos v ON c.codigo_cliente = v.codigo_cliente;

-- INNER JOIN con 3 tablas (Cliente, Vehiculo, Mantenimiento, Tecnico)
SELECT
    c.nombres + ' ' + c.apellidos AS cliente,
    v.placa,
    m.tipo_mantenimiento,
    m.estado,
    t.nombres + ' ' + t.apellidos AS tecnico
FROM Mantenimientos m
INNER JOIN Vehiculos v ON m.codigo_vehiculo = v.codigo_vehiculo
INNER JOIN Clientes c ON v.codigo_cliente = c.codigo_cliente
INNER JOIN Tecnicos t ON m.codigo_tecnico = t.codigo_tecnico
ORDER BY m.fecha_programada;

-- LEFT JOIN (Todos los de la izquierda (Clientes), tengan o no veh�culos)
SELECT 
    c.nombres,
    c.apellidos,
    v.placa,
    v.marca
FROM Clientes c
LEFT JOIN Vehiculos v ON c.codigo_cliente = v.codigo_cliente;

-- RIGHT JOIN (Todos los de la derecha (Clientes), tengan o no veh�culos)
SELECT 
    v.placa,
    v.marca,
    c.nombres AS nombre_cliente,
    c.apellidos AS apellido_cliente
FROM Vehiculos v
RIGHT JOIN Clientes c ON v.codigo_cliente = c.codigo_cliente;

-- FULL OUTER JOIN (Todos los de ambas tablas, coincidan o no)
SELECT
    c.nombres AS cliente,
    v.placa,
    v.marca
FROM Clientes c
FULL OUTER JOIN Vehiculos v ON c.codigo_cliente = v.codigo_cliente;

-- CROSS JOIN (Combinaci�n de todo con todo, producto cartesiano)
-- Ojo con esto, solo usar con tablas peque�as.
SELECT 
    c.nombres AS cliente,
    v.marca AS vehiculo
FROM Clientes c
CROSS JOIN Vehiculos v;

-- Ejemplo final pr�ctico: Mantenimientos pendientes con info completa
SELECT
    m.codigo_mantenimiento,
    c.nombres + ' ' + c.apellidos AS cliente,
    v.placa,
    t.nombres + ' ' + t.apellidos AS tecnico,
    m.tipo_mantenimiento,
    m.estado
FROM Mantenimientos m
INNER JOIN Vehiculos v ON m.codigo_vehiculo = v.codigo_vehiculo
INNER JOIN Clientes c ON v.codigo_cliente = c.codigo_cliente
INNER JOIN Tecnicos t ON m.codigo_tecnico = t.codigo_tecnico
WHERE m.estado = 'Pendiente'
ORDER BY m.fecha_programada;

--Practicando Funciones Agregadas (SUM, COUNT, AVG, MAX, MIN) y HAVING

-- Contar el total de t�cnicos
SELECT COUNT(codigo_tecnico) AS total_tecnicos
FROM Tecnicos;

-- Contar cu�ntos veh�culos tiene cada cliente (usando JOIN y GROUP BY)
SELECT
    c.nombres,
    c.apellidos,
    COUNT(v.codigo_vehiculo) AS cantidad_de_vehiculos
FROM Clientes c
LEFT JOIN Vehiculos v ON c.codigo_cliente = v.codigo_cliente
GROUP BY c.codigo_cliente, c.nombres, c.apellidos
ORDER BY cantidad_de_vehiculos DESC;

-- SUM (Sumar todos los a�os, no es muy �til pero es para el ejemplo)
SELECT SUM(anio) AS suma_de_anios
FROM Vehiculos;

-- Analizar los a�os de los veh�culos por marca (Promedio, M�s nuevo, M�s antiguo)
SELECT 
    marca,
    AVG(CAST(anio AS FLOAT)) AS anio_promedio, -- CAST para que el promedio sea decimal
    MAX(anio) AS vehiculo_mas_nuevo,
    MIN(anio) AS vehiculo_mas_antiguo,
    COUNT(*) AS total_unidades
FROM Vehiculos
GROUP BY marca
ORDER BY marca;

-- Agrupar por m�ltiples columnas (T�cnico y tipo de mantenimiento)
SELECT 
    t.nombres + ' ' + t.apellidos AS tecnico,
    m.tipo_mantenimiento,
    COUNT(*) AS total
FROM Mantenimientos m
INNER JOIN Tecnicos t ON m.codigo_tecnico = t.codigo_tecnico
GROUP BY t.nombres, t.apellidos, m.tipo_mantenimiento
ORDER BY tecnico, m.tipo_mantenimiento;

-- HAVING (Filtro despu�s del GROUP BY)
-- Mostrar solo las marcas que tienen 2 o m�s veh�culos
SELECT 
    marca, 
    COUNT(*) AS total_unidades
FROM Vehiculos
GROUP BY marca
HAVING COUNT(*) >= 2
ORDER BY total_unidades DESC;

-- Mostrar solo los t�cnicos con 2 o m�s mantenimientos asignados
SELECT 
    t.nombres + ' ' + t.apellidos AS tecnico,
    COUNT(m.codigo_mantenimiento) AS cantidad_mantenimientos
FROM Tecnicos t
INNER JOIN Mantenimientos m ON t.codigo_tecnico = m.codigo_tecnico
GROUP BY t.codigo_tecnico, t.nombres, t.apellidos
HAVING COUNT(m.codigo_mantenimiento) >= 2
ORDER BY cantidad_mantenimientos DESC;

--Practicando EXISTS y funciones de Fecha, Cadena y Conversi�n

-- Subconsulta con EXISTS (Clientes que S� tienen veh�culos)
SELECT c.nombres, c.apellidos
FROM Clientes c
WHERE EXISTS (
    SELECT 1
    FROM Vehiculos v
    WHERE v.codigo_cliente = c.codigo_cliente
);

-- Funciones de Fecha
SELECT GETDATE() AS fecha_actual;

-- Extraer partes de una fecha
SELECT 
    descripcion, 
    fecha_programada,
    DAY(fecha_programada) AS dia,
    MONTH(fecha_programada) AS mes,
    YEAR(fecha_programada) AS anio
FROM Mantenimientos;

-- Sumar 30 d�as a una fecha
SELECT 
    descripcion, 
    fecha_programada,
    DATEADD(DAY, 30, fecha_programada) AS fecha_vencimiento_revision
FROM Mantenimientos;

-- Diferencia en d�as entre hoy y la fecha programada
SELECT
    descripcion,
    fecha_programada,
    DATEDIFF(DAY, GETDATE(), fecha_programada) AS dias_faltantes
FROM Mantenimientos
WHERE estado = 'Pendiente';

-- Funciones de Cadena (Texto)

-- Concatenar nombre y correo
SELECT CONCAT(nombres, ' (', correo, ')') AS contacto_cliente
FROM Clientes;

-- Longitud de la placa
SELECT placa, LEN(placa) AS longitud_placa
FROM Vehiculos;

-- Extraer los 3 primeros caracteres de la placa
SELECT placa, SUBSTRING(placa, 1, 3) AS primeros_tres_caracteres
FROM Vehiculos;

-- May�sculas y min�sculas
SELECT 
    UPPER(marca) AS marca_mayuscula,
    LOWER(modelo) AS modelo_minuscula
FROM Vehiculos;

-- Quitar espacios en blanco
SELECT 
    RTRIM(LTRIM('    Juan P�rez    ')) AS nombre_limpio;

-- Funciones de Conversi�n

-- Convertir fecha a formato DD/MM/YYYY
SELECT
    descripcion, 
    CONVERT(NVARCHAR(10), fecha_programada, 103) AS fecha_formateada
FROM Mantenimientos;

-- Convertir a�o (n�mero) a texto (nvarchar) para unirlo
SELECT 
    placa,
    marca + ' - ' + CONVERT(NVARCHAR(4), anio) AS vehiculo_con_anio
FROM Vehiculos;