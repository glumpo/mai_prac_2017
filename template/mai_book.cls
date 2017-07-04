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
\RequirePackage[left=0.5cm,right=0.5cm,top=2cm,bottom=0.5cm]{geometry}

\RequirePackage{atbegshi}
\RequirePackage{titlesec}

\RequirePackage{fancyhdr}
\pagestyle{fancy}

\newcommand{\newtop}[1]{\renewcommand{\sectionmark}[1]{\markboth{\thesection.\ #1}{}}}

\renewcommand{\sectionmark}[1]{\markboth{\thesection.\ #1}{}}
\lhead{}
\lhead{\thepage}

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


\titleformat {\chapter}
[display]
{\bfseries\Huge}
{Глава \ \thechapter}
{2ex} % sep
{} % before-code
[] % after-code

