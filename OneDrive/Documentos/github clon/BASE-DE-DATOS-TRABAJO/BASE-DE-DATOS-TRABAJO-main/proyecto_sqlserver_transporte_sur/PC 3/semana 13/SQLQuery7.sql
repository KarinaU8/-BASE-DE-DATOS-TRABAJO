DECLARE @CodigoVehiculo INT;

DECLARE CurVehiculos CURSOR FOR
SELECT codigo_vehiculo FROM Vehiculos;

OPEN CurVehiculos;
FETCH NEXT FROM CurVehiculos INTO @CodigoVehiculo;

WHILE @@FETCH_STATUS = 0
BEGIN
    UPDATE Vehiculos
    SET anio = anio + 1
    WHERE codigo_vehiculo = @CodigoVehiculo;

    FETCH NEXT FROM CurVehiculos INTO @CodigoVehiculo;
END

CLOSE CurVehiculos;
DEALLOCATE CurVehiculos;
