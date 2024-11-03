return {
    --{
    ---- DESC: Papyrus: Pandoc integration for automatic file conversion in Vim!
    ---- WARN: Require Pandoc and a Latex Engine (pdflatex, lualatex, xelatex, latexmk,
    ----       tectonic, wkhtmltopdf, weasyprint, pagedjs-cli, prince, context, and pdfroff)
    --"abeleinin/papyrus",
    --init = function()
    --vim.g.papyrus_latex_engine = "xelatex"
    ----vim.g.papyrus_viewer = 'zathura'
    --vim.g.papyrus_viewer = "okular"
    --vim.g.papyrus_template = "default"
    --end,
    --cmd = {
    --"PapyrusCompile",
    --"PapyrusAutoCompile",
    --"PapyrusAutoCompile",
    --"PapyrusStart",
    --},
    --},
}
