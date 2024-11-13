```sql
-- Tabla de Autores
CREATE TABLE autores (
    autor_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    nacionalidad VARCHAR(50)
);

-- Tabla de Libros
CREATE TABLE libros (
    libro_id SERIAL PRIMARY KEY,
    titulo VARCHAR(200) NOT NULL,
    ano_publicacion INT,
    autor_id INT REFERENCES autores(autor_id)
);

-- Insertar datos en la tabla de autores
INSERT INTO autores (nombre, nacionalidad) VALUES
('Gabriel Garcia Marquez', 'Colombiana'),
('Isabel Allende', 'Chilena'),
('Mario Vargas Llosa', 'Peruana'),
('Julio Cortazar', 'Argentina'),
('Jorge Luis Borges', 'Argentina');

-- Insertar datos en la tabla de libros
INSERT INTO libros (titulo, ano_publicacion, autor_id) VALUES
('Cien años de soledad', 1967, 1),
('El amor en los tiempos del cólera', 1985, 1),
('La casa de los espíritus', 1982, 2),
('Paula', 1994, 2),
('La ciudad y los perros', 1963, 3),
('Conversación en La Catedral', 1969, 3),
('Rayuela', 1963, 4),
('Bestiario', 1951, 4),
('Ficciones', 1944, 5),
('El Aleph', 1949, 5);


-- Una función de ser solo lectura y que retorne un valor
-- Consultar cuantos libros ha escrito un autor

create or replace function contar_libros_por_autor(p_autor_id INT)
returns integer as $$
declare 
  v_cantidad_libros INT;
begin
   -- count(*)
   select count(*) into v_cantidad_libros from libros where autor_id = p_autor_id;
   return v_cantidad_libros;
end;
$$ language plpgsql;
select * from autores;
select contar_libros_por_autor(2);

```