# 05 - Reglas de Negocio

- **RN-01 (Precios y Stock no negativos)**: El precio y el stock de los productos no pueden ser negativos (`precio >= 0`, `stock >= 0`).
- **RN-02 (Formas de pago válidas)**: La forma de pago de un pedido debe pertenecer al conjunto cerrado: `EFECTIVO`, `TARJETA`, `TRANSFERENCIA`.
- **RN-03 (Cantidades positivas)**: La cantidad de un producto en el detalle de pedido debe ser estrictamente mayor a cero (`cantidad > 0`).
- **RN-04 (Cálculo automático de subtotal)**: El subtotal de cada ítem en el detalle de pedido se calcula automáticamente mediante una columna generada: `cantidad * precio_unitario`.
- **RN-05 (Integridad referencial en productos y categorías)**: No se puede eliminar una categoría si tiene productos asociados (`ON DELETE RESTRICT`). No se puede eliminar un producto si está referenciado en un detalle de pedido (`ON DELETE RESTRICT`).
- **RN-06 (Cascada en pedidos y detalles)**: Si se elimina un pedido, sus detalles asociados se eliminan en cascada (`ON DELETE CASCADE`).
