# Atajos de Teclado de Configuración Neovim

Guía de referencia completa para todos los atajos de teclado en esta configuración de Neovim.

**Nota:** La tecla `<leader>` está configurada como `<Space>` (barra espaciadora)

---

## Tabla de Contenidos

1. [Navegación General](#navegación-general)
2. [Gestión de Archivos](#gestión-de-archivos)
3. [Telescope (Buscador de Archivos)](#telescope-buscador-de-archivos)
4. [Nvim-Tree (Explorador de Archivos)](#nvim-tree-explorador-de-archivos)
5. [LSP (Protocolo de Servidor de Lenguaje)](#lsp-protocolo-de-servidor-de-lenguaje)
6. [Integración Git](#integración-git)
7. [Harpoon (Navegación Rápida de Archivos)](#harpoon-navegación-rápida-de-archivos)
8. [Claude Code (Asistente IA)](#claude-code-asistente-ia)
9. [Formateo de Código](#formateo-de-código)
10. [Búsqueda y Navegación](#búsqueda-y-navegación)
11. [Edición de Texto](#edición-de-texto)
12. [Gestión de Ventanas](#gestión-de-ventanas)
13. [Misceláneos](#misceláneos)

---

## Navegación General

| Atajo | Modo | Descripción |
|-------|------|-------------|
| `e` | Normal | Mover arriba (mapeo personalizado, reemplaza `k`) |
| `h` | Normal | Mover izquierda |
| `j` | Normal | Mover abajo |
| `t` | Normal | Mover derecha (mapeo personalizado, reemplaza `l`) |
| `u` | Normal | Deshacer |
| `u` | Visual | Deshacer en modo visual |

---

## Gestión de Archivos

| Atajo | Modo | Descripción |
|-------|------|-------------|
| `<leader>fx` | Normal | Abrir explorador de archivos (netrw) |
| `<leader>fp` | Normal | Formatear archivo con Prettier |

---

## Telescope (Buscador de Archivos)

| Atajo | Modo | Descripción |
|-------|------|-------------|
| `<leader>ff` | Normal | Buscar archivos |
| `<leader>fs` | Normal | Buscar cadena de texto (grep) |
| `<leader>fb` | Normal | Buscar buffers |
| `<leader>fh` | Normal | Buscar etiquetas de ayuda |

**Navegación en Telescope:**
- `j` / `k` - Navegar arriba/abajo
- `Enter` - Abrir archivo seleccionado
- `Esc` / `q` - Cerrar Telescope
- `Ctrl-t` - Abrir en nueva pestaña
- `Ctrl-v` - Abrir en división vertical
- `Ctrl-x` - Abrir en división horizontal

---

## Nvim-Tree (Explorador de Archivos)

| Atajo | Modo | Descripción |
|-------|------|-------------|
| `<leader>nt` | Normal | Alternar árbol de archivos |
| `<leader>nf` | Normal | Enfocar árbol de archivos |

**Dentro de Nvim-Tree:**
| `<CR>` (Enter) | Normal | Abrir archivo |
| `<C-v>` | Normal | Abrir en división vertical |
| `<C-x>` | Normal | Abrir en división horizontal |
| `<C-t>` | Normal | Abrir en nueva pestaña |
| `<C-o>` | Normal | Cerrar nodo padre |
| `D` | Normal | Mover a papelera |
| `s` | Normal | Ejecutar comando del sistema |
| `W` | Normal | Colapsar todo |
| `g?` | Normal | Alternar ayuda |

---

## LSP (Protocolo de Servidor de Lenguaje)

| Atajo | Modo | Descripción |
|-------|------|-------------|
| `gd` | Normal | Ir a definición |
| `K` | Normal | Mostrar documentación al pasar el mouse |
| `<leader>vws` | Normal | Buscar símbolo en workspace |
| `<leader>vd` | Normal | Mostrar diagnóstico en ventana flotante |
| `[d` | Normal | Ir al diagnóstico anterior |
| `]d` | Normal | Ir al siguiente diagnóstico |
| `<leader>vca` | Normal | Acciones de código |
| `<leader>vrr` | Normal | Mostrar referencias |
| `<leader>vrn` | Normal | Renombrar símbolo |
| `<C-h>` | Insert | Ayuda de firma |

---

## Integración Git

### Fugitive (Comandos Git)

| Atajo | Modo | Descripción |
|-------|------|-------------|
| `<leader>gs` | Normal | Abrir estado de Git |
| `<leader>gu` | Normal | Git blame y navegar |

**Dentro del Buffer de Fugitive:**
| `<leader>p` | Normal | Git push |
| `<leader>P` | Normal | Git pull (con rebase) |
| `<leader>gc` | Normal | Git commit |
| `<leader>gt` | Normal | Git push -u origin (con selección de rama) |
| `<leader>gv` | Normal | Git diff archivo |

**Navegación de Diff:**
| `<leader>dg2` | Normal | Obtener cambios del buffer 2 (izquierda) |
| `<leader>dg3` | Normal | Obtener cambios del buffer 3 (derecha) |
| `<leader>dgn` | Normal | Siguiente bloque diff |
| `<leader>dgp` | Normal | Bloque diff anterior |

### GitLinker

| Atajo | Modo | Descripción |
|-------|------|-------------|
| `<leader>gu` | Normal | Obtener URL de Git para línea actual |
| `<leader>gu` | Visual | Obtener URL de Git para rango seleccionado |

### Gitsigns

| Atajo | Modo | Descripción |
|-------|------|-------------|
| `<leader>gp` | Normal | Vista previa del bloque |
| `<leader>gb` | Normal | Alternar blame de línea actual |

---

## Harpoon (Navegación Rápida de Archivos)

| Atajo | Modo | Descripción |
|-------|------|-------------|
| `<leader>a` | Normal | Agregar archivo a harpoon |
| `<C-e>` | Normal | Alternar menú rápido de harpoon |
| `<C-t>` | Normal | Navegar al archivo 1 |
| `<C-b>` | Normal | Navegar al archivo 2 |
| `<C-n>` | Normal | Navegar al archivo 3 |
| `<C-s>` | Normal | Navegar al archivo 4 |

---

## Claude Code (Asistente IA)

### Abrir y Alternar

| Atajo | Modo | Descripción |
|-------|------|-------------|
| `<leader>cc` | Normal | Abrir/Enfocar terminal de Claude Code |
| `<leader>cC` | Normal | Cambiar de código a terminal de Claude (cuando Claude está abierto) |
| `<leader>cq` | Terminal | Cambiar de terminal de Claude a ventana de código (mantiene Claude abierto) |

### Gestión de Conversaciones

| Atajo | Modo | Descripción |
|-------|------|-------------|
| `<leader>aC` | Normal | Continuar última conversación de Claude |
| `<leader>ar` | Normal | Reanudar Claude (seleccionar del historial) |
| `<leader>ch` | Normal | Abrir selector de historial de Claude |
| `<leader>cv` | Normal | Modo verbose de Claude Code |

### Enviar Contexto a Claude

| Atajo | Modo | Descripción |
|-------|------|-------------|
| `<leader>as` | Visual | Enviar selección visual a Claude |
| `<leader>ab` | Normal | Agregar buffer actual al contexto de Claude |

### Gestión de Diffs

| Atajo | Modo | Descripción |
|-------|------|-------------|
| `<leader>aa` | Normal | Aceptar cambios de diff (guarda el archivo) |
| `<leader>ad` | Normal | Rechazar cambios de diff (cierra sin guardar) |

### Navegación entre Buffers (Cuando Claude Muestra Múltiples Archivos)

| Atajo | Modo | Descripción |
|-------|------|-------------|
| `<leader>cn` | Normal | Siguiente buffer (diff de Claude) |
| `<leader>cp` | Normal | Buffer anterior (diff de Claude) |
| `<leader>cb` | Normal | Listar todos los buffers con Telescope |

### Navegación Dentro del Terminal de Claude

**Navegación en el Chat:**
| `<leader>ku` | Terminal | Desplazar arriba (línea por línea) |
| `<leader>kd` | Terminal | Desplazar abajo (línea por línea) |
| `<leader>kb` | Terminal | Desplazar página arriba (página completa) |
| `<leader>kf` | Terminal | Desplazar página abajo (página completa) |
| `<leader>kh` | Terminal | Ir al inicio del chat |
| `<leader>ke` | Terminal | Ir al final del chat |
| `<leader>ki` | Terminal | Volver al modo insertar (para escribir) |

**Navegación Alternativa (Neovim Estándar):**
- Primero sal del modo terminal: `<Ctrl-\><Ctrl-n>`
- Luego usa: `j`/`k` (línea), `Ctrl-u`/`Ctrl-d` (media página), `Ctrl-b`/`Ctrl-f` (página completa), `gg`/`G` (inicio/final)
- Búsqueda: `/` (adelante), `?` (atrás), `n`/`N` (siguiente/anterior)

### Ejemplos de Flujo de Trabajo

**Iniciar una Nueva Conversación:**
1. `<leader>cc` → Abrir Claude Code
2. Escribe tu pregunta/prompt
3. Presiona `Enter` para enviar

**Acceder a Conversaciones Antiguas:**
1. `<leader>ar` o `<leader>ch` → Abrir selector de historial
2. Selecciona conversación con flechas
3. Presiona `Enter` para reanudar

**Trabajar con Código y Claude:**
1. `<leader>cc` → Abrir Claude
2. Trabaja en ventana de código
3. `<leader>cC` → Cambiar a Claude
4. `<leader>cq` → Volver al código
5. Repite según necesites

**Revisar Respuesta de Claude:**
1. `<leader>ke` → Ir al final (ver última respuesta)
2. `<leader>kb` → Desplazar arriba para leer
3. `<leader>kf` → Desplazar abajo para leer más
4. `<leader>ki` → Volver a modo insertar para responder

**Manejar Múltiples Sugerencias de Archivos:**
1. Claude propone múltiples archivos
2. `<leader>cb` → Listar todos los buffers
3. Selecciona archivo con `Enter`
4. Revisa cambios
5. `<leader>aa` → Aceptar o `<leader>ad` → Rechazar
6. `<leader>cn` → Siguiente archivo
7. Repite para cada archivo

---

## Formateo de Código

| Atajo | Modo | Descripción |
|-------|------|-------------|
| `<Leader>f` | Normal | Formatear buffer actual |
| `<Leader>f` | Visual | Formatear rango seleccionado |

**Nota:** El formateo también ocurre automáticamente al guardar (excepto para archivos TypeScript React).

---

## Búsqueda y Navegación

### Hlslens (Resaltado de Búsqueda)

| Atajo | Modo | Descripción |
|-------|------|-------------|
| `n` | Normal | Siguiente resultado de búsqueda (con resaltado) |
| `N` | Normal | Resultado anterior de búsqueda (con resaltado) |
| `*` | Normal | Buscar palabra bajo cursor hacia adelante |
| `#` | Normal | Buscar palabra bajo cursor hacia atrás |
| `g*` | Normal | Buscar palabra bajo cursor (parcial) hacia adelante |
| `g#` | Normal | Buscar palabra bajo cursor (parcial) hacia atrás |
| `<leader>l` | Normal | Limpiar resaltados de búsqueda |

### Hop (Easy Motion)

| Atajo | Modo | Descripción |
|-------|------|-------------|
| `<space>hs` | Normal/Visual | Saltar a palabra |

---

## Edición de Texto

### Comentarios

| Atajo | Modo | Descripción |
|-------|------|-------------|
| `gcc` | Normal | Alternar comentario para línea actual |
| `gc` | Visual | Alternar comentario para selección |
| `gbc` | Normal | Alternar comentario para bloque |

### Indentación

| Atajo | Modo | Descripción |
|-------|------|-------------|
| `di` | Normal | Alternar líneas de indentación (indent-blankline) |

### Renombrar

| Atajo | Modo | Descripción |
|-------|------|-------------|
| `<Space>rn` | Normal | Renombrar archivo/buffer |

---

## Gestión de Ventanas

| Atajo | Modo | Descripción |
|-------|------|-------------|
| `<C-w>h` | Normal | Mover a ventana izquierda |
| `<C-w>j` | Normal | Mover a ventana inferior |
| `<C-w>k` | Normal | Mover a ventana superior |
| `<C-w>l` | Normal | Mover a ventana derecha |
| `<C-w>v` | Normal | Dividir ventana verticalmente |
| `<C-w>s` | Normal | Dividir ventana horizontalmente |
| `<C-w>q` | Normal | Cerrar ventana |
| `<C-w>o` | Normal | Cerrar todas las demás ventanas |

---

## Misceláneos

| Atajo | Modo | Descripción |
|-------|------|-------------|
| `<leader>fx` | Normal | Abrir explorador de archivos |
| `:GitLog` | Comando | Abrir log de Git en terminal dividido |

---

## Comandos Personalizados

### GitLog

Abre el log de Git en una ventana de terminal dividida:

```vim
:GitLog
```

---

## Detalles de Configuración

### Tecla Leader

La tecla leader está configurada como `<Space>` (barra espaciadora) en `lua/augustog/remap.lua`:

```lua
vim.g.mapleader = " "
```

### Mapeos de Navegación Personalizados

La configuración usa mapeos de navegación personalizados:
- `e` = `k` (arriba)
- `h` = `h` (izquierda)
- `j` = `j` (abajo)
- `t` = `l` (derecha)

Estos están definidos en `lua/augustog/init.lua`.

---

## Notas Específicas de Plugins

### Auto-Session

Las sesiones se guardan y restauran automáticamente. Directorios suprimidos:
- `~/`
- `~/Projects`
- `~/Downloads`
- `/`

### Codeium

- Sugerencias de texto virtual habilitadas
- Fuente CMP deshabilitada (solo texto virtual)
- Aceptar: `<Tab>`
- Siguiente: `<M-]>`
| Anterior: `<M-[>`

### Prettier

- Auto-formateo al guardar (excepto archivos `.tsx`)
- Formateo manual: `<leader>fp`

---

## Consejos

1. **Recuerda:** `<leader>` = `<Space>`
2. **Usa Telescope** (`<leader>ff`) para navegación rápida de archivos
3. **Usa Harpoon** (`<leader>a`) para marcar archivos frecuentemente usados
4. **Las características LSP** funcionan automáticamente cuando los servidores de lenguaje están instalados
5. **La integración Git** es extensa - explora Fugitive con `<leader>gs`
6. **Claude Code** proporciona asistencia IA - usa `<leader>cc` para comenzar

---

**¡Feliz Codificación! 🚀**
