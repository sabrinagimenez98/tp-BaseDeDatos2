# Skill Registry

**Delegator use only.** Any agent that launches sub-agents reads this registry to resolve compact rules, then injects them directly into sub-agent prompts. Sub-agents do NOT read this registry or individual SKILL.md files.

## User Skills

| Trigger | Skill | Path |
|---------|-------|------|
| Crear, construir, generar base de conocimiento | kb-creator | C:\Users\Sabrina Gimenez\.config\opencode\skills\kb-creator\SKILL.md |
| Crear, construir, regenerar CHANGES.md o roadmap | roadmap-generator | C:\Users\Sabrina Gimenez\.config\opencode\skills\roadmap-generator\SKILL.md |
| Buscar e instalar skills | find-skill | C:\Users\Sabrina Gimenez\.config\opencode\skills\find-skill\SKILL.md |
| Actualizar skill registry | skill-registry | C:\Users\Sabrina Gimenez\.config\opencode\skills\skill-registry\SKILL.md |
| Generar AGENTS.md / CLAUDE.md | agent-instruction | C:\Users\Sabrina Gimenez\.config\opencode\skills\agent-instruction\SKILL.md |

## Compact Rules

### kb-creator
- Usar modo silent si existe docs/ o interactivo desde cero
- Mantener los 10 archivos canónicos obligatorios en knowledge-base/
- Respetar el state contract para state.kb cuando esté orquestado

### roadmap-generator
- Validar pre-checks (knowledge-base/ con 10 canónicos, openspec/)
- Generar CHANGES.md en raíz con formato canónico de Fases, Changes, Gates y Camino Crítico
- Respetar restricciones del usuario y state contract state.roadmap

### find-skill
- Buscar skills usando el ecosistema y verificar reputación e installs
- Recomendar primero y nunca auto-instalar sin confirmación del usuario

### skill-registry
- Escanear skills globales y de proyecto
- Generar reglas compactas y registrar convenciones en .atl/skill-registry.md

### agent-instruction
- Generar CLAUDE.md / AGENTS.md canónicos específicos del proyecto sin repetir el global
- Consultar el skill-registry como fuente de verdad

## Project Conventions

| File | Path | Notes |
|------|------|-------|
| README.md | README.md | Archivo principal del proyecto |
| schema.sql | db/schema.sql | Esquema relacional base de datos |
