%
% In dieser Datei fehlen noch ein paar erklaerende Kommentare
%
\ProvidesClass{tuberlinbeamer}
\newcounter{deko}
\setcounter{deko}{0}
\DeclareOption{Nike}{\def\FileName{Nike}\setcounter{deko}{1}}
\DeclareOption{Haus}{\def\FileName{Haus}\setcounter{deko}{2}}
\DeclareOption{Aussicht}{\def\FileName{Aussicht}\setcounter{deko}{3}}
\DeclareOption{Leer}{\def\Filename{}\setcounter{deko}{0}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{beamer}}
\ProcessOptions\relax
\LoadClass[xcolor=table,hyperref={bookmarks},9pt,t]{beamer}  % pdfpagemode=FullScreen
\RequirePackage{sansmathfonts}
\RequirePackage[helvet]{sfmath}
\RequirePackage[scaled=0.85]{helvet}
\RequirePackage{xspace}
\RequirePackage{etoolbox}
\RequirePackage{calc}

\setlength{\unitlength}{1mm}
\newlength{\rand}
\setlength{\rand}{5mm}
\newlength{\mylogowidth}
\setlength{\mylogowidth}{20mm}
\newlength{\tvoff}
\newlength{\vpicsize}
\newlength{\vtitel}

\def\mykSv{0} % kryptische Spezialvariable

% unterstuetzte Seitenverhaeltnisse (Nike)
% 43:   12.80 cm x  9.60 cm
% 54:   12.50 cm x 10.00 cm
% 169:  16.00 cm x  9.00 cm
% 1610: 16.00 cm x 10.00 cm

\xdefinecolor{TUred}{RGB}{197,14,31}
\xdefinecolor{grau}{RGB}{113,113,113}
\setbeamersize{text margin left=\rand, text margin right=\rand}

\newcommand*{\lengthinmm}[1]{\strip@pt\dimexpr0.35149804\dimexpr#1\relax\relax}
\newcommand{\smallcirc}{\begin{picture}(2,2)\put(1,0.9){\circle*{0.88}}\end{picture}}
\newcommand{\Nike}{\def\FileName{Nike}\setcounter{deko}{1}}
\newcommand{\Haus}{\def\FileName{Haus}\setcounter{deko}{2}}
\newcommand{\Aussicht}{\def\FileName{Aussicht}\setcounter{deko}{3}}
\newcommand{\Leer}{\setcounter{deko}{0}}
\newcommand{\sehrLeer}{\setcounter{deko}{-1}}
\newcommand{\pagename}{Seite} % Definition wird vom babel-Paket ueberschrieben
\newcommand{\hurz}{\mbox{~\textbar~}}

\linespread{1.1}
\newcommand{\leer}{}
\newcommand{\pathtologo}{TU_Logo_lang_RGB_rot}
%\newcommand{\pathtologo}{test}
\newcommand{\pathtomylogo}{}

\newlength{\rechts}
\newlength{\oben}
\newlength{\titleheight}

\setbeamertemplate{title page}{%
	\thispagestyle{empty}%
	\setlength{\vpicsize}{\paperheight-\headheight-7pt}%
	\setlength{\vtitel}{20mm}
	\addtolength{\vtitel}{(\paperheight-9cm)/\real{2}}%
	\setlength{\rechts}{\paperwidth-\rand}%
	\setlength{\oben}{\paperheight-\rand}%
	\hspace{-\rand}\begin{picture}(0,\lengthinmm{\vpicsize})%
		\put(\lengthinmm{\rechts},\lengthinmm{\oben}){\makebox(0,0)[rt]{\includegraphics[width=30mm]{\pathtologo}}}%
		\ifnum\thedeko>0%
			\ifdimequal{\paperwidth}{12.80cm}{%
				\put(-0.5,32){\color{TUred}\rule{\rand}{32mm}}
				\put(5,32){\includegraphics[height=32mm,width=118mm]{\FileName}}
			}{}
			\ifdimequal{\paperwidth}{16.00cm}{%
				\ifdimequal{\paperheight}{10.00cm}{%
					\put(-0.5,34){\color{TUred}\rule{\rand}{32mm}}
					\put(5,34){\includegraphics[height=32mm,width=150mm]{\FileName_1610}}
				}{}
				\ifdimequal{\paperheight}{9.00cm}{%
					\put(-0.5,29){\color{TUred}\rule{\rand}{32mm}}
					\put(5,29){\includegraphics[height=32mm,width=150mm]{\FileName_1610}}
				}{}
			}{}
			\ifdimequal{\paperwidth}{12.50cm}{%
				\put(-0.5,34){\color{TUred}\rule{\rand}{32mm}}
				\put(5,34){\includegraphics[height=32mm,width=115mm,trim=0 0 3mm 0,clip]{\FileName}}
			}{}
		\fi
		\put(\lengthinmm{\rand},8){\parbox[b][\vtitel][s]{\linewidth}{%
			\raggedright\vfill%
			\usebeamerfont{title}\usebeamercolor[fg]{titlelike}{\inserttitle}\par%
			\vfill%
			\color{grau}\fontsize{8pt}{8pt}\selectfont%
			\insertauthor%
			\ifdefempty{\insertinstitute}{}{\hurz\insertinstitute}%
			\ifdefempty{\insertsubtitle}{}{\hurz\insertsubtitle}\par%
			\vfill%
		}}
		\put(\lengthinmm{\rand},7.5){%
			\ifx\pathtomylogo\leer%
				{\color{grau}{\rule{\linewidth}{0.5pt}}}
			\else{\color{grau}{\rule{\linewidth}{0.5pt}}}
			\fi
		}
	\end{picture}
}

\setbeamertemplate{headline}{%
	\begin{picture}(100,16)
		\ifnum\thedeko>-1%
			\put(\lengthinmm{\paperwidth-\rand},1){\makebox[0mm][r]{\includegraphics[width=18mm]{\pathtologo}}}%
		\fi
		\ifnum\thedeko>0%
			\put(-0.5,1){\color{TUred}\rule{\rand}{10mm}}
			\ifdimequal{\paperwidth}{16.00cm}{%
				\put(5,1){\includegraphics[height=10mm,width=126mm]{\FileName_head_1610}}}{}
			\ifdimequal{\paperwidth}{12.80cm}{%
				\put(5,1){\includegraphics[height=10mm,width=94mm]{\FileName_head}}}{}
			\ifdimequal{\paperwidth}{12.50cm}{%
				%\put(5,1){\includegraphics[height=10mm,width=94mm,trim=0 0 0 3mm,clip]{\FileName_head}}}{}
				\put(5,1){\includegraphics[height=10mm,width=91mm,trim=0 0 3mm 0,clip]{\FileName_head}}}{}
		\fi
	\end{picture}
}

\setbeamertemplate{frametitle}{%
	\ifnum\thedeko<0
		\vspace{-12mm}
		\insertframetitle
	\fi
	\ifnum\thedeko=0
		\vspace{-5mm}
		\begin{picture}(0,0)
			\put(0,0){\parbox[b][10mm][b]{94mm}{\raggedright\insertframetitle\vphantom{Ag}}}
		\end{picture}
	\fi
	\ifnum\thedeko>0
		\insertframetitle
	\fi
\vspace{-1mm}
}

\setbeamertemplate{footline}{%
	\begin{picture}(100,10)%
		\put(\lengthinmm{\rand},7.5){\rule{\linewidth}{0.5pt}}
		\put(\lengthinmm{\rand},1){%
			\parbox[b][6mm][s]{100mm}{\fontsize{5pt}{5pt}\selectfont%
				\raggedright\vfill%
				\ifdefempty{\inserttitle}%
					{\vphantom{}\def\mykSv{0}}%
					{\textbf{\insertshorttitle}%
					 \def\mykSv{1}}%
				\ifdefempty{\beamer@shortauthor}
					{}%
					{\ifnum\mykSv=1\discretionary{}{}{\hurz}\fi%
					 \insertshortauthor%
					 \def\mykSv{1}}%
				\ifdefempty{\insertsubtitle}%
					{}%
					{\ifnum\mykSv=1\discretionary{}{}{\hurz}\fi%
					 \insertshortsubtitle}%
				\vfill\vfill%
				\pagename~\insertframenumber\par\vfill%
			}
		}
		\put(\lengthinmm{\paperwidth-\rand},1){%
			\ifx\pathtomylogo\leer
			\else{\makebox[0mm][r]{\includegraphics[height=6mm]{\pathtomylogo}}}
		\fi}
  \end{picture}
}

\setbeamertemplate{navigation symbols}{}
\setbeamertemplate{background}{}
\setbeamertemplate{itemize item}{--}
\setbeamertemplate{itemize subitem}{\smallcirc}
\setbeamertemplate{itemize subsubitem}{\frqq}

\setbeamercolor{alerted text}{fg=TUred}
\setbeamercolor{block body}{bg=lightgray}
\setbeamercolor{block body alerted}{bg=lightgray}
\setbeamercolor{block title}{bg=TUred,fg=white}
\setbeamercolor{block title alerted}{bg=TUred,fg=white}
\setbeamercolor{block title example}{bg=TUred,fg=white}
\setbeamercolor{frametitle}{fg=TUred}
\setbeamercolor{item}{fg=black}
\setbeamercolor{navigation symbols}{fg=grau}
\setbeamercolor{section in toc}{fg=TUred}
\setbeamercolor{titlelike}{fg=TUred}
\setbeamercolor{footline}{fg=grau}

\setbeamerfont{block title}{size=\normalsize}
\setbeamerfont{block title alerted}{size=\normalsize}
\setbeamerfont{block title example}{size=\normalsize}
\setbeamerfont{titlelike}{}
\setbeamerfont{title}{size=\fontsize{12}{12}\selectfont}
\setbeamerfont{title in head}{series=\bfseries}
\setbeamerfont{frametitle}{size=\large}
\setbeamerfont{section in toc}{series=\bfseries}

\setbeamerfont*{itemize/enumerate body}{parent=normal text}
\setbeamerfont*{itemize/enumerate subbody}{parent=itemize/enumerate body}
\setbeamerfont*{itemize/enumerate subsubbody}{parent=itemize/enumerate body}

\renewcommand{\emph}{\textbf}
\renewcommand{\ttdefault}{lmtt}
\newcommand{\fazit}[1]{{\color{TUred}#1}\xspace}

% Bildformate 4:3
% Titelfolie: 118:32 (42.5:32 / 75:32)
% Kopfzeile:   94:10
%
% Bildformate 16:10
% Titlefolie: 150:34 (50.5:34 / 99:34)
% Kopfzeile:  126:10

