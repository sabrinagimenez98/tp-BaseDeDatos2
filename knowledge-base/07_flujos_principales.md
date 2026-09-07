# 07 - Flujos Principales

## Flujo 1: Alta de Producto
1. El administrador verifica o crea la categoría correspondiente en la tabla `categoria`.
2. Se inserta el producto en la tabla `producto` indicando nombre, precio, stock y `categoria_id`.
3. El sistema valida que el precio y stock sean `>= 0`.

## Flujo 2: Creación de Pedido con Detalle
1. El cliente se registra o selecciona de la tabla `cliente`.
2. Se inserta el registro en la tabla `pedido` especificando `cliente_id` y `forma_pago`.
3. Se insertan los registros en `detalle_pedido` asociando `id_pedido`, `id_producto`, `cantidad` y `precio_unitario`.
4. La columna generada `subtotal` calcula automáticamente `cantidad * precio_unitario`.
