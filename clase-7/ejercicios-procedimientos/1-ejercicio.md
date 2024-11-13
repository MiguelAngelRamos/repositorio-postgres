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