<h1 align="center"> 
  Kiosks Data Base
  <em> (KiosksDB) </em>
</h1>

<ins> Curso</ins>: SQL <ins> Comisión</ins>: 53175

<ins> Nombre del alumno</ins>: Vazquez Velasquez, Henry José

<h2 align="center">
  <ins> Temática de la Base de Datos</ins>
</h2>

La temática es para un Sistema de Base de Datos que usarán varios locales de 
mercadería (kioscos) donde se pueden ingresar los productos que se adquieren para 
ponerlos a la venta, crear las facturas automáticamente desde el programa y generar 
estadísticas que sirvan para mejorar el rendimiento de los locales.

<h2 align="center">
  <ins> Objetivo de la Base de Datos</ins>
</h2>

El objetivo es almacenar los datos más importantes del negocio para gestionarlo y 
generar procedimientos automáticos que permitan agilizar la realización de compras y 
ventas de los locales de manera que sea escalable y eficiente.

<h2 align="center">
  <ins> Modelo de Negocio</ins>
</h2>

La manera básica de comerciar para los kioscos es que se compren diversos productos a 
un precio más barato del que se venden, además de recopilar información del local, del 
cliente, del producto, entre otros; para crear una factura con toda la información 
relacionada a la venta de un producto.

<h2 align="center">
  <ins> Índice de Página</ins>
</h2>

<p align="center"> 
(Presione en uno de los nombres de las tablas o en la opción del 
DER para ir directamente a esa sección de la página)
</p>

+ Diagrama Entidad - Relación (DER)
  
+ Descripción de las Tablas
  1. Tabla Categorías de Factura
  2. Tabla Clientes
  3. Tabla Dueños de los Kioscos
  4. Tabla Kioscos
  5. Tabla Empleados
  6. Tabla Métodos de Pago
  7. Tabla Productos
  8. Tabla Facturas
  9. Tabla Cuotas con Crédito
  10. Tabla Historial de Clientes
  11. Tabla Historial de Empleados
  12. Tabla Historial de Productos
  13. Tabla Historial de Facturas
      
+ Objetos de la Base de Datos
  1. Vistas (Views)
  2. Funciones (Functions)
  3. Procedimientos Almacenados (Stored Procedures)
  4. Disparadores (Triggers)
     
+ Inserción de Datos
  1. Por Interfaz Gráfica
  2. A través del archivo `Population.sql`
  
+ Herramientas Utilizadas

<h2 align="center">
  <ins> Diagrama Entidad - Relación (DER)</ins>
</h2>

<ins><em> Parte Izquierda </em></ins>

![1  DER Proyecto Final CoderHouse Izquierda](https://github.com/vazquezdev1/SQL-53175/assets/123138886/52ae8461-cd8d-426b-aa6f-c1eb3db0d02a)
<!-- Insertar imágen izquierda del DER con la Etiqueta "<img=>" -->

<ins><em> Parte Derecha </em></ins>

![2  DER Proyecto Final CoderHouse Derecha](https://github.com/vazquezdev1/SQL-53175/assets/123138886/1eb27843-41ea-4602-8c36-dd3f352d675e)
<!-- Insertar imágen derecha del DER con la Etiqueta "<img=>" -->

<p align="center"> 
Nombre del archivo para editar el Diagrama Entidad - Relación:
  <em><b> 
    <a href="https://app.diagrams.net/" title="Página donde abrir el archivo 'DER Proyecto Final CoderHouse.drawio'"> 
    DER Proyecto Final CoderHouse.drawio </a>
  </em></b>
</p>

<h2 align="center">
  <ins> Descripción de las Tablas</ins>
</h2>

<p align="center"><em> Tablas Dimensionales</em></p>

1. <ins><strong>Categorías de Factura</strong></ins>: Tabla que tendrá la información de los tipos de factura en que se puede realizar la compra según la clase de contribuyente que 
sea el cliente. 
</br> A = Responsable inscripto a Responsable inscripto/Monotributista.
</br> B = Responsable inscripto a Consumidor final/exento de IVA.
</br> C = Monotributista/Exento en IVA a cualquier destinatario. </br>

<b>Atributos</b>:
  + Categoría de la factura [varchar(1) A, B, C] [<strong>Primary Key</strong>]
  + Descripción de la categoría [varchar(100)]

2. <ins><strong>Clientes</strong></ins>: Almacenará la información de los clientes que le compren un producto a los kioscos, principalmente tendrán la función de recuperar los datos ingresados en esta tabla para generar la factura con sus datos relevantes.

<b>Atributos</b>:
  + DNI del cliente [varchar(8)] [<strong>Primary Key</strong>]
  + Nombre del cliente [varchar(100)]
  + Apellido del cliente [varchar(100)]
  + El email del cliente [varchar(100)]
  + El teléfono del cliente [varchar(30)]

3. <ins><strong>Dueños de los Kioscos</strong></ins>: Entidad que mantendrá la información más relevante de los dueños de cada kiosco.

<b>Atributos</b>:
  + DNI del dueño [varchar(8)] [<strong>Primary Key</strong>]
  + Nombre del dueño [varchar(100)]
  + Apellido del dueño [varchar(100)]

4. <ins><strong>Kioscos</strong></ins>: Contendrá la información relevante sobre los locales que llevan a cabo el modelo de negocio.

<b>Atributos</b>:
  + ID del kiosco [int autonum] [<strong>Primary Key</strong>]
  + Dirección del local [varchar(100)]
  + Nombre del kiosco [varchar(100)]
  + Cantidad de empleados [int]
  + DNI del dueño [varchar(8)] [<strong>Foreign Key</strong>]

5. <ins><strong>Empleados</strong></ins>: Tabla dimensional que guardará los datos relevantes de los trabajadores que tenga cada local.

<b>Atributos</b>:
  + DNI del empleado [varchar(8)] [<strong>Primary Key</strong>]
  + Nombre del empleado [varchar(100)]
  + Apellido del empleado [varchar(100)]
  + Email del empleado [varchar(100)]
  + Teléfono del empleado [varchar(30)]
  + Aproximado de horas trabajadas en el día [int]
  + Salario por hora trabajada del empleado [decimal(7, 2)]
  + Fecha en que empezó a trabajar en el kiosco [date]
  + ID del kiosco donde trabaja [int] [<strong>Foreign Key</strong>]
    
6. <ins><strong>Métodos de Pago</strong></ins>: Entidad que se especializará en guardar la información de las modalidades de pago (por ahora son 3: efectivo, débito y crédito).

<b>Atributos</b>:
  + ID del método de pago [tinyint 1 a 3] [<strong>Primary Key</strong>]
  + Descripción del método de pago [varchar(100)]

7. <ins><strong>Productos</strong></ins>: Tendrá la información básica de los productos que se compran para el local y que pondrán venderse a los clientes posteriormente.

<b>Atributos</b>:
  + ID del producto [int autonum] [<strong>Primary Key</strong>]
  + Descripción del producto [varchar(100)]
  + Marca del producto [varchar(100)]
  + Cantidad disponible en stock del producto [int]
  + Precio al que se compró el producto [decimal(15, 6)]
  + Precio en el que se venderá el producto [decimal(18, 6)]*
  + La fecha en que se compró el producto [date]

*<strong> Aclaración</strong>: Se recomienda que el precio de venta sea siempre mayor al precio de compra en un 35% al 70% para que sea rentable la compra del producto.

El porcentaje de ganancia del producto, con respecto al precio de compra, lo podrá elegir el administrador de la Base de Datos utilizando la función `fn_calculate_sellsPricePerUnit` introduciendo como parámetros el precio de compra y el porcentaje de ganancia.

<p align="center"><em> Tablas de Hechos</em></p>

8. <ins><strong>Facturas</strong></ins>: Tabla de hechos que reunirá los datos más importantes de las 7 tablas anteriores con el objetivo de que sirva como factura válida de las ventas del local.

<b>Atributos</b>:
  + ID de la factura [int autonum] [<strong>Primary Key</strong>]
  + DNI del cliente [varchar(8)] [<strong>Foreign Key</strong>]
  + Fecha en la que se realizó la factura [date]
  + ID del producto [int] [<strong>Foreign Key</strong>]
  + Cantidad comprada del producto [int]
  + Total de la factura [decimal(18, 6)]
  + ID del método de pago [tinyint 1, 2 o 3] [<strong>Foreign Key</strong>]
  + Valor de las cuotas con ese método de pago [decimal(18, 6)]
  + Cantidad de cuotas con ese método de pago [int]
  + Estado de la factura [bool]*
  + Categoría de la factura [varchar(1) A, B, C] [<strong>Foreign Key</strong>]**
  + ID del kiosco donde se realizó la compra [int] [<strong>Foreign Key</strong>]

*<strong> Aclaración 1 (Estado de la factura)</strong>: `False` o `0` equivaldría 
<ins><em>Cancelada</ins></em> y `True` o `1` a <ins><em>Válida</ins></em>.

**<strong> Aclaración 2 (Categoría de la factura)</strong>: `Responsable inscripto`, 
`Monotributo`, etc.

<p align="center"><em> Tablas creadas por Triggers</em></p>

9. <ins><strong>Cuotas con Crédito</strong></ins>: Tabla especializada en guardar los datos de las facturas que faltan por pagar o ya fueron totalmente pagadas con el método de tarjeta de crédito. Acá pueden estar facturas con ninguna o con varias cuotas.

<b>Atributos</b>:
  + Fecha y hora exacta en la que se cargó la factura [timestamp]
  + ID de la factura [int] [<strong>Primary Key</strong>]
  + DNI del cliente [varchar(8)]
  + Fecha de la factura [date]
  + Total de la factura [decimal(18, 6)]
  + Valor de las cuotas de la factura [decimal(18, 6)]
  + Cantidad de cuotas de la factura [int]
  + Estado de la factura [bool]

10. <ins><strong>Historial de Clientes</strong></ins>: Entidad que guardará los datos anteriores de los clientes cuando sus registros originales sean actualizados en la tabla Clientes (tabla principal) a modo de auditoría o por si se cometió un error con la actualización de los datos.

<b>Atributos</b>:
  + Fecha y hora exacta en la que se modificó el dato original del cliente [timestamp] [<strong>Primary Key</strong>]
  + DNI del cliente [varchar(8)]
  + Nombre completo del cliente [varchar(200)]
  + El email del cliente [varchar(100)]
  + El teléfono del cliente [varchar(30)]

11. <ins><strong>Historial de Empleados</strong></ins>: Entidad que guardará los datos anteriores de los empleados cuando sus registros originales sean actualizados en la tabla Empleados (tabla principal) a modo de auditoría o por si se cometió un error con la actualización de los datos.

<b>Atributos</b>:
  + Fecha y hora exacta en la que se modificó el dato original del empleado [timestamp] [<strong>Primary Key</strong>]
  + DNI del empleado [varchar(8)]
  + Nombre completo del empleado [varchar(200)]
  + El email del empleado [varchar(100)]
  + Aproximado de horas trabajadas en el día [int]
  + Salario por hora trabajada del empleado [decimal(7, 2)]
  + Fecha en que empezó a trabajar en el kiosco [date]
  + ID del kiosco donde trabaja [int]

12. <ins><strong>Historial de Productos</strong></ins>: Entidad que guardará los datos anteriores de los  empleados cuando sus registros originales sean actualizados en la tabla Productos (tabla principal) a modo de auditoría o por si se cometió un error con la actualización de los datos.

<b>Atributos</b>:
  + Fecha y hora exacta en la que se modificó el dato original del producto [timestamp] [<strong>Primary Key</strong>]
  + ID del producto [int autonum]
  + Descripción del producto [varchar(100)]
  + Marca del producto [varchar(100)]
  + Descripción del tipo de modificación realizada al registro original [varchar(200)]

12. <ins><strong>Historial de Facturas</strong></ins>: Entidad que guardará los datos anteriores de las facturas cuando sus registros originales sean actualizados en la tabla Facturas (tabla principal) a modo de auditoría o por si se cometió un error con la actualización de los datos.

<b>Atributos</b>:
  + Fecha y hora exacta en la que se modificó el dato original de la factura [timestamp] [<strong>Primary Key</strong>]
  + ID de la factura [int]
  + DNI del cliente [varchar(8)]
  + Fecha en la que se realizó la factura [date]
  + ID del producto [int]
  + Cantidad comprada del producto [int]
  + Total de la factura [decimal(18, 6)]
  + ID del método de pago [tinyint 1, 2 o 3]
  + Valor de las cuotas con ese método de pago [decimal(18, 6)]
  + Cantidad de cuotas con ese método de pago [int]
  + Estado de la factura [bool]
  + ID del kiosco donde se realizó la compra [int]
  + Descripción del tipo de modificación realizada al registro original [varchar(200)]

<h2 align="center">
  <ins> Objetos de la Base de Datos</ins>
</h2>

Vistas (Views)

1. <b>`vw_full_information_bill`</b>: Trae información de casi todas las tablas dimensionales (menos la de `Empleados` y la de `Dueños de los Kioscos`) para ver el detalle completo de la factura incluso con los datos que no se almacenan directamente en la tabla `Facturas`.

2. <b>`vw_full_information_kiosks`</b>: Reúne toda la información de la tabla `Kioscos` y le agrega la información de la tabla `Dueños de los Kioscos` según corresponda su DNI para tener un poco más de contexto de quien maneja ese local.

3. <b>`vw_employees_under_average_salary`</b>: Permite visualizar los datos más relevantes de los empleados que tienen un salario por hora menor que el promedio, esto lo hace solo utilizando los datos de la tabla `Empleados`.

4. <b>`vw_products_upon_average_purchases_price`</b>: Se crea la vista para observar la información complete de los productos cuyo precio de compra sea mayor al promedio para revisar su rendimiento constantemente.

Funciones (Functions)

1. <b>`fn_calculate_sellsPricePerUnit`</b>: Función que permite ingresar por parámetro el precio al que se compró un producto y su porcentaje de ganancia para generar automáticamente su precio de venta.

2. <b>`fn_calculate_salaryPerDay`</b>: Permite visualizar el salario que le corresponde a un empleado en una x cantidad de días según el salario que cobra por hora, las horas trabajadas por día y la cantidad de días que se quiere saber.

3. <b>`fn_calculate_billAmount`</b>: Calcula el total de una compra según el ID del producto y la cantidad de unidades compradas que son ingresadas como parámetros.

Procedimientos Almacenados (Stored Procedures)

1. <b>`sp_calculate_most_selled_product`</b>: Calcula cual fue el producto más comprado dentro de la tabla `Facturas` y con ese dato busca su información más importante que está guardada en la tabla `Productos` para tener una noción de lo que más se compra y la cantidad de veces que se compró el producto.

2. <b>`sp_calculate_employee_seniority_in_years`</b>: Calcula cuantos años tiene un empleado trabajando en un kiosco solo ingresando su DNI, esto sirve para tener una idea del tiempo que lleva el empleado en el local y si correspondería aumentarle el salario según las horas trabajadas.

Disparadores (Triggers)

|                Trigger                 | Tabla a Revisar | Acción que revisa | Tabla de Destino | Descripción |
|---------------------------------------:|----------------:|------------------:|-----------------:|-------------|
| tgr_after_insert_credit_payments_bills | bills           | After Insert      | CreditFees       | Registra la información de las facturas que fueron pagadas con crédito para tener un control de las cuotas que existen con este método de pago.|
| tgr_after_update_Clients               | clients         | After Update      | ClientsHistory   | Registra la información antigua de los clientes por si se actualiza con error o por si se quiere comparar los datos anteriores con los nuevos para auditar y crear un recorrido.|
| tgr_after_update_Employees             | employees       | After Update      | EmployeesHistory | Registra la información antigua de los empleados por si se actualiza con error o por si se quiere comparar los datos anteriores con los nuevos para auditar y crear un recorrido.|
| tgr_after_update_Products              | products        | After Update      | ProductsHistory  | Registra la información antigua de los productos por si se actualiza con error o por si se quiere comparar los datos anteriores con los nuevos para auditar y crear un recorrido. </br> Además, se incorpora una columna donde resume el tipo de cambio que se le realizó al registro original.|
| tgr_after_update_Bills                 | bills           | After Update      | BillsHistory     | Registra la información antigua de las facturas por si se actualiza con error o por si se quiere comparar los datos anteriores con los nuevos para auditar y crear un recorrido. </br> Además, se incorpora una columna donde resume el tipo de cambio que se le realizó al registro original.|
