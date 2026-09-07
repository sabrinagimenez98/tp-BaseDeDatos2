# CHANGES — Secuencia de Implementación

> Índice canónico de todos los changes del proyecto Food Store.
> Cada change es atómico: un agente puede implementarlo en una sesión (~4-6 horas).
> **Leer este archivo antes de ejecutar cualquier `/opsx:propose`.**

---

## Cómo usar este documento

1. Identificar el siguiente change pendiente (`C-NN`).
2. Leer los archivos referenciados en "Leer antes".
3. Proponer el change con `/opsx:propose C-NN-nombre`.
4. Implementar y verificar.
5. Archivar change y marcar el checkbox `[x]`.

---

## Árbol de dependencias

```
C-01 (Foundation & Schema DDL)
└── C-02 (Tablas Base: cliente y categoria)
    └── C-03 (Tabla producto y restricciones)
        └── C-04 (Tablas pedido y detalle_pedido con subtotales)
            └── C-05 (Validaciones, Índices y Consultas de Prueba)
```

### Paralelismo por fase

- **GATE 0**: C-01 (Foundation) ✓
  - → C-02 (Tablas Base) [Agente A]
- **GATE 1**: C-02 ✓
  - → C-03 (Productos) [Agente A]
- **GATE 2**: C-03 ✓
  - → C-04 (Pedidos y Detalles) [Agente A]
- **GATE 3**: C-04 ✓
  - → C-05 (Validaciones y Pruebas) [Agente A]

### Camino crítico (5 changes — mínimo irreducible)
C-01 → C-02 → C-03 → C-04 → C-05

### Plan óptimo con 3 agentes

| Paso | Agente A (Backend/DB Core) | Agente B (Auxiliar) | Agente C (Testing/QA) |
|---|---|---|---|
| 1 | C-01 (Foundation & Schema) | — | — |
| 2 | C-02 (Tablas Base) | — | — |
| 3 | C-03 (Productos) | — | — |
| 4 | C-04 (Pedidos y Detalle) | — | — |
| 5 | C-05 (Validaciones y Pruebas) | — | Revisión de integridad |

---

## FASE 1 — Infraestructura y Modelo de Datos Relacional

### [C-01] `foundation-setup`
- **Estado**: `[x]` completado (schema.sql y KB iniciales listos)
- **Scope**:
  - Estructura de directorios (`db/`, `knowledge-base/`, `openspec/`)
  - Configuración de `.env.example` para conexión a PostgreSQL
  - Creación de base de datos y esquema inicial
- **Dependencias**: ninguna
- **Governance**: BAJO
- **Leer antes**:
  - `knowledge-base/01_vision_y_objetivos.md`
  - `knowledge-base/08_arquitectura_propuesta.md`

### [C-02] `tablas-base-cliente-categoria`
- **Estado**: `[ ]` pendiente
- **Scope**:
  - Verificación de la tabla `cliente` (`id_cliente`, `nombre`, `direccion`, `telefono`, `email` UNIQUE, `activo`, `created_at`)
  - Verificación de la tabla `categoria` (`id_categoria`, `nombre` UNIQUE, `descripcion`, `activo`)
  - Scripts de seed data inicial para clientes y categorías
- **Dependencias**: C-01
- **Governance**: MEDIO
- **Leer antes**:
  - `knowledge-base/04_modelo_de_datos.md §cliente`
  - `knowledge-base/04_modelo_de_datos.md §categoria`
  - `knowledge-base/05_reglas_de_negocio.md`

### [C-03] `gestion-productos`
- **Estado**: `[ ]` pendiente
- **Scope**:
  - Implementación de la tabla `producto` (`id_producto`, `nombre`, `precio` con `CHECK (precio >= 0)`, `stock` con `CHECK (stock >= 0)`, `activo`, `categoria_id` FK con `ON DELETE RESTRICT`)
  - Creación de índice `idx_producto_categoria_activo`
- **Dependencias**: C-02
- **Governance**: ALTO
- **Leer antes**:
  - `knowledge-base/04_modelo_de_datos.md §producto`
  - `knowledge-base/05_reglas_de_negocio.md §RN-01`
  - `knowledge-base/07_flujos_principales.md §Flujo 1`

### [C-04] `gestion-pedidos-y-detalles`
- **Estado**: `[ ]` pendiente
- **Scope**:
  - Implementación de la tabla `pedido` (`id_pedido`, `fecha`, `forma_pago` con `CHECK IN ('EFECTIVO','TARJETA','TRANSFERENCIA')`, `total`, `cliente_id` FK con `ON DELETE RESTRICT`)
  - Implementación de la tabla `detalle_pedido` (`id_detalle`, `id_pedido` FK con `ON DELETE CASCADE`, `id_producto` FK con `ON DELETE RESTRICT`, `cantidad` con `CHECK (cantidad > 0)`, `precio_unitario`, columna generada `subtotal GENERATED ALWAYS AS (cantidad * precio_unitario) STORED`)
  - Creación de índice `idx_pedido_cliente`
- **Dependencias**: C-03
- **Governance**: CRITICO
- **Leer antes**:
  - `knowledge-base/04_modelo_de_datos.md §pedido`
  - `knowledge-base/04_modelo_de_datos.md §detalle_pedido`
  - `knowledge-base/05_reglas_de_negocio.md §RN-02..06`
  - `knowledge-base/07_flujos_principales.md §Flujo 2`

### [C-05] `validaciones-integridad-y-pruebas`
- **Estado**: `[ ]` pendiente
- **Scope**:
  - Pruebas unitarias y de integración de restricciones CHECK (`precio >= 0`, `stock >= 0`, `cantidad > 0`, `forma_pago`)
  - Verificación de comportamiento de borrado (`ON DELETE RESTRICT` vs `ON DELETE CASCADE`)
  - Verificación de cálculo automático de subtotales
- **Dependencias**: C-04
- **Governance**: ALTO
- **Leer antes**:
  - `knowledge-base/05_reglas_de_negocio.md`
  - `knowledge-base/09_decisiones_y_supuestos.md`
  - `knowledge-base/10_preguntas_abiertas.md`
