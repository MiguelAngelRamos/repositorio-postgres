```sql
select * from users where country like '%Island%';

-- Buscar usuarios que comiezen con una letra especifica 'A'
select * from users where first_name like 'S%';

-- Buscar usuarios con correos eletronicos que terminen con .com
select * from users where email like '%.com';

select count(*) as cantidad_usuarios from users where email like '%google.com';

/*
CASE 
    WHEN condicion1 THEN resultado1
    WHEN condicion2 THEN resultado2
    ELSE resultado_por_default
END 
*/

select username from users;

select 
	username, followers,
	case 
		when followers >= 4500 then 'Alta'
		when followers >= 2000 and followers < 4500 then 'Media'
		else 'Baja'
	end as categoria_followers
from users;


-- sawdadmuh.ga
-- ahrer.iq
-- google.com
select 
	case 
		when email like '%google.com' then 'google.com'
		when email like '%ahrer.iq' then 'ahrer.iq'
		when email like '%sawdadmuh.ga' then 'sawdadmuh.ga'
		else 'other'
	end as domain,
	count(*) as user_count
from users
group by domain
order by user_count desc;


SELECT
    COUNT(*) AS total,
    COUNT(CASE WHEN email LIKE '%@sawdadmuh.ga' THEN 1 END) AS count_sawdadmuh_ga,
    COUNT(CASE WHEN email LIKE '%@ahrer.iq' THEN 1 END) AS count_ahrer_iq,
    COUNT(CASE WHEN email LIKE '%@google.com' THEN 1 END) AS count_google_com
FROM users
HAVING
    COUNT(CASE WHEN email LIKE '%@sawdadmuh.ga' THEN 1 END) > 0 OR
    COUNT(CASE WHEN email LIKE '%@ahrer.iq' THEN 1 END) > 0 OR
    COUNT(CASE WHEN email LIKE '%@google.com' THEN 1 END) > 0;
```