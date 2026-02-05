# Guía de Instalación de Configuración Neovim

Guía completa de instalación para configurar esta configuración de Neovim en una computadora nueva.

## Tabla de Contenidos

1. [Prerrequisitos](#prerrequisitos)
2. [Instalar Neovim](#instalar-neovim)
3. [Instalar Dependencias Requeridas](#instalar-dependencias-requeridas)
4. [Instalar Fuentes](#instalar-fuentes)
5. [Clonar/Copiar Configuración](#clonarcopiar-configuración)
6. [Instalar Plugins](#instalar-plugins)
7. [Instalar Servidores de Lenguaje](#instalar-servidores-de-lenguaje)
8. [Instalar Herramientas Adicionales](#instalar-herramientas-adicionales)
9. [Verificar Instalación](#verificar-instalación)
10. [Solución de Problemas](#solución-de-problemas)

---

## Prerrequisitos

Antes de comenzar, asegúrate de tener:

- **Git** instalado
- **Node.js** (v16+) y **npm** instalados (para algunos plugins y servidores LSP)
- **Python 3** instalado (para algunos servidores LSP)
- **Rust** instalado (si planeas usar desarrollo Rust)
- **Go** instalado (si planeas usar desarrollo Go)

---

## Instalar Neovim

### macOS

```bash
# Usando Homebrew (recomendado)
brew install neovim

# Verificar instalación
nvim --version
```

### Linux (Ubuntu/Debian)

```bash
sudo apt update
sudo apt install neovim

# Verificar instalación
nvim --version
```

### Linux (Arch)

```bash
sudo pacman -S neovim

# Verificar instalación
nvim --version
```

### Windows (WSL)

```bash
# En WSL
sudo apt update
sudo apt install neovim

# Verificar instalación
nvim --version
```

---

## Instalar Dependencias Requeridas

### Ripgrep (Requerido para Telescope)

**macOS:**
```bash
brew install ripgrep
```

**Linux (Ubuntu/Debian):**
```bash
sudo apt install ripgrep
```

**Linux (Arch):**
```bash
sudo pacman -S ripgrep
```

### fd-find (Opcional pero recomendado para Telescope)

**macOS:**
```bash
brew install fd
```

**Linux (Ubuntu/Debian):**
```bash
sudo apt install fd-find
```

**Linux (Arch):**
```bash
sudo pacman -S fd
```

### Git (Requerido)

**macOS:**
```bash
brew install git
```

**Linux:**
```bash
# Generalmente pre-instalado, pero si no:
sudo apt install git  # Ubuntu/Debian
sudo pacman -S git    # Arch
```

---

## Instalar Fuentes

Las Nerd Fonts son requeridas para el soporte adecuado de iconos en la barra de estado y el árbol de archivos.

### Instalación Rápida

Visita: [https://webinstall.dev/nerdfont/](https://webinstall.dev/nerdfont/)

### Instalación Manual

1. Descarga una Nerd Font desde: [https://www.nerdfonts.com/font-downloads](https://www.nerdfonts.com/font-downloads)
   - Recomendadas: **JetBrains Mono**, **Fira Code**, o **Hack**

2. Instala la fuente:
   - **macOS**: Haz doble clic en el archivo `.ttf` y haz clic en "Install Font"
   - **Linux**: Copia a `~/.local/share/fonts/` y ejecuta `fc-cache -fv`
   - **Windows**: Clic derecho y selecciona "Install"

3. Configura tu terminal para usar la Nerd Font:
   - **iTerm2** (macOS): Preferences → Profiles → Text → Font
   - **Alacritty**: Edita el archivo de configuración, establece `font.family`
   - **Windows Terminal**: Settings → Appearance → Font face

---

## Clonar/Copiar Configuración

### Opción 1: Clonar desde Repositorio Git

```bash
# Clonar tu repositorio
git clone <url-de-tu-repo> ~/.config/nvim

# O si ya tienes un repo
cd ~/.config/nvim
git pull origin main
```

### Opción 2: Copiar desde Configuración Existente

```bash
# Crear directorio de configuración de Neovim
mkdir -p ~/.config/nvim

# Copiar archivos de configuración
cp -R /ruta/a/tu/config/* ~/.config/nvim/
```

### Verificar Estructura

Tu directorio `~/.config/nvim` debería tener:
```
nvim/
├── init.lua
├── lua/
│   └── augustog/
│       ├── init.lua
│       ├── packer.lua
│       ├── remap.lua
│       └── set.lua
├── after/
│   └── plugin/
│       ├── *.lua archivos
└── plugin/
    └── packer_compiled.lua (se generará)
```

---

## Instalar Plugins

1. **Abrir Neovim:**
   ```bash
   nvim
   ```

2. **Cargar la configuración:**
   ```vim
   :so
   ```

3. **Instalar plugins con Packer:**
   ```vim
   :PackerSync
   ```

   Esto hará:
   - Instalar el gestor de plugins Packer.nvim
   - Descargar e instalar todos los plugins definidos en `packer.lua`
   - Compilar la configuración de plugins

4. **Esperar a que complete la instalación** (puede tomar varios minutos)

5. **Reiniciar Neovim:**
   ```bash
   # Salir de Neovim
   :q

   # Reabrir
   nvim
   ```

---

## Instalar Servidores de Lenguaje

Los servidores de lenguaje son gestionados por Mason y se instalarán automáticamente cuando abras un archivo de ese tipo. Sin embargo, también puedes instalarlos manualmente:

### Usando Mason (Recomendado)

1. Abre Neovim
2. Ejecuta:
   ```vim
   :Mason
   ```
3. Navega con `j`/`k` y presiona `i` para instalar servidores
4. Instala como mínimo:
   - `typescript-language-server` (o `ts_ls`)
   - `rust-analyzer` (si usas Rust)
   - `gopls` (si usas Go)
   - `lua-language-server` (para archivos Lua)

### Instalación Manual (Alternativa)

Algunos servidores pueden necesitar instalación manual:

**TypeScript Language Server:**
```bash
npm install -g typescript-language-server typescript
```

**Rust Analyzer:**
```bash
# Usando rustup
rustup component add rust-analyzer
```

**Go Language Server:**
```bash
go install golang.org/x/tools/gopls@latest
```

---

## Instalar Herramientas Adicionales

### Prettier (Formateador de Código)

Instala el daemon de Prettier para formateo más rápido:

```bash
npm install -g @fsouza/prettierd
```

O sigue: [https://github.com/fsouza/prettierd](https://github.com/fsouza/prettierd)

### Claude Code CLI (Para Asistente de Código IA)

```bash
# Instalar Claude Code CLI
npm install -g @anthropic-ai/claude-code

# Verificar instalación
claude --version

# Ejecutar doctor para verificar configuración
claude doctor
```

### Tree-sitter (Generalmente auto-instalado)

Los parsers de Tree-sitter generalmente se instalan automáticamente. Si es necesario:

```vim
:TSInstall typescript javascript lua vim vue heex
```

---

## Verificar Instalación

### Verificar Versión de Neovim

```bash
nvim --version
# Debería mostrar Neovim 0.8.0 o superior
```

### Verificar Instalación de Plugins

```vim
:PackerStatus
```

Todos los plugins deberían mostrarse como instalados.

### Verificar Servidores LSP

```vim
:LspInfo
```

Debería mostrar los servidores de lenguaje disponibles.

### Probar Funcionalidad Básica

1. **Abrir un archivo:**
   ```bash
   nvim test.js
   ```

2. **Probar navegación de archivos:**
   - Presiona `<leader>ff` (debería abrir el buscador de archivos Telescope)
   - Presiona `<leader>nt` (debería alternar el árbol de archivos)

3. **Probar LSP:**
   - Escribe algo de código
   - Presiona `gd` (debería saltar a la definición si LSP está funcionando)
   - Presiona `K` (debería mostrar documentación al pasar el mouse)

---

## Solución de Problemas

### Plugins No Se Instalan

1. **Verificar que Packer está cargado:**
   ```vim
   :PackerStatus
   ```

2. **Reinstalar Packer:**
   ```bash
   rm -rf ~/.local/share/nvim/site/pack/packer
   nvim
   :PackerSync
   ```

### LSP No Funciona

1. **Verificar Mason:**
   ```vim
   :Mason
   ```
   Asegúrate de que los servidores de lenguaje estén instalados.

2. **Verificar estado de LSP:**
   ```vim
   :LspInfo
   ```

3. **Reiniciar LSP:**
   ```vim
   :LspRestart
   ```

### Iconos de Fuentes No Se Muestran

1. Verifica que la Nerd Font está instalada:
   ```bash
   fc-list | grep -i "nerd\|jetbrains\|fira"
   ```

2. Configura la terminal para usar Nerd Font (ver [Instalar Fuentes](#instalar-fuentes))

3. Reinicia la terminal y Neovim

### Telescope No Encuentra Archivos

1. **Verificar que ripgrep está instalado:**
   ```bash
   rg --version
   ```

2. **Verificar que fd está instalado (opcional pero recomendado):**
   ```bash
   fd --version
   ```

### Claude Code No Se Conecta

1. **Verificar que Claude CLI está instalado:**
   ```bash
   claude --version
   ```

2. **Verificar estado de Claude Code en Neovim:**
   ```vim
   :ClaudeCodeStatus
   ```

3. **Verificar que existe el archivo lock:**
   ```bash
   ls ~/.claude/ide/
   ```

### Problemas de Rendimiento

1. **Deshabilitar plugins no usados** en `packer.lua`

2. **Reducir parsers de Tree-sitter** si no son necesarios

3. **Verificar archivos grandes** que puedan ralentizar LSP

---

## Configuración Post-Instalación

### Configurar Git (Si No Está Hecho)

```bash
git config --global user.name "Tu Nombre"
git config --global user.email "tu.email@ejemplo.com"
```

### Configurar Alias de Shell (Opcional)

Agrega a tu `~/.zshrc` o `~/.bashrc`:

```bash
alias vim="nvim"
alias vi="nvim"
```

### Configurar Directorios de Auto-Sesión

Edita `after/plugin/auto-session.lua` para configurar directorios suprimidos si es necesario.

---

## Próximos Pasos

1. **Lee la Guía de Atajos:** Ver `ATAJOS.md` para todos los atajos disponibles
2. **Personaliza la Configuración:** Edita archivos en `lua/augustog/` para personalizar ajustes
3. **Instala Plugins Adicionales:** Agrega a `packer.lua` y ejecuta `:PackerSync`

---

## Soporte

Si encuentras problemas:

1. Revisa la sección [Solución de Problemas](#solución-de-problemas)
2. Revisa los logs de Neovim: `:messages`
3. Verifica la documentación de los plugins
4. Verifica que todos los prerrequisitos estén instalados

---

**¡Feliz Codificación! 🚀**
