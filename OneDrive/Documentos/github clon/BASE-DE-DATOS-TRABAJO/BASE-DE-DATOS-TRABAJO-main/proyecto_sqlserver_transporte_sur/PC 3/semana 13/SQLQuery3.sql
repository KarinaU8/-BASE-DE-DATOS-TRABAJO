CREATE PROCEDURE dbo.ActualizarEstadoMantenimiento 
    @CodigoMantenimiento INT,
    @NuevoEstado NVARCHAR(50)
AS
BEGIN
    UPDATE Mantenimientos
    SET estado = @NuevoEstado
    WHERE codigo_mantenimiento = @CodigoMantenimiento;
END;
