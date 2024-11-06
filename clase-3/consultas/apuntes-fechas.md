-- MANIPULACION DE FECHAS Y HORAS
-- Extraer el año
select extract (year from date '2024-11-04') as year;
-- Extraer el año de la fecha actual
select extract (year from now()) as current_year;

-- extract(field from source)
-- field
-- YEAR
-- MONTH
-- DAY
-- HOUR
-- MINUTE
-- SECOND

-- Calcula la edad en años desde una fecha de nacimiento

select extract(year from AGE(NOW(), DATE '1990-04-15')) as years_passed;

-- Intervalos + o -

select date '2024-11-04' + interval '1 month' as next_month;
select timestamp '2024-11-04 14:30:00' - interval '2 days' as two_days_before;

-- Zonas Horarias

select timestamp '2024-11-04 14:30:00 UTC' at time zone 'America/Mexico_City' as local_time;
-- '11:31:00-03' 


-- to_char()
select to_char(timestamp '2024-11-04 14:30:00', 'DD-MM-YYYY HH24:MI') as formatted_date;

-- Nombres Abreviados
select to_char(timestamp '2024-11-04 14:30:00', 'Mon DD, YY') as formatted_date;
-- YYYY: año completo
-- YY: Año con dos digitos
-- Mon: Nombre del mes abreviado


-- Trucamiento de fechas
-- date_trunc(field, source)

select date_trunc('month', timestamp '2024-11-04 14:30:00') as start_of_month;