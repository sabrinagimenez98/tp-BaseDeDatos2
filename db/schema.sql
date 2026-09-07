-- ================================
-- Food Store - schema.sql
-- Alumna: Sabrina Gimenez
-- Proyecto integrador Base de Datos II
-- ================================

-- Tabla de clientes
CREATE TABLE cliente (
    id_cliente SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(150) NOT NULL,
    telefono VARCHAR(20),
    email VARCHAR(100) UNIQUE NOT NULL,
    activo BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMPTZ DEFAULT now()
);

-- Tabla de categorías
CREATE TABLE categoria (
    id_categoria SERIAL PRIMARY KEY,
    nombre VARCHAR(100) UNIQUE NOT NULL,
    descripcion TEXT,
    activo BOOLEAN DEFAULT TRUE
);

-- Tabla de productos
CREATE TABLE producto (
    id_producto SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    precio NUMERIC(10,2) CHECK (precio >= 0),
    stock INT CHECK (stock >= 0),
    activo BOOLEAN DEFAULT TRUE,
    categoria_id INT NOT NULL,
    FOREIGN KEY (categoria_id) REFERENCES categoria(id_categoria)
        ON DELETE RESTRICT
);

-- Tabla de pedidos
CREATE TABLE pedido (
    id_pedido SERIAL PRIMARY KEY,
    fecha TIMESTAMPTZ DEFAULT now(),
    forma_pago VARCHAR(20) CHECK (forma_pago IN ('EFECTIVO','TARJETA','TRANSFERENCIA')),
    total NUMERIC(12,2) CHECK (total >= 0),
    cliente_id INT NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES cliente(id_cliente)
        ON DELETE RESTRICT
);

-- Tabla detalle de pedidos
CREATE TABLE detalle_pedido (
    id_detalle SERIAL PRIMARY KEY,
    id_pedido INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT CHECK (cantidad > 0),
    precio_unitario NUMERIC(10,2) CHECK (precio_unitario >= 0),
    subtotal NUMERIC(12,2) GENERATED ALWAYS AS (cantidad * precio_unitario) STORED,
    FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido)
        ON DELETE CASCADE,
    FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
        ON DELETE RESTRICT
);

-- Índices para optimizar consultas
CREATE INDEX idx_pedido_cliente ON pedido(cliente_id);
CREATE INDEX idx_producto_categoria_activo ON producto(categoria_id) WHERE activo = TRUE;

