# 01 - Visión y Objetivos

## Propósito del Proyecto
Food Store es el proyecto integrador para la materia Base de Datos II. Su propósito es implementar un sistema relacional robusto para la gestión de una tienda de alimentos, abarcando clientes, categorías, productos, pedidos y el detalle de los mismos.

## Objetivos
- Diseñar e implementar un esquema de base de datos relacional normalizado y eficiente.
- Garantizar la integridad de los datos mediante restricciones (`CHECK`, `FOREIGN KEY`, `UNIQUE`).
- Optimizar el rendimiento de consultas frecuentes mediante índices adecuados.

## Alcance
- Gestión de clientes (registro, datos de contacto, estado activo).
- Gestión de inventario (categorías y productos con control de stock y precios no negativos).
- Procesamiento de pedidos (formas de pago: efectivo, tarjeta, transferencia, cálculo de subtotales mediante columnas generadas).
- Detalle de pedidos con eliminación en cascada para pedidos y restricción en productos.

## Fuera de Alcance (para esta versión)
- Pasarelas de pago reales externas.
- Sistema de autenticación y roles avanzados (JWT/OAuth).
- Interfaz gráfica de usuario completa (frontend).
