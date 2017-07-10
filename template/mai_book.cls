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
\RequirePackage{changepage}
\RequirePackage{tikz}
\RequirePackage{wrapfig}
\RequirePackage[left=0.5cm,right=0.5cm,top=1.5cm,bottom=1cm]{geometry}

\RequirePackage[perpage]{footmisc}
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
\RequirePackage[listings]{tcolorbox}

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
\RequirePackage{listings}
\lstset{
captionpos={bo},
basicstyle=\ttfamily,
frame=single,
breaklines=true,
tabsize=3,
language=C
}

\newtcblisting[auto counter]{namedlisting}[2][]{sharp corners, 
    listing only, 
    listing options={basicstyle=\ttfamily,
					frame=single,
					breaklines=true,
					tabsize=3,
					language=C,
					showtabs=false,
					showspaces=false}, 
    title=Исходный код \thetcbcounter: #2, #1}



\RequirePackage{fancyhdr}
\pagestyle{fancy}

\newcommand{\currentsubsection}{}
\let\oldsubsection\subsection
\renewcommand{\subsection}[1]{\oldsubsection{#1}\renewcommand{\currentsubsection}{#1}}

\newcommand{\currentsection}{}
\let\oldsection\section
\renewcommand{\section}[1]{\oldsection{#1}\renewcommand{\currentsection}{#1}\renewcommand{\currentsubsection}{#1}}

%\newcommand{\cleartop}{\fancyhf{}}

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

\renewcommand{\lstlistingname}{\textbf{Алгоритм}}
%\renewcommand{\qedsymbol}{\blacksquare}
\renewcommand{\qedsymbol}{\ensuremath{\blacksquare}}

\newtheoremstyle{mai_theorem_style}
{\topsep}{\topsep}%
{\itshape}{}%
{\bfseries}{}%
{\newline}{}%

\newenvironment{mynotice}{
\begin{adjustwidth}{25pt}{25pt}
	\small
	\textbf{Замечание.\ }
}{
	
	\end{adjustwidth}
}

\newenvironment{mynote}{
\begin{adjustwidth}{25pt}{25pt}
	\small
	\textbf{Примечание.\ }
}{
	
	\end{adjustwidth}
}



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
\begin{proof}[\bfseries #1] $ $\par\nobreak\ignorespaces \begin{leftbar} \noindent
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
\newtheorem{determ}[thm]{Определение}

\theoremstyle{mai_theorem_style}
\newtheorem{lemma}[thm]{Лемма}

\theoremstyle{mai_theorem_style}
\newtheorem{algo}[thm]{Алгоритм}

\theoremstyle{mai_theorem_style}
\newtheorem{property}[thm]{Свойство}

\theoremstyle{mai_theorem_style}
\newtheorem{bezpodpisi}[thm]{}

\theoremstyle{mai_theorem_style}
\newtheorem*{beznomera}{}