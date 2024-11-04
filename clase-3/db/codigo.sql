CREATE TABLE pacientes (
    paciente_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    genero CHAR(1) CHECK (genero IN ('M', 'F')),
    telefono VARCHAR(15)
);

CREATE TABLE especialidades (
    especialidad_id SERIAL PRIMARY KEY,
    especialidad_nombre VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE medicos (
    medico_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    especialidad_id INT REFERENCES especialidades(especialidad_id),
    fecha_ingreso DATE NOT NULL
);

CREATE TABLE citas (
    cita_id SERIAL PRIMARY KEY,
    paciente_id INT REFERENCES pacientes(paciente_id),
    medico_id INT REFERENCES medicos(medico_id),
    fecha TIMESTAMP NOT NULL,
    duracion INTERVAL DEFAULT INTERVAL '30 minutes',
    estado VARCHAR(20) CHECK (estado IN ('Pendiente', 'Realizada', 'Cancelada'))
);


CREATE TABLE tratamientos (
    tratamiento_id SERIAL PRIMARY KEY,
    cita_id INT REFERENCES citas(cita_id),
    tratamiento_nombre VARCHAR(100) NOT NULL,
    dosis VARCHAR(50),
    duracion_dias INT CHECK (duracion_dias > 0),
    fecha_inicio DATE NOT NULL
);

INSERT INTO especialidades (especialidad_nombre) VALUES
('Cardiología'),
('Dermatología'),
('Pediatría'),
('Neurología'),
('Ginecología'),
('Odontología'),
('Oftalmología'),
('Psicología'),
('Reumatología'),
('Traumatología'),
('Endocrinología'),
('Gastroenterología'),
('Neumología'),
('Urología'),
('Oncología'),
('Nefrología'),
('Infectología'),
('Hematología'),
('Alergología'),
('Otorrinolaringología');


INSERT INTO pacientes (nombre, fecha_nacimiento, genero, telefono) VALUES
('Ana Pérez', '1990-04-15', 'F', '555-1234'),
('Carlos Gómez', '1985-07-20', 'M', '555-5678'),
('María López', '1995-12-10', 'F', '555-8765'),
('José Martínez', '1978-02-25', 'M', '555-4321'),
('Lucía Sánchez', '2000-11-30', 'F', '555-2233'),
('Juan Ramírez', '1992-06-18', 'M', '555-3344'),
('Sofía Torres', '1988-09-22', 'F', '555-4455'),
('Miguel Morales', '1975-05-10', 'M', '555-5566'),
('Laura Flores', '1983-01-28', 'F', '555-6677'),
('Alberto Castillo', '1991-03-15', 'M', '555-7788'),
('Carolina Ruiz', '1986-07-04', 'F', '555-8899'),
('Roberto Díaz', '1993-10-12', 'M', '555-9900'),
('Valeria Medina', '1982-02-22', 'F', '555-1011'),
('Pablo Fernández', '1997-12-05', 'M', '555-2022'),
('Daniela Ortega', '1990-05-17', 'F', '555-3033'),
('Luis Fuentes', '1981-08-09', 'M', '555-4044'),
('Elena García', '1989-11-01', 'F', '555-5055'),
('Javier Peña', '1994-06-06', 'M', '555-6066'),
('Gabriela Ríos', '1996-03-30', 'F', '555-7077'),
('Francisco Soto', '1984-09-13', 'M', '555-8088');


INSERT INTO medicos (nombre, especialidad_id, fecha_ingreso) VALUES
('Dr. Juan García', 1, '2020-01-01'),
('Dr. Luis Hernández', 2, '2019-06-15'),
('Dra. Paula Muñoz', 3, '2018-03-10'),
('Dr. Tomás Navarro', 4, '2021-08-20'),
('Dra. Marta Pérez', 5, '2017-02-25'),
('Dr. Fernando López', 6, '2016-12-12'),
('Dr. Claudia Herrera', 7, '2019-11-14'),
('Dra. Teresa Díaz', 8, '2020-04-18'),
('Dr. Jorge Vargas', 9, '2021-05-06'),
('Dra. Sofía Luna', 10, '2018-09-01'),
('Dr. Alejandro Ruiz', 11, '2020-03-22'),
('Dra. Carmen Soto', 12, '2015-07-30'),
('Dr. Roberto Espinoza', 13, '2019-02-27'),
('Dra. Andrea Martínez', 14, '2021-06-11'),
('Dr. Héctor Sánchez', 15, '2017-10-09'),
('Dra. Patricia Rivera', 16, '2016-05-13'),
('Dr. Guillermo Torres', 17, '2020-12-01'),
('Dra. Julia Moreno', 18, '2019-08-08'),
('Dr. Víctor Jiménez', 19, '2021-02-20'),
('Dra. Mariana Castillo', 20, '2018-11-03');


INSERT INTO citas (paciente_id, medico_id, fecha, duracion, estado) VALUES
(1, 1, '2024-11-10 09:00:00', INTERVAL '30 minutes', 'Pendiente'),
(2, 2, '2024-11-11 11:30:00', INTERVAL '30 minutes', 'Realizada'),
(3, 3, '2024-11-12 14:00:00', INTERVAL '30 minutes', 'Cancelada'),
(4, 4, '2024-11-13 16:15:00', INTERVAL '45 minutes', 'Pendiente'),
(5, 5, '2024-11-14 10:00:00', INTERVAL '30 minutes', 'Realizada'),
(6, 6, '2024-11-15 13:30:00', INTERVAL '30 minutes', 'Pendiente'),
(7, 7, '2024-11-16 15:00:00', INTERVAL '30 minutes', 'Cancelada'),
(8, 8, '2024-11-17 09:45:00', INTERVAL '45 minutes', 'Pendiente'),
(9, 9, '2024-11-18 10:30:00', INTERVAL '30 minutes', 'Realizada'),
(10, 10, '2024-11-19 14:15:00', INTERVAL '30 minutes', 'Pendiente'),
(11, 11, '2024-11-20 11:00:00', INTERVAL '30 minutes', 'Cancelada'),
(12, 12, '2024-11-21 12:30:00', INTERVAL '30 minutes', 'Realizada'),
(13, 13, '2024-11-22 16:00:00', INTERVAL '45 minutes', 'Pendiente'),
(14, 14, '2024-11-23 13:00:00', INTERVAL '30 minutes', 'Pendiente'),
(15, 15, '2024-11-24 09:00:00', INTERVAL '30 minutes', 'Realizada'),
(16, 16, '2024-11-25 11:45:00', INTERVAL '30 minutes', 'Pendiente'),
(17, 17, '2024-11-26 14:30:00', INTERVAL '30 minutes', 'Cancelada'),
(18, 18, '2024-11-27 10:15:00', INTERVAL '30 minutes', 'Realizada'),
(19, 19, '2024-11-28 15:30:00', INTERVAL '45 minutes', 'Pendiente'),
(20, 20, '2024-11-29 12:00:00', INTERVAL '30 minutes', 'Realizada');


INSERT INTO tratamientos (cita_id, tratamiento_nombre, dosis, duracion_dias, fecha_inicio) VALUES
(1, 'Ibuprofeno', '200mg cada 8 horas', 5, '2024-11-10'),
(2, 'Paracetamol', '500mg cada 6 horas', 7, '2024-11-11'),
(3, 'Amoxicilina', '250mg cada 8 horas', 10, '2024-11-12'),
(4, 'Omeprazol', '20mg antes de desayunar', 14, '2024-11-13'),
(5, 'Anticonceptivos', 'Una diaria', 28, '2024-11-14'),
(6, 'Enjuague bucal', 'Dos veces al día', 14, '2024-11-15'),
(7, 'Gotas para ojos', 'Una gota cada 4 horas', 7, '2024-11-16'),
(8, 'Terapia psicológica', 'Una sesión semanal', 8, '2024-11-17'),
(9, 'Analgésicos', 'Según dolor', 5, '2024-11-18'),
(10, 'Fisioterapia', 'Tres sesiones semanales', 4, '2024-11-19'),
(11, 'Insulina', 'Según indicación médica', 30, '2024-11-20'),
(12, 'Antiácidos', 'Después de cada comida', 10, '2024-11-21'),
(13, 'Inhalador', 'Según necesidad', 15, '2024-11-22'),
(14, 'Ejercicios pélvicos', 'Diarios', 21, '2024-11-23'),
(15, 'Quimioterapia', 'Según protocolo', 60, '2024-11-24'),
(16, 'Diálisis', 'Tres veces por semana', 30, '2024-11-25'),
(17, 'Antivirales', 'Según prescripción', 14, '2024-11-26'),
(18, 'Suplementos de hierro', 'Una diaria', 30, '2024-11-27'),
(19, 'Antihistamínicos', 'Una cada 12 horas', 10, '2024-11-28'),
(20, 'Antibiótico tópico', 'Aplicar en zona afectada', 7, '2024-11-29');
