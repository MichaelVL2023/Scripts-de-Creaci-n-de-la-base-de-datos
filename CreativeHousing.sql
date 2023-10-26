create DATABASE CreativeHousing
go

use CreativeHousing
go

-- tables
-- Table: artefactos_electronicos
CREATE TABLE artefactos_electronicos (
    codigo  int  NOT NULL,
    nombre  varchar(100)  NOT NULL,
    marca   varchar(100)  NOT NULL,
    modelo  varchar(100)  NOT NULL,
    precio  money  NOT NULL,
    ancho   float  NOT NULL,
    largo   float  NOT NULL,
    altura  float  NOT NULL,
    CONSTRAINT pk_artefactos_electronicos PRIMARY KEY (codigo)
);

-- Table: calificaciones_proyectos
CREATE TABLE calificaciones_proyectos (
    codigo_usuario          int  NOT NULL,
    codigo_proyecto         int  NOT NULL,
    fecha_de_calificacion   date  NOT NULL,
    puntuacion varchar(50)  NOT NULL,
    comentario varchar(300) NOT NULL,
    CONSTRAINT pk_calificaciones_proyectos PRIMARY KEY (codigo_usuario,codigo_proyecto,fecha_de_calificacion)
);

-- Table: categorias
CREATE TABLE categorias (
    codigo              int  NOT NULL,
    nombre_categoria    varchar(45)  NOT NULL,
    CONSTRAINT pk_categorias PRIMARY KEY (codigo)
);

-- Table: decoraciones
CREATE TABLE decoraciones (
    codigo  int  NOT NULL,
    nombre  varchar(100)  NOT NULL,
    color   varchar(50)  NOT NULL,
    textura varchar(100)  NOT NULL,
    precio  money  NOT NULL,
    CONSTRAINT pk_decoraciones PRIMARY KEY (codigo)
);

-- Table: espacios
CREATE TABLE espacios (
    codigo          int  NOT NULL,
    tipo_de_espacio varchar(100)  NOT NULL,
    CONSTRAINT pk_espacios PRIMARY KEY (codigo)
);

-- Table: espacios_artefactos_electronicos
CREATE TABLE espacios_artefactos_electronicos (
    codigo_artefacto_electronico    int  NOT NULL,
    codigo_espacio                  int  NOT NULL,
    CONSTRAINT pk_espacios_artefactos_electronicos PRIMARY KEY (codigo_artefacto_electronico,codigo_espacio)
);

-- Table: espacios_decoraciones
CREATE TABLE espacios_decoraciones (
    codigo_decoracion   int  NOT NULL,
    codigo_espacio      int  NOT NULL,
    CONSTRAINT pk_espacios_decoraciones PRIMARY KEY (codigo_decoracion,codigo_espacio)
);


-- Table: membresias
CREATE TABLE membresias (
    codigo_usuario      int  NOT NULL,
    codigo_plan         int  NOT NULL,
    fecha_inicio        date  NOT NULL,
    fecha_vencimiento   date  NOT NULL,
    estado              varchar(15)  NOT NULL,
    CONSTRAINT pk_membresias PRIMARY KEY (codigo_usuario,codigo_plan,fecha_inicio)
);

-- Table: muebles
CREATE TABLE muebles (
    codigo  int  NOT NULL,
    nombre  varchar(100)  NOT NULL,
    modelo  varchar(100)  NOT NULL,
    marca   varchar(100)  NOT NULL,
    color   varchar(50)  NOT NULL,
    precio  money  NOT NULL,
    ancho   float  NOT NULL,
    largo   float  NOT NULL,
    altura  float  NOT NULL,
    CONSTRAINT pk_muebles PRIMARY KEY (codigo)
);

-- Table: espacios_muebles
CREATE TABLE espacios_muebles (
    codigo_mueble       int  NOT NULL,
    codigo_espacio     int  NOT NULL,
    CONSTRAINT pk_espacios_muebles PRIMARY KEY (codigo_mueble,codigo_espacio)
);
-- Table: planes
CREATE TABLE planes (
    codigo      int  NOT NULL,
    monto       money  NOT NULL,
    beneficios  text  NOT NULL,
    CONSTRAINT pk_planes PRIMARY KEY (codigo)
);

-- Table: proyectos
CREATE TABLE proyectos (
    codigo              int  NOT NULL,
    codigo_usuario      int  NOT NULL,
    nombre              varchar(100)  NOT NULL,
    fecha_de_creacion   date  NOT NULL,
    descripcion         text  NOT NULL,
    estado              varchar(100)  NOT NULL,
    ultima_modificacion date  NOT NULL,
    CONSTRAINT pk_proyectos PRIMARY KEY (codigo)
);

-- Table: proyectos_categorias
CREATE TABLE proyectos_categorias (
    codigo_proyecto     int  NOT NULL,
    codigo_categoria    int  NOT NULL,
    CONSTRAINT pk_proyectos_categorias PRIMARY KEY (codigo_proyecto,codigo_categoria)
);

-- Table: proyectos_espacios
CREATE TABLE proyectos_espacios (
    codigo_proyecto     int  NOT NULL,
    codigo_espacio      int  NOT NULL,
    CONSTRAINT pk_proyectos_espacios PRIMARY KEY (codigo_proyecto,codigo_espacio)
);

-- Table: usuarios
CREATE TABLE usuarios (
    codigo              int  NOT NULL,
    dni                 char(8)  NOT NULL,
    nombre              varchar(100)  NOT NULL,
    apellido_paterno    varchar(50)  NOT NULL,
    apellido_materno    varchar(50)  NOT NULL,
    correo_electronico  varchar(200)  NOT NULL,
    contrasenia         varchar(20)  NOT NULL,
    numero_telefonico   char(9)  NOT NULL,
    CONSTRAINT pk_usuarios PRIMARY KEY (codigo)
);


-- FK: Foreign Keys

-- Table: espacios_artefactos_electronicos
-- Reference: espacios_espacios_artefactos_electronicos
ALTER TABLE espacios_artefactos_electronicos
    ADD CONSTRAINT fk_espacios_to_espacios_artefactos_electronicos
        FOREIGN KEY (codigo_espacio)
            REFERENCES espacios (codigo)

-- Reference: artefactos_electronicos_espacios_artefactos_electronicos
ALTER TABLE espacios_artefactos_electronicos
    ADD CONSTRAINT fk_artefactos_electronicos_to_espacios_artefactos_electronicos
        FOREIGN KEY (codigo_artefacto_electronico)
            REFERENCES artefactos_electronicos (codigo)




-- Table: proyectos_espacios
-- Reference: proyectos_proyectos_espacios
ALTER TABLE proyectos_espacios
    ADD CONSTRAINT fk_proyectos_to_proyectos_espacios
        FOREIGN KEY (codigo_proyecto)
            REFERENCES proyectos (codigo)

-- Reference: espacios_proyectos_espacios
ALTER TABLE proyectos_espacios
    ADD CONSTRAINT fk_espacios_to_proyectos_espacios
        FOREIGN KEY (codigo_espacio)
            REFERENCES espacios (codigo)




-- Table: calificaciones_proyectos
-- Reference:usuarios_calificaciones_proyectos
ALTER TABLE calificaciones_proyectos
    ADD CONSTRAINT fk_usuarios_to_calificaciones_proyectos
        FOREIGN KEY (codigo_usuario)
            REFERENCES usuarios (codigo)

-- Reference:proyectos_calificaciones_proyectos
ALTER TABLE calificaciones_proyectos
    ADD CONSTRAINT fk_proyectos_to_calificaciones_proyectos
        FOREIGN KEY (codigo_proyecto)
            REFERENCES proyectos (codigo)




-- Table: espacios_decoraciones
-- Reference: espacios_espacios_decoraciones
ALTER TABLE espacios_decoraciones
    ADD CONSTRAINT fk_espacios_to_espacios_decoraciones
        FOREIGN KEY (codigo_espacio)
            REFERENCES espacios (codigo)

-- Reference: decoraciones_espacios_decoraciones
ALTER TABLE espacios_decoraciones
    ADD CONSTRAINT fk_decoraciones_to_espacios_decoraciones
        FOREIGN KEY (codigo_decoracion)
            REFERENCES decoraciones (codigo)




-- Table: espacios_muebles
-- Reference: espacios_espacios_muebles
ALTER TABLE espacios_muebles
    ADD CONSTRAINT fk_espacios_to_espacios_muebles
        FOREIGN KEY (codigo_espacio)
            REFERENCES espacios (codigo)

-- Reference: muebles_espacios_muebles
ALTER TABLE espacios_muebles
    ADD CONSTRAINT fk_muebles_to_espacios_muebles
        FOREIGN KEY (codigo_mueble)
            REFERENCES muebles (codigo)




-- Table: proyectos_categorias
-- Reference:categorias_proyectos_categorias
ALTER TABLE proyectos_categorias
    ADD CONSTRAINT fk_categorias_to_proyectos_categorias
        FOREIGN KEY (codigo_categoria)
            REFERENCES categorias (codigo)

-- Reference:proyectos_proyectos_categorias
ALTER TABLE proyectos_categorias
    ADD CONSTRAINT fk_proyectos_to_proyectos_categorias
        FOREIGN KEY (codigo_proyecto)
            REFERENCES proyectos (codigo)




-- Table: proyectos
ALTER TABLE proyectos
    ADD CONSTRAINT fk_usuarios_to_proyectos
        FOREIGN KEY (codigo_usuario)
            REFERENCES usuarios (codigo)



-- Table: membresias
-- Reference:planes_membresias
ALTER TABLE membresias
    ADD CONSTRAINT fk_planes_to_membresias
        FOREIGN KEY (codigo_plan)
            REFERENCES planes (codigo)

-- Reference:usuarios_membresias
ALTER TABLE membresias
    ADD CONSTRAINT fk_usuarios_to_membresias
        FOREIGN KEY (codigo_usuario)
            REFERENCES usuarios (codigo)


--REGISTROS    

INSERT INTO usuarios (codigo, dni, nombre, apellido_paterno, apellido_materno, correo_electronico, contrasenia, numero_telefonico)
VALUES
    (1, '74568121', 'Juan', 'Perez', 'Lopez', 'juanperez@gmail.com', 'Juan123', '915123456'),
    (2, '77684212', 'Maria', 'Gonzalez', 'Rodriguez', 'mariagonzalez@gmail.com', 'Maria456', '925234567'),
    (3, '75698423', 'Pedro', 'Ramirez', 'Martinez', 'pedroramirez@gmail.com', 'Pedro789', '984345678'),
    (4, '74878914', 'Laura', 'Diaz', 'Fernandez', 'lauradiaz@gmail.com', 'Laura567', '995456789'),
    (5, '74546165', 'Carlos', 'Lopez', 'Gutierrez', 'carloslopez@gmail.com', 'Carlos123', '987567890'),
    (6, '78665156', 'Ana', 'Mendoza', 'Sanchez', 'anamendoza@gmail.com', 'Ana789', '978678901'),
    (7, '79156127', 'Luis', 'Torres', 'Hernandez', 'luistorres@gmail.com', 'Luis456', '996789012'),
    (8, '77899528', 'Carmen', 'Ortega', 'Vargas', 'carmenortega@gmail.com', 'Carmen567', '928890123'),
    (9, '71566899', 'Manuel', 'Santos', 'Lopez', 'manuelsantos@gmail.com', 'Manuel123', '945901234'),
    (10, '79156168', 'Elena', 'Castillo', 'Jimenez', 'elenacastillo@gmail.com', 'Elena789', '936012345');


INSERT INTO planes (codigo, monto, beneficios)
VALUES
    (9000, 0.00, 'Exploración de Diseño Básico, Compartir con la Comunidad, Interfaz Intuitiva y Visualización en Realidad Virtual'),
    (9100, 15.00, 'Amplia Biblioteca de Diseño, Colaboración en Tiempo Real, Ahorro de Tiempo y Dinero, Soporte Prioritario y Actualizaciones y Contenido Exclusivo'),
    (9200, 15.00, 'Amplia Biblioteca de Diseño, Colaboración en Tiempo Real, Ahorro de Tiempo y Dinero, Soporte Prioritario y Actualizaciones y Contenido Exclusivo'),
    (9300, 0.00, 'Exploración de Diseño Básico, Compartir con la Comunidad, Interfaz Intuitiva y Visualización en Realidad Virtual'),
    (9400, 15.00, 'Amplia Biblioteca de Diseño, Colaboración en Tiempo Real, Ahorro de Tiempo y Dinero, Soporte Prioritario y Actualizaciones y Contenido Exclusivo'),
    (9500, 0.00, 'Exploración de Diseño Básico, Compartir con la Comunidad, Interfaz Intuitiva y Visualización en Realidad Virtual'),
    (9600, 15.00, 'Amplia Biblioteca de Diseño, Colaboración en Tiempo Real, Ahorro de Tiempo y Dinero, Soporte Prioritario y Actualizaciones y Contenido Exclusivo'),
    (9700, 0.00, 'Exploración de Diseño Básico, Compartir con la Comunidad, Interfaz Intuitiva y Visualización en Realidad Virtual'),
    (9800, 15.00, 'Amplia Biblioteca de Diseño, Colaboración en Tiempo Real, Ahorro de Tiempo y Dinero, Soporte Prioritario y Actualizaciones y Contenido Exclusivo'),
    (9900, 0.00, 'Exploración de Diseño Básico, Compartir con la Comunidad, Interfaz Intuitiva y Visualización en Realidad Virtual');


INSERT INTO membresias (codigo_usuario,codigo_plan,fecha_inicio,fecha_vencimiento,estado)
VALUES
    (1, 9000, '15-01-2023', '15-02-2023', 'Activa'),
    (2, 9100, '20-02-2023', '20-03-2023', 'Activa'),
    (3, 9200, '10-03-2023', '10-04-2023', 'Activa'),
    (4, 9300, '01-07-2023', '01-08-2023', 'Pendiente'),
    (5, 9400, '05-04-2023', '05-05-2024', 'Activa'),
    (6, 9500, '15-06-2023', '15-07-2023', 'Pendiente'),
    (7, 9600, '10-08-2023', '10-09-2024', 'Activa'),
    (8, 9700, '05-09-2023', '05-10-2023', 'Pendiente'),
    (9, 9800, '15-10-2023', '15-11-2024', 'Activa'),
    (10, 9900, '20-11-2023', '20-12-2024', 'Activa');


INSERT INTO proyectos (codigo, codigo_usuario, nombre, fecha_de_creacion, descripcion, estado, ultima_modificacion)
VALUES
    (1101, 1, 'Renovación de Sala de Estar', '2023-10-01', 'Proyecto de renovación de la sala de estar con un enfoque en colores y mobiliario moderno.', 'En Curso', '2023-10-15'),
    (1102, 2, 'Diseño de Cocina Abierta', '2023-10-02', 'Proyecto de diseño de una cocina abierta para mejorar el flujo y la funcionalidad.', 'Completado', '2023-10-16'),
    (1103, 3, 'Decoración de Dormitorio Principal', '2023-10-03', 'Proyecto de decoración del dormitorio principal con un estilo contemporáneo.', 'Archivado', '2023-10-17'),
    (1104, 4, 'Rediseño de Espacio de Oficina en Casa', '2023-10-04', 'Proyecto de rediseño de un espacio de oficina en casa para mayor productividad.', 'En Curso', '2023-10-18'),
    (1105, 5, 'Diseño de Baño de Invitados', '2023-10-05', 'Proyecto de diseño de un baño de invitados con un enfoque en la elegancia y la funcionalidad.', 'Completado', '2023-10-19'),
    (1106, 6, 'Reorganización del Salón Comedor', '2023-10-06', 'Proyecto de reorganización del salón comedor para crear un espacio acogedor y versátil.', 'Archivado', '2023-10-20'),
    (1107, 7, 'Diseño de Jardín Interior', '2023-10-07', 'Proyecto de diseño de un jardín interior con plantas tropicales y zonas de descanso.', 'En Curso', '2023-10-21'),
    (1108, 8, 'Renovación del Cuarto de Niños', '2023-10-08', 'Proyecto de renovación del cuarto de niños con un tema de aventuras y colores brillantes.', 'Completado', '2023-10-22'),
    (1109, 9, 'Diseño de Zona de Entretenimiento', '2023-10-09', 'Proyecto de diseño de una zona de entretenimiento en el sótano con un bar y sala de juegos.', 'Archivado', '2023-10-23'),
    (1110, 10, 'Renovación de Baño Principal', '2023-10-10', 'Proyecto de renovación del baño principal con una bañera de hidromasaje y ducha de lluvia.', 'En Curso', '2023-10-24');


INSERT INTO calificaciones_proyectos(codigo_usuario, codigo_proyecto, fecha_de_calificacion, puntuacion, comentario)
VALUES
    (10, 1101, '2023-10-26', '4', 'Excelente proyecto de renovación de la sala de estar.'),
    (9, 1102, '2023-10-02','5','Muy satisfecho con el diseño de la cocina abierta.'),
    (1, 1103, '2023-10-28','3','El proyecto de decoración del dormitorio necesita mejoras.'),
    (2, 1104, '2023-10-22','4','Buen progreso en el rediseño de la oficina en casa.'),
    (8, 1105, '2023-10-05','5','Diseño elegante y funcional del baño de invitados.'),
    (7, 1106, '2023-10-20','2','No satisfecho con la reorganización del salón comedor.'),
    (3, 1107, '2023-10-15','4','Esperando ver más avances en el diseño del jardín interior.'),
    (4, 1108, '2023-10-08','5','Increíble trabajo en la renovación del cuarto de niños.'),
    (5, 1109, '2023-10-10','3', 'La zona de entretenimiento necesita mejoras.'),
    (6, 1110, '2023-10-17', '4', 'Buen progreso en la renovación del baño principal.');


INSERT INTO categorias (codigo, nombre_categoria)
VALUES
    (1000, 'Minimalista'),
    (1001, 'Industrial'),
    (1002, 'Rústico'),
    (1003, 'Contemporáneo'),
    (1004, 'Clásico'),
    (1005, 'Bohemio'),
    (1006, 'Nórdico'),
    (1007, 'Tropical'),
    (1008, 'Ecléctico'),
    (1009, 'Escandinavo');


INSERT INTO  proyectos_categorias(codigo_proyecto, codigo_categoria)
VALUES
    (1101, 1000),
    (1102, 1001),
    (1103, 1002),
    (1104, 1003),
    (1105, 1004),
    (1106, 1005),
    (1107, 1006),
    (1108, 1007),
    (1109, 1008),
    (1110, 1009);


INSERT INTO espacios (codigo, tipo_de_espacio)
VALUES
    (5050, 'Baño'),
    (5051, 'Dormitorio'),
    (5052, 'Sala'),
    (5053, 'Comedor'),
    (5054, 'Cocina'),
    (5055, 'Terraza'),
    (5056, 'Comedor'),
    (5057, 'Sótano'),
    (5058, 'Garaje'),
    (5059, 'Oficina en Casa');


INSERT INTO proyectos_espacios(codigo_proyecto, codigo_espacio)
VALUES
    (1101, 5050),
    (1102, 5051),
    (1103, 5052),
    (1104, 5053),
    (1105, 5054),
    (1106, 5055),
    (1107, 5056),
    (1108, 5057),
    (1109, 5058),
    (1110, 5059);


INSERT INTO artefactos_electronicos (codigo, nombre, marca, modelo, precio, ancho, largo, altura)
VALUES
    (120001, 'Smart TV', 'Sony', 'Bravia 4K', 599.99, 55.5, 31.2, 5.6),
    (120002, 'Laptop', 'Dell', 'XPS 15', 1299.99, 13.3, 9.2, 0.7),
    (120003, 'Smartphone', 'Samsung', 'Galaxy S21', 799.99, 2.8, 6.2, 0.3),
    (120004, 'Tablet', 'Apple', 'iPad Pro', 999.99, 9.7, 7.0, 0.3),
    (120005, 'Soundbar', 'Bose', 'SoundTouch 300', 399.99, 4.3, 38.5, 2.2),
    (120006, 'Refrigerador', 'LG', 'InstaView', 1499.99, 35.5, 70.2, 28.6),
    (120007, 'Cámara', 'Canon', 'EOS 5D Mark IV', 2499.99, 5.9, 4.6, 3.0),
    (120008, 'Impresora', 'HP', 'LaserJet Pro', 299.99, 15.4, 20.9, 9.4),
    (120009, 'Consola de juegos', 'Sony', 'PlayStation 5', 499.99, 10.4, 15.4, 4.1),
    (120010, 'Altavoz Bluetooth', 'JBL', 'Charge 4', 119.99, 8.7, 18.1, 7.4);


INSERT INTO espacios_artefactos_electronicos(codigo_artefacto_electronico, codigo_espacio)
VALUES
    (120001, 5050),
    (120002, 5051),
    (120003, 5052),
    (120004, 5053),
    (120005, 5054),
    (120006, 5055),
    (120007, 5056),
    (120008, 5057),
    (120009, 5058),
    (120010, 5059);


INSERT INTO muebles (codigo, nombre, modelo, marca, color, precio, ancho, largo, altura)
VALUES
    (13000, 'Mesa de comedor', 'Clásica', 'Mueblería ABC', 'Marrón', 299.99, 150.0, 80.0, 75.0),
    (13100, 'Sofá seccional', 'Contemporáneo', 'Muebles XYZ', 'Gris', 599.99, 200.0, 100.0, 85.0),
    (13200, 'Silla de oficina', 'Ergonómica', 'Muebles Ergo', 'Negro', 149.99, 60.0, 60.0, 120.0),
    (13300, 'Cama individual', 'Modernista', 'CamaCozy', 'Blanco', 199.99, 90.0, 200.0, 45.0),
    (13400, 'Armario de almacenamiento', 'Rústico', 'WoodWorks', 'Roble', 349.99, 100.0, 50.0, 180.0),
    (13500, 'Mesa de café', 'Industrial', 'MetalMuebles', 'Negro', 79.99, 80.0, 80.0, 45.0),
    (13600, 'Escritorio de estudio', 'Minimalista', 'MueblesMínimos', 'Blanco', 129.99, 120.0, 60.0, 75.0),
    (13700, 'Estantería modular', 'Contemporáneo', 'ModuMuebles', 'Blanco', 169.99, 90.0, 30.0, 180.0),
    (13800, 'Silla de comedor', 'Clásica', 'Muebles Antiguos', 'Caoba', 79.99, 50.0, 50.0, 90.0),
    (13900, 'Mesa de noche', 'Elegante', 'Muebles Nocturnos', 'Negro', 49.99, 45.0, 45.0, 60.0);


INSERT INTO espacios_muebles(codigo_mueble, codigo_espacio)
VALUES
    (13000, 5050),
    (13100, 5051),
    (13200, 5052),
    (13300, 5053),
    (13400, 5054),
    (13500, 5055),
    (13600, 5056),
    (13700, 5057),
    (13800, 5058),
    (13900, 5059);


INSERT INTO decoraciones (codigo, nombre, color, textura, precio)
VALUES
    (40000, 'Cuadro Abstracto', 'Azul', 'Textura abstracta en acrílico', 99.99),
    (40001, 'Alfombra Shaggy', 'Gris', 'Pelo largo y suave', 49.99),
    (40002, 'Jarrón de Cerámica', 'Blanco', 'Diseño elegante', 29.99),
    (40003, 'Cojines Decorativos', 'Varios colores', 'Tejido de algodón', 19.99),
    (40004, 'Lámpara de Pie', 'Negra', 'Estilo moderno', 79.99),
    (40005, 'Cortinas de Seda', 'Dorado', 'Con forro opaco', 69.99),
    (40006, 'Espejo de Pared', 'Plateado', 'Diseño ovalado', 59.99),
    (40007, 'Estante Flotante', 'Madera natural', 'Estilo rústico', 39.99),
    (40008, 'Mesa de Centro', 'Negra', 'Superficie de vidrio', 89.99),
    (40009, 'Escultura Decorativa', 'Plata', 'Diseño geométrico', 49.99);


INSERT INTO espacios_decoraciones(codigo_decoracion, codigo_espacio)
VALUES
    (40000, 5050),
    (40001, 5051),
    (40002, 5052),
    (40003, 5053),
    (40004, 5054),
    (40005, 5055),
    (40006, 5056),
    (40007, 5057),
    (40008, 5058),
    (40009, 5059);
