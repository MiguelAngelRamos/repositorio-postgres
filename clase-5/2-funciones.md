```sql
-- Tabla Users
create table users (
  id serial primary key,
  username varchar(50) not null,
  email varchar(100) not null unique,
  create_at timestamp default current_timestamp
);

FUNCTION create_user(p_username varchar, p_email varchar)
RETURNS VOID AS $$ 
  BEGIN
    insert into users(username, email) values (p_username, p_email)
  END;
$$ LANGUAGE plpgsql;
```