# 09 - Decisiones y Supuestos

- **Decisión 1**: Uso de columnas generadas (`GENERATED ALWAYS AS ... STORED`) para `detalle_pedido.subtotal` para garantizar consistencia y evitar discrepancias de cálculo en la aplicación.
- **Decisión 2**: Políticas estrictas de borrado (`ON DELETE RESTRICT`) en relaciones críticas como productos y categorías para evitar pérdida accidental de datos históricos de ventas.
- **Supuesto 1**: Los precios de los productos se almacenan como `NUMERIC(10,2)` para evitar errores de redondeo de punto flotante.
- **Supuesto 2**: Cada pedido pertenece a un único cliente registrado en el sistema.
