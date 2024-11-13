```sql
-- Tabla de Estudiantes
CREATE TABLE estudiantes (
    estudiante_id SERIAL PRIMARY KEY,  
    nombre VARCHAR(100) NOT NULL,       
    email VARCHAR(100) UNIQUE NOT NULL  
);

-- Tabla de Cursos
CREATE TABLE cursos (
    curso_id SERIAL PRIMARY KEY,        
    nombre VARCHAR(100) NOT NULL,       
    cupos_disponibles INT NOT NULL      
);

-- Tabla de Inscripciones
CREATE TABLE inscripciones (
    inscripcion_id SERIAL PRIMARY KEY,   
    estudiante_id INT REFERENCES estudiantes(estudiante_id), -- Relación con estudiantes
    curso_id INT REFERENCES cursos(curso_id),               -- Relación con cursos
    fecha_inscripcion DATE DEFAULT CURRENT_DATE             -- Fecha de inscripción
);

-- Insertar datos en la tabla de estudiantes
INSERT INTO estudiantes (nombre, email) VALUES
('Juan Perez', 'juan.perez@correo.com'),
('Maria Lopez', 'maria.lopez@correo.com'),
('Carlos Diaz', 'carlos.diaz@correo.com'),
('Ana Gomez', 'ana.gomez@correo.com'),
('Luis Rojas', 'luis.rojas@correo.com'),
('Lucia Sanchez', 'lucia.sanchez@correo.com'),
('Fernando Torres', 'fernando.torres@correo.com'),
('Carla Ruiz', 'carla.ruiz@correo.com'),
('Miguel Fernandez', 'miguel.fernandez@correo.com'),
('Rosa Ortega', 'rosa.ortega@correo.com');

-- Insertar datos en la tabla de cursos
INSERT INTO cursos (nombre, cupos_disponibles) VALUES
('Matemáticas', 5),
('Historia', 3),
('Ciencias', 4),
('Literatura', 2),
('Física', 5),
('Química', 3),
('Inglés', 4),
('Biología', 3),
('Educación Física', 6),
('Arte', 2);

```

```sql
create or replace procedure inscribir_estudiante(p_estudiante_id INT, p_curso_id INT)
language plpgsql
as $$
declare
	cupos INT;
    inscrito INT;
begin
	-- Verificar si el estudiante ya está inscrito en algun curso
      select count(*) into inscrito from inscripciones where estudiante_id = p_estudiante_id AND curso_id = p_curso_id;
	  
      if inscrito > 0 THEN
        raise notice 'El estudiante % ya está inscrito en el curso %', p_estudiante_id, p_curso_id;
        return; -- Se salga del procedimiento
      end if;
      -- Obtener el numero de cupos disponible del curso
      select cupos_disponibles into cupos from cursos where curso_id = p_curso_id;

      if cupos <= 0 then
         raise notice 'No hay cupos disponibles para el curso %', p_curso_id;
         return;
      end if;
     
      -- Registramos la inscripción
      insert into inscripciones (estudiante_id, curso_id) values (p_estudiante_id, p_curso_id);
      -- Actualizar el cupo del curso
      update cursos set cupos_disponibles = cupos_disponibles - 1 where curso_id = p_curso_id;
      -- Mensaje de Exito
      raise notice 'Inscripción exitosa para el estudiante % en el curso %', p_estudiante_id, p_curso_id;
exception 
      when others then
      raise notice 'Error inesperado al realizar la inscripcion en procedimiento';
      raise;
end;
$$;

select * from cursos;
call inscribir_estudiante(1,2);

```