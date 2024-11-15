## Enunciado del Ejercicio

**Contexto**: 

Una empresa ha solicitado desarrollar un sistema de gestión de inicios de sesión para su aplicación interna, la cual permitirá registrar y auditar los accesos de los usuarios de manera segura. Para cumplir con las políticas de seguridad, se necesita implementar una estructura en la base de datos que controle tanto los inicios de sesión exitosos como los intentos fallidos. Además, las contraseñas deben almacenarse de forma encriptada, y cada vez que un usuario inicia sesión, la base de datos debe registrar la fecha y hora de su último acceso.

**Objetivo del Ejercicio**:

Implementar una solución en PostgreSQL que:
1. Administre usuarios en una tabla con contraseñas encriptadas.
2. Verifique las credenciales de un usuario cuando intenta iniciar sesión.
3. Registre en una tabla separada los intentos fallidos de inicio de sesión.
4. Actualice el campo de "último inicio de sesión" (`last_login`) cada vez que el usuario se autentique correctamente.
5. Guarde los inicios de sesión exitosos en una tabla de auditoría para futuros análisis y reportes.

### Requisitos del Desarrollo

1. **Tabla de Usuarios (`user`)**:
   - Crear una tabla `user` con los siguientes campos:
     - `id`: Clave primaria que se autoincrementa.
     - `username`: Nombre de usuario, único y no nulo.
     - `password`: Contraseña encriptada usando `pgcrypto`.
     - `last_login`: Fecha y hora del último inicio de sesión, que se actualiza automáticamente en cada acceso exitoso.

2. **Encriptación de Contraseñas**:
   - Utilizar la extensión `pgcrypto` para almacenar las contraseñas de manera segura.
   - Al insertar un usuario nuevo, encriptar la contraseña usando el algoritmo `bcrypt`.

3. **Verificación de Credenciales**:
   - Crear un procedimiento almacenado llamado `user_login` que reciba `username` y `password` como parámetros y realice las siguientes acciones:
     - Verifique si las credenciales son correctas comparando la contraseña ingresada con la encriptada almacenada en la tabla `user`.
     - Si las credenciales son incorrectas, registre un intento fallido en una tabla llamada `session_failed`.
     - Si las credenciales son correctas, actualice el campo `last_login` del usuario en la tabla `user` y registre el inicio de sesión en una tabla de auditoría.

4. **Registro de Intentos Fallidos (`session_failed`)**:
   - Crear una tabla `session_failed` para almacenar los intentos de inicio de sesión fallidos, con los siguientes campos:
     - `id`: Clave primaria que se autoincrementa.
     - `username`: Nombre del usuario que intentó iniciar sesión.
     - `when`: Fecha y hora del intento fallido.

5. **Registro de Inicios de Sesión Exitosos (`session`)**:
   - Crear una tabla `session` para registrar cada inicio de sesión exitoso, con los siguientes campos:
     - `id`: Clave primaria que se autoincrementa.
     - `user_id`: Identificador del usuario que inició sesión, referenciado desde la tabla `user`.
     - `last_login`: Fecha y hora del inicio de sesión exitoso.

6. **Disparador para Registrar Inicios de Sesión**:
   - Crear un disparador que se active automáticamente cada vez que el campo `last_login` de un usuario sea actualizado. Este disparador debe:
     - Ejecutar una función que registre el inicio de sesión en la tabla `session`.

7. **Procedimiento de Login con Manejo de Excepciones**:
   - En el procedimiento `user_login`, manejar los casos en los que el usuario no existe o la actualización de `last_login` falla. En caso de error inesperado, registrar un mensaje de advertencia y permitir una futura auditoría del problema.