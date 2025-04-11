-- 1. Validar que el cliente exista
CREATE OR REPLACE FUNCTION validar_cliente(p_id_cliente TEXT)
RETURNS BOOLEAN AS $$
BEGIN
    IF EXISTS (SELECT 1 FROM cliente WHERE doc = p_id_cliente) THEN
        RETURN TRUE;
    ELSE
        RAISE NOTICE 'El cliente con documento % no existe.', p_id_cliente;
        RETURN FALSE;
    END IF;
END;
$$ LANGUAGE plpgsql;


-- 2. Verificar que el stock sea suficiente
CREATE OR REPLACE FUNCTION verificar_stock(p_id_producto INT, p_cantidad INT)
RETURNS BOOLEAN AS $$
DECLARE
    v_stock_actual INT;
BEGIN
    SELECT cantidad INTO v_stock_actual
    FROM stock
    WHERE idProducto = p_id_producto;

    IF v_stock_actual IS NULL THEN
        RAISE NOTICE 'No hay registro de stock para el producto con ID %.', p_id_producto;
        RETURN FALSE;
    ELSIF v_stock_actual < p_cantidad THEN
        RAISE NOTICE 'Stock insuficiente: solo hay % unidades disponibles.', v_stock_actual;
        RETURN FALSE;
    END IF;

    RETURN TRUE;
END;
$$ LANGUAGE plpgsql;



-- 3. Notificar que no hay stock suficiente
CREATE OR REPLACE FUNCTION notificar_falta_stock(p_id_producto INT)
RETURNS VOID AS $$
DECLARE
    v_nombre TEXT;
BEGIN
    SELECT nombre INTO v_nombre FROM productos WHERE id = p_id_producto;

    IF v_nombre IS NULL THEN
        v_nombre := 'Producto desconocido';
    END IF;

    RAISE NOTICE 'No hay stock suficiente para el producto: % (ID %).', v_nombre, p_id_producto;
END;
$$ LANGUAGE plpgsql;


-- 4. Registrar la venta (sin validaciones)
CREATE OR REPLACE FUNCTION realizar_registro_venta(
    p_id_empleado INT,
    p_id_cliente TEXT,
    p_id_producto INT,
    p_cantidad INT
) RETURNS VOID AS $$
DECLARE
    v_precio_unitario INT;
    v_total INT;
BEGIN
    -- Obtener precio unitario
    SELECT precioUnitario INTO v_precio_unitario
    FROM productos
    WHERE id = p_id_producto;

    IF NOT FOUND THEN
        RAISE NOTICE 'Producto con ID % no encontrado.', p_id_producto;
        RETURN;
    END IF;


    v_total := v_precio_unitario * p_cantidad;

    INSERT INTO detalleVenta (idEmpleado, idCliente, idProducto, total, fecha)
    VALUES (p_id_empleado, p_id_cliente, p_id_producto, v_total, CURRENT_DATE);


    INSERT INTO historialVentas (fechaVenta, totalVenta)
    VALUES (CURRENT_DATE, v_total);


    UPDATE stock
    SET cantidad = cantidad - p_cantidad
    WHERE idProducto = p_id_producto;

    RAISE NOTICE 'Venta registrada con éxito. Total: %', v_total;
END;
$$ LANGUAGE plpgsql;

-- 5. Procedimiento principal para registrar venta con todas las validaciones
CREATE OR REPLACE FUNCTION registrar_venta(
    p_id_empleado INT,
    p_id_cliente TEXT,
    p_id_producto INT,
    p_cantidad INT
) RETURNS VOID AS $$
BEGIN
    IF NOT validar_cliente(p_id_cliente) THEN
        RETURN;
    END IF;
  
    IF NOT verificar_stock(p_id_producto, p_cantidad) THEN
        PERFORM notificar_falta_stock(p_id_producto);
        RETURN;
    END IF;

    PERFORM realizar_registro_venta(p_id_empleado, p_id_cliente, p_id_producto, p_cantidad);
END;
$$ LANGUAGE plpgsql;
