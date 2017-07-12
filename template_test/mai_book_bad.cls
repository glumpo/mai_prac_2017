\NeedsTeXFormat{LaTeX2e}[2017/06/04 MAI Practice]
\ProvidesClass{mai_book}

\LoadClass[10pt,a5paper]{book}

\RequirePackage{fontspec}
\RequirePackage{xunicode}
\RequirePackage{xltxtra}
\RequirePackage{polyglossia}
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}
\RequirePackage{graphicx}
\RequirePackage{etoolbox}
\RequirePackage[left=0.5cm,right=0.5cm,top=2cm,bottom=0.5cm]{geometry}

\RequirePackage{atbegshi}
\RequirePackage{titlesec}

\newcounter{thecaption}
\addtocounter{thecaption}{1}
\RequirePackage{tikz}
\RequirePackage{wrapfig}
\renewcommand{\caption}[1]{\newline\textbf{Рис. \arabic{thecaption}.} {#1} \stepcounter{thesection}}

\RequirePackage{fancyhdr}


\newcounter{thesection}
\addtocounter{thesection}{1}

\newcounter{lol}
\fancyhf{}
\fancyhead[LE,RO]{\thepage}
\fancyhead[LO,RE]{\arabic{lol}}

\pagestyle{fancy}

\renewcommand{\headrulewidth}{0pt}

\newcommand\getcurrentref[1]{%
 \ifnumequal{\value{#1}}{0}
  {??}
  {\the\value{#1}}%
}


%\newcommand{\newtop}[1]{\sectionmark{#1}}
%\lhead{}
%\lhead{\thepage}

%\newcommand{\head}{empty}
%\newcommand{\changehead}[1]{\renewcommand{\head}{#1}}

%\lhead{}
%\chead{}
%\rhead{\textbf{\head}}
%\lhead{\thepage}
%\renewcommand{\headrulewidth}{0.4pt}
%\renewcommand{\footrulewidth}{0.4pt}

\def \printhead [#1]{ %
		\begin{center} %
			\begin{flushright} %
				#1 %
			\end{flushright} %
			\line(1,0){566} %
		\end{center} %
}


\renewcommand{\thesubsection}{\arabic{thesection}.\arabic{subsection}}

\titleformat {\chapter}
[display]
{\bfseries\Huge}
{Глава \ \Roman{chapter}}
{2ex} % sep
{} % before-code
[] % after-code

\titleformat {\section}
[hang]
{\bfseries\normalsize}
{\arabic{thesection} \ }
{0ex} % sep
{\stepcounter{thesection}} % before-code
[\stepcounter{lol}] % after-code


\titleformat {\subsection}
[hang]
{\bfseries\normalfont\normalsize}
{\thesubsection \ }
{0ex} % sep
{} % before-code
[] % after-code

