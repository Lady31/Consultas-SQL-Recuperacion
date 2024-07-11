CREATE DATABASE recuperacion

USE recuperacion

CREATE TABLE Clientes (
    id_cliente INT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL
);

CREATE TABLE Cuentas (
    id_cuenta INT PRIMARY KEY,
    id_cliente INT,
    saldo DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);

CREATE TABLE Transacciones (
    id_transaccion INT PRIMARY KEY,
    id_cuenta INT,
    monto DECIMAL(10, 2) NOT NULL,
    fecha DATE NOT NULL,
    FOREIGN KEY (id_cuenta) REFERENCES Cuentas(id_cuenta)
);

INSERT INTO Clientes (id_cliente, nombre, email) VALUES
(1, 'yuverly verdezoto', 'yuverly.verdezoto@epn.edu.ec'),
(2, 'mateo garzon', 'mateo.garzon@epn.edu.ec'),
(3, 'luis guaygua', 'luis.guaygua@epn.edu.ec'),
(4, 'eduardo caza', 'eduardo.caza@epn.edu.ec'),
(5, 'alejandra moreno', 'alejandra.moreno@epn.edu.ec');

INSERT INTO Cuentas (id_cuenta, id_cliente, saldo) VALUES
(1, 1, 1000.00),
(2, 1, 1500.00),
(3, 2, 2000.00),
(4, 2, 2500.00),
(5, 3, 3000.00),
(6, 3, 3500.00),
(7, 4, 4000.00),
(8, 4, 4500.00),
(9, 5, 5000.00),
(10, 5, 5500.00);

INSERT INTO Transacciones (id_transaccion, id_cuenta, monto, fecha) VALUES
(1, 1, 100.00, '2024-07-01'),
(2, 1, 200.00, '2024-07-02'),
(3, 2, 300.00, '2024-07-03'),
(4, 2, 400.00, '2024-07-04'),
(5, 3, 500.00, '2024-07-05'),
(6, 3, 600.00, '2024-07-06'),
(7, 4, 700.00, '2024-07-07'),
(8, 4, 800.00, '2024-07-08'),
(9, 5, 900.00, '2024-07-09'),
(10, 5, 1000.00, '2024-07-10'),
(11, 6, 1100.00, '2024-07-11'),
(12, 6, 1200.00, '2024-07-12'),
(13, 7, 1300.00, '2024-07-13'),
(14, 7, 1400.00, '2024-07-14'),
(15, 8, 1500.00, '2024-07-15'),
(16, 8, 1600.00, '2024-07-16'),
(17, 9, 1700.00, '2024-07-17'),
(18, 9, 1800.00, '2024-07-18'),
(19, 10, 1900.00, '2024-07-19'),
(20, 10, 2000.00, '2024-07-20');

-- ejercicio 1
SELECT id_cuenta, saldo FROM Cuentas;
SELECT id_cuenta, saldo FROM Cuentas WHERE saldo > 4000;
SELECT id_cuenta, saldo FROM Cuentas WHERE saldo < 2000;
SELECT nombre, LENGTH(nombre) AS longitud_nombre FROM Clientes;
SELECT id_cuenta, saldo FROM Cuentas WHERE saldo BETWEEN 1000 AND 3000;

SELECT Clientes.id_cliente, nombre, id_cuenta, saldo 
FROM Clientes 
LEFT JOIN Cuentas ON Clientes.id_cliente = Cuentas.id_cliente;

SELECT CONCAT(nombre, ' - ', email) AS nombre_email FROM Clientes;
SELECT email, RIGHT(email, 3) AS ultimos_3_caracteres FROM Clientes;
SELECT LOWER(nombre) AS nombre_minusculas FROM Clientes;
SELECT UPPER(nombre) AS nombre_mayusculas FROM Clientes;
SELECT * FROM Transacciones ORDER BY monto DESC LIMIT 10;
SELECT id_cuenta, saldo, saldo * 1.05 AS saldo_con_interes FROM Cuentas;
SELECT email, REPLACE(email, '@example.com', '@newdomain.com') AS email_nuevo FROM Clientes;


-- ejercicio 2
SELECT nombre FROM Clientes;
SELECT nombre, CONCAT('Correo: ', email) AS email_formateado FROM Clientes;
SELECT email, LOWER(email) AS email_minusculas FROM Clientes;
SELECT nombre, UPPER(nombre) AS nombre_mayusculas FROM Clientes;

-- ejercicio 3
SELECT id_cuenta FROM Cuentas;

SELECT id_cuenta, SUM(monto) AS total_transacciones 
FROM Transacciones 
GROUP BY id_cuenta;

SELECT SUM(saldo) AS saldo_total FROM Cuentas;
SELECT SUM(monto) AS monto_total_transacciones FROM Transacciones;
SELECT AVG(monto) AS monto_promedio_transacciones FROM Transacciones;

-- ejercicio 4
SELECT id_transaccion, fecha FROM Transacciones;
SELECT id_transaccion, fecha, YEAR(fecha) AS año FROM Transacciones;
SELECT id_transaccion, fecha, MONTH(fecha) AS mes FROM Transacciones;
SELECT id_transaccion, fecha, DAYOFWEEK(fecha) AS dia_semana FROM Transacciones;

SELECT id_transaccion, fecha, monto 
FROM Transacciones 
WHERE YEAR(fecha) = 2024;

SELECT id_transaccion, fecha, monto 
FROM Transacciones 
WHERE YEAR(fecha) = 2023;

SELECT id_transaccion, fecha, monto 
FROM Transacciones 
WHERE MONTH(fecha) = 6;

SELECT id_transaccion, fecha, monto 
FROM Transacciones 
WHERE DAY(fecha) = 15;

-- ejercicio 5
SELECT id_cuenta FROM Cuentas;

SELECT id_cuenta, COUNT(id_transaccion) AS numero_transacciones 
FROM Transacciones 
GROUP BY id_cuenta;

SELECT AVG(saldo) AS saldo_promedio FROM Cuentas;

-- ejercicio 6
SELECT id_transaccion, id_cuenta, monto, fecha 
FROM Transacciones 
WHERE monto < 0;

SELECT id_transaccion, id_cuenta, monto, fecha 
FROM Transacciones 
WHERE monto > 0;

-- ejercicio 7
SELECT id_cuenta, id_cliente, saldo 
FROM Cuentas 
ORDER BY saldo DESC;

SELECT id_cliente, nombre, email 
FROM Clientes 
ORDER BY nombre ASC;

SELECT id_transaccion, id_cuenta, monto, fecha 
FROM Transacciones 
WHERE YEAR(fecha) = 2023;

SELECT id_cuenta, id_cliente, saldo 
FROM Cuentas 
ORDER BY saldo ASC 
LIMIT 5;

-- ejercicio 8
SELECT COUNT(id_cliente) AS total_clientes FROM Clientes;
SELECT COUNT(id_cuenta) AS total_cuentas FROM Cuentas;
SELECT COUNT(id_transaccion) AS total_transacciones FROM Transacciones;
SELECT id_cuenta, id_cliente, ROUND(saldo, 2) AS saldo_redondeado FROM Cuentas;

-- ejercicio 9
SELECT id_cuenta, saldo 
FROM Cuentas 
ORDER BY saldo DESC 
LIMIT 1;

SELECT id_cuenta, saldo 
FROM Cuentas 
ORDER BY saldo ASC 
LIMIT 1;

SELECT id_transaccion, id_cuenta, monto, fecha 
FROM Transacciones 
ORDER BY monto DESC 
LIMIT 1;

SELECT id_transaccion, id_cuenta, monto, fecha 
FROM Transacciones 
ORDER BY monto ASC 
LIMIT 1;








