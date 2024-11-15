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

-- Insertar empleados
insert into employees (name, position) values
('Juan Pérez', 'Desarrollador'),
('María López', 'Diseñadora'),
('Carlos Gómez', 'Gerente');


-- Insertar proyectos
insert into projects (project_name, start_date, end_date) values
('Proyecto A', '2024-01-01', '2024-06-30'),
('Proyecto B', '2024-02-01', '2024-12-31');

-- Crear el Trigger

create or replace function check_duplicate_assignment()
returns trigger as $$
  begin 
	-- Verificar 
    if exists (select 1 from employee_projects where employee_id = new.employee_id and project_id = new.project_id) then
      raise exception 'El empleado ya está asignado a este proyecto.';
    end if;
  return new; -- Si no hay duplicados permite la inserción
  end;
$$ language plpgsql;

-- Crear trigger
create trigger trigger_check_duplicate_assigment
before insert on employee_projects
for each row
execute function check_duplicate_assignment();

select * from employees;
select * from projects;

insert into employee_projects(employee_id, project_id) values 
(1, 1),
(2, 2);

select * from employee_projects;

-- Asignación duplicada
insert into employee_projects(employee_id, project_id) values (1,1);
```