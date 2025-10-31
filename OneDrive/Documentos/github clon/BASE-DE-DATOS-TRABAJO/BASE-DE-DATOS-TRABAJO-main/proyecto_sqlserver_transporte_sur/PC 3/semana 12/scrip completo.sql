CREATE DATABASE MantenimientoVehicular;
GO

USE MantenimientoVehicular;
GO

-- 1. Creación de las tablas
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

-- 2. Inserción de datos de prueba
INSERT INTO Clientes VALUES
(1, 'Juan', 'Pérez', 'Transporte Pérez SAC', 'Av. Siempre Viva 123', '999111222', 'juanperez@email.com'),
(2, 'María', 'González', 'Logística González', 'Jr. Lima 456', '988777444', 'mariagonzalez@email.com'),
(3, 'Luis', 'Ramírez', 'Ramírez Cargo', 'Calle Central 789', '977555333', 'luisramirez@email.com'),
(4, 'Carmen', 'Vargas', 'Vargas Transportes', 'Av. Principal 1020', '966111999', 'carmenvargas@email.com'),
(5, 'José', 'Torres', 'Torres Distribuciones', 'Jr. Comercio 654', '955222888', 'josetorres@email.com'),
(6, 'Elena', 'Morales', 'Morales Express', 'Av. Industrial 202', '933444555', 'elenamorales@email.com'),
(7, 'Andrés', 'Flores', 'Flores Cargo', 'Jr. Libertad 321', '944555666', 'andresflores@email.com'),
(8, 'Rosa', 'Martínez', 'Martínez SAC', 'Calle Unión 808', '955666777', 'rosamartinez@email.com'),
(9, 'Diego', 'Castillo', 'Castillo Transportes', 'Av. Sur 110', '977888999', 'diegocastillo@email.com'),
(10, 'Lucía', 'Mendoza', 'Mendoza Logistics', 'Jr. Comercio 222', '988999000', 'luciamendoza@email.com');

INSERT INTO Vehiculos VALUES
(1, 1, 'ABC123', 'Toyota', 'Hilux', 2019, 'Camioneta'),
(2, 1, 'XYZ987', 'Hyundai', 'Santa Fe', 2020, 'SUV'),
(3, 2, 'LMN456', 'Volvo', 'FH16', 2018, 'Camión'),
(4, 3, 'QWE789', 'Mercedes', 'Sprinter', 2021, 'Van'),
(5, 4, 'JKL321', 'Nissan', 'Navara', 2017, 'Pick-up'),
(6, 5, 'OPQ654', 'Scania', 'R450', 2022, 'Camión'),
(7, 2, 'RST852', 'Isuzu', 'NQR', 2016, 'Camión Mediano'),
(8, 3, 'UVW963', 'Ford', 'Transit', 2019, 'Van'),
(9, 6, 'HJK741', 'Chevrolet', 'D-Max', 2020, 'Camioneta'),
(10, 7, 'BNM258', 'MAN', 'TGX', 2021, 'Camión'),
(11, 8, 'PLQ369', 'Renault', 'Kangoo', 2019, 'Furgón'),
(12, 9, 'GHJ147', 'Kia', 'Sportage', 2018, 'SUV'),
(13, 10, 'VBN753', 'Mitsubishi', 'Fuso', 2022, 'Camión'),
(14, 6, 'YUI852', 'Peugeot', 'Partner', 2020, 'Furgoneta'),
(15, 7, 'TRE963', 'Volkswagen', 'Crafter', 2019, 'Van');

INSERT INTO Tecnicos VALUES
(1, 'Carlos', 'López', 'Mecánica General', '955111333', 'carloslopez@email.com'),
(2, 'Ana', 'Torres', 'Electrónica', '955222444', 'anatorres@email.com'),
(3, 'Pedro', 'Sánchez', 'Motor Diesel', '955333555', 'pedrosanchez@email.com'),
(4, 'Lucía', 'Fernández', 'Frenos y Suspensión', '955444666', 'luciafernandez@email.com'),
(5, 'Miguel', 'Castro', 'Transmisiones', '955555777', 'miguelcastro@email.com'),
(6, 'Sofía', 'García', 'Electricidad Automotriz', '955666888', 'sofiagarcia@email.com'),
(7, 'Hugo', 'Ramírez', 'Chapa y Pintura', '955777999', 'hugoramirez@email.com'),
(8, 'Patricia', 'Reyes', 'Diagnóstico Computarizado', '955888000', 'patriciareyes@email.com');

INSERT INTO Mantenimientos VALUES
(1, 1, 1, 'Preventivo', 'Cambio de aceite y filtros', '2025-09-10', 'Pendiente'),
(2, 2, 2, 'Correctivo', 'Reparación sistema eléctrico', '2025-09-15', 'Pendiente'),
(3, 3, 3, 'Preventivo', 'Revisión general motor', '2025-09-20', 'Pendiente'),
(4, 4, 4, 'Correctivo', 'Cambio de frenos', '2025-09-25', 'Pendiente'),
(5, 5, 5, 'Preventivo', 'Revisión suspensión', '2025-09-28', 'Pendiente'),
(6, 6, 6, 'Correctivo', 'Reparación transmisión', '2025-10-02', 'Pendiente'),
(7, 7, 2, 'Preventivo', 'Chequeo eléctrico', '2025-10-05', 'Pendiente'),
(8, 8, 3, 'Correctivo', 'Cambio de inyectores', '2025-10-08', 'Pendiente'),
(9, 9, 7, 'Correctivo', 'Pintura general', '2025-10-12', 'Pendiente'),
(10, 10, 8, 'Preventivo', 'Diagnóstico computarizado', '2025-10-15', 'Pendiente'),
(11, 11, 1, 'Correctivo', 'Revisión de caja de cambios', '2025-10-18', 'Pendiente'),
(12, 12, 4, 'Preventivo', 'Cambio de pastillas de freno', '2025-10-20', 'Pendiente'),
(13, 13, 5, 'Correctivo', 'Reparación de embrague', '2025-10-22', 'Pendiente'),
(14, 14, 6, 'Preventivo', 'Revisión eléctrica', '2025-10-25', 'Pendiente'),
(15, 15, 8, 'Correctivo', 'Revisión computadora de abordo', '2025-10-28', 'Pendiente');


-- 3. Consultas básicas para verificar
SELECT * FROM Clientes;
SELECT * FROM Vehiculos;
SELECT * FROM Tecnicos;
SELECT * FROM Mantenimientos;

-- Clientes con sus vehículos
SELECT c.nombres, c.apellidos, v.placa, v.marca, v.modelo
FROM Clientes c
INNER JOIN Vehiculos v ON c.codigo_cliente = v.codigo_cliente;

-- Mantenimientos con cliente, vehículo y técnico
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

-- Vehículos ordenados por año (del más nuevo al más viejo)
SELECT placa, marca, modelo, anio
FROM Vehiculos
ORDER BY anio DESC;

-- Contar cuántos mantenimientos hay por estado
SELECT estado, COUNT(*) AS total
FROM Mantenimientos
GROUP BY estado;

-- Clientes que no tienen razón social registrada
SELECT nombres, apellidos
FROM Clientes
WHERE razon_social IS NULL;

-- Vehículos cuya marca empieza con 'T'
SELECT placa, marca, modelo
FROM Vehiculos
WHERE marca LIKE 'T%';

-- Vehículos de los primeros 3 clientes
SELECT placa, marca
FROM Vehiculos
WHERE codigo_cliente IN (1,2,3);

-- Mantenimientos programados para un rango de fechas específico
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

-- Contar tipos de mantenimiento, pero solo mostrar los que tengan 3 o más registros
SELECT tipo_mantenimiento, COUNT(*) AS total
FROM Mantenimientos
GROUP BY tipo_mantenimiento
HAVING COUNT(*) >= 3;

-- Otro ejemplo de CASE
SELECT codigo_mantenimiento, tipo_mantenimiento,
    CASE 
        WHEN estado = 'Pendiente' THEN 'Aún no realizado'
        ELSE 'Finalizado'
    END AS detalle_estado
FROM Mantenimientos;


-- 5. En esta parte estoy practicando cómo usar subconsultas y UNION

-- Subconsulta en el SELECT: Contar vehículos por cliente
SELECT 
    c.nombres,
    c.apellidos,
    (SELECT COUNT(*) 
     FROM Vehiculos v 
     WHERE v.codigo_cliente = c.codigo_cliente) AS cantidad_vehiculos
FROM Clientes c;

-- Subconsulta en el WHERE: Mantenimientos de técnicos que tienen más de 1 trabajo
SELECT *
FROM Mantenimientos
WHERE codigo_tecnico IN (
    SELECT codigo_tecnico
    FROM Mantenimientos
    GROUP BY codigo_tecnico
    HAVING COUNT(*) > 1
);

-- Subconsulta en el FROM: Calcular el año promedio de los vehículos de cada cliente
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

-- Comparación de conteo entre UNION y UNION ALL
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

-- Insertar su vehículo
INSERT INTO Vehiculos (codigo_vehiculo, codigo_cliente, placa, marca, modelo, anio, tipo)
VALUES (16, 11, 'JKP741', 'Toyota', 'RAV4', 2023, 'SUV');

-- Registrarle un mantenimiento
INSERT INTO Mantenimientos (codigo_mantenimiento, codigo_vehiculo, codigo_tecnico, tipo_mantenimiento, descripcion, fecha_programada, estado)
VALUES (16, 16, 2, 'Preventivo', 'Cambio de filtros de aire y aceite', '2025-11-01', 'Pendiente');

-- Verifico que se grabó todo
SELECT * FROM Clientes WHERE codigo_cliente = 11;
SELECT * FROM Vehiculos WHERE codigo_cliente = 11;
SELECT * FROM Mantenimientos WHERE codigo_mantenimiento = 16;

-- Actualizar el teléfono de un cliente
UPDATE Clientes
SET telefono = '999777555'
WHERE codigo_cliente = 2;

-- Actualizar un mantenimiento que ya se completó
UPDATE Mantenimientos
SET estado = 'Completado'
WHERE codigo_mantenimiento = 3;

-- Verificar los UPDATES
SELECT codigo_cliente, nombres, telefono FROM Clientes WHERE codigo_cliente = 2;
SELECT codigo_mantenimiento, estado FROM Mantenimientos WHERE codigo_mantenimiento = 3;

-- Eliminar un mantenimiento que se registró por error (el 15)
DELETE FROM Mantenimientos
WHERE codigo_mantenimiento = 15;

-- Verificar que se borró
SELECT * FROM Mantenimientos;


-- 7. Practicando Procedimientos Almacenados (Stored Procedures), Funciones y Vistas

-- Voy a crear un SP (Stored Procedure) para registrar mantenimientos más rápido
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
EXEC RegistrarMantenimiento 17, 5, 1, 'Correctivo', 'Revisión de sistema de frenos', '2025-11-10', 'Pendiente';
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

-- Probando la actualización...
EXEC ActualizarEstadoMantenimiento 17, 'Completado';
SELECT codigo_mantenimiento, estado FROM Mantenimientos WHERE codigo_mantenimiento = 17;


-- Ahora una función. Le paso el ID del técnico y me dice cuántos trabajos tiene.
CREATE FUNCTION CantidadMantenimientosPorTecnico (@codigo_tecnico INT)
RETURNS INT
AS
BEGIN
    DECLARE @total INT;
    SELECT @total = COUNT(*) FROM Mantenimientos WHERE codigo_tecnico = @codigo_tecnico;
    RETURN @total;
END;
GO

-- Probando la función con la tabla de Técnicos
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

-- Consultando la VISTA... debería salir todo combinado
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

-- LEFT JOIN (Todos los de la izquierda (Clientes), tengan o no vehículos)
SELECT 
    c.nombres,
    c.apellidos,
    v.placa,
    v.marca
FROM Clientes c
LEFT JOIN Vehiculos v ON c.codigo_cliente = v.codigo_cliente;

-- RIGHT JOIN (Todos los de la derecha (Clientes), tengan o no vehículos)
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

-- CROSS JOIN (Combinación de todo con todo, producto cartesiano)
-- Ojo con esto, solo usar con tablas pequeñas.
SELECT 
    c.nombres AS cliente,
    v.marca AS vehiculo
FROM Clientes c
CROSS JOIN Vehiculos v;

-- Ejemplo final práctico: Mantenimientos pendientes con info completa
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

-- Contar el total de técnicos
SELECT COUNT(codigo_tecnico) AS total_tecnicos
FROM Tecnicos;

-- Contar cuántos vehículos tiene cada cliente (usando JOIN y GROUP BY)
SELECT
    c.nombres,
    c.apellidos,
    COUNT(v.codigo_vehiculo) AS cantidad_de_vehiculos
FROM Clientes c
LEFT JOIN Vehiculos v ON c.codigo_cliente = v.codigo_cliente
GROUP BY c.codigo_cliente, c.nombres, c.apellidos
ORDER BY cantidad_de_vehiculos DESC;

-- SUM (Sumar todos los años, no es muy útil pero es para el ejemplo)
SELECT SUM(anio) AS suma_de_anios
FROM Vehiculos;

-- Analizar los años de los vehículos por marca (Promedio, Más nuevo, Más antiguo)
SELECT 
    marca,
    AVG(CAST(anio AS FLOAT)) AS anio_promedio, -- CAST para que el promedio sea decimal
    MAX(anio) AS vehiculo_mas_nuevo,
    MIN(anio) AS vehiculo_mas_antiguo,
    COUNT(*) AS total_unidades
FROM Vehiculos
GROUP BY marca
ORDER BY marca;

-- Agrupar por múltiples columnas (Técnico y tipo de mantenimiento)
SELECT 
    t.nombres + ' ' + t.apellidos AS tecnico,
    m.tipo_mantenimiento,
    COUNT(*) AS total
FROM Mantenimientos m
INNER JOIN Tecnicos t ON m.codigo_tecnico = t.codigo_tecnico
GROUP BY t.nombres, t.apellidos, m.tipo_mantenimiento
ORDER BY tecnico, m.tipo_mantenimiento;

-- HAVING (Filtro después del GROUP BY)
-- Mostrar solo las marcas que tienen 2 o más vehículos
SELECT 
    marca, 
    COUNT(*) AS total_unidades
FROM Vehiculos
GROUP BY marca
HAVING COUNT(*) >= 2
ORDER BY total_unidades DESC;

-- Mostrar solo los técnicos con 2 o más mantenimientos asignados
SELECT 
    t.nombres + ' ' + t.apellidos AS tecnico,
    COUNT(m.codigo_mantenimiento) AS cantidad_mantenimientos
FROM Tecnicos t
INNER JOIN Mantenimientos m ON t.codigo_tecnico = m.codigo_tecnico
GROUP BY t.codigo_tecnico, t.nombres, t.apellidos
HAVING COUNT(m.codigo_mantenimiento) >= 2
ORDER BY cantidad_mantenimientos DESC;

--Practicando EXISTS y funciones de Fecha, Cadena y Conversión

-- Subconsulta con EXISTS (Clientes que SÍ tienen vehículos)
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

-- Sumar 30 días a una fecha
SELECT 
    descripcion, 
    fecha_programada,
    DATEADD(DAY, 30, fecha_programada) AS fecha_vencimiento_revision
FROM Mantenimientos;

-- Diferencia en días entre hoy y la fecha programada
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

-- Mayúsculas y minúsculas
SELECT 
    UPPER(marca) AS marca_mayuscula,
    LOWER(modelo) AS modelo_minuscula
FROM Vehiculos;

-- Quitar espacios en blanco
SELECT 
    RTRIM(LTRIM('    Juan Pérez    ')) AS nombre_limpio;

-- Funciones de Conversión

-- Convertir fecha a formato DD/MM/YYYY
SELECT
    descripcion, 
    CONVERT(NVARCHAR(10), fecha_programada, 103) AS fecha_formateada
FROM Mantenimientos;

-- Convertir año (número) a texto (nvarchar) para unirlo
SELECT 
    placa,
    marca + ' - ' + CONVERT(NVARCHAR(4), anio) AS vehiculo_con_anio
FROM Vehiculos;