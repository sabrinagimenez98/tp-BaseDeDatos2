# 03 - Actores y Roles

## Actores del Sistema
1. **Cliente**: Usuario final que realiza pedidos en la tienda.
2. **Administrador**: Gestor de la tienda que administra productos, categorías y visualiza pedidos.

## Matriz de Permisos (RBAC preliminar)
| Entidad / Acción | Cliente | Administrador |
|------------------|---------|---------------|
| Registrarse / Gestionar perfil | Sí (propio) | Sí |
| Ver catálogo (productos y categorías) | Sí | Sí |
| Realizar pedido | Sí | Sí |
| Gestionar productos y categorías | No | Sí |
| Ver todos los pedidos | No (solo propios) | Sí |
