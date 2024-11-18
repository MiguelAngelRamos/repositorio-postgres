### Ejercicio 1

La empresa **"Ventas Globales S.A."** es una empresa que gestiona ventas de productos tecnológicos. La compañía necesita realizar análisis avanzados sobre su operación, incluyendo:

1. **Monitoreo del rendimiento de los vendedores**, clasificándolos según sus ventas y calculando los totales acumulados.
2. **Identificación de los productos más vendidos y comparación entre períodos de tiempo**.
3. **Obtención de información clave sobre el desempeño de cada sucursal**, evaluando las ventas promedio y el crecimiento respecto al período anterior.

La empresa busca optimizar sus decisiones comerciales mediante **funciones de ventana**, ya que estas permiten:
- Obtener métricas sin agrupar los datos.
- Comparar filas entre sí y realizar análisis avanzados.
- Generar resultados personalizados según los grupos (por ejemplo, por vendedor, producto, o sucursal).

---

### Estructura de la Base de Datos

Vamos a crear una base de datos llamada **ventas_globales** con las siguientes tablas normalizadas:

1. **sucursales**:
   - Información de las sucursales de la empresa.
   - Campos: `id_sucursal`, `nombre`, `ubicacion`.

2. **productos**:
   - Detalles de los productos disponibles.
   - Campos: `id_producto`, `nombre`, `categoria`, `precio`.

3. **vendedores**:
   - Datos sobre los vendedores de la empresa.
   - Campos: `id_vendedor`, `nombre`, `apellido`, `id_sucursal` (relación con la tabla `sucursales`).

4. **ventas**:
   - Registro de las ventas realizadas.
   - Campos: `id_venta`, `id_producto`, `id_vendedor`, `fecha`, `cantidad`, `monto_total`.


```sql
-- BASE DE DATOS : ventas_global
-- Tabla sucursales
CREATE TABLE sucursales (
    id_sucursal SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    ubicacion VARCHAR(100) NOT NULL
);

-- Tabla productos
CREATE TABLE productos (
    id_producto SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    precio NUMERIC(10, 2) NOT NULL
);

-- Tabla vendedores
CREATE TABLE vendedores (
    id_vendedor SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    id_sucursal INT NOT NULL REFERENCES sucursales(id_sucursal)
);

-- Tabla ventas
CREATE TABLE ventas (
    id_venta SERIAL PRIMARY KEY,
    id_producto INT NOT NULL REFERENCES productos(id_producto),
    id_vendedor INT NOT NULL REFERENCES vendedores(id_vendedor),
    fecha DATE NOT NULL,
    cantidad INT NOT NULL,
    monto_total NUMERIC(10, 2) NOT NULL
);

INSERT INTO sucursales (nombre, ubicacion) VALUES
('Sucursal Norte', 'Ciudad de México'),
('Sucursal Sur', 'Guadalajara'),
('Sucursal Este', 'Monterrey'),
('Sucursal Oeste', 'Puebla');

INSERT INTO productos (nombre, categoria, precio) VALUES
('Laptop X', 'Electrónica', 15000.00),
('Smartphone Z', 'Electrónica', 8000.00),
('Tablet A', 'Electrónica', 5000.00),
('Mouse Y', 'Accesorios', 300.00),
('Teclado Q', 'Accesorios', 500.00),
('Monitor W', 'Electrónica', 7000.00),
('Cargador R', 'Accesorios', 200.00),
('Audífonos T', 'Accesorios', 1200.00),
('Impresora U', 'Electrónica', 2500.00),
('Router V', 'Electrónica', 1500.00);


INSERT INTO vendedores (nombre, apellido, id_sucursal) VALUES
('Carlos', 'Pérez', 1),
('Ana', 'Gómez', 1),
('Luis', 'Martínez', 2),
('Sofía', 'López', 2),
('Juan', 'Hernández', 3),
('María', 'Ramírez', 3),
('Pedro', 'Alvarez', 4),
('Laura', 'Torres', 4);

INSERT INTO ventas (id_producto, id_vendedor, fecha, cantidad, monto_total) VALUES
(1, 1, '2024-11-11', 1, 15000.00), -- Laptop X, Carlos
(2, 1, '2024-11-12', 2, 16000.00), -- Smartphone Z, Carlos
(3, 2, '2024-11-13', 1, 5000.00),  -- Tablet A, Ana
(4, 2, '2024-11-14', 6, 1800.00),  -- Mouse Y, Ana
(5, 3, '2024-11-15', 3, 1500.00),  -- Teclado Q, Luis
(6, 3, '2024-11-16', 2, 14000.00), -- Monitor W, Luis
(7, 4, '2024-11-17', 7, 1400.00),  -- Cargador R, Sofía
(8, 4, '2024-11-18', 6, 7200.00),  -- Audífonos T, Sofía
(9, 5, '2024-11-19', 4, 10000.00), -- Impresora U, Juan
(10, 6, '2024-11-20', 5, 7500.00), -- Router V, María
(1, 1, '2024-11-21', 1, 15000.00), -- Laptop X, Carlos
(2, 1, '2024-11-22', 2, 16000.00), -- Smartphone Z, Carlos
(3, 2, '2024-11-23', 1, 5000.00),  -- Tablet A, Ana
(4, 2, '2024-11-24', 6, 1800.00),  -- Mouse Y, Ana
(5, 3, '2024-11-25', 3, 1500.00),  -- Teclado Q, Luis
(6, 3, '2024-11-26', 2, 14000.00), -- Monitor W, Luis
(7, 4, '2024-11-27', 7, 1400.00),  -- Cargador R, Sofía
(8, 4, '2024-11-28', 6, 7200.00),  -- Audífonos T, Sofía
(9, 5, '2024-11-29', 4, 10000.00), -- Impresora U, Juan
(10, 6, '2024-11-30', 5, 7500.00); -- Router V, María
```
