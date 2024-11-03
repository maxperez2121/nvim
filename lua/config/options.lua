-- _       _ _     _
--(_)_ __ (_) |_  | |_   _  __ _
--| | '_ \| | __| | | | | |/ _` |
--| | | | | | |_ _| | |_| | (_| |
--|_|_| |_|_|\__(_)_|\__,_|\__,_|

vim.opt.compatible = false -- Desactivar la compatibilidad con vi
vim.opt.number = true -- Muestra el numero de la linea en que estamos
vim.opt.relativenumber = true -- Cuenta y muestra el numero de lineas desde la linea actual hacia los exteriores
vim.opt.cursorline = true -- Resalte la línea de texto del cursor (existe otra opción cursorlineopt=number,screenline)
vim.opt.cursorcolumn = true -- Resalte la columna de pantalla del cursor.
--vim.opt.cursorbind = true     -- Cuando el cursor en la ventana actual se mueve, otras ventanas mueven sus cursores de forma correspondiente.
vim.opt.showcmd = true -- Muestra el comando (parcial) en la última línea de la pantalla.
vim.opt.showmode = true -- Si está en el modo Insertar, Reemplazar o Visual, coloque un mensaje en la última línea.

vim.cmd("syntax on") -- Activar el resaltado(Coloreado xd) del archivo
vim.opt.termguicolors = true -- Habilita colores RGB de 24 bits (para los themas)
vim.opt.encoding = "UTF-8" -- Todos los archivos se guardaran con utf-8 en ves de ascii
vim.opt.textwidth = 143 -- Ancho máximo del texto insertado, si es mas largo será roto después del espacio en blanco.
vim.opt.wrap = true -- Corta el texto y le muestra debajo cuando el texto rebasa la pantalla
--vim.opt.swapfile = true       -- Crear un archivo .swap por cada archivo que es editado, sirve como copia de seguridad ante imprevistos.
--vim.opt.backup = true         -- Crea un backup del archivo que se va a editar
vim.opt.undofile = true -- Permite guardar el historial de cambios al cerrar nvim, y poder regresar cambios anteriores
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir" -- Carpeta donde se guardara el historial de modificaciones pasadas de los archivos.

vim.opt.mouse = "a" -- La linea de edición se moverá donde se haga click
vim.opt.scrolloff = 5 -- Mover n lineas arriba/abajo del cursor con el scroll del mouse.
vim.opt.ttyfast = true -- Acelera el desplazamiento en vim

-- Tabuladores
vim.opt.tabstop = 4 -- Número de espacios que cuenta un <Tab> en el archivo.
vim.opt.softtabstop = 4 -- Espacios que cuenta un <Tab> mientras se realizan operaciones de edición, como insertar una <Tab> o usar <BS>
vim.opt.shiftwidth = 4 -- Número de espacios autilizar para cada paso de sangría (automática)
vim.opt.expandtab = true -- En modo Insertar: use el número apropiado de espacios para insertar un <Tab>
vim.opt.autoindent = true -- Copie la sangría de la línea actual al comenzar una nueva línea
vim.opt.backspace:append({ "indent", "eol", "start" }) -- Soluciona los problemas de borrado

-- Búsqueda
vim.opt.hlsearch = true -- Cuando haya un patrón de búsqueda anterior, resalte todas sus coincidencias
vim.opt.incsearch = true -- Mientras escribe un comando de búsqueda, muestre dónde coincide el patrón.
vim.opt.ignorecase = true -- Ignorar mayúsculas y minúsculas en los patrones de búsqueda
vim.opt.smartcase = true -- Anule la opción 'ignorar mayúsculas' si el patrón de búsqueda contiene caracteres en mayúsculas

--vim.opt.matchpairs = { '(' , ')' , '[' , ']' , '{' , '}' }  -- Nos permite navegar entre el inicio y el final de teclas paréntesis con la tecla %
vim.opt.modelines = 0 -- No se comprueban el numero de lineas para establecer comandos

-- Remarca (rojo) los caracteres especiales
if vim.env.TERM ~= "linux" then
    vim.cmd([[
    highlight ExtraWhitespace ctermbg=1
    match ExtraWhitespace /\s\+$/
  ]])
else
    vim.opt.listchars = { trail = "~" }
    vim.opt.list = true
end

-- Opciones para plegar codigo, shortcuts: zr, zR, za, zM, [z, ]z, %
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldcolumn = "0"
vim.opt.foldtext = ""
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 2
vim.opt.foldnestmax = 4

vim.o.splitright = true
