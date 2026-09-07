# 04 - Modelo de Datos

El esquema se define en `db/schema.sql` y consta de las siguientes entidades:

## Entidades y Relaciones
1. **cliente**:
   - `id_cliente` (SERIAL, PK)
   - `nombre` (VARCHAR(100), NOT NULL)
   - `direccion` (VARCHAR(150), NOT NULL)
   - `telefono` (VARCHAR(20))
   - `email` (VARCHAR(100), UNIQUE, NOT NULL)
   - `activo` (BOOLEAN, DEFAULT TRUE)
   - `created_at` (TIMESTAMPTZ, DEFAULT now())

2. **categoria**:
   - `id_categoria` (SERIAL, PK)
   - `nombre` (VARCHAR(100), UNIQUE, NOT NULL)
   - `descripcion` (TEXT)
   - `activo` (BOOLEAN, DEFAULT TRUE)

3. **producto**:
   - `id_producto` (SERIAL, PK)
   - `nombre` (VARCHAR(100), NOT NULL)
   - `precio` (NUMERIC(10,2), CHECK precio >= 0)
   - `stock` (INT, CHECK stock >= 0)
   - `activo` (BOOLEAN, DEFAULT TRUE)
   - `categoria_id` (INT, FK a categoria, ON DELETE RESTRICT)

4. **pedido**:
   - `id_pedido` (SERIAL, PK)
   - `fecha` (TIMESTAMPTZ, DEFAULT now())
   - `forma_pago` (VARCHAR(20), CHECK IN ('EFECTIVO','TARJETA','TRANSFERENCIA'))
   - `total` (NUMERIC(12,2), CHECK total >= 0)
   - `cliente_id` (INT, FK a cliente, ON DELETE RESTRICT)

5. **detalle_pedido**:
   - `id_detalle` (SERIAL, PK)
   - `id_pedido` (INT, FK a pedido, ON DELETE CASCADE)
   - `id_producto` (INT, FK a producto, ON DELETE RESTRICT)
   - `cantidad` (INT, CHECK cantidad > 0)
   - `precio_unitario` (NUMERIC(10,2), CHECK precio_unitario >= 0)
   - `subtotal` (NUMERIC(12,2), GENERATED ALWAYS AS (cantidad * precio_unitario) STORED)

## Índices
- `idx_pedido_cliente` en `pedido(cliente_id)`
- `idx_producto_categoria_activo` en `producto(categoria_id) WHERE activo = TRUE`
