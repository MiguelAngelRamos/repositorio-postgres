```sql
-- Obtener el historial de tratamientos de un paciente específico

select 
	t.tratamiento_id,
	t.tratamiento_nombre,
	t.dosis,
	t.duracion_dias,
	t.fecha_inicio,
	c.fecha as fecha_cita,
	m.nombre as nombre_medico,
	e.especialidad_nombre as especialidad_medico
from 
	tratamientos t 
inner join 
	citas c on t.cita_id = c.cita_id
inner join 
	pacientes p on c.paciente_id = p.paciente_id
inner join 
    medicos m on c.medico_id = m.medico_id
inner join 
    especialidades e on m.especialidad_id = e.especialidad_id
where 
    p.paciente_id = 2;

-- Listar todas las citas "pendientes" junto con la información de paciente(nombre, telefono) y médico (nombre, especialidad)
select * from citas;

select * from pacientes p;

select * from medicos;

select
    c.cita_id,
    c.fecha as fecha_cita,
    c.duracion,
	p.nombre as nombre_paciente,
	p.telefono as numero_de_telefono,
	m.nombre as nombre_medico,
	e.especialidad_nombre especialidad_medico
from
	citas c
inner join pacientes p on
	(c.paciente_id = p.paciente_id)
inner join medicos m on
	(c.medico_id = m.medico_id)
inner join especialidades e on
	(m.especialidad_id = e.especialidad_id)
where
	c.estado = 'Pendiente'
order by 
    c.fecha desc;


-- Calculemos el numero de citas atentidas (estado = Realizada) por cada médico en el mes de noviembre del 2024

select * from citas;


select
	m.nombre as nombre_medico,
	count(c.cita_id) as numero_atendidos
from
	medicos m
join citas c on
	(c.medico_id = m.medico_id
	and c.estado = 'Realizada'
	and c.fecha between '2024-11-01' and '2024-11-30')
group by
	m.nombre;

-- Calculemos el numero de citas atentidas (estado = Realizada) por cada médico en el mes de noviembre del 2024
select  
	m.medico_id,
	m.nombre as nombre_medico,
	e.especialidad_nombre as especialidad_nombre,
	count(c.cita_id) as total_citas_antentidas
from 
	citas c
join 
    medicos m on c.medico_id = m.medico_id
join 
    especialidades e on m.especialidad_id = e.especialidad_id
where 
    c.estado = 'Realizada'
    and c.fecha >= '2024-11-01' and c.fecha < '2024-12-01'
group by
    m.medico_id, m.nombre, e.especialidad_nombre;


-- Calcular la cantidad de citas por mes
-- DATE_TRUNC()
select 
	date_trunc('month', fecha) as mes,
	count(*) as total_citas
from citas
group by 
 	date_trunc('month', fecha)
order by mes asc;

-- Obtener las Citas canceladas por mes 

select * from citas;

select
	to_char(date_trunc('month', fecha), 'YYYY-MM') as mes,
	count (*) as total_citas
from
	citas
where
	estado = 'Cancelada'
group by
	date_trunc ('month', fecha)
order by
	mes;
```