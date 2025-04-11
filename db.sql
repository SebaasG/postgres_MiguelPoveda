


CREATE TABLE ciudad (
    idCiudad SERIAL PRIMARY KEY,
    nombre VARCHAR(45)
);


CREATE TABLE direccion (
    idDireccion SERIAL PRIMARY KEY,
    idCiudad INTEGER REFERENCES ciudad(idCiudad),
    detalle VARCHAR(150)
);


CREATE TABLE telefonos (
    idTelefono SERIAL PRIMARY KEY,
    telefono VARCHAR(15)
);


CREATE TABLE empresa (
    NIT VARCHAR(45) PRIMARY KEY,
    nombre VARCHAR(45)
);


CREATE TABLE proveedor (
    NIT VARCHAR(45) PRIMARY KEY,
    idTelefono INTEGER REFERENCES telefonos(idTelefono),
    idDireccion INTEGER REFERENCES direccion(idDireccion),
    nombre VARCHAR(45)
);


CREATE TABLE empleado (
    doc VARCHAR(12) PRIMARY KEY,
    idDireccion INTEGER REFERENCES direccion(idDireccion),
    idTelefono INTEGER REFERENCES telefonos(idTelefono),
    NITempresa VARCHAR(45) REFERENCES empresa(NIT),
    nombre VARCHAR(80)
);


CREATE TABLE cliente (
    doc VARCHAR(12) PRIMARY KEY,
    idDireccion INTEGER REFERENCES direccion(idDireccion),
    idTelefono INTEGER REFERENCES telefonos(idTelefono),
    nombre VARCHAR(45)
);


CREATE TABLE categoria (
    idCategoria SERIAL PRIMARY KEY,
    nombre VARCHAR(45)
);


CREATE TABLE productos (
    id SERIAL PRIMARY KEY,
    idCategoria INTEGER REFERENCES categoria(idCategoria),
    nombre VARCHAR(45),
    precio DECIMAL,
    precioUnitario DECIMAL
);

CREATE TABLE stock (
    idStock SERIAL PRIMARY KEY,
    idProducto INTEGER REFERENCES productos(id),
    cantidad INTEGER
);


CREATE TABLE proveedorProducto (
    idProveedor VARCHAR(45),
    idProducto INTEGER,
    PRIMARY KEY (idProveedor, idProducto),
    FOREIGN KEY (idProveedor) REFERENCES proveedor(NIT),
    FOREIGN KEY (idProducto) REFERENCES productos(id)
);


CREATE TABLE detalleVenta (
    id SERIAL PRIMARY KEY,
    idEmpleado VARCHAR(12) REFERENCES empleado(doc),
    idCliente VARCHAR(12) REFERENCES cliente(doc),
    idProducto INTEGER REFERENCES productos(id),
    total DECIMAL,
    fecha TIMESTAMP
);


CREATE TABLE historialVentas (
    id SERIAL PRIMARY KEY,
    fechaVenta TIMESTAMP,
    totalVenta DECIMAL
);
