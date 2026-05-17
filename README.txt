``` header
@file: README.txt
@brief: Journal paper on USCT imaging, published at Acoustical Science and Technology, Vol. 46, No. 4 (2025)
@see: https://www.jstage.jst.go.jp/article/ast/46/4/46_e24.88/_article/-char/en
@date: [created: 2026-04-25, updated: 2026-05-17]
@author: Tianhan Tang (tianhantang.pd@gmail.com)
```

# Towards minimizing data-acquisition for a pixel-based ultrasound computed tomography echo imaging method

## Abstract

Ultrasound Computed Tomography is increasingly valued for breast cancer diagnosis.
However, traditional echo imaging method, particularly the synthetic aperture method, though high in resolution, requires extensive data acquisition from numerous transducer element combinations.
This leads to prolonged data collection, substantial storage and transfer burdens, and ultimately reduced throughput, limiting ultrasound computed tomography's practicality.

This study introduces a minimal data-acquisition strategy for echo imaging, leveraging a pixel-based imaging method.
Our method aims to find an optimal transducer elements configuration that meets two criteria:
minimizing the number of elements and ensuring the associated measurement matrix has a sufficiently small condition number to remain robust against random noise.
By using this approach, we can significantly reduce the amount of data required for image reconstruction without compromising image quality compared to the synthetic aperture method.

Through simulation studies, we demonstrate that our method requires only 1/8th the number of elements and 1/64th the amount of data used by the synthetic aperture method while reconstructing images with comparable resolution and enhanced contrast.
This advancement is valuable in boosting screening throughput, lowering system costs, and potentially improving diagnostic accuracy, marking a significant step forward in ultrasound computed tomography technology for breast cancer detection.

## 1. Introduction

[...]

In this study, we investigate minimizing the data required for image reconstruction for a given region of interest and pixel resolution, based on a pixel-based USCT echo imaging method we have proposed.

[...]

## Addendum (not part of publication)

### Build the manuscript into PDF

Requirement: PowerShell (pwsh), LaTeX (latex), dvipdf

``` powershell
pwsh -nop ./build-article.ps1
```

The generated PDF will be at `tex/u2025_ast.pdf`.

### Folder structure

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

### File naming convention

The content files MUST be named as `t\d{2}_*.txt`.
The prefix must be unique since it is used as anchor in `u2025_ast_gen.tex`.
Those files are loaded by the script `build-article.ps1` and converted to LaTeX source.

Since figures are all exported to EPS format, plain `latex` command is enough.
