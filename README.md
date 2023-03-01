# fistrum

> Lorem fistrum quietooor fistro qué dise usteer quietooor va usté muy cargadoo.

150 paragraphs of Lorem fistrum dummy text for LaTeX.

Based on [www.chiquitoipsum.com](https://www.chiquitoipsum.com/)

## Install

If you want to install it manually, run fistrum.ins through latex to generate the
style file. To generate the docs, run fistrum.dtx through XeLaTeX or lualatex.

You can also download the latest fistrum.zip file from [releases](https://github.com/daviddavo/fistrum/releases) and unzip its contents in your project folder.

We are working on including this package in tex-distributions

## Usage

See the documentation.

## Quick'n'dirty

```latex
\documentclass{article}
\usepackage{fistrum}

\begin{document}
\fistrum
\end{document}
```

## Generate new files

The `fistrum-es.txt` and `fistrum-la.txt` files were generated using the following commands:

```bash
./generate.lua chiquito 150 1932 > fistrum-es.txt
./generate.lua latin 150 2017 > fistrum-la.txt
```

## License

(C) 2023 David Davó

This program may be distributed and/or modified under the
conditions of the LaTeX Project Public License, either version 1.3
of this license or (at your option) any later version.
The latest version of this license is in
  http://www.latex-project.org/lppl.txt
and version 1.3 or later is part of all distributions of LaTeX
version 2005/12/01 or later.
