```sql
-- Crear una base de datos proyectos_db
-- Tabla de empleados
create table employees (
    employee_id serial primary key, -- ID único para cada empleado
    name varchar(100) not null,     -- Nombre del empleado
    position varchar(50) not null  -- Puesto o rol del empleado
);

-- Tabla de proyectos
create table projects (
    project_id serial primary key, -- ID único para cada proyecto
    project_name varchar(100) not null, -- Nombre del proyecto
    start_date date not null,           -- Fecha de inicio del proyecto
    end_date date not null              -- Fecha de finalización del proyecto
);

-- Tabla de asignaciones de empleados a proyectos
create table employee_projects (
    assignment_id serial primary key,         -- ID único para cada asignación
    employee_id int not null references employees(employee_id), -- ID del empleado
    project_id int not null references projects(project_id),    -- ID del proyecto
    assigned_date timestamp default current_timestamp,          -- Fecha de asignación
    unique (employee_id, project_id)                            -- Evita duplicar asignaciones
);
```