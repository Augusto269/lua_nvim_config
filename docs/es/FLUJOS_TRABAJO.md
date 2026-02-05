# Flujos de Trabajo de Configuración Neovim

Guía completa de flujos de trabajo comunes y mejores prácticas para usar esta configuración de Neovim.

---

## Tabla de Contenidos

1. [Flujo de Desarrollo Diario](#flujo-de-desarrollo-diario)
2. [Trabajar con Claude Code IA](#trabajar-con-claude-code-ia)
3. [Flujo de Trabajo con Git](#flujo-de-trabajo-con-git)
4. [Flujo de Navegación de Archivos](#flujo-de-navegación-de-archivos)
5. [Flujo de Edición de Código](#flujo-de-edición-de-código)
6. [LSP e Inteligencia de Código](#lsp-e-inteligencia-de-código)
7. [Flujo de Depuración](#flujo-de-depuración)
8. [Flujo de Configuración de Proyecto](#flujo-de-configuración-de-proyecto)

---

## Flujo de Desarrollo Diario

### Iniciando tu Día

1. **Abrir Neovim en tu proyecto:**
   ```bash
   cd ~/projects/mi-proyecto
   nvim
   ```

2. **Sesión Restaurada Automáticamente:**
   - Auto-session restaura tu sesión anterior
   - Todos los buffers y ventanas se restauran
   - Estás exactamente donde lo dejaste

3. **Acceso Rápido a Archivos:**
   - `<leader>ff` → Buscar archivos con Telescope
   - `<leader>a` → Agregar archivos a Harpoon para acceso rápido
   - `<C-t>`, `<C-b>`, `<C-n>`, `<C-s>` → Saltar a archivos de Harpoon

### Durante el Desarrollo

**Patrón Común:**
```
1. <leader>ff → Buscar archivo
2. Editar código
3. <leader>gs → Verificar estado de Git
4. <leader>fp → Formatear con Prettier
5. <leader>cc → Preguntar a Claude si es necesario
6. Guardar y continuar
```

---

## Trabajar con Claude Code IA

### Iniciando una Nueva Característica con Claude

1. **Abrir Claude Code:**
   ```
   <Space>cc
   ```

2. **Agregar Contexto:**
   - `<leader>ab` → Agregar buffer actual al contexto
   - Seleccionar código → `<leader>as` → Enviar selección a Claude

3. **Preguntar a Claude:**
   - Escribe tu pregunta o solicitud
   - Presiona `Enter` para enviar

4. **Revisar Respuesta:**
   - `<leader>ke` → Ir al final (ver última respuesta)
   - `<leader>kb` → Desplazar arriba para leer
   - `<leader>kf` → Desplazar abajo

5. **Trabajar con Sugerencias:**
   - Claude propone cambios
   - Revisar en vista diff
   - `<leader>aa` → Aceptar o `<leader>ad` → Rechazar
   - Editar antes de aceptar si es necesario

6. **Alternar Entre Código y Claude:**
   - `<leader>cC` → Ir a Claude
   - `<leader>cq` → Volver al código
   - Mantén ambos abiertos y alterna según necesites

### Acceder a Conversaciones Anteriores

1. **Ver Historial:**
   ```
   <Space>ar  o  <Space>ch
   ```

2. **Seleccionar Conversación:**
   - Usa flechas para navegar
   - Presiona `Enter` para reanudar

3. **Continuar Donde Lo Dejaste:**
   ```
   <Space>aC
   ```
   - Reanuda instantáneamente la última conversación

### Revisión de Código Multi-Archivo con Claude

1. **Claude propone múltiples archivos:**
   ```
   <Space>cb  → Listar todos los buffers
   ```

2. **Navegar entre archivos:**
   ```
   <Space>cn  → Siguiente archivo
   <Space>cp  → Archivo anterior
   ```

3. **Revisar cada archivo:**
   - Lee los cambios propuestos
   - Edita si es necesario
   - `<Space>aa` → Aceptar o `<Space>ad` → Rechazar

---

## Flujo de Trabajo con Git

### Operaciones Git Diarias

**Verificar Estado:**
```
<Space>gs  → Estado de Git
```

**Ver Cambios:**
```
<leader>gp  → Vista previa del bloque
<leader>gb  → Alternar blame de línea
```

**Hacer Commit:**
1. `<leader>gs` → Abrir estado de Git
2. Agregar archivos al staging (dentro del buffer de Fugitive)
3. `<leader>gc` → Git commit
4. Escribir mensaje de commit
5. Guardar y cerrar

**Push/Pull:**
```
<leader>p   → Git push (desde buffer de Fugitive)
<leader>P   → Git pull con rebase
<leader>gt  → Git push -u origin (establecer upstream)
```

### Resolver Conflictos de Merge

1. **Abrir Estado de Git:**
   ```
   <leader>gs
   ```

2. **Ver Conflictos:**
   - Navegar a archivos en conflicto
   - Abrir vista diff

3. **Resolver Conflictos:**
   ```
   <leader>dg2  → Obtener cambios del buffer 2 (izquierda)
   <leader>dg3  → Obtener cambios del buffer 3 (derecha)
   <leader>dgn  → Siguiente conflicto
   <leader>dgp  → Conflicto anterior
   ```

4. **Agregar y Hacer Commit:**
   - Después de resolver, agregar archivos
   - `<leader>gc` → Commit

### Obtener URLs de Git

**Para Línea Actual:**
```
<leader>gu  → Obtener URL de Git (abre en navegador)
```

**Para Rango Seleccionado:**
- Seleccionar texto en modo Visual
- `<leader>gu` → Obtener URL de Git para selección

---

## Flujo de Navegación de Archivos

### Encontrar Archivos Rápidamente

**Telescope (Más Común):**
```
<leader>ff  → Buscar archivos
<leader>fs  → Buscar cadena de texto (grep)
<leader>fb  → Buscar buffers
<leader>fh  → Buscar etiquetas de ayuda
```

**Árbol de Archivos:**
```
<leader>nt  → Alternar árbol de archivos
<leader>nf  → Enfocar árbol de archivos
```

**Harpoon (Acceso Rápido):**
```
<leader>a   → Agregar archivo actual a Harpoon
<C-e>        → Alternar menú de Harpoon
<C-t>        → Saltar al archivo 1
<C-b>        → Saltar al archivo 2
<C-n>        → Saltar al archivo 3
<C-s>        → Saltar al archivo 4
```

### Estrategia Recomendada de Navegación

1. **Usa Harpoon para archivos frecuentemente accedidos:**
   - Agrega tus archivos principales: `<leader>a`
   - Salto rápido: `<C-t>`, `<C-b>`, etc.

2. **Usa Telescope para todo lo demás:**
   - `<leader>ff` → Buscar cualquier archivo
   - `<leader>fs` → Buscar código

3. **Usa árbol de archivos para exploración:**
   - `<leader>nt` → Explorar estructura del proyecto
   - Abrir archivos desde el árbol

---

## Flujo de Edición de Código

### Comentar Código

**Línea Única:**
```
gcc  → Alternar comentario en línea actual
```

**Múltiples Líneas:**
- Seleccionar en modo Visual
- `gc` → Alternar comentario

**Comentarios de Bloque:**
```
gbc  → Alternar comentario de bloque
```

### Formatear Código

**Formato Manual:**
```
<leader>f   → Formatear buffer actual
```

**Selección Visual:**
- Seleccionar código
- `<leader>f` → Formatear selección

**Auto-Formato al Guardar:**
- Habilitado automáticamente (excepto archivos `.tsx`)
- Solo guarda: `:w`

**Prettier:**
```
<leader>fp  → Formatear con Prettier
```

### Renombrar Archivos

```
<Space>rn  → Renombrar archivo/buffer
```

### Indentación

```
di  → Alternar líneas de indentación
```

---

## LSP e Inteligencia de Código

### Usar Características LSP

**Ir a Definición:**
```
gd  → Saltar a definición
```

**Documentación al Pasar el Mouse:**
```
K   → Mostrar información al pasar el mouse
```

**Buscar Referencias:**
```
<leader>vrr  → Mostrar todas las referencias
```

**Renombrar Símbolo:**
```
<leader>vrn  → Renombrar símbolo (refactoriza todas las ocurrencias)
```

**Acciones de Código:**
```
<leader>vca  → Mostrar acciones de código (correcciones, refactorizaciones, etc.)
```

**Diagnósticos:**
```
<leader>vd   → Mostrar diagnóstico en ventana flotante
[d           → Diagnóstico anterior
]d           → Siguiente diagnóstico
```

### Ejemplo de Flujo LSP

**Entender Código:**
1. `gd` → Ir a definición
2. `K` → Leer documentación
3. `<leader>vrr` → Ver dónde se usa
4. Navegar atrás: `<C-o>` (saltar atrás)

**Corregir Problemas:**
1. `]d` → Ir al siguiente error
2. `<leader>vca` → Ver correcciones disponibles
3. Seleccionar corrección
4. Aplicar

---

## Flujo de Depuración

### Usar Búsqueda Efectivamente

**Buscar en Archivo Actual:**
```
*   → Buscar palabra bajo cursor hacia adelante
#   → Buscar palabra bajo cursor hacia atrás
n   → Siguiente resultado (con resaltado)
N   → Resultado anterior
<leader>l  → Limpiar resaltados
```

**Buscar en Todo el Proyecto:**
```
<leader>fs  → Búsqueda grep
```

**Navegación Hop:**
```
<space>hs  → Saltar a palabra (saltar a cualquier lugar rápidamente)
```

### Leer Código

**Desplazarse Eficientemente:**
- `e`/`j` → Mover arriba/abajo (mapeos personalizados)
- `Ctrl-u`/`Ctrl-d` → Media página
- `Ctrl-b`/`Ctrl-f` → Página completa

**Navegar Archivos Grandes:**
- `gg` → Inicio del archivo
- `G` → Final del archivo
- `%` → Coincidir corchetes
- `*` → Buscar palabra

---

## Flujo de Configuración de Proyecto

### Iniciando un Nuevo Proyecto

1. **Crear Directorio del Proyecto:**
   ```bash
   mkdir mi-proyecto
   cd mi-proyecto
   ```

2. **Inicializar Git:**
   ```bash
   git init
   ```

3. **Abrir en Neovim:**
   ```bash
   nvim .
   ```

4. **Crear Archivos Iniciales:**
   - `<leader>ff` → Crear nuevo archivo
   - O usar árbol de archivos: `<leader>nt`

5. **Configurar LSP:**
   - Abrir un archivo de tu lenguaje
   - Mason pedirá instalar servidor LSP
   - O manualmente: `:Mason`

6. **Configurar Proyecto:**
   - Agregar archivos a Harpoon: `<leader>a`
   - Configurar Git: `<leader>gs`

### Trabajar con Múltiples Proyectos

**Gestión de Sesiones:**
- Auto-session guarda/restaura automáticamente
- Cada directorio tiene su propia sesión
- Directorios suprimidos: `~/`, `~/Projects`, `~/Downloads`, `/`

**Cambiar de Proyecto:**
1. Cerrar Neovim (sesión auto-guardada)
2. Abrir nuevo directorio de proyecto
3. Neovim restaura la sesión de ese proyecto

---

## Flujos Avanzados

### Flujo de Revisión de Código

1. **Abrir Estado de Git:**
   ```
   <leader>gs
   ```

2. **Revisar Cambios:**
   - Navegar por archivos modificados
   - `<leader>gp` → Vista previa de bloques
   - `<leader>gv` → Ver diff completo

3. **Hacer Cambios:**
   - Editar archivos según sea necesario
   - Formatear: `<leader>f`

4. **Agregar y Hacer Commit:**
   - Agregar archivos
   - `<leader>gc` → Commit

### Flujo de Refactorización

1. **Encontrar Todas las Ocurrencias:**
   ```
   <leader>vrr  → Buscar referencias
   ```

2. **Renombrar de Forma Segura:**
   ```
   <leader>vrn  → Renombrar símbolo (actualiza todo)
   ```

3. **Revisar Cambios:**
   - LSP muestra vista previa
   - Aceptar o modificar

### Edición Multi-Archivo

1. **Abrir Múltiples Archivos:**
   ```
   <leader>ff  → Abrir primer archivo
   <C-v>       → Abrir en división vertical
   <leader>ff  → Abrir segundo archivo
   ```

2. **Navegar Entre Ventanas:**
   ```
   <C-w>h/j/k/l  → Mover entre ventanas
   <C-w>w        → Ciclar ventanas
   ```

3. **Copiar Entre Archivos:**
   - Seleccionar visualmente → `y` (copiar)
   - Cambiar ventana → `p` (pegar)

---

## Consejos y Mejores Prácticas

### Eficiencia con Teclado

1. **Usa la Tecla Leader Consistentemente:**
   - `<Space>` es tu leader
   - La mayoría de comandos empiezan con `<Space>`

2. **Aprende Memoria Muscular:**
   - `<Space>ff` → Archivos
   - `<Space>gs` → Git
   - `<Space>cc` → Claude
   - `<Space>nt` → Árbol

3. **Navegación Personalizada:**
   - `e` = arriba, `j` = abajo, `h` = izquierda, `t` = derecha
   - Más rápido que las teclas estándar de vim

### Mejores Prácticas de Claude Code

1. **Agregar Contexto Antes de Preguntar:**
   - `<leader>ab` → Agregar buffer
   - Seleccionar código relevante → `<leader>as`

2. **Mantener Claude Abierto:**
   - No cerrar entre preguntas
   - Usar `<leader>cC` / `<leader>cq` para alternar

3. **Revisar Antes de Aceptar:**
   - Siempre revisar diffs
   - Editar si es necesario
   - Luego aceptar

### Mejores Prácticas de Git

1. **Verificar Estado Frecuentemente:**
   ```
   <leader>gs  → Verificación rápida de estado
   ```

2. **Vista Previa Antes de Commit:**
   ```
   <leader>gp  → Vista previa de cambios
   ```

3. **Usar Line Blame:**
   ```
   <leader>gb  → Ver quién escribió qué
   ```

---

## Flujos de Solución de Problemas

### LSP No Funciona

1. **Verificar Estado LSP:**
   ```
   :LspInfo
   ```

2. **Instalar Servidores Faltantes:**
   ```
   :Mason
   ```
   - Navegar con `j`/`k`
   - Presionar `i` para instalar

3. **Reiniciar LSP:**
   ```
   :LspRestart
   ```

### Claude Code No Se Conecta

1. **Verificar Estado:**
   ```
   :ClaudeCodeStatus
   ```

2. **Verificar CLI:**
   ```bash
   claude --version
   claude doctor
   ```

3. **Reiniciar Claude:**
   - Cerrar terminal: `<leader>cq`
   - Reabrir: `<leader>cc`

### Archivos No Encontrados

1. **Verificar Ripgrep:**
   ```bash
   rg --version
   ```

2. **Verificar Telescope:**
   - `<leader>ff` debería funcionar
   - Si no, instalar ripgrep

---

**¡Feliz Codificación! 🚀**

Para referencia de atajos, ver [ATAJOS.md](./ATAJOS.md)
