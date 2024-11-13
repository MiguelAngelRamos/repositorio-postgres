## Procedimiento que retorna un valor

Nombre de la base de datos : ventas_db

```sql
-- Tabla de Clientes
CREATE TABLE clientes (
    cliente_id SERIAL PRIMARY KEY,       
    nombre VARCHAR(100) NOT NULL,       
    email VARCHAR(100) UNIQUE NOT NULL   
);

-- Tabla de Ventas
CREATE TABLE ventas (
    venta_id SERIAL PRIMARY KEY,        
    cliente_id INT REFERENCES clientes(cliente_id), 
    monto DECIMAL(10, 2) NOT NULL,       
    fecha_venta DATE DEFAULT CURRENT_DATE 
);

-- Insertar datos en la tabla de clientes
INSERT INTO clientes (nombre, email) VALUES
('Carlos Perez', 'carlos.perez@ventas.com'),
('Ana Gomez', 'ana.gomez@ventas.com');

-- Insertar datos en la tabla de ventas
INSERT INTO ventas (cliente_id, monto) VALUES
(1, 100.50),  -- Venta del cliente 1
(1, 200.75),  -- Venta del cliente 1
(2, 300.00);  -- Venta del cliente 2
```

## Ejemplo  de store produce 

```sql
create or replace procedure obtener_total_ventas(p_cliente_id int, out total_ventas decimal)
language plpgsql
as $$
	begin
		select coalesce(sum(monto), 0) into total_ventas from ventas where cliente_id = p_cliente_id;
    end;
$$;

do $$
declare 
   resultado decimal;
begin
	call obtener_total_ventas(1, resultado);
    raise notice 'El total de ventas del cliente es %', resultado;
end;
$$
```