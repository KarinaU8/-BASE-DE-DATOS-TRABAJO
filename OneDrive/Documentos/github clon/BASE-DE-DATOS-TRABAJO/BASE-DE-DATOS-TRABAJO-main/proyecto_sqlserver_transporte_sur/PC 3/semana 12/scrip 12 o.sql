
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