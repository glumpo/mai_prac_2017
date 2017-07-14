\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mai_book}

\LoadClass[10pt,a5paper]{book}

\RequirePackage{etoolbox}

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

\RequirePackage{floatrow}

\RequirePackage[justification=centering]{caption}
%\RequirePckage[labelsep=period]{caption}
\RequirePackage{mathtools}

%эпиграф
\RequirePackage{epigraph}
\epigraphrule=0pt
\epigraphwidth=10cm
\renewcommand{\textflush}{flushepinormal}
\makeatletter
% Taken and updated from http://mirrors.ctan.org/macros/latex/contrib/epigraph..
\renewcommand{\@epitext}[1]{%
\begin{minipage}{\epigraphwidth}\begin{\textflush} \hspace*{20pt} {\sffamily\footnotesize \indent \textit{#1}} \\
\ifdim\epigraphrule>\z@ \@epirule \else \vspace*{-.5\baselineskip} \fi
\end{\textflush}\end{minipage}}

\renewcommand{\@episource}[1]{%
\begin{minipage}{\epigraphwidth}\begin{\sourceflush} {\sffamily\footnotesize #1 } \end{\sourceflush}
\end{minipage}}

\makeatother

\RequirePackage{framed}

\RequirePackage[listings]{tcolorbox}
\RequirePackage{multicol}

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
frame=lrtb,
breaklines=true,
tabsize=3,
language=C,
showtabs=false,
showspaces=false
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

%-----------
\newcommand{\currentchapter}{}
\let\oldchapter\chapter
\renewcommand{\chapter}[2][1]{\oldchapter{#2}\renewcommand{\currentchapter}{#1}\renewcommand{\currentsection}{#2}}

\newcommand{\chaptertop}{
\fancyhf{}
\fancyhead[LE,RO]{\footnotesize\thepage}
\fancyhead[RE]{\footnotesize\Roman{chapter}\hspace{7pt} \selectfont\itshape{\currentchapter}}
\fancyhead[LO]{\footnotesize\Roman{chapter}-\arabic{section}\hspace{7pt} \selectfont\itshape{\currentsection}}
\renewcommand{\headrulewidth}{0.8pt}

}
\newcommand{\sectiontop}{
\fancyhf{}
\fancyhead[LE,RO]{\footnotesize\thepage}
\fancyhead[RE]{\footnotesize\Roman{chapter}-\arabic{section}\hspace{7pt} \selectfont\itshape{\currentsection}}
\fancyhead[LO]{\footnotesize\Roman{chapter}-\arabic{section}.\arabic{subsection}\hspace{7pt} \selectfont\itshape{\currentsubsection}}
\fancyfoot{}
\renewcommand{\headrulewidth}{0.8pt}
}

\newcommand{\currentsubsubsection}{}
\let\oldsubsubsection\subsubsection
\renewcommand{\subsubsection}[1]{\oldsubsubsection{#1}\renewcommand{\currentsubsubsection}{#1}}
\newcommand{\subsectiontop}{
\fancyhf{}
\fancyhead[LE,RO]{\footnotesize\thepage}
\fancyhead[RE]{\footnotesize\Roman{chapter}-\arabic{section}\hspace{7pt} \selectfont\itshape{\currentsection}}
\fancyhead[LO]{\footnotesize\Roman{chapter}-\arabic{section}.\arabic{subsection}.\arabic{subsubsection}\hspace{7pt} \selectfont\itshape{\currentsubsubsection}}
\fancyfoot{}
\renewcommand{\headrulewidth}{0.8pt}
}

%-----------

\newcommand{\newtopre}[1]{\fancyhead[RE]{#1}}
\newcommand{\newtoplo}[1]{\fancyhead[LO]{#1}}

\newcommand{\cleartop}{\fancyhf{} \renewcommand{\headrulewidth}{0pt}}
\newcommand{\restoretop}{
	\cleartop
	\fancyhead[LE,RO]{\thepage}
	\fancyhead[RE]{\Roman{section}\hspace{7pt} \currentsection}
	\fancyhead[LO]{\Roman{subsection}\hspace{7pt} \currentsubsection}
	\renewcommand{\headrulewidth}{0.8pt}
}

\fancyhf{}
\fancyhead[LE,RO]{\thepage}
\fancyhead[RE]{\Roman{section}\hspace{7pt} \textit{\currentsection}}
\fancyhead[LO]{\Roman{subsection}\hspace{7pt} \textit{\currentsubsection}}
\renewcommand{\headrulewidth}{0.8pt}

% римские цифры в номерах глав
\renewcommand\thechapter{\Roman{chapter}}

\titleformat {\chapter}
[display]
{\bfseries\Huge}
{Глава \ \Roman{chapter}}
{2ex} % sep
{} % before-code
[\thispagestyle{empty}] % after-code

%\makeatletter
%\patchcmd{\chapter}{\if@openright\cleardoublepage\else\clearpage\fi}{}{}{}
%\makeatother

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

\newtheoremstyle{mai_theorem_style_normal}
{\topsep}{\topsep}%
{}{}%
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

\theoremstyle{mai_theorem_style_normal}
\newtheorem*{beznomera}{}
