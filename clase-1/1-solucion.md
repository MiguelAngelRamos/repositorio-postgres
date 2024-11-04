## Solucion

```sql
-- Crear la base de datos
CREATE DATABASE biblioteca_saber;

-- Crear la tabla libros
CREATE TABLE libros (
    id SERIAL PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    autor VARCHAR(255) NOT NULL,
    genero VARCHAR(100) NOT NULL,
    fecha_publicacion DATE
);

-- Crear: Agregar un nuevo libro
INSERT INTO libros (titulo, autor, genero, fecha_publicacion)
VALUES ('El Principito', 'Antoine de Saint-Exupéry', 'Ficción', '1943-04-06');

-- Leer: Ver todos los libros disponibles
SELECT * FROM libros;

-- Leer: Consultar un libro específico por su ID
SELECT * FROM libros WHERE id = 1;

-- Actualizar: Modificar la información de un libro existente
UPDATE libros
SET titulo = 'El Principito (Edición Revisada)', autor = 'Antoine de Saint-Exupéry'
WHERE id = 1;

-- Eliminar: Borrar un libro del inventario por su ID
DELETE FROM libros WHERE id = 1;

```