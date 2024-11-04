### Sistema de Gestión de Consultas Médicas

Se requiere diseñar una base de datos para administrar información sobre pacientes, médicos, especialidades, citas médicas y tratamientos en una clínica. A continuación, se especifican las entidades y los campos necesarios para este sistema.

#### 1. **Pacientes**
   - Debe almacenarse la información básica de cada paciente, incluyendo:
     - Un identificador único para el paciente (`paciente_id`).
     - Su nombre completo.
     - Fecha de nacimiento.
     - Género (limitado a 'M' o 'F').
     - Número de teléfono.

#### 2. **Especialidades**
   - La clínica ofrece distintas especialidades médicas. Cada especialidad debe:
     - Tener un identificador único (`especialidad_id`).
     - Un nombre único de especialidad.

#### 3. **Médicos**
   - La información de cada médico debe incluir:
     - Un identificador único (`medico_id`).
     - Nombre completo.
     - La especialidad a la que pertenece, que se debe referenciar desde la entidad de especialidades.
     - La fecha de ingreso a la clínica.

#### 4. **Citas Médicas**
   - Las citas deben ser registradas para controlar el historial de atención de cada paciente. Cada cita incluye:
     - Un identificador único para la cita (`cita_id`).
     - Referencia al paciente atendido en la cita.
     - Referencia al médico que atiende la cita.
     - Fecha y hora de la cita.
     - Duración de la cita (por defecto, 30 minutos).
     - Estado de la cita, que puede ser 'Pendiente', 'Realizada' o 'Cancelada'.

#### 5. **Tratamientos**
   - Algunos pacientes requieren tratamientos específicos después de sus citas. Los tratamientos incluyen:
     - Un identificador único (`tratamiento_id`).
     - La cita a la que está asociado el tratamiento.
     - Nombre del tratamiento.
     - Dosis (si corresponde) e instrucciones de administración.
     - Duración del tratamiento en días, asegurando que sea un valor positivo.
     - Fecha de inicio del tratamiento.
