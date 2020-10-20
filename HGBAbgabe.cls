\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{HGBAbgabe}[2019/11/05 HGB Abgabe]
\LoadClass[10pt,a4paper]{scrartcl}

\RequirePackage[naustrian]{babel}
\RequirePackage[utf8]{inputenc}
\RequirePackage[dvipsnames]{xcolor}
\RequirePackage[colorlinks,linkcolor=black]{hyperref}
\RequirePackage{fancyvrb}
\RequirePackage{pdfpages}
\RequirePackage{graphicx}
\RequirePackage{listings}
\RequirePackage{courier}
\RequirePackage[T1]{fontenc}
\RequirePackage{scrhack}   %prevent problems with listings toc

% Options 
% - headers for source files; header depth
% - tab size

\definecolor{myComment}{HTML}{227722}
\definecolor{myString}{HTML}{aa2222}
\definecolor{myKeyword}{HTML}{2222aa}
\definecolor{myLineNumber}{HTML}{666666}

\lstloadlanguages{C++, Java} % Load syntax for listings, for a list of other languages supported see: ftp://ftp.tex.ac.uk/tex-archive/macros/latex/contrib/listings/listings.pdf

\lstset{%
   basicstyle=\footnotesize\ttfamily,%
   showspaces=false,showstringspaces=false,%
   numbers=left,tabsize=3,breaklines,%
   breaklines=true,                 % automatic line breaking only at whitespace
   captionpos=b,                    % sets the caption-position to bottom
   commentstyle=\color{myComment},    % comment style
   keywordstyle=\bfseries\color{myKeyword},       % keyword style
   stringstyle=\color{myString},     % string literal style
   numberstyle=\color{myLineNumber},		%
   identifierstyle=\color{black},%
   literate=
      {ö}{{\"o}}1
      {ä}{{\"a}}1
      {ü}{{\"u}}1
      {Ö}{{\"O}}1
      {Ä}{{\"A}}1
      {Ü}{{\"U}}1
      {ß}{{\ss}}1
      {_}{{\_}}1
      {°}{{$^{\circ}$}}1
}

% Margins
\topmargin=-0.45in
\evensidemargin=0in
\oddsidemargin=0in
\textwidth=6.5in
\textheight=9.0in
\headsep=0.25in

\linespread{1.1} % Line spacing

\setlength\parskip{0.3\baselineskip}
\setlength\parindent{0pt} % Removes all indentation from paragraphs

\lstdefinestyle{C}{
   language=C
}

\lstdefinestyle{C++}{
   language=C++
}

\lstdefinestyle{Java}{
   language=Java
}

\lstdefinestyle{CSharp}{
   language=C++,
   morekeywords={input,output,attribute,uint}
}

\lstdefinestyle{Pseudocode}{
   language=C,
   morekeywords={algorithm,param,local,array,end,then}
   literate=
      {[in]}{$\downarrow$}1
      {[inout]}{$\updownarrow$}1
      {[out]}{$\uparrow$}1
      {!=}{$\neq$}1
}

\newcommand{\HGBFile}[2]{
   \begin{itemize}
      \item[]\lstinputlisting[style=#2,caption=#1,label=#1]{#1}
   \end{itemize}
}

\newcommand{\HGBSource}[2]{
    \HGBFile{#1}{#2}
}

\newcommand{\HGBCSource}[1]{
   \HGBSource{#1}{C}
}

\newcommand{\HGBCppSource}[1]{
   \HGBSource{#1}{C++}
}

\newcommand{\HGBJavaSource}[1]{
   \HGBSource{#1}{Java}
}

\newcommand{\HGBCModule}[1]{
   \HGBFile{#1.h}{C}
   \HGBFile{#1.cpp}{C}
}

\newcommand{\HGBCppModule}[1]{
   \HGBFile{#1.h}{C++}
   \HGBFile{#1.cpp}{C++}
}

\newcommand{\HGBVerbatim}[1]{
   \VerbatimInput{#1}
}

\newcommand{\HGBPdf}[2]{
   \includepdf[fitpaper,scale=1, pages=1, pagecommand={\thispagestyle{empty}{#2}}]{#1}
   \pdfximage{#1}
   \ifthenelse{\equal{\the\pdflastximagepages}{1}}
   {} %true
   {\includepdf[fitpaper, pages=2-last, pagecommand={\thispagestyle{empty}}]{#1}}
   \pagebreak
}

\newcommand{\HGBSourceToc}{
   \lstlistoflistings
}