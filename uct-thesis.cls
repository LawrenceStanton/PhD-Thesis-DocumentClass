\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{uct-thesis}[2025/03/07 v1.0 UCT PhD Thesis]

\RequirePackage[
	a4paper,
]{geometry}
\RequirePackage{fancyhdr}

\RequirePackage{svg}
\RequirePackage{graphicx}
\graphicspath{{Img/}}

\RequirePackage[utf8]{inputenc}

\newcommand*{\supervisors}[1]{\newcommand{\@supervisors}{#1}}
\newcommand*{\degree}[1]{\newcommand{\@degree}{#1}}

\newcommand*{\monthname}{%
	\ifcase\month\or January\or February\or March\or April\or May\or June\or July\or August\or September\or October\or November\or December\fi}
\renewcommand{\@date}{\monthname, \the\year}

\LoadClassWithOptions{report}

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
					in the University of Cape Town.
				\end{minipage}
				\par
			}
			\vfill
			{
				\includesvg[width=0.5\textwidth]{uct-logo.svg}
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

\newcommand{\frontmatter}{
	\pagenumbering{roman}
}
\newcommand{\mainmatter}{
	\cleardoublepage
	\pagenumbering{arabic}
	\pagestyle{fancy}
}
\g@addto@macro\appendix{
	\pagestyle{plain}
}
\newcommand{\backmatter}{
	\@empty
}