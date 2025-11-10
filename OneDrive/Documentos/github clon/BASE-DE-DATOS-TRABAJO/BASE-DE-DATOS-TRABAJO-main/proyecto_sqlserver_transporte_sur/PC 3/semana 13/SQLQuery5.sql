DECLARE @PromedioMantenimientos DECIMAL(10,2);

SELECT @PromedioMantenimientos = AVG(Cantidad)
FROM (
    SELECT COUNT(*) AS Cantidad
    FROM Mantenimientos
    GROUP BY codigo_tecnico
) AS Subconsulta;

PRINT 'El promedio de mantenimientos por técnico es: ' + CAST(@PromedioMantenimientos AS VARCHAR(10));
