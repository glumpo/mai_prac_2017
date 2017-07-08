\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mai_book}

\LoadClass[10pt,a5paper]{book}
\RequirePackage{fontspec}
\RequirePackage{xunicode}
\RequirePackage{xltxtra}
\RequirePackage{xecyr}
\RequirePackage{polyglossia}
\RequirePackage{indentfirst}
\PolyglossiaSetup{russian}{indentfirst=true}
\RequirePackage{amsfonts}
\RequirePackage{amsmath}
\RequirePackage{amsthm}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}
\RequirePackage{graphicx}
\RequirePackage[left=0.5cm,right=0.5cm,top=2cm,bottom=0.5cm]{geometry}

\RequirePackage{atbegshi}
\RequirePackage{titlesec}

%эпиграф
\RequirePackage{epigraph}
\epigraphrule=0pt
\epigraphwidth=10cm
\renewcommand{\textflush}{flushepinormal}
\makeatletter
% Taken and updated from http://mirrors.ctan.org/macros/latex/contrib/epigraph..
\renewcommand{\@epitext}[1]{%
\begin{minipage}{\epigraphwidth}\begin{\textflush} \hspace*{20pt}#1\\
\ifdim\epigraphrule>\z@ \@epirule \else \vspace*{-.5\baselineskip} \fi
\end{\textflush}\end{minipage}}
\makeatother

\RequirePackage{framed}

%для таблицы
\RequirePackage{multirow}

%шрифт кода
\setmainfont{DejaVuSerif}
\newfontfamily{\cyrillicfonttt}{DejaVuSansMono}
\newfontfamily{\cyrillicfontit}{DejaVuSerif-Italic}
\newfontfamily{\cyrillicfontsf}{DejaVuSerif}

\DeclareMathOperator{\Nod}{НОД}
\DeclareMathOperator{\card}{card}
\DeclareMathOperator{\im}{Im}
\DeclareMathOperator{\Ker}{Ker}

%для кода
\newcommand{\listname}{lol}
\RequirePackage{listings}
\lstset{
captionpos={bo},
basicstyle=\ttfamily,
frame=single,
breaklines=true,
tabsize=3,
language=C
}


\RequirePackage{fancyhdr}
\pagestyle{fancy}

%\fancyhead[LE,RO]{\thepage}
%\fancyhead[LO,RE]{\sectionname}

\newcommand{\currentsubsection}{}
\let\oldsubsection\subsection
\renewcommand{\subsection}[1]{\oldsubsection{#1}\renewcommand{\currentsubsection}{#1}}

\newcommand{\currentsection}{}
\let\oldsection\section
\renewcommand{\section}[1]{\oldsection{#1}\renewcommand{\currentsection}{#1}\renewcommand{\currentsubsection}{#1}}

\fancyhf{}
\fancyhead[LE,RO]{\thepage}
\fancyhead[RE]{\Roman{section}\hspace{7pt} \currentsection}
\fancyhead[LO]{\Roman{subsection}\hspace{7pt} \currentsubsection}
\renewcommand{\headrulewidth}{0.8pt}

% римские цифры в номерах глав
\renewcommand\thechapter{\Roman{chapter}}

\titleformat {\chapter}
[display]
{\bfseries\Huge}
{Глава \ \thechapter}
{2ex} % sep
{} % before-code
[] % after-code


\makeatletter
\@definecounter{chapter}
\makeatother
\renewcommand{\thesection}{\arabic{section}}

\renewcommand{\lstlistingname}{Алгоритм}
%\renewcommand{\qedsymbol}{\blacksquare}
\renewcommand{\qedsymbol}{\ensuremath{\blacksquare}}

\newtheoremstyle{mai_theorem_style}
{\topsep}{\topsep}%
{\itshape}{}%
{\bfseries}{}%
{\newline}{}%

%для линии, что под словом "доказательство"
\renewenvironment{leftbar}[1][\hsize]
{%
\def\FrameCommand
{%
{\vrule width 0.5pt}%
\hspace{10pt}%must no space.
}%
\MakeFramed{\hsize#1\advance\hsize-\width\FrameRestore}%
}
{\endMakeFramed}

\newenvironment{myproof}[1][\proofname]{%
\begin{proof}[#1] $ $\par\nobreak\ignorespaces \begin{leftbar} \noindent
}{%
\end{leftbar}\end{proof}
}

%запрет разрыва формул
\binoppenalty=10000
\relpenalty=10000

\theoremstyle{mai_theorem_style}
\newtheorem{thm}{Теорема}

\theoremstyle{mai_theorem_style}
\newtheorem{predl}[thm]{Предложение}

\theoremstyle{mai_theorem_style}
\newtheorem{sled}[thm]{Следствие}

\theoremstyle{mai_theorem_style}
\newtheorem{bezpodpisi}[thm]{}

\theoremstyle{mai_theorem_style}
\newtheorem*{beznomera}{}