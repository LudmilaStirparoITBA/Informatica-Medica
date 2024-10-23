# Trabajo Práctico N°5
![image](https://github.com/user-attachments/assets/f2e54dc0-6027-4cd7-817a-a42e47570113)

## _Autoras:_ 
* Stirparo Ludmila
* Boan Natalia

## **PARTE 1:** Bases de Datos

Caso: centro médico

La base de datos esté diseñada para almacenar y gestionar información relacionada con pacientes,
médicos, recetas y consultas médicas. Su propósito es proporcionar una plataforma para registrar y
acceder a datos médicos críticos de manera eficiente y segura.

Entidades:
- Pacientes: Registra información detallada sobre los pacientes, incluyendo nombre, fecha de nacimiento y dirección.
- Médicos: Almacena detalles sobre los médicos que brindan atención médica, como nombre y especialidad.
- Medicamentos: Contiene una lista de medicamentos disponibles con detalles sobre dosis y administración.
- Consultas: Registra todas las consultas médicas realizadas, incluyendo fecha, médico y paciente involucrados, y diagnóstico.
- Recetas: Vincula pacientes con medicamentos prescritos por los médicos, incluyendo información sobre el medicamento, cantidad y frecuencia.

Considerando el caso, se debe contestar las siguientes preguntas relacionadas con la base de datos.

### 1. ¿Qué tipo de base de datos es? 

La base de datos del centro médico es, en cuanto a su estructura, de tipo relacional. Esto se debe a que almacena la información de manera estructurada y a que las entidades se relacionan entre sí. Por otro lado, según su función, la base de datos es de tipo transaccional ya que está diseñada para manejar operaciones de lectura y escritura frecuentes como registrar una nueva consulta, emitir una receta, actualizar información de pacientes, de manera eficiente y segura. 

### 2. Armar el diagrama entidad-relación de la base de datos dada. 
En primer lugar, analizamos con mayor detalle las entidades y las relaciones existentes entre ellas:
- Paciente: nombre, fecha de nacimiento, dirección.
- Médico: nombre, especialidad.
- Medicamento: nombre, dosis, administración.
- Consulta: fecha, médico, paciente, diagnóstico.
- Receta: cantidad, frecuencia, paciente, médico, medicamento.
- Relaciones entre entidades:
  - Un Paciente puede tener múltiples Consultas (relación 1 a N).
  - Un Médico puede atender múltiples Consultas (relación 1 a N).
  - Un Medicamento puede estar presente en múltiples Receta (M a N).
  - Una Consulta está asociada a un solo Paciente y a un solo Médico.
  - Una Receta está vinculada a una Consulta (1 a 1) y a un medicamento (1 a 1).

Considerando esta información, se construye el diagrama entidad-relación de la base de datos
(figura 1).

<img src="Imagenes\entidad-relacion.png" alt="ejemplo_modelo-ER" style="width:500px;"/>
Figura1: Diagrama entidad-relación de la base de datos

### 3. Armar el Modelo relacional de la base de datos dada.
El modelo relacional se obtiene a partir de la información de los puntos anterior. A continuación,
se observa el modelo:

<img src="Imagenes\modelo_relacional.png" alt="ejemplo_modelo-ER" style="width:500px;"/>
Figura 2: Modelo relacional de la base de datos

### 4. Considera que la base de datos está normalizada. En caso que no lo esté, ¿cómo podría hacerlo?

La base de datos presentada hasta el momento no está normalizada. Para ello, se tendría que realizar una serie de cambios para que cumpla con los requisitos pertinentes. En primer lugar, se podría dividir el nombre del paciente en nombre y apellido, el del médico también y la dirección en calle, altura y CP. Más allá de estos cambios, la tabla cumple con las condiciones: los datos no son redundantes, las claves Fk relacionan información sin duplicarla y cada atributo depende de su clave primaria Pk. 

## **PARTE 2:** Bases de Datos

Al igual que en el ejercicio anterior, este punto se resolverá con la base de datos de un centro médico utilizada a lo largo de las clases. La base de datos está diseñada para almacenar y gestionar información relacionada con pacientes, médicos, recetas y consultas médicas. Su propósito es proporcionar una plataforma para registrar y acceder a datos médicos críticos de manera eficiente y segura. Para resolver algunos ejercicios de este punto, utilizamos la página SQL Tutorial [1].

### 1. Cuando se realizan consultas sobre la tabla paciente agrupando por ciudad los tiempos de respuesta son demasiado largos. Proponer mediante una query SQL una solución a este problema.
En primer lugar, se realiza una búsqueda por ciudad sin modificar nada previamente, obteniendo un tiempo de respuesta de 0.12 segundos (figura 3).

<img src="Imagenes\consulta_lenta.png" alt="ejemplo_modelo-ER" style="width:500px;"/>
Figura 3: Consulta lenta

Luego, para acelerar el proceso, se realiza un índice que optimiza la búsqueda de los datos en la tabla evitando la necesidad de leer todas las filas. De esta manera, vemos en la figura 4 que el tiempo de respuesta es considerablemente menor, siento tan solo de 0.093 segundos.

<img src="Imagenes\consulta_rapida.png" alt="ejemplo_modelo-ER" style="width:500px;"/>
Figura 4: Consulta rápida

### 2. Se tiene la fecha de nacimiento de los pacientes. Se desea calcular la edad de los pacientes y almacenarla de forma dinámica en el sistema ya que es un valor típicamente consultado, junto con otra información relevante del paciente. 

La edad se puede calcular a partir de la fecha de nacimiento utilizando la función EXTRACT(YEAR FROM AGE(CURRENT_DATE, fecha_nacimiento)) AS edad tal como se observa en la figura 5.

<img src="Imagenes\edad.png" alt="ejemplo_modelo-ER" style="width:500px;"/>
Figura 5: Edad y almacenamiento dinámica

Además, se crea una función para actualizar la edad de cada paciente cuando corresponde. La
función se llama con el trigger, el cual asegura que los datos esten siempre al día aún cuando se agrega un nuevo paciente. De esta manera, queda la edad almacenada y actualizada constantemente.

### 3. La paciente, “Luciana Gómez”, ha cambiado de dirección. Antes vivía en “Avenida Las Heras 121” en “Buenos Aires”, pero ahora vive en “Calle Corrientes 500” en “Buenos Aires”. Actualizar la dirección de este paciente en la base de datos.
Utilizando Update, Set y Where se pueden actualizar los datos correspondientes donde se requiere (Figura 6).

<img src="Imagenes\update_set.png" alt="ejemplo_modelo-ER" style="width:500px;"/>
Figura 6: Actualización de la dirección de una paciente

### 4. Seleccionar el nombre y la matrícula de cada médico cuya especialidad sea identificada por el id 4.
En la figura 7 se observa el código que devuelve a los médicos cuya especialidad sea identificada por id = 4.

### 5. Puede pasar que haya inconsistencias en la forma en la que están escritos los nombres de las ciudades, ¿cómo se corrige esto? Agregar la query correspondiente.
Para corregir las inconsistencias, se pueden realizar dos estrategias distintas: actualizar a mano cada variante o generar una tabla adicional con las variantes detectadas automáticamente para luego actualizar la tabla de pacientes original. En este caso, como se observa en la figura 8, se optó por intentar la segunda opción, lo cual da como resultado 4 posibles ciudades (figura 9).

### 6. Obtener el nombre y la dirección de los pacientes que viven en Buenos Aires.
Se encuentran 8 pacientes tal como se debería.

<img src="Imagenes\especialidad4.png" alt="ejemplo_modelo-ER" style="width:500px;"/>
Figura 7: Médicos cuya especialidad sea identificada por id = 4.

<img src="Imagenes\inconsistencias1.png" alt="ejemplo_modelo-ER" style="width:500px;"/>
<img src="Imagenes\inconsistencias2.png" alt="ejemplo_modelo-ER" style="width:500px;"/>
<img src="Imagenes\inconsistencias3.png" alt="ejemplo_modelo-ER" style="width:500px;"/>
<img src="Imagenes\inconsistencias4.png" alt="ejemplo_modelo-ER" style="width:500px;"/>
Figura 8: Corrección de inconsistencias en los nombres de las ciudades.

<img src="Imagenes\inconsistenciasresultado.png" alt="ejemplo_modelo-ER" style="width:500px;"/>
Figura 9: Resultado de la corrección de inconsistencias en los nombres de las ciudades.

<img src="Imagenes\pacientes_bsas.png" alt="ejemplo_modelo-ER" style="width:500px;"/>
Figura 10: Nombre y dirección de los pacientes que viven en Buenos Aires.

### 7. Cantidad de pacientes que viven en cada ciudad.
A continuación, se observa cuántos pacientes viven en cada provincia.

<img src="Imagenes\cantidadpac.png" alt="ejemplo_modelo-ER" style="width:500px;"/>
Figura 11: Cantidad de pacientes por provincia.

### 8. Cantidad de pacientes por sexo que viven en cada ciudad.
A continuación, se observa cuántos pacientes viven en cada provincia agrupados por sexo (12).

<img src="Imagenes\pacprovsex.png" alt="ejemplo_modelo-ER" style="width:500px;"/>
Figura 12: Cantidad de pacientes por provincia agrupados por sexo.

### 9. Obtener la cantidad de recetas emitidas por cada médico.
En la figura 13 se observa la cantidad de recetas emitidas por médico, dando un total de 27 como
corresponde según la base de datos.

<img src="Imagenes\cant_recetas.png" alt="ejemplo_modelo-ER" style="width:500px;"/>
Figura 13: Cantidad de recetas emitidas por médico.

### 10. Obtener todas las consultas médicas realizadas por el médico con ID igual a 3 durante el mes de agosto de 2024.
Considerando las condiciones solicitadas, se esperaba encontrar un solo resultado tal como sucede
con el código de la figura 14.

<img src="Imagenes\medico3.png" alt="ejemplo_modelo-ER" style="width:500px;"/>
Figura 14: Cantidad de recetas emitidas por el médico con ID = 3 en agosto.

### 11. Obtener el nombre de los pacientes junto con la fecha y el diagnóstico de todas las consultas médicas realizadas en agosto del 2024.
Para obtener los datos solicitados, se debe unir las tablas pacientes y consultas mediante un
INNER JOIN. Esto se puede hacer gracias a que ambas tablas contienen id_paciente. Como resultado, se obtienen los 25 pacientes que cumplen las condiciones (figura 15).

<img src="Imagenes\innerjoin.png" alt="ejemplo_modelo-ER" style="width:500px;"/>
Figura 15: Nombre de los pacientes, fecha de consulta y diagnóstico.

### 12. Obtener el nombre de los medicamentos prescritos más de una vez por el médico con ID igual a 2.
En este caso, se unen las tablas medicamentos y recetas con INNER JOIN a través de id_medicamento, tal como se observa en la figura 16.

<img src="Imagenes\recetasmed2.png" alt="ejemplo_modelo-ER" style="width:500px;"/>
Figura 16: Nombre de los medicamentos prescritos más de una vez por el médico con ID = 2.

### 13. Obtener el nombre de los pacientes junto con la cantidad total de recetas que han recibido.
Para este punto, se unen recetas y pacientes con un INNER JOIN a través de id_paciente, dando
como resultado la cantidad de recetas que tuvo cada paciente por su nombre (figura 17).

<img src="Imagenes\pacrecetas.png" alt="ejemplo_modelo-ER" style="width:500px;"/>
Figura 17: Cantidad de recetas por paciente.

### 14. Obtener el nombre del medicamento más recetado junto con la cantidad de recetas emitidas para ese medicamento.
Para calcular cuál es el medicamento más recetado, se unen las tablas medicamentos y recetas
a través de id_medicamento. Luego, se utiliza una subquery para contar cuántas veces se recetó
cada medicamento y allí obtener el máximo. De esta manera, es posible obtener el nombre del medicamento que más fue recetado como se observa en la figura 18.

<img src="Imagenes\maxreceta.png" alt="ejemplo_modelo-ER" style="width:500px;"/>
Figura 18: Medicamento más recetado.

### 15. Obtener el nombre del paciente junto con la fecha de su última consulta y el diagnóstico asociado.
En este caso, se obtiene lo solicitiado utilizando un mecanismo similar al del punto anterior.
Primero, se unen las tablas pacientes y consultas por medio de id_paciente. Luego, se utiliza
MAX para buscar la última fecha de consulta de cada paciente, pudiendo distinguir entre varias
consultas por cada uno de ellos. El resultado se observa en la figura 19.

<img src="Imagenes\fechacons.png" alt="ejemplo_modelo-ER" style="width:500px;"/>
Figura 19: Última consulta de cada paciente.

### 16. Obtener el nombre del médico junto con el del paciente y el número de consultas realizadas por cada médico para cada paciente, ordenado por médico y paciente.
En este punto, se debe unir 3 tablas utilizando 2 INNER JOIN: pacientes, médicos y consultas. Luego, con COUNT y GROUP BY y ORDER BY se obtiene el número total de consultas ordenado por médico para cada paciente (figura 20).

<img src="Imagenes\3innerjoin.png" alt="ejemplo_modelo-ER" style="width:500px;"/>
Figura 20: Consultas ordenadas por médico por paciente.

### 17. Obtener el nombre del medicamento junto con el total de recetas prescritas, el nombre del médico que lo recetó y el nombre del paciente al que se le recetó, ordenado por total de recetas en orden descendente.
En la figura 21, se observan el nombre del medicamento por médico y paciente junto con la
cantidad prescrita.

<img src="Imagenes\medicamentocantidad.jpg" alt="ejemplo_modelo-ER" style="width:500px;"/>
Figura 21: Medicamentos prescritos.

### 18. Obtener el nombre del médico junto con el total de pacientes a los que ha atendido, ordenado por el total de pacientes en orden descendente.
A continuación, utilizando las tablas médicos y consultas se obtiene el nombre del médico y la
cantidad de pacientes que atendió, sin considerar cuántas consultas hubo por paciente (figura 22).


<img src="Imagenes\medpac.png" alt="ejemplo_modelo-ER" style="width:500px;"/>
Figura 22: Cantidad de pacientes que atendió cada médico.

