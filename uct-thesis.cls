\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{uct-thesis}[2025/03/07 v1.0 UCT PhD Thesis]

\LoadClassWithOptions{report}

\newcommand{\classpath}[1]{\newcommand{\@classpath}{#1}}

\RequirePackage[
	a4paper,
	top=3.2cm,
	bottom=3.2cm,
]{geometry}
\RequirePackage{setspace}
\RequirePackage{fancyhdr}
\RequirePackage{titlesec}

\RequirePackage{svg}
\RequirePackage{graphicx}

\RequirePackage[utf8]{inputenc}

\newcommand*{\supervisors}[1]{\newcommand{\@supervisors}{#1}}
\newcommand*{\degree}[1]{\newcommand{\@degree}{#1}}

\newcommand*{\monthname}{%
	\ifcase\month\or January\or February\or March\or April\or May\or June\or July\or August\or September\or October\or November\or December\fi}
\renewcommand{\@date}{\monthname, \the\year}

\RequirePackage[addtotoc]{abstract}

\renewcommand{\sectionmark}[1]{\markright{\thesection\ #1}}
\fancyhf{}
\fancyfoot[C]{\thepage}

\if@twoside
	\fancyhead[LO, RE]{\nouppercase{\rightmark}}
\else
	\fancyhead[LE, RO]{\nouppercase{\rightmark}}
\fi

\renewcommand{\maketitle}{
	\begin{titlepage}
		\begin{center}
			{
				\LARGE
				\bfseries
				\@title
				\par
			}
			\vfill
			{
				{\textit{by}}\\
				\vspace{0.05in}
				\large
				\bfseries
				\@author
				\par
			}
			\vspace{0.2in}
			{
				{\textit{supervised by}}\\
				\vspace{0.05in}
				\large
				\@supervisors
				\par
			}
			\vspace{0.5in}
			{
				\large
				\begin{minipage}{0.7\textwidth}
					\centering
					A thesis prepared in fulfilment of the requirements for the degree of\\
					\@degree{}\\
					within the University of Cape Town.
				\end{minipage}
				\par
			}
			\vfill
			{
				\includesvg[width=0.5\textwidth]{\@classpath/Img/uct-logo.svg}
				\par
			}
			\vfill
			{
				\large
				Cape Town, South Africa \hfill \@date
				\par
			}
		\end{center}
	\end{titlepage}
}

% Format chapter headings as a centred two-line heading at the top of the page.
\titleformat{\chapter}[display]
{\centering\LARGE\bfseries}
{\chaptertitlename\ \thechapter}
{0.5\baselineskip}
{}
\titlespacing*{\chapter}{0pt}{0pt}{1.5\baselineskip}


\newcommand{\frontmatter}{
	\pagenumbering{roman}
}
\newcommand{\mainmatter}{
	\cleardoublepage
	\pagenumbering{arabic}
	\pagestyle{fancy}
	\onehalfspacing
}
\g@addto@macro\appendix{
	\pagestyle{plain}
}
\newcommand{\backmatter}{
	\@empty
}

\newcommand{\summary}[1]{
	\begin{adjustwidth}{2em}{0em}
		\begin{flushright}
			\singlespacing
			\small
			\textit{
				#1
			}
		\end{flushright}
	\end{adjustwidth}
}

\makeatletter
\newcounter{reaction}
\renewcommand{\thereaction}{(R\,\thechapter.\arabic{reaction})}
\@addtoreset{reaction}{chapter}
\newenvironment{reaction}{
	\refstepcounter{reaction}
	\renewcommand{\theequation}{\thereaction}
}{
}
\newenvironment{reaction*}{
	\begin{equation*}
}{
	\end{equation*}
}

\newenvironment{reactions}{
	\refstepcounter{reaction}
	\renewcommand{\theequation}{\thereaction}
}{}

\clubpenalty=10000
\widowpenalty=10000
\displaywidowpenalty=10000
\brokenpenalty=10000
\predisplaypenalty=10000
\postdisplaypenalty=10000
\interlinepenalty=0