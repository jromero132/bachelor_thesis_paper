% Created byJosé Ariel Romero Costa <josea132.romero@gmail.com>

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{thesis}[13/02/2020 0.1 thesis]

\RequirePackage[utf8]{inputenc}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions
\relax
\LoadClass{book}

\RequirePackage{footmisc}
\RequirePackage{graphicx}
\RequirePackage{lmodern}
\RequirePackage{mathptmx}
\RequirePackage{pgffor}
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

% % fancyhdr settings from texlive-doc
% \RequirePackage{fancyhdr}
% \fancypagestyle{wakala}{%
% \fancyhf{} % clear all header and footer fields
% \fancyfoot[C]{\bfseries\thepage} % except the center
% \renewcommand{\headrulewidth}{1pt}
% \renewcommand{\footrulewidth}{0pt}}

% \fancyhf{}
% \if@twoside
%     \renewcommand{\chaptermark}[1]{\markboth{\small \ \chaptername\ \thechapter. \ #1}{}}
%     \renewcommand{\sectionmark}[1]{\markright{\thesection \ \ #1}}
%     \fancyhead[L]{\slshape \leftmark}
%     \fancyhead[R]{\thepage}
%     \fancyhead[LO]{\slshape \rightmark}
%     \fancyhead[RO,LE]{\textbf{\thepage}}
%     \fancyhead[RE]{\slshape \leftmark}
% \else
%     \renewcommand{\chaptermark}[1]{\markboth{\small \ \chaptername\ \thechapter. \ #1}{}}
%     \fancyhead[L]{\slshape\leftmark}
%     \fancyhead[R]{\thepage}
% \fi
% \renewcommand{\headheight}{28pt}

\setlength\oddsidemargin{36.1\p@}
\setlength\evensidemargin{36.1\p@}
\setlength\marginparwidth{36.1\p@}
\marginparsep 10pt
\topmargin 0pt \headsep .5in
%\textheight 8.1in \textwidth 6in

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

\renewcommand{\nomname}{Glosario}
\newcommand{\advisor}[1]{\def\@advisor{#1}}
\newcommand{\degree}[1]{\def\@degree{#1}}
\newcommand{\university}[1]{\def\@university{#1}}
\newcommand{\faculty}[1]{\def\@faculty{#1}}
\newcommand{\logo}[1]{\def\@logo{#1}}

\newenvironment{opinion}%
  {\chapter*{Opinión del tutor}}%
  {}
\newenvironment{acknowledgements}%
  {\chapter*{Agradecimientos}}%
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
    \includegraphics[width=1.75cm]{\@logo}\\
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
    \includegraphics[width=2.5cm]{graphics/qrcode-thesis}
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
  % \pagestyle{main_section_style}
}

\def\backmatter{%
  \pagestyle{plain}
}

% % fancyhdr settings from texlive-doc
% \RequirePackage{fancyhdr}
% \fancypagestyle{main_section_style}{
%   \fancyhf{} % clear all header and footer fields

%   % \fancyhead[C]{\@title

%   \fancyhead[L]{\@title}
%   \fancyhead[R]{\@author}

%   % \fancyfoot[LE,RO]{\bfseries\thepage}
%   % \renewcommand{\chaptermark}{1}{\markboth{#1}{}}
%   \fancyfoot[LE,RO]{\leftmark}
%   \fancyfoot[RE,LO]{\small\@author}

%   \renewcommand{\headrulewidth}{1pt}
%   \renewcommand{\footrulewidth}{1pt}
% }

% \RequirePackage[explicit]{titlesec}
% \RequirePackage{lettrine}
% \titleformat
% {\chapter}
% [display]
% {\bfseries\Large\flushright\itshape}
% {{\fontsize{40}{48}\selectfont C}apítulo\space\space\space{\fontsize{40}{48}\selectfont\thechapter}}
% {-1ex}
% {
%   \rule{\textwidth}{1.5pt}
%   \centering
%   #1
% }
% [
%   \vspace{-1ex}
%   \rule{\textwidth}{0.2pt}
% ]

% \RequirePackage{xstring}
% \newcommand*{\ExtractFirstChar}[1]{%
%     \StrRemoveBraces{#1}[\FirstChar]%
%     \StrChar{\FirstChar}{1}[\FirstChar]%
%     '\FirstChar'
% }

% \makeatletter
% \newcommand{\shortcut}[1]{%
%   \@tempswafalse
%   \@for\next:=#1\do
%     {\if@tempswa\else\@tempswatrue\fi\ExtractFirstChar{\next}}%
% }
% \makeatother

% \titleformat
% {name=\chapter,numberless}
% [display]
% {\bfseries\Large\flushright\itshape}
% {}
% {0em}
% {\shortcut{#1}}
% []

% \titleformat
% {\section}
% [wrap]
% {\normalfont\bfseries}
% {\thesection.}
% {0.5em}
% {}

% Created by José Ariel Romero Costa <josea132.romero@gmail.com>