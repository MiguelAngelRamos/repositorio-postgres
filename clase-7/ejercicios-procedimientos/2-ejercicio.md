### Ejercicio 2

La consultora **Optimus Projects** gestiona proyectos en los que participan distintos empleados. Cada proyecto tiene un límite de cupos, y cada empleado puede ser asignado a varios proyectos, con una restricción importante: **cada empleado solo puede estar en un máximo de 2 proyectos a la vez**. Esto permite a los empleados participar en uno o dos proyectos simultáneamente, pero no en un tercero.

**Requisitos del Sistema:**

1. La empresa tiene una lista de **empleados** con su **nombre** y **correo electrónico**.
2. Cada proyecto tiene un **nombre** y una **cantidad de cupos disponibles** para asignar empleados.
3. Se requiere un sistema para **asignar empleados a proyectos** que cumpla con las siguientes reglas:
   - Un empleado solo puede estar asignado a un máximo de 2 proyectos a la vez.
   - No se debe permitir asignar un empleado al mismo proyecto más de una vez.
   - Si el proyecto no tiene cupos disponibles, la asignación debe ser rechazada.
   - En caso de un error inesperado, se debe revertir la transacción para mantener la integridad de los datos.


1. Crear una base de datos llamada `OptimusProjectsDB`.
2. Crear tres tablas: `empleados`, `proyectos`, y `asignaciones`, con las relaciones necesarias.
3. Desarrollar un procedimiento almacenado llamado `asignar_empleado` que implemente la lógica de asignación cumpliendo con la restricción de máximo 2 proyectos por empleado, además de verificar duplicados y cupos disponibles.


```sql
-- Tabla de Empleados
CREATE TABLE empleados (
    empleado_id SERIAL PRIMARY KEY,       
    nombre VARCHAR(100) NOT NULL,        
    email VARCHAR(100) UNIQUE NOT NULL    
);

-- Tabla de Proyectos
CREATE TABLE proyectos (
    proyecto_id SERIAL PRIMARY KEY,       
    nombre VARCHAR(100) NOT NULL,         
    cupos_disponibles INT NOT NULL        
);

-- Tabla de Asignaciones (relación entre empleados y proyectos)
CREATE TABLE asignaciones (
    asignacion_id SERIAL PRIMARY KEY,               
    empleado_id INT REFERENCES empleados(empleado_id), 
    proyecto_id INT REFERENCES proyectos(proyecto_id), 
    fecha_asignacion DATE DEFAULT CURRENT_DATE         
);

-- Insertar datos en la tabla de empleados
INSERT INTO empleados (nombre, email) VALUES
('Javier García', 'javier.garcia@optimus.com'),
('Laura Pérez', 'laura.perez@optimus.com'),
('Daniela Rojas', 'daniela.rojas@optimus.com');

-- Insertar datos en la tabla de proyectos
INSERT INTO proyectos (nombre, cupos_disponibles) VALUES
('Proyecto Alpha', 2),
('Proyecto Beta', 30),
('Proyecto Gamma', 10);
```

```sql
--- Creamos un procedimiento que implemente la lógica de asignación cumpliendo con la restricción de máximo 2 proyectos por empleado, además de verificar duplicados y cupos disponibles.
 
create or replace procedure asignar_empleado(p_empleado_id int, p_proyecto_id int)
language plpgsql
as $$
declare
	asignaciones int;
	duplicados int;
	cupos int;
begin
	--- Verificar si el empleado ya tiene 2 proyectos
	select count(*) into asignaciones from asignaciones where empleado_id = p_empleado_id;
 
	if asignaciones >= 2 then
		raise notice 'El empleado % ya está asignado a 2 proyectos como máximo.', p_empleado_id;
    return;
	end if;
 
	-- Verificar duplicados
	select count(*) into duplicados from asignaciones where empleado_id = p_empleado_id and proyecto_id = p_proyecto_id;	
	
	if duplicados >0 then
		raise notice 'El empleado % ya está asignado al proyecto %.', p_empleado_id, p_proyecto_id;
		return; -- Se sale del procedimiento
	end if;
	
	-- Verificar cupos disponibles
	select cupos_disponibles into cupos from proyectos where proyecto_id = p_proyecto_id;
 
	if cupos <=0 then
		raise notice 'No hay cupos disponibles para el proyecto %.', p_proyecto_id;
		return;
	end if;
 
	-- Ingreso de la asignación de empleado al proyecto
	insert into asignaciones (empleado_id, proyecto_id) values (p_empleado_id, p_proyecto_id);
	
	-- Actualizar cupos disponibles del proyecto
	update proyectos set cupos_disponibles = cupos_disponibles - 1 where proyecto_id = p_proyecto_id;
 
	-- Mensaje de Exito
	raise notice 'Asignación exitosa para el empleado % en el proyecto %', p_empleado_id, p_proyecto_id;
 
exception
	when others then
	raise notice 'Error inesperado al realizar la asignación en procedimiento.';
	raise;
end;
$$;
```

```sql



