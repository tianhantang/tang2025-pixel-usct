``` header
@file: README.txt
@brief: Journal paper on USCT imaging, published at Acoustical Science and Technology, Vol. 46, No. 4 (2025)
@see: https://www.jstage.jst.go.jp/article/ast/46/4/46_e24.88/_article/-char/en
@date: [created: 2026-04-25, updated: 2026-05-19]
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

## Table of Contents

- [1. INTRODUCTION](#1-introduction)
- [2. METHOD](#2-method)
  - [2.1 The pixel-based USCT echo imaging method](#21-the-pixel-based-usct-echo-imaging-method)
  - [2.2 Minimizing data-acquisition for USCT echo imaging](#22-minimizing-data-acquisition-for-usct-echo-imaging)
  - [2.3 The Simulation Experiment](#23-the-simulation-experiment)
- [3. RESULT](#3-result)
  - [3.1 Condition numbers of systems with different configurations](#31-condition-numbers-of-systems-with-different-configurations)
  - [3.2 Phantom data reconstruction under different SNR](#32-phantom-data-reconstruction-under-different-snr)
  - [3.3 Comparison between pixel-based imaging method and synthetic aperture method](#33-comparison-between-pixel-based-imaging-method-and-synthetic-aperture-method)
- [4. DISCUSSION](#4-discussion)
  - [4.1 Advantages and features of the pixel-based imaging method](#41-advantages-and-features-of-the-pixel-based-imaging-method)
  - [4.2 Challenges and future directions for the pixel-based imaging method](#42-challenges-and-future-directions-for-the-pixel-based-imaging-method)
- [5. CONCLUSION](#5-conclusion)

## 1. INTRODUCTION

<div align="center">
  <img src="media/figure-01.png" width="60%">
  <br>
  <em>Fig. 1: A commercial ultrasound computed tomography system (Courtesy of Lily MedTech Inc.).</em>
</div>

[...]

In this study, we investigate minimizing the data required for image reconstruction for a given region of interest and pixel resolution, based on a pixel-based USCT echo imaging method we have proposed.

[...]

## 2. METHOD

### 2.1 The pixel-based USCT echo imaging method

The pixel-based USCT echo imaging method, proposed in our prior study [6](https://doi.org/10.24492/use.38.0_2E1-4), and further elaborated upon in [7](https://doi.org/10.1109/ULTSYM.2019.8925696), diverges from the traditional synthetic aperture method (which relies on back-projection techniques) by exploring a unique "pixel-dictionary" approach for image reconstruction.
It aims for high-quality echo image creation while reducing the ultrasound data acquisition.

[...]

Considering an object consisting of multiple scatterers, the linear acoustics principle dictates that the received signal is the linear superposition of signals from each individual scatterer, encapsulated by Eq. (1):
``` math
\mathbf{G x = y} \tag{1}
```
where $\mathbf{x}$ represents a vector describing the scattering ability (derived from echogenicity) at each pixel within the ROI, and its physical meaning will be clarified in Section 2.3;
$\mathbf{y}$ represents the received RF signal.

Solving the inverse problem for $\mathbf{x}$ in Eq. (1), followed by appropriate post-processing on the result creates the echo image.
This image effectively represents the echogenicity strength distribution of the ROI.

Fig. 2 provides a visual guide to understand the pixel-based USCT echo imaging method. [...]

<div align="center">
  <img src="media/figure-02-a.png" width="85%">
  <img src="media/figure-02-b.png" width="85%">
  <br>
  <em>Fig. 2: A pixel-based USCT echo imaging method. (a) the forward process; (b) the inverse process.</em>
</div>

### 2.2 Minimizing data-acquisition for USCT echo imaging

In light of Eq. (1), the concept of minimizing data acquisition for USCT echo imaging is straightforward. 
The vector $\mathbf{x}$ symbolizes the one-dimensional unknown parameters relating to the echogenicity map.
Given a specific ROI and the required spatial resolution, the number of pixels ($N_{p}$)---and thus the elements in $\mathbf{x}$---is predetermined.
Minimizing data acquisition necessitates reducing the length of vector $\mathbf{y}$, which comprises the vertically stacked RF data from all TX/RX pairs.
The length of $\mathbf{y}$ is the product of the number of samples per RX channel ($N_{t}$), the number of RX channels ($N_{RX}$), and the number of TX events ($N_{TX}$). [...]

[...] Our strategy is to diminish the number of elements across the entire system, inherently reducing both the number of RX channels and TX events.

A decrease in the length of $\mathbf{y}$ also implies a reduction in the number of rows in matrix $\mathbf{G}$, following the linear system relationship.
Thus, the pursuit of data minimization aims to design an optimal system characterized by a $\mathbf{G}$ matrix that has as few as possible rows while maintains:
- A full rank to ensure that Eq. (1) is solvable for $\mathbf{x}$;
- A small condition number to guarantee the measurement being robust against noise [8](https://doi.org/10.1017/9781009089517).

[...]

### 2.3 The Simulation Experiment

In this study, we conduct simulations to investigate the characteristics of the pixel-based echo imaging method and assess the practicality of our strategy for minimizing data acquisition.
We also compare the performance of our method with that of the conventional synthetic aperture method.

To maintain computational efficiency, we use a 1/16 scaled-down model of the actual system depicted in Fig. 1, with detailed simulation parameters provided in Table 1.

*Table 1: Simulation parameters.*

| Symbol | Value | Remarks |
|--------|-------|---------|
| $c_0$ | 1523.3 m/s | Sound speed (36.8°C water) |
| $\alpha_0$ | 6.4 dB/MHz/cm | Attenuation factor (*) |
| $f_c$ | 1.8 MHz | TX wave central frequency |
| $p_0$ | 1.0 MPa | TX wave peak amplitude |
| $f_s$ | 9.0 MHz | Sampling frequency |
| $\phi$ | 14.625 mm | USCT system diameter |
| $N_t$ | 256 | Samples per RX channel |
| $N_e$ | 128 | Number of element slots |
| $d$ | 0.500 mm | Pixel size |
| $N_p$ | 584 | Pixel number (**) |

(*) The attenuation is artificially scaled-up 16x to compensate for the down-scaling effect of the model.
(**) Only the pixels inside the ring-shaped transducer, on a 32-by-32 grid are included.

The simulation is performed in time domain within 2D space. [...]

[...]

## 3. RESULT

### 3.1 Condition numbers of systems with different configurations

[...]

We observe that for each category, systems with uniform configurations have the smallest mode in terms of condition number, implying that for imaging the entire ROI inside the ring-shaped transducer of USCT, uniform configuration is generally the best choice.
For all systems with uniform configuration, more elements result in a smaller condition number.
However, halving the number of elements sequentially from 128 to 64, 32, and 16 results in only a relatively small increase in condition number.
This suggests significant redundancy in the full system.

### 3.2 Phantom data reconstruction under different SNR

[...]

At lower SNR, the importance of using a uniform configuration, which has the smallest condition number, becomes more evident.
In the extreme case of 10 dB SNR, the concentrated configuration, whose aperture only covers a small corner, completely fails to reveal the phantom, leaving most of the ROI unpainted and giving a high RMSE. [...]

### 3.3 Comparison between pixel-based imaging method and synthetic aperture method

Comparisons between the reconstructions from the pixel-based imaging method and the synthetic aperture method (SA) are shown in Figs. 6 and 7.
The SNR of the RF data for reconstruction is 40 dB.

[...]

Figure 7 compares the contrast of SA and the pixel-based method using a female breast-mimicking phantom, which models skin, fat, mammary tissue, and a tumor. [...]

<div align="center">
  <img src="media/figure-07.png" width="50%">
  <br>
  <em>Fig. 7: Comparing the contrast ratio: the reconstructions, and the quantitative evaluation.</em>
</div>

[...] The result shows that the pixel-based imaging method using only 8 or 16 elements is good enough that outperforms SA using a full or 64-element system.

## 4. DISCUSSION

### 4.1 Advantages and features of the pixel-based imaging method

[...]

### 4.2 Challenges and future directions for the pixel-based imaging method

[...]

## 5. CONCLUSION

In this research, we propose a minimal data-acquisition strategy for USCT echo imaging by leveraging the pixel-based imaging method.
Simulation studies demonstrate that the condition number of the generated measurement matrix serves as an appropriate metric for the system design quality.
The image reconstruction results indicate that a uniform elements configuration is optimal for imaging the ROI inside the ring-shaped transducer of USCT.

Compared with the conventional synthetic aperture method, the proposed method exhibits an 8-fold reduction in the number of elements and a 64-fold decrease in the raw data required for the image reconstruction, while achieving comparable spatial resolution and enhanced contrast.
This advancement could boost breast cancer screening throughput by providing better image quality and higher temporal resolution, as well as lower system costs by reducing the number of transducer elements.

Future research will focus on evaluating the proposed method with experiment data.

---

## Addendum (not part of publication)

### Build the manuscript into PDF

Requirement: PowerShell (pwsh), LaTeX (latex), dvipdf

``` powershell
pwsh -nop ./build-article.ps1
```

The generated PDF will be at `tex/u2025_ast.pdf`.

### Folder structure

The essential files for building the article are organized as follows:
``` tree
.
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

### Third-Party Materials

Certain images and figures in this repository are reproduced with permission from third parties and are not covered by the BSD-3-Clause license.

In particular:
- `media/figure-01.png`: Courtesy of *Lily MedTech Inc.*, used with permission for academic publication only.

All rights to these materials remain with their respective copyright holders.
