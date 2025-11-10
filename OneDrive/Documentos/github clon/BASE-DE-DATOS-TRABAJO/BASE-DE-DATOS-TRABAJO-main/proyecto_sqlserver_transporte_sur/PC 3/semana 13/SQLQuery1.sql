CREATE FUNCTION dbo.ObtenerNombreCompletoTecnico(@CodigoTecnico INT)
RETURNS NVARCHAR(200)
AS
BEGIN
    DECLARE @Nombre NVARCHAR(200);
    SELECT @Nombre = nombres + ' ' + apellidos 
    FROM Tecnicos
    WHERE codigo_tecnico = @CodigoTecnico;
    RETURN @Nombre;
END;
