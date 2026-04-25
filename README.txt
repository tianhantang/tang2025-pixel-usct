``` header
@file: README.txt
@brief: Source of the journal paper published in Acoustical Science and Technology (AST), Vol. 46, No. 4 (2025).
@date: [created: 2026-04-25, updated: 2026-04-25]
@author: Tianhan Tang (tianhantang.pd@gmail.com)
```

# Towards minimizing data-acquisition for a pixel-based ultrasound computed tomography echo imaging method

Published at: https://www.jstage.jst.go.jp/article/ast/46/4/46_e24.88/_article/-char/en

## Build the manuscript into PDF

Requirement: PowerShell (pwsh), LaTeX (latex), dvipdf

``` powershell
pwsh -nop ./build-article.ps1
```

The generated PDF will be at `tex/u2025_ast.pdf`.

## Folder structure

``` tree
.
|- README.txt                # <- this file
|- build-article.ps1         # <- script to build the article
|- t\d{2}_*.txt              # <- the manuscript in plain text, w/ custom markup
|- mmd2latex/                # <- utility to convert the custom markup to LaTeX
|- tex/                      # <- LaTeX source files
|- |- figure-\d{2}.eps       # <- figures in EPS format
|- |- u2025_ast_gen.tex      # <- LaTeX template file, where the utility fills in the content
|- |- u2025_ast.tex          # <- auto-generated LaTeX source file (not tracked)
```

## NOTE

The content files MUST be named as `t\d{2}_*.txt`.
The prefix must be unique since it is used as anchor in `u2025_ast_gen.tex`.
Those files are loaded by the script `build-article.ps1` and converted to LaTeX source.

Since figures are all exported to EPS format, plain `latex` command is enough.
