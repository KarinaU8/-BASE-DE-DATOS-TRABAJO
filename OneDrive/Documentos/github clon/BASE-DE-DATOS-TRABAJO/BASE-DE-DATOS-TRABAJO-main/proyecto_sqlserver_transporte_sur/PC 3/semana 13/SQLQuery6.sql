DECLARE @Placa NVARCHAR(20) = 'ABC123';
DECLARE @Existe INT;

SELECT @Existe = COUNT(*) 
FROM Vehiculos
WHERE placa = @Placa;

IF @Existe = 1
    PRINT 'El vehículo con placa ' + @Placa + ' existe.';
ELSE
    PRINT 'El vehículo con placa ' + @Placa + ' NO existe.';
