```sql

-- Crear las tablas surveys y responses
create table surveys (
	id serial primary key,
	title varchar(255) not null,
	descripcion text,
	structure JSONB
);

create table responses (
	id serial primary key,
	surveys_id INT references surveys(id),
	user_id INT,
	answers text []
);

-- ENCUESTA 1
insert into surveys (title, descripcion, structure)
values(
	'Encuesta de Satisfacción al Cliente',
	'Encuesta para evaluar la satisfacción de nuestros clientes con el servicio recibido',
	'
	{
		"title": "Encuesta de Satisfacción al Cliente",
		"questions": [
			{
			  "type": "multiple_choice",
              "text": "¿Cómo calificaria nuestro servicio?",
              "options": ["Excelente", "Bueno", "Regular", "Malo"]
			},
			{
			  "type": "rating",
              "text": "Califique su satisfacción general (1 a 5)",
              "scale": [1,2,3,4,5]
			},
			{
			  "type": "text",
              "text": "¿Alguna sugerencia para mejorar nuestro servicio?"
			}
		]
    }'
);

-- ENCUESTA 2
insert into surveys (title, descripcion, structure)
values(
	'Encuesta de síntomas COVID-19',
	'Encuesta para identificar síntomas de COVID-19',
	'
	{
		"title": "Encuesta para identificar si el paciente tiene COVID-19",
		"questions": [
			{
			  "type": "multiple_choice",
              "text": "¿Tuvo usted algún contacto cercano sin protección con alguien con COVID-19?",
              "options": ["Si", "No"]
			},
			{
			  "type": "multiple_choice",
              "text": "¿Tiene dificultad para respirar?",
              "options": ["Si", "No"]
			},
			{
			  "type": "multiple_choice",
              "text": "¿Presenta fiebre?",
              "options": ["Si", "No"]
			},
			{
			  "type": "text",
              "text": "Especifique otros síntomas que está experimentando"
			}
		]
    }'
);

-- ENCUESTA 3
insert into surveys (title, descripcion, structure)
values(
	'Encuesta de Conocimiento de la Marca',
	'Encuesta para evaluar el conocimiento de nuestra marca',
	'
	{
		"title": "Encuesta de Conocimiento de nuestra Marca",
		"questions": [
			{
			  "type": "multiple_choice",
              "text": "¿Conoce usted nuestra marca?",
              "options": ["Desconocida", "He oído de ella", "La conozco", "La uso regularmente"]
			},
			{
			  "type": "rating",
              "text": "Califique su percepción de la marca (1-5)",
              "scale": [1,2,3,4,5]
			},
			{
			  "type": "text",
              "text": "¿Dónde suele informarse sobre productos o marcas?"
			}
		]
    }'
);

-- ENCUESTA 4
insert into surveys (title, descripcion, structure)
values(
	'Encuesta de Consumo de Comida Chatarra',
	'Encuesta para determinar los hábitos de consumo de comida chatarra',
	'
	{
		"title": "Encuesta de Consumo de Comida Chatarra",
		"questions": [
			{
			  "type": "multiple_choice",
              "text": "Seleccione qué tipo de comida chatarra consume más",
              "options": ["Bebidas", "Snacks procesados", "Galletas", "Embutidos", "Dulces", "Helados"]
			},
			{
			  "type": "rating",
              "text": "Frecuencia de consumo de comida chatarra (0-10)",
              "scale": [0,1,2,3,4,5,6,7,8,9,10]
			},
			{
			  "type": "text",
              "text": "¿Cómo podría mejorar sus hábitos alimenticios?"
			}
		]
    }'
);

-- ENCUESTA 5
insert into surveys (title, descripcion, structure)
values(
	'Encuesta de Preferencia de Medios de Transporte',
	'Encuesta para analizar las preferencias de transporte en la ciudad',
	'
	{
		"title": "Encuesta de Preferencia de Medios de Transporte",
		"questions": [
			{
			  "type": "multiple_choice",
              "text": "¿Qué medio de transporte utiliza con mayor frecuencia?",
              "options": ["Auto", "Bicicleta", "Transporte público", "A pie"]
			},
			{
			  "type": "rating",
              "text": "Califique su satisfacción con su medio de transporte habitual (1-5)",
              "scale": [1,2,3,4,5]
			},
			{
			  "type": "text",
              "text": "¿Qué mejoras sugeriría para el sistema de transporte?"
			}
		]
    }'
);

-- Respuestas a encuestas

-- Respuestas a la Encuesta de Satisfacción al Cliente
insert into responses (surveys_id, user_id, answers)
values 
(1, 201, '{"Excelente", "5", "Nada que mejorar"}'),
(1, 202, '{"Bueno", "4", "Agregar más opciones de pago"}'),
(1, 203, '{"Regular", "3", "Tiempo de espera en atención"}');

-- Respuestas a la Encuesta de Síntomas COVID-19
insert into responses (surveys_id, user_id, answers)
values 
(2, 204, '{"Si", "Si", "No", "Dolor de cabeza y fiebre leve"}'),
(2, 205, '{"No", "Si", "No", "Cansancio y falta de apetito"}');

-- Respuestas a la Encuesta de Conocimiento de la Marca
insert into responses (surveys_id, user_id, answers)
values 
(3, 206, '{"La conozco", "4", "Redes sociales"}'),
(3, 207, '{"Desconocida", "1", "Boca a boca"}');

-- Respuestas a la Encuesta de Consumo de Comida Chatarra
insert into responses (surveys_id, user_id, answers)
values 
(4, 208, '{"Snacks procesados", "7", "Comer más frutas y verduras"}'),
(4, 209, '{"Helados", "5", "Reducir consumo de azúcar"}');

-- Respuestas a la Encuesta de Preferencia de Medios de Transporte
insert into responses (surveys_id, user_id, answers)
values 
(5, 210, '{"Transporte público", "3", "Mayor frecuencia y menos aglomeración"}'),
(5, 211, '{"Bicicleta", "4", "Más ciclovías"}');
```