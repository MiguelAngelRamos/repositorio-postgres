## Ejercicio

La empresa **GlobalTech** desea analizar el rendimiento de sus empleados en términos de productividad y eficiencia. Para ello, ha recopilado datos sobre el número de proyectos completados y las horas trabajadas por cada empleado. La empresa quiere:

- Asignar a los empleados un **rango** basado en el número de proyectos completados.
- Determinar el **rango denso** (`DENSE_RANK`) de los empleados según las horas trabajadas.
- Dividir a los empleados en **cuartiles** usando la función `NTILE(4)` basándose en su eficiencia (proyectos completados por hora trabajada).
- Calcular la **desviación estándar** de la eficiencia para analizar la variabilidad entre empleados.


```sql
CREATE TABLE empleado (
    empleado_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    departamento VARCHAR(50) NOT NULL,
    proyectos_completados INT NOT NULL,
    horas_trabajadas INT NOT NULL
);

INSERT INTO empleado (nombre, departamento, proyectos_completados, horas_trabajadas) VALUES
('Ana López', 'Desarrollo', 15, 160),
('Luis Martínez', 'Marketing', 12, 150),
('Carlos Gómez', 'Desarrollo', 18, 170),
('María Rodríguez', 'Ventas', 10, 140),
('José Fernández', 'Marketing', 14, 155),
('Laura Sánchez', 'Desarrollo', 20, 180),
('David Jiménez', 'Ventas', 9, 130),
('Marta Díaz', 'Desarrollo', 17, 165),
('Jorge Pérez', 'Marketing', 13, 145),
('Lucía Morales', 'Ventas', 11, 135),
('Sofía Romero', 'Desarrollo', 16, 160),
('Diego Torres', 'Marketing', 15, 150),
('Isabel Ruiz', 'Ventas', 8, 125),
('Pedro Castillo', 'Desarrollo', 19, 175),
('Elena Blanco', 'Marketing', 12, 140),
('Raúl Gómez', 'Ventas', 10, 130),
('Carolina Vázquez', 'Desarrollo', 14, 160),
('Fernando Herrera', 'Marketing', 13, 150),
('Sandra Gil', 'Ventas', 9, 120),
('Alberto Cruz', 'Desarrollo', 18, 170);

```