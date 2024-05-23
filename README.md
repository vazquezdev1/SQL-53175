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

1. <ins><strong>Categorías de Factura</strong></ins>: Tabla que tendrá la información de los tipos de 
factura en que se puede realizar la compra según la clase de contribuyente que 
sea el cliente. 
</br> A = Responsable inscripto a Responsable inscripto/Monotributista.
</br> B = Responsable inscripto a Consumidor final/exento de IVA.
</br> C = Monotributista/Exento en IVA a cualquier destinatario. </br>

<b>Atributos</b>:
  + Categoría de la factura [varchar(1) A, B, C] [<strong>Primary Key</strong>]
  + Descripción de la categoría [varchar(100)]

2. <ins><strong>Clientes</strong></ins>: Almacenará la información de los clientes que le compren un 
producto a los kioscos, principalmente tendrán la función de recuperar los datos 
ingresados en esta tabla para generar la factura con sus datos relevantes.

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

*<strong>Aclaración</strong>: Se recomienda que el precio de venta sea siempre mayor al precio de compra en un 35% al 70% para que sea rentable la compra del producto.

</br> El porcentaje de ganancia del producto, con respecto al precio de compra, lo podrá elegir el administrador de la Base de Datos utilizando la función `fn_calculate_sellsPricePerUnit` introduciendo como parámetros el precio de compra y el porcentaje de ganancia.
