CREATE DATABASE Tienda

use Tienda

CREATE TABLE clientes (
  id_cliente INT PRIMARY KEY,
  nombre VARCHAR(50),
  direccion VARCHAR(100)
);

CREATE TABLE Productos (
  id_producto INT PRIMARY KEY,
  nombre VARCHAR(50),
  precio DECIMAL(10, 2)
);

CREATE TABLE Pedidos (
  id_pedido INT PRIMARY KEY,
  id_cliente INT,
  id_producto INT,
  cantidad INT,
  fecha_pedido DATE,
  FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente),
  FOREIGN KEY (id_producto) REFERENCES Productos(id_producto)
);


INSERT INTO Clientes (id_cliente, nombre, direccion) VALUES (1, 'fabio', 'cra 40 # 3');
INSERT INTO Clientes (id_cliente, nombre, direccion) VALUES (2, 'carlos', 'calle 5 # 3');
INSERT INTO Clientes (id_cliente, nombre, direccion) VALUES (3, 'camilo', 'cra 22 # 3');
INSERT INTO Productos (id_producto, nombre, precio) VALUES (10, 'Roa arroz', 50000);
INSERT INTO Productos (id_producto, nombre, precio)VALUES (11, 'Aceite', 25000);
INSERT INTO Productos (id_producto, nombre, precio)VALUES (12, 'huevos', 19000);
INSERT INTO Pedidos (id_pedido, id_cliente, id_producto, cantidad, fecha_pedido) VALUES (100, 1, 10, 10, '2023-06-29');
INSERT INTO Pedidos (id_pedido, id_cliente, id_producto, cantidad, fecha_pedido) VALUES (101, 2, 11, 11, '2023-07-29');
INSERT INTO Pedidos (id_pedido, id_cliente, id_producto, cantidad, fecha_pedido) VALUES (102, 3, 12, 12, '2023-08-29');

SELECT * FROM Clientes;
SELECT * FROM Productos;
SELECT * FROM Pedidos;

UPDATE Clientes SET direccion = 'av 5 #32-11' WHERE id_cliente = 2;
UPDATE Productos SET precio = 32000 WHERE id_producto = 11;
UPDATE Pedidos SET cantidad = 13 WHERE id_pedido = 1;

DELETE FROM Clientes WHERE id_cliente = 3;
DELETE FROM Productos WHERE id_producto = 11;
DELETE FROM Pedidos WHERE id_pedido = 101;

SELECT Pedidos.id_pedido, Clientes.nombre, Productos.nombre, Pedidos.cantidad
FROM Pedidos
INNER JOIN Clientes ON Pedidos.id_cliente = Clientes.id_cliente
INNER JOIN Productos ON Pedidos.id_producto = Productos.id_producto;

SELECT Clientes.nombre, SUM(Pedidos.cantidad * Productos.precio) AS total_gastado
FROM Pedidos
INNER JOIN Clientes ON Pedidos.id_cliente = Clientes.id_cliente
INNER JOIN Productos ON Pedidos.id_producto = Productos.id_producto
GROUP BY Clientes.nombre;

SELECT Clientes.nombre, COUNT(Pedidos.id_pedido) AS cantidad_pedidos
FROM Clientes
LEFT JOIN Pedidos ON Clientes.id_cliente = Pedidos.id_cliente