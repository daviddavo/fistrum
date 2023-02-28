# fistrum

> Lorem fistrum quietooor fistro qué dise usteer quietooor va usté muy cargadoo.

150 paragraphs of Lorem fistrum dummy text for LaTeX.

Based on [www.chiquitoipsum.com](https://www.chiquitoipsum.com/)

## Install

If you want to install it manually, run fistrum.ins through latex to generate the
style file. To generate the docs, run fistrum.dtx through XeLaTeX or lualatex.

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

## Things to do before publishing
- [x] Autogenerate fistrum-es.txt and fistrum-la.txt
- [x] Revise documentation
- [ ] Fix tests
