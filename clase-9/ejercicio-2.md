### Ejercicio 2

**"Educación Digital S.A."** es una empresa que administra una plataforma de cursos en línea y necesita realizar un análisis avanzado de su base de datos para:

1. **Clasificar a los estudiantes** según su desempeño en los cursos, incluyendo rankings y análisis acumulativos.
2. **Dividir a los estudiantes en cuartiles** para identificar diferentes niveles de desempeño.
3. **Determinar los cursos más populares** y analizar tendencias de inscripción.
4. **Evaluar el crecimiento en la cantidad de inscripciones por mes** para proyecciones futuras.

## Tablas 

La base de datos se llama **educacion_digital** con las siguientes tablas normalizadas:

1. **estudiantes**:
   - Datos básicos de los estudiantes.
   - Campos: `id_estudiante`, `nombre`, `apellido`, `edad`.

2. **cursos**:
   - Información de los cursos ofrecidos.
   - Campos: `id_curso`, `nombre`, `categoria`, `duracion_horas`.

3. **instructores**:
   - Detalles de los instructores.
   - Campos: `id_instructor`, `nombre`, `apellido`, `especialidad`.

4. **inscripciones**:
   - Registra las inscripciones a los cursos.
   - Campos: `id_inscripcion`, `id_estudiante`, `id_curso`, `id_instructor`, `fecha`, `calificacion`.



```sql
-- Tabla estudiantes
CREATE TABLE estudiantes (
    id_estudiante SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    edad INT NOT NULL
);

-- Tabla cursos
CREATE TABLE cursos (
    id_curso SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    duracion_horas INT NOT NULL
);

-- Tabla instructores
CREATE TABLE instructores (
    id_instructor SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    especialidad VARCHAR(50) NOT NULL
);

-- Tabla inscripciones
CREATE TABLE inscripciones (
    id_inscripcion SERIAL PRIMARY KEY,
    id_estudiante INT NOT NULL REFERENCES estudiantes(id_estudiante),
    id_curso INT NOT NULL REFERENCES cursos(id_curso),
    id_instructor INT NOT NULL REFERENCES instructores(id_instructor),
    fecha DATE NOT NULL,
    calificacion NUMERIC(5, 2)
);


INSERT INTO estudiantes (nombre, apellido, edad) VALUES
('Carlos', 'Pérez', 22), 
('Ana', 'Gómez', 24), 
('Luis', 'Martínez', 21),
('Sofía', 'López', 23), 
('Juan', 'Hernández', 25), 
('María', 'Ramírez', 26),
('Pedro', 'Alvarez', 20), 
('Laura', 'Torres', 22), 
('Fernando', 'Castro', 27),
('Isabel', 'Ruiz', 29), 
('Antonio', 'Jiménez', 23), 
('Clara', 'Morales', 24),
('Diego', 'Vargas', 22), 
('Sara', 'Ortega', 21), 
('Roberto', 'Núñez', 28),
('Patricia', 'Mendoza', 25), 
('Ángel', 'Castillo', 22), 
('Carmen', 'Luna', 23),
('Marta', 'Figueroa', 20), 
('Gabriel', 'Paredes', 26),
('Javier', 'Serrano', 24), 
('Elena', 'García', 22);

INSERT INTO cursos (nombre, categoria, duracion_horas) VALUES
('Python para Principiantes', 'Programación', 40),
('Análisis de Datos con R', 'Estadística', 30),
('Introducción a la IA', 'Inteligencia Artificial', 50),
('SQL Avanzado', 'Bases de Datos', 25),
('Gestión de Proyectos', 'Administración', 35),
('Diseño UX/UI', 'Diseño', 45),
('Marketing Digital', 'Marketing', 20),
('React y Frontend', 'Programación', 60),
('Machine Learning', 'Inteligencia Artificial', 70),
('Big Data con Hadoop', 'Bases de Datos', 50),
('Java para Backend', 'Programación', 60),
('Ética Empresarial', 'Administración', 15),
('Inglés Técnico', 'Idiomas', 30),
('DevOps con Kubernetes', 'DevOps', 50),
('Photoshop Avanzado', 'Diseño', 40),
('Deep Learning con TensorFlow', 'Inteligencia Artificial', 80),
('Scrum para Equipos', 'Administración', 25),
('Redacción Técnica', 'Idiomas', 30),
('Power BI para Negocios', 'Análisis', 40),
('Seguridad en Redes', 'Ciberseguridad', 50);



INSERT INTO instructores (nombre, apellido, especialidad) VALUES
('Alejandro', 'García', 'Programación'),
('Lucía', 'Sánchez', 'Estadística'),
('Jorge', 'Díaz', 'Inteligencia Artificial'),
('Elena', 'Pérez', 'Bases de Datos'),
('Andrés', 'López', 'Administración'),
('Carla', 'Moreno', 'Diseño'),
('Ricardo', 'Fernández', 'Marketing'),
('Paula', 'Hernández', 'DevOps'),
('Francisco', 'Castro', 'Inteligencia Artificial'),
('Sandra', 'Mejía', 'Diseño'),
('Héctor', 'Ortiz', 'Programación'),
('Rosa', 'Morales', 'Idiomas'),
('Manuel', 'Ramírez', 'Bases de Datos'),
('María', 'Cruz', 'Marketing'),
('César', 'López', 'Ciberseguridad'),
('Valeria', 'Fuentes', 'Administración'),
('Pedro', 'Martínez', 'DevOps'),
('Lorena', 'Vargas', 'Estadística'),
('Andrés', 'Guzmán', 'Programación'),
('Ana', 'Méndez', 'Diseño');


INSERT INTO inscripciones (id_estudiante, id_curso, id_instructor, fecha, calificacion) VALUES
(1, 1, 1, '2024-01-01', 85.5),
(2, 2, 2, '2024-01-02', 78.0),
(3, 3, 3, '2024-01-03', 90.0), 
(4, 4, 4, '2024-01-04', 88.0),
(5, 5, 5, '2024-01-05', 92.0), 
(6, 6, 6, '2024-01-06', 76.0),
(7, 7, 7, '2024-01-07', 89.5), 
(8, 8, 8, '2024-01-08', 95.0),
(9, 9, 3, '2024-01-09', 77.0), 
(10, 10, 4, '2024-01-10', 82.0),
(11, 11, 1, '2024-01-11', 80.0), 
(12, 12, 2, '2024-01-12', 70.5),
(13, 13, 5, '2024-01-13', 88.0), 
(14, 14, 6, '2024-01-14', 91.0),
(15, 15, 7, '2024-01-15', 85.0), 
(16, 16, 8, '2024-01-16', 89.0),
(17, 17, 3, '2024-01-17', 92.0), 
(18, 18, 4, '2024-01-18', 94.0),
(19, 19, 1, '2024-01-19', 78.5), 
(20, 20, 2, '2024-01-20', 75.0);

INSERT INTO inscripciones (id_estudiante, id_curso, id_instructor, fecha, calificacion) VALUES
-- Carlos Pérez
(1, 2, 2, '2024-01-05', 88.0),
(1, 3, 3, '2024-01-10', 92.0),
(1, 4, 4, '2024-01-15', 84.0),

-- Ana Gómez
(2, 1, 1, '2024-01-07', 81.0),
(2, 3, 3, '2024-01-12', 85.5),
(2, 5, 5, '2024-01-17', 90.0),

-- Luis Martínez
(3, 2, 2, '2024-01-04', 88.5),
(3, 6, 6, '2024-01-09', 70.0),
(3, 7, 7, '2024-01-14', 95.0),

-- Sofía López
(4, 3, 3, '2024-01-06', 80.5),
(4, 8, 8, '2024-01-11', 89.0),
(4, 9, 3, '2024-01-16', 92.5),

-- Juan Hernández
(5, 4, 4, '2024-01-03', 88.0),
(5, 5, 5, '2024-01-08', 91.0),
(5, 10, 4, '2024-01-13', 85.5),

-- María Ramírez
(6, 1, 1, '2024-01-05', 78.0),
(6, 3, 3, '2024-01-10', 90.0),
(6, 6, 6, '2024-01-15', 84.5),

-- Pedro Alvarez
(7, 2, 2, '2024-01-06', 87.0),
(7, 8, 8, '2024-01-11', 92.0),
(7, 9, 3, '2024-01-16', 86.5),

-- Laura Torres
(8, 5, 5, '2024-01-03', 89.0),
(8, 7, 7, '2024-01-08', 80.0),
(8, 10, 4, '2024-01-13', 88.0),

-- Fernando Castro
(9, 1, 1, '2024-01-07', 82.0),
(9, 6, 6, '2024-01-12', 91.0),
(9, 8, 8, '2024-01-17', 87.5),

-- Isabel Ruiz
(10, 2, 2, '2024-01-06', 85.0),
(10, 4, 4, '2024-01-11', 90.0),
(10, 9, 3, '2024-01-16', 88.5);
```

## Consultas

```sql


-- Consulta Total de calificaciones acumuladas y ranking estudiante

select
	e.nombre as estudiante,
	e.apellido,
	sum(i.calificacion) as total_calificaciones,
	rank() over (order by sum(i.calificacion) desc ) as ranking
from
	estudiantes e
join inscripciones i on
	e.id_estudiante = i.id_estudiante
group by e.id_estudiante, e.nombre, e.apellido;

-- Consulta 2 : Obtener el Promedio de calificaciones y distribucion por cuartiles
select
	e.nombre as estudiante,
	e.apellido,
	avg(i.calificacion) as promedio_calificaciones,
	NTILE(4) over (order by avg(i.calificacion) desc ) as cuartil
from
	estudiantes e
join inscripciones i on e.id_estudiante = i.id_estudiante
group by e.id_estudiante, e.nombre, e.apellido;

-- Consulta 3 Popularidad del curso
select
	c.nombre,
	count(i.id_inscripcion) as total_inscritos,
	dense_rank() over (order by count(i.id_inscripcion) desc) as ranking
from
	cursos c
join inscripciones i on
	c.id_curso = i.id_curso
group by c.id_curso, c.nombre;


select 	c.nombre as curso_nombre,
		count(i.id_curso) cantidad_inscripciones,
		dense_rank() over (order by count(i.id_curso) desc) as popularidad_ranking,
		ntile(4) over (order by count(i.id_curso) desc) as popularidad_cuartil
from cursos c
join inscripciones i ON c.id_curso = i.id_curso
group by curso_nombre;
 
-- Ricardo Rojas
 
select
	c.nombre,
	count(i.id_estudiante) total_inscripcion,
	dense_rank() over (order by count(i.id_estudiante) desc ) as ranking
from
	cursos c
join inscripciones i on
	c.id_curso = i.id_curso
group by c.nombre;

-- Tome el numero de cursos tomados y ranking por estudiante.
-- Nombre   Apellido  Cursos tomados          Ranking
-- Richard  Stallman        10                    1 
-- Viky     Ramirez         8                     2



-- Ricardo Rojas
-- Tome el numero de cursos tomado y rankin por estudiante
-- Nombre apellido cursos_tomados ranking
-- cursos_tomados ranking
select 	e.apellido || ', ' ||  e.nombre as estudiante_nombre,
		count(i.id_inscripcion) as cursos_tomados,
		dense_rank() over (order by count(i.id_inscripcion) desc) as ranking
from estudiantes e
join inscripciones i ON e.id_estudiante = i.id_estudiante
group by estudiante_nombre;

SELECT 
    e.nombre AS estudiante, 
    e.apellido,
    COUNT(i.id_curso) AS cursos_tomados,
    DENSE_RANK() OVER (ORDER BY COUNT(i.id_curso) DESC) AS ranking
FROM estudiantes e
JOIN inscripciones i ON e.id_estudiante = i.id_estudiante
GROUP BY e.id_estudiante, e.nombre, e.apellido;


```