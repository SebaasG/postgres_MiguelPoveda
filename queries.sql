-- 1️ Productos con stock menor a 5 unidades
SELECT p.nombre, s.cantidad
FROM productos p
JOIN stock s ON p.id = s.idProducto
WHERE s.cantidad < 5;


-- 2️ Ventas totales de un mes específico 
SELECT SUM(total) AS total_ventas_mes
FROM detalleVenta
WHERE DATE_PART('month', fecha) = 4
  AND DATE_PART('year', fecha) = 2025;


-- 3️ Cliente con más compras realizadas
SELECT c.nombre, COUNT(dv.idCliente) AS cantidad_compras
FROM cliente c
JOIN detalleVenta dv ON c.doc = dv.idCliente
GROUP BY c.nombre
ORDER BY cantidad_compras DESC
LIMIT 1;


-- 4️ Los 5 productos más vendidos
SELECT p.nombre, COUNT(dv.idProducto) AS veces_vendido
FROM productos p
JOIN detalleVenta dv ON p.id = dv.idProducto
GROUP BY p.nombre
ORDER BY veces_vendido DESC
LIMIT 5;



-- 5️ Ventas realizadas en un rango de fechas de tres días y un mes

-- Rango de tres días
SELECT * FROM detalleVenta
WHERE fecha BETWEEN '2025-03-01' AND '2025-03-04';

-- Rango de un mes
SELECT * FROM detalleVenta
WHERE fecha BETWEEN '2025-03-01' AND '2025-04-01';


-- Identificar clientes que no han comprado en los últimos 6 meses.
SELECT c.nombre, c.doc
FROM cliente c
WHERE NOT EXISTS (
    SELECT 1
    FROM detalleVenta dv
    WHERE dv.idCliente = c.doc
      AND dv.fecha >= NOW() - INTERVAL '6 months'
);