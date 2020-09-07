% Created byJosé Ariel Romero Costa <josea132.romero@gmail.com>

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{thesis}[13/02/2020 0.1 thesis]

\RequirePackage[utf8]{inputenc}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions
\relax
\LoadClass{book}

\RequirePackage{fancyhdr}
\RequirePackage{footmisc}
\RequirePackage{graphicx}
\RequirePackage{lmodern}
\RequirePackage{mathptmx}
\RequirePackage{multirow}
\RequirePackage{pgffor}
% \RequirePackage{titleps}
\RequirePackage{suffix}
\RequirePackage{xcolor}

% \RequirePackage[ruled,vlined]{algorithm2e}
\RequirePackage[fixlanguage]{babelbib}
\RequirePackage[nottoc,notlof,notlot]{tocbibind}
\RequirePackage[pagebackref,linktocpage,breaklinks,colorlinks,%
                linkcolor=black,anchorcolor=black,citecolor=black,%
                filecolor=black,menucolor=black,runcolor=black,%
                urlcolor=black]{hyperref}
\RequirePackage[refpage, intoc, spanish]{nomencl}
\RequirePackage[spanish,es-nodecimaldot]{babel}
\RequirePackage[T1]{fontenc}

\setlength\oddsidemargin{36.1\p@}
\setlength\evensidemargin{36.1\p@}
\setlength\marginparwidth{36.1\p@}
\marginparsep 10pt
\topmargin 0pt \headsep .5in

% More liberal float placement from BYUPhys.cls.
\renewcommand{\topfraction}{0.9}
\renewcommand{\bottomfraction}{0.8}
\setcounter{topnumber}{2}
\setcounter{bottomnumber}{2}
\setcounter{totalnumber}{4}
\renewcommand{\textfraction}{0.07}

% Backreferences in the bibliography.
\backrefspanish
\renewcommand{\backref}[1]{}
\renewcommand{\backrefalt}[4]{%
  \ifcase #1 \relax%
  \or (Citado en la página~#2).%
  \else (Citado en las páginas~#2).%
  \fi%
}
\btxifchangecaseoff
\renewcommand{\btxselectlanguage}[1]{\relax}

% Book edition numbers.
\declarebtxcommands{spanish}{%
  \def\btxnumeralshort#1{#1.^a}%
  \def\btxnumerallong#1{%
    \ifnumber{#1}{%
      \ifcase#1 0\or
        primera\or segunda\or tercera\or cuarta\or quinta\or
        sexta\or séptima\or octava\or novena\or décima\else
        #1.^a%
      \fi%
    }%
    {#1}%
  }%
}

\newcommand\NewChapter[1]{
  \def\chaptertitle{#1}
  \thispagestyle{thesis_style_for_new_chapter}
}
\newcommand\Chapter[1]{
  \chapter{#1}
  \NewChapter{#1}
}

\WithSuffix\newcommand\Chapter*[1]{
  \chapter*{#1}
  \addcontentsline{toc}{chapter}{#1}
  \NewChapter{#1}
}

\newcommand\ChapterOutOfToc[1]{
  \chapter*{#1}
  \def\chaptertitle{#1}
}

\renewcommand{\nomname}{Glosario}
\newcommand{\advisor}[1]{\def\@advisor{#1}}
\newcommand{\degree}[1]{\def\@degree{#1}}
\newcommand{\university}[1]{\def\@university{#1}}
\newcommand{\faculty}[1]{\def\@faculty{#1}}
\newcommand{\logo}[1]{\def\@logo{#1}}

\newenvironment{phrase}[1][0.5\textwidth]%
  {
    \begin{flushright}
      \begin{minipage}[t]{#1}
        \itshape
  }%
  {
      \end{minipage}
    \end{flushright}
  }
\newenvironment{acknowledgements}%
  {\chapter*{Agradecimientos}}%
  {}
\newenvironment{opinion}%
  {\chapter*{Opinión del tutor}}%
  {}
\newenvironment{abstract}%
  {\chapter*{Resumen}}%
  {}
\newenvironment{introduction}%
  {\cleardoublepage%
   \phantomsection%
   \addcontentsline{toc}{chapter}{Introducción}%
   \chapter*{Introducción}}%
  {}
\newenvironment{conclusions}%
  {\cleardoublepage%
   \phantomsection%
   \addcontentsline{toc}{chapter}{Conclusiones}%
   \chapter*{Conclusiones}}%
  {}
\newenvironment{recomendations}%
  {\cleardoublepage%
   \phantomsection%
   \addcontentsline{toc}{chapter}{Recomendaciones}%
    \chapter*{Recomendaciones}}%
  {}
\newenvironment{dedication}%
  {\cleardoublepage%
   \thispagestyle{empty}%
   \vskip 3.5cm%
   \begin{flushright}}%
  {\end{flushright}}

\newtheorem{theorem}{Teorema}
\newtheorem{definition}{Definición}

\AtBeginDocument{%
  \hypersetup{pdftitle=\@title,pdfauthor=\@author}%
  % Renaming cuadro to tabla.
  \renewcommand{\listtablename}{Índice de tablas}%
  \renewcommand{\tablename}{Tabla}%
}

% The title page.
\def\maketitle{%
  \thispagestyle{empty}
  \begin{center}
    {\large \@university}\\
    \@faculty\\
    \vskip 0.25cm
    \includegraphics[width=2cm]{\@logo}\\
    \vfill
    {\huge \textbf{\@title}}\\
    \vskip 2cm
    {\Large Autor: \textbf{\@author}}\\
    \vskip 0.5cm
    {\Large Tutor: \textbf{\@advisor}}\\
    \vfill
    {\large Trabajo de Diploma\\
    presentado en opción al título de\\
    \@degree}\\
    \vskip 0.25cm
    % \includegraphics[width=2.5cm]{graphics/qrcode-thesis}
    \textbf{CÓDIGO QR EN UN GRAFO SIMULANDO UN GRAFO DE CONOCIMIENTO PARA QUE QUEDE CON UN USO PARECIDO AL RESULTADO DE LA TESIS :)}
    \vskip 0.25cm
    \@date
  \end{center}
}

\def\frontmatter{%
  \pagenumbering{roman}
  \pagestyle{plain}
}

\def\mainmatter{%
  \cleardoublepage%
  \pagenumbering{arabic}
  \pagestyle{thesis_style}
}

\def\backmatter{%
  \pagestyle{thesis_style}
}

\fancypagestyle{thesis_style}{
  \fancyhf{} % clear all header and footer fields

  \fancyhead[L]{\@title}
  \fancyhead[R]{
    \ifnum\value{chapter}=0 \chaptertitle
    \else
      \chaptername\ \thechapter
      \ifnum\value{chapter}>1 : \chaptertitle\fi
    \fi
  }
  \fancyfoot[L]{\@author}
  \fancyfoot[R]{\bfseries\thepage}

  \renewcommand{\headrulewidth}{1pt}
  \renewcommand{\footrulewidth}{1pt}
}

\fancypagestyle{thesis_style_for_new_chapter}{
  \fancyhf{} % clear all header and footer fields

  \fancyfoot[L]{\@author}
  \fancyfoot[R]{\bfseries\thepage}

  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{1pt}
}

% Created by José Ariel Romero Costa <josea132.romero@gmail.com>