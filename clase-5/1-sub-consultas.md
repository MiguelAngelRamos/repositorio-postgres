## SUB-CONSULTAS de la Base de datos "clinica"


```sql
-- Obtener todos los pacientes, incluso aquellos que no tienen citas programadas
-- Left Join
-- paciente, citas, medicos
select * from pacientes;
select * from citas;

select p.nombre, m.nombre nombre_medico, c.fecha cita_fecha, c.duracion cita_duracion, c.estado cita_estado
from pacientes p
left join citas c on c.paciente_id  = p.paciente_id
left join medicos m on c.medico_id = m.medico_id;
 
select
	p.nombre,
	c.cita_id,
	m.nombre
from
	pacientes p
	left join citas c on c.paciente_id = p.paciente_id
	left join medicos m on m.medico_id  = c.medico_id;

-- Right Join  Obtener todas las citas incluso si no tienen un paciente asignado

select 
	c.cita_id,
	c.fecha,
	c.estado,
	p.nombre as nombre_paciente
from 
	citas c 
right join 
	pacientes p on c.paciente_id = p.paciente_id;

select * from citas;
select * from tratamientos t ;

-- Obtener todas las citas y mostrar sus tramientos si existen, nombre paciente y medico de la cita.

select 
 c.cita_id,
 c.fecha,
 c.estado,
 p.nombre as nombre_paciente,
 m.nombre as nombre_medico,
 t.tratamiento_nombre,
 t.dosis,
 t.duracion_dias 
from 
	citas c
left join 
    tratamientos t on c.cita_id = t.cita_id
left join 
	pacientes p on c.paciente_id = p.paciente_id
left join 
    medicos m on c.medico_id = m.medico_id;

-- Obtener los pacientes que tienen una cita Realizada
select paciente_id from citas where estado = 'Realizada';


select
	nombre
from 
	pacientes
where
	paciente_id in (
	select
		paciente_id
	from
		citas
	where
		estado = 'Realizada'
);
  
-- Encontrar el medico con mas citas asignadas
select * from citas;

select medico_id, count(*) as total_citas 
from citas
group by medico_id;

select
	nombre as nombre_medico,
	total_citas
from
	(
	select
		medico_id,
		count(*) as total_citas
	from
		citas
	group by
		medico_id) as citas_por_medico
inner join medicos on
	medicos.medico_id = citas_por_medico.medico_id
order by
	total_citas desc;


select max(a.cantidad_citas) cantidad_citas, a.medico_nombre
from (
	select count (*) cantidad_citas,
		m.nombre medico_nombre
	from
		citas c
	inner join medicos m on c.medico_id = m.medico_id
	group by m.nombre
) a
group by medico_nombre;
 
-- Vasco Contreras
SELECT
    m.nombre AS medico_nombre,
    COUNT(c.cita_id) AS total_citas
FROM
    medicos m
JOIN
    citas c ON m.medico_id = c.medico_id
GROUP BY
    m.medico_id
HAVING
    COUNT(c.cita_id) = (
        SELECT MAX(total_citas)
        FROM (
            SELECT
                m2.medico_id,
                COUNT(c2.cita_id) AS total_citas
            FROM
                medicos m2
            JOIN
                citas c2 ON m2.medico_id = c2.medico_id
            GROUP BY
                m2.medico_id
        ) AS subquery
 );

-- Eduardo 
select
	m.nombre,
	total_citas
from
	medicos m
inner join (
	select
	count(*) total_citas,
	medico_id
	from
	citas
	group by
		medico_id
				) as tot_cita on
	m.medico_id = tot_cita.medico_id
where
	total_citas = (
	select
		max(total_citas)
	from 	
	(
		select
		count(*) total_citas,
		medico_id
		from
		citas
		group by
			medico_id
		));

```