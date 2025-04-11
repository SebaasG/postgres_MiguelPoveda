
INSERT INTO ciudad (nombre) VALUES 
('Bogotá'), ('Medellín'), ('Cali'), ('Barranquilla'), ('Cartagena'),
('Bucaramanga'), ('Pereira'), ('Manizales'), ('Cúcuta'), ('Ibagué'),
('Armenia'), ('Neiva'), ('Santa Marta'), ('Villavicencio'), ('Tunja');

INSERT INTO direccion (idCiudad, detalle) VALUES
(1, 'Calle 109A #15-25'), (2, 'Calle 40 #23-54'), (3, 'Av campus #78-90'),
(4, 'Calle 5 #66-77'), (5, 'Cra 7 #80-91'), (6, 'Av solecito #22-45'),
(7, 'Calle Real #15-55'), (8, 'Cra 10 #10-10'), (9, 'Calle 8 #8-8'),
(10, 'Av Siempre Viva #742'), (11, 'Calle 1 #1-1'), (12, 'Carrera 15 #100-50'),
(13, 'Calle 99 #77-88'), (14, 'Cra 2 #23-45'), (15, 'Calle 22 #99-22');

INSERT INTO telefonos (telefono) VALUES
('3001112233'), ('3002223344'), ('3013334455'), ('3024445566'), ('3035556677'),
('3046667788'), ('3057778899'), ('3068889900'), ('3079990011'), ('3080001122'),
('3091112233'), ('3102223344'), ('3113334455'), ('3124445566'), ('3135556677');

INSERT INTO empresa (NIT, nombre) VALUES
('123456789', 'productCampus');


INSERT INTO proveedor (NIT,idTelefono,idDireccion,nombre) VALUES
('1122334455', 1, 1, 'JOSE SOLUCIONES'), ('1133559977', 2, 2, 'JHOLVER SOLUCIONES'),
('4456481233', 3, 3, 'AMPARITO SOLUCIONES'), ('9994515213', 3, 3, 'JOSEACA SOLUCIONES'),
('8451354842', 5, 5, 'MANOLO SOLUCIONES'), ('5165842131', 6, 6, 'CARNALITO SOLUCIONES');


INSERT INTO empleado (doc,idDireccion,idTelefono,NITempresa,nombre) VALUES
('111231352',7,7,'123456789','Manuel alonso rapinha'), ('109005615',8,8,'123456789','Simon Melo'),
('451147852',3,2,'123456789','Cristina Rosas'), ('445612058',9,6,'123456789','Claudio Uribe'),
('841325165',10,4,'123456789','Alfredo Cacerito'), ('54654123',14,1,'123456789','Sara Messi'),
('105215684',6,2,'123456789','Manuel alonso rapinha'), ('847841561',11,10,'123456789','pestiano Ronaldo');


INSERT INTO cliente(doc,idDireccion,idTelefono,nombre) VALUES
('887878789',4,9,'Saimon alonso rapinha'), ('998871202',9,8,'Suguru Getto'),
('545456525',2,9,'Satoru Gojo'), ('4841356160',3,6,'Los tigres del norte'),
('741512235',14,14,'Mi vecina xd'), ('10504512',14,15,'donald Trumpt'),
('515615616',6,2,'Perciples tercer'), ('20510451',15,1,'Malanoso Panceta');ç


INSERT INTO categoria(nombre) VALUES
('LAPTOS'), ('TELEFONOS'), ('IMPRESORAS'),('CPU'), 
('AUDIFONOS'),('SILLAS'),('FUNDAS'), ('PROTECTORES');


INSERT INTO productos (idCategoria,nombre,precio,precioUnitario) VALUES
(1,'Portatil Asus Gaming', 4990400, 4990400), (1,'Portatil acer Gaming', 3290400, 3290400),
(2,'Iphone 16', 6590400, 6590400), (3,'Epson l395', 1160400, 1160400),
(3,'Epson 1023l', 2480400, 2480400), (4,'Ryzen5 4600g', 2290600, 2290600),
(4,'ryzen7 6900', 4990400, 4990400), (5,'Portatil acer Gaming', 3290400, 3290400),
(7,'Portatil Asus Gaming', 4990400, 4990400), (6,'Portatil acer Gaming', 3290400, 3290400),


INSERT INTO stock (idProducto, cantidad) VALUES
(1, 10), (2, 15), (3, 5), (4, 8), (5, 7),
(6, 12), (7, 6), (8, 20), (9, 9), (10, 18);


INSERT INTO proveedorProducto (idProveedor, idProducto) VALUES
('1122334455', 1), ('1122334455', 2),
('1133559977', 3), ('1133559977', 4),
('4456481233', 5), ('4456481233', 6),
('9994515213', 7), ('8451354842', 8),
('5165842131', 9), ('5165842131', 10);


INSERT INTO detalleVenta (idEmpleado, idCliente, idProducto, total, fecha) VALUES
('111231352', '887878789', 1, 4990400, NOW()),
('109005615', '998871202', 3, 6590400, NOW()),
('451147852', '545456525', 4, 1160400, NOW()),
('445612058', '4841356160', 6, 2290600, NOW()),
('841325165', '741512235', 8, 3290400, NOW()),
('54654123', '10504512', 10, 3290400, NOW()),
('105215684', '515615616', 7, 4990400, NOW()),
('847841561', '20510451', 2, 3290400, NOW());


INSERT INTO historialVentas (fechaVenta, totalVenta) VALUES
(NOW(), 4990400),
(NOW(), 6590400),
(NOW(), 1160400),
(NOW(), 2290600),
(NOW(), 3290400),
(NOW(), 3290400),
(NOW(), 4990400),
(NOW(), 3290400);