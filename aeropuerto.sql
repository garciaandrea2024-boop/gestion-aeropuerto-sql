-- CREACIÓN DE LAS TABLAS
CREATE TABLE Aviones (
    codigo_avion VARCHAR(10) PRIMARY KEY,
    modelo VARCHAR(50) NOT NULL,
    capacidad_max INT NOT NULL
);

CREATE TABLE Vuelos (
    numero_vuelo VARCHAR(10) PRIMARY KEY,
    origen VARCHAR(50) NOT NULL,
    destino VARCHAR(50) NOT NULL,
    hora_salida TIME NOT NULL,
    codigo_avion VARCHAR(10) NOT NULL,
    FOREIGN KEY (codigo_avion) REFERENCES Aviones(codigo_avion)
);

CREATE TABLE Pasajeros (
    documento VARCHAR(15) PRIMARY KEY,
    nombre_completo VARCHAR(80) NOT NULL,
    telefono VARCHAR(15),
    nacionalidad VARCHAR(30) NOT NULL
);

CREATE TABLE Reservas (
    documento VARCHAR(15) NOT NULL,
    numero_vuelo VARCHAR(10) NOT NULL,
    fecha_vuelo DATE NOT NULL,
    asiento VARCHAR(4) NOT NULL,
    PRIMARY KEY (documento, numero_vuelo, fecha_vuelo),
    FOREIGN KEY (documento) REFERENCES Pasajeros(documento),
    FOREIGN KEY (numero_vuelo) REFERENCES Vuelos(numero_vuelo)
);

-- REGISTROS DE EJEMPLO
INSERT INTO Aviones VALUES 
('MX-001', 'Boeing 737-800', 180),
('MX-002', 'Airbus A320', 165),
('MX-003', 'Embraer 195', 120);

INSERT INTO Vuelos VALUES 
('AM-201', 'Guadalajara - GDL', 'Cancún - CUN', '07:30', 'MX-001'),
('AM-345', 'Monterrey - MTY', 'Tijuana - TIJ', '14:15', 'MX-002'),
('AM-112', 'Guadalajara - GDL', 'Ciudad de México - MEX', '19:00', 'MX-001');

INSERT INTO Pasajeros VALUES 
('DNI123456', 'Juan Pérez López', '3312345678', 'Mexicana'),
('PAS987654', 'María González Ruiz', '5598765432', 'Española'),
('DNI456789', 'Carlos Méndez Torres', '8145678901', 'Mexicana');

INSERT INTO Reservas VALUES 
('DNI123456', 'AM-201', '2026-06-10', '12B'),
('PAS987654', 'AM-201', '2026-06-10', '14A'),
('DNI456789', 'AM-345', '2026-06-15', '07C'),
('DNI123456', 'AM-112', '2026-06-20', '03D');

-- CONSULTAS PARA VERIFICAR
SELECT * FROM Aviones;
SELECT * FROM Vuelos;
SELECT * FROM Pasajeros;
SELECT * FROM Reservas;
