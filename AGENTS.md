# Food Store — Instrucciones para Agentes

> **Propósito**: Guía unificada para agentes autónomos y desarrolladores en el proyecto Food Store (Proyecto Integrador Base de Datos II).

---

## Stack Tecnológico

| Componente | Tecnología | Versión / Detalle |
|---|---|---|
| Base de Datos | PostgreSQL / SQL | Motor relacional estándar |
| Esquema DDL | SQL | `db/schema.sql` |
| Documentación | OpenSpec & Knowledge Base | `knowledge-base/`, `CHANGES.md` |

---

## Base de Conocimiento (Knowledge Base)

La fuente de verdad arquitectónica reside en `knowledge-base/`:
- [01. Visión y Objetivos](./knowledge-base/01_vision_y_objetivos.md)
- [02. Descripción General](./knowledge-base/02_descripcion_general.md)
- [03. Actores y Roles](./knowledge-base/03_actores_y_roles.md)
- [04. Modelo de Datos](./knowledge-base/04_modelo_de_datos.md)
- [05. Reglas de Negocio](./knowledge-base/05_reglas_de_negocio.md)
- [06. Funcionalidades](./knowledge-base/06_funcionalidades.md)
- [07. Flujos Principales](./knowledge-base/07_flujos_principales.md)
- [08. Arquitectura Propuesta](./knowledge-base/08_arquitectura_propuesta.md)
- [09. Decisiones y Supuestos](./knowledge-base/09_decisiones_y_supuestos.md)
- [10. Preguntas Abiertas](./knowledge-base/10_preguntas_abiertas.md)

---

## Skills Disponibles

| Agente / Rol | Skills Asignadas |
|---|---|
| Database / Backend | `kb-creator`, `roadmap-generator`, `find-skill`, `skill-registry`, `agent-instruction` |

> Los compact rules de cada skill los resuelve el orquestador desde `.atl/skill-registry.md` (generado por `skill-registry`; no versionado).

---

## Roadmap de Changes

El desarrollo se rige por `CHANGES.md`.
- **Camino Crítico**: C-01 → C-02 → C-03 → C-04 → C-05
- **Siguiente Change pendiente**: `C-02` (Tablas Base: cliente y categoria)

---

## Reglas Duras (específicas del proyecto)

> Reglas globales ya definidas en `~/.claude/CLAUDE.md` (orquestador, governance, TDD, engram): el proyecto las hereda. Acá viven solo las reglas **específicas de este proyecto**.

1. **NUNCA modificar el esquema SQL** (`db/schema.sql`) sin validar las restricciones de integridad referencial (`ON DELETE RESTRICT` / `ON DELETE CASCADE`) y constraints `CHECK`.
2. **Nombres en snake_case**: Todas las tablas, columnas, índices y restricciones en la base de datos deben seguir rigurosamente la convención `snake_case`.
3. **Tipos numéricos precisos**: Usar `NUMERIC(10,2)` o equivalente para precios y montos monetarios para evitar errores de punto flotante.

---

## Flujo de Trabajo

1. Consultar la KB y `CHANGES.md`.
2. Proponer change con OpenSpec (`/opsx:propose`).
3. Implementar modificaciones en SQL y scripts.
4. Verificar integridad de la base de datos.
5. Archivar y marcar como completado.
---

## Seguridad del Proyecto

Las normas específicas de seguridad están documentadas en:
- [.kiro/steering/security-policies.md](./.kiro/steering/security-policies.md)

> Estas reglas complementan las Reglas Duras y garantizan que nunca se expongan credenciales, que se validen inputs y que las contraseñas se almacenen de forma segura.
