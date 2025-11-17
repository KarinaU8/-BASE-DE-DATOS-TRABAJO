BEGIN TRANSACTION;

-- Actualizar el estado del mantenimiento
UPDATE Mantenimientos
SET estado = 'Finalizado'
WHERE codigo_mantenimiento = 1;

-- Actualizar la descripción del mantenimiento
UPDATE Mantenimientos
SET descripcion = 'Mantenimiento completado correctamente'
WHERE codigo_mantenimiento = 1;

-- Si todo es correcto, confirmar la transacción
COMMIT;

-- Si ocurre algún error, revertir los cambios
-- ROLLBACK;
