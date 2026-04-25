%========================== acoust.cls ===========================
%
%-for Acoustical Science and Technology %
% Version 1.2
%-Released on March 2002
%-Revised on January 2003 for ver.1.2
%-Komiyama Printing Co., Ltd.
%
%=================================================================

\typeout{***** Document Class =<<<acoust.cls>>>= ver. 1.2 ******}
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{acoust}[2003/01/09 version 1.2  document class]
\RequirePackage{amsmath}[1997/03/20]
\RequirePackage{amssymb}
\RequirePackage[dvips]{graphicx}
%\RequirePackage[dvipdfmx]{graphicx}
\RequirePackage{cite}
\allowdisplaybreaks[4]
\flushbottom
\frenchspacing
\@twosidetrue
\@twocolumntrue
\AtBeginDocument{\sloppy}
\AtEndDocument{\label{lastpage}}

\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
\DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
\DeclareOldFontCommand{\sl}{\normalfont\slshape}{\@nomath\sl}
\DeclareOldFontCommand{\sc}{\normalfont\scshape}{\@nomath\sc}
\DeclareRobustCommand*\cal{\@fontswitch\relax\mathcal}
\DeclareRobustCommand*\mit{\@fontswitch\relax\mathnormal}

\DeclareOption{seceq}{%
\@addtoreset{equation}{section}
\renewcommand\theequation{\@arabic\c@section.\@arabic\c@equation}
}

\newif\if@paper\@papertrue
\newif\if@tr
\DeclareOption{techrep}{\@trtrue}
\newif\if@sn
\DeclareOption{shortnote}{\@sntrue}
\newif\if@l
\DeclareOption{letter}{\@ltrue}

%\newif\if@prepr\@preprtrue
\DeclareOption{prepr}{\input{prepr.clo}}

\setlength{\paperheight}{297mm}
\setlength{\paperwidth}{210mm}
\setlength{\columnsep}{18\p@}
\setlength{\textwidth}{500\p@}
\setlength{\textheight}{710\p@}
% \setlength{\textheight}{717\p@}
\setlength{\oddsidemargin}{-.75cm}
\setlength{\evensidemargin}{-.75cm}
\setlength{\arrayrulewidth}{.25\p@}

\setcounter{topnumber}{5}
\renewcommand\topfraction{.95}
\setcounter{bottomnumber}{5}
\renewcommand\bottomfraction{.95}
\setcounter{totalnumber}{10}
\renewcommand\textfraction{.05}
\renewcommand\floatpagefraction{.8}
\setcounter{dbltopnumber}{3}
\renewcommand\dbltopfraction{.9}
\renewcommand\dblfloatpagefraction{.1}

\renewcommand\normalsize{%
   \@setfontsize\normalsize\@xpt{\if@l \@xiipt \else \if@sn \@xiipt \else 14\p@ \fi \fi}
   \abovedisplayskip 10\p@ \@plus2\p@ \@minus5\p@
   \abovedisplayshortskip \z@ \@plus3\p@
   \belowdisplayshortskip 6\p@ \@plus3\p@ \@minus3\p@
   \belowdisplayskip \abovedisplayskip
   \let\@listi\@listI}
\normalsize
\newcommand\small{%
   \@setfontsize\small\@ixpt{11}%
   \abovedisplayskip 8.5\p@ \@plus3\p@ \@minus4\p@
   \abovedisplayshortskip \z@ \@plus2\p@
   \belowdisplayshortskip 4\p@ \@plus2\p@ \@minus2\p@
   \def\@listi{\leftmargin\leftmargini
               \topsep 4\p@ \@plus2\p@ \@minus2\p@
               \parsep 2\p@ \@plus\p@ \@minus\p@
               \itemsep \parsep}%
   \belowdisplayskip \abovedisplayskip
}
\newcommand\footnotesize{%
   \@setfontsize\footnotesize\@viiipt{9.5}%
   \abovedisplayskip 6\p@ \@plus2\p@ \@minus4\p@
   \abovedisplayshortskip \z@ \@plus\p@
   \belowdisplayshortskip 3\p@ \@plus\p@ \@minus2\p@
   \def\@listi{\leftmargin\leftmargini
               \topsep 3\p@ \@plus\p@ \@minus\p@
               \parsep 2\p@ \@plus\p@ \@minus\p@
               \itemsep \parsep}%
   \belowdisplayskip \abovedisplayskip
}
\newcommand\scriptsize{\@setfontsize\scriptsize\@viipt\@viiipt}
\newcommand\tiny{\@setfontsize\tiny\@vpt\@vipt}
\newcommand\large{\@setfontsize\large\@xiipt{14}}
\newcommand\Large{\@setfontsize\Large\@xivpt{18}}
\newcommand\LARGE{\@setfontsize\LARGE\@xviipt{22}}
\newcommand\huge{\@setfontsize\huge\@xxpt{25}}
\newcommand\Huge{\@setfontsize\Huge\@xxvpt{30}}

%%%%% Section %%%%%
\newcounter {section}
\newcounter {subsection}[section]
\newcounter {subsubsection}[subsection]
\newcounter {paragraph}[subsubsection]
\newcounter {subparagraph}[paragraph]

\renewcommand\thesection {\@arabic\c@section}
\renewcommand\thesubsection {\thesection.\@arabic\c@subsection{.}}
\renewcommand\thesubsubsection {\thesubsection\@arabic\c@subsubsection{.}}
\renewcommand\theparagraph {\thesubsubsection.\@arabic\c@paragraph}
\renewcommand\thesubparagraph {\theparagraph.\@arabic\c@subparagraph}
%

\newcommand\@secapp{}

\newcommand\section{\@startsection{section}{1}{\z@}%
                   {\if@sn 12\p@ \@plus \p@ \@minus \p@ \else
				   \if@l 12\p@ \@plus \p@ \@minus \p@ \else
				   8\p@ \@plus \p@ \@minus \p@ \fi \fi}%
				   {\if@sn \p@ \else \if@l \p@ \else 6\p@ \@plus \p@ \@minus \p@ \fi \fi}%
                   {\normalfont%
                      \if@l\bfseries\boldmath
                        \else
                      \if@sn\bfseries\boldmath
                        \else
                      \centering\large\bfseries\boldmath
                      \fi \fi}}
\newcommand\subsection{\@startsection{subsection}{2}{\z@}%
                   {1\baselineskip}{\p@}%
                   {\normalfont\bfseries\boldmath}}
\newcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                   {1\baselineskip}{\p@}%
                   {\normalfont\normalfont}} 
\newcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
                   {\z@}{-1em}%
                   {\normalfont\bfseries}}
\newcommand\subparagraph{\@startsection{subparagraph}{4}{\parindent}%
                   {\z@}{-1em}%
                   {\normalfont\itshape}}

\def\@nullstring{}
\def\@appendixstring{APPENDIX}

\def\@sect#1#2#3#4#5#6[#7]#8{\ifnum #2>\c@secnumdepth
     \def\@svsec{}\else
       \ifnum #2=1
         \refstepcounter{#1}
         \def\@appendixtitle{#8}
         \ifx\@secapp\@appendixstring
         \ifx\@appendixtitle\@nullstring
             \edef\@svsec{\@secapp \csname the#1\endcsname\hskip1em}
         \else
             \edef\@svsec{\@secapp \csname the#1\endcsname:\hskip1em}
         \fi
         \else
           \ifx\thesection\@nullstring
             \edef\@svsec{\@secapp \csname the#1\endcsname\hskip1em}
           \else
             \edef\@svsec{\@secapp \csname the#1\endcsname.\hskip1em}
           \fi
         \fi
       \else
         \refstepcounter{#1}\edef\@svsec{\csname the#1\endcsname\hskip1em}
       \fi
     \fi
     \@tempskipa #5\relax
      \ifdim \@tempskipa>\z@
        \begingroup #6\relax
        \@hangfrom{\hskip #3\relax\@svsec}{\interlinepenalty \@M #8\par}%
        \endgroup
       \csname #1mark\endcsname{#7}
      \else
        \def\@svsechd{#6\hskip #3\@svsec #8\csname #1mark\endcsname{#7}}
      \fi
     \@xsect{#5}}

\setcounter{secnumdepth}{3}

\renewcommand\theenumi{\@arabic\c@enumi}
\renewcommand\theenumii{\@alph\c@enumii}
\renewcommand\theenumiii{\@roman\c@enumiii}
\renewcommand\theenumiv{\@Alph\c@enumiv}
\newcommand\labelenumi{(\theenumi)}
\newcommand\labelenumii{\theenumii.}
\newcommand\labelenumiii{\theenumiii.}
\newcommand\labelenumiv{\theenumiv.}
\renewcommand\p@enumii{\theenumi}
\renewcommand\p@enumiii{\theenumi(\theenumii)}
\renewcommand\p@enumiv{\p@enumiii\theenumiii}
\newcommand\labelitemi{\textbullet}
\newcommand\labelitemii{\normalfont\bfseries \textendash}
\newcommand\labelitemiii{\textasteriskcentered}
\newcommand\labelitemiv{\textperiodcentered}

\setlength\leftmargini {2.5em}
\setlength\leftmarginii {1em} 
\setlength\leftmarginiii {1em} 
\setlength\leftmarginiv {1em} 
\setlength\leftmarginv {1em}
\setlength\leftmarginvi {1em}
\setlength\leftmargin{\leftmargini}
\setlength\labelwidth{\leftmargini\advance\labelwidth-\labelsep}
\setlength\labelsep {.5em} 
\setlength\parsep {\z@}


\if@twocolumn
  \setlength\parindent{1em}
\else
  \setlength\parindent{15\p@}
\fi
\setlength\smallskipamount{3\p@ \@plus 1\p@ \@minus 1\p@}
\setlength\medskipamount{6\p@ \@plus 2\p@ \@minus 2\p@}
\setlength\bigskipamount{12\p@ \@plus 4\p@ \@minus 4\p@}
\setlength\topmargin{-1cm}
\setlength\headheight{10\p@}
\setlength\headsep   {12\p@}
\setlength\topskip   {10\p@}
\setlength\footskip{30\p@}
\addtolength\textheight{\topskip}

\newcommand\abstsize{\@setfontsize\abstsize\@xpt{12}}
\newcommand\instsize{\@setfontsize\instsize\@xipt{13}}
\newcommand\sectionsize{\@setfontsize\sectionsize{11.5\p@}{14}}
\setlength\footnotesep{6.65\p@}
\setlength{\skip\footins}{9\p@ \@plus 4\p@ \@minus 2\p@}
\setlength\floatsep    {12\p@ \@plus 2\p@ \@minus 2\p@}
\setlength\textfloatsep{20\p@ \@plus 2\p@ \@minus 4\p@}
\setlength\intextsep   {12\p@ \@plus 2\p@ \@minus 2\p@}
\setlength\dblfloatsep    {12\p@ \@plus 2\p@ \@minus 2\p@}
\setlength\dbltextfloatsep{20\p@ \@plus 2\p@ \@minus 4\p@}
\setlength\@fptop{0\p@ \@plus 1fil}
\setlength\@fpsep{8\p@ \@plus 2fil}
\setlength\@fpbot{0\p@ \@plus 1fil}
\setlength\@dblfptop{0\p@ \@plus 1fil}
\setlength\@dblfpsep{8\p@ \@plus 2fil}
\setlength\@dblfpbot{0\p@ \@plus 1fil}
\setlength\partopsep{\z@ \@plus 2\p@ \@minus \p@}

\def\@listi{\leftmargin\leftmargini
            \parsep \z@ \@plus2\p@ \@minus\p@
            \topsep \z@ \@plus2\p@ \@minus\p@
            \itemsep \z@ \@plus2\p@ \@minus\p@}
\let\@listI\@listi
\@listi
\def\@listii {\leftmargin\leftmarginii
              \labelwidth\leftmarginii
              \advance\labelwidth-\labelsep
              \topsep    \z@ \@plus2\p@ \@minus\p@
              \parsep    \z@ \@plus2\p@ \@minus\p@
              \itemsep   \parsep}
\def\@listiii{\leftmargin\leftmarginiii
              \labelwidth\leftmarginiii
              \advance\labelwidth-\labelsep
              \topsep    \z@ \@plus2\p@ \@minus\p@
              \parsep    \z@
              \partopsep \z@ \@plus2\p@ \@minus\p@
              \itemsep   \topsep}
\def\@listiv {\leftmargin\leftmarginiv
              \labelwidth\leftmarginiv
              \advance\labelwidth-\labelsep}
\def\@listv  {\leftmargin\leftmarginv
              \labelwidth\leftmarginv
              \advance\labelwidth-\labelsep}
\def\@listvi {\leftmargin\leftmarginvi
              \labelwidth\leftmarginvi
              \advance\labelwidth-\labelsep}
 
\newenvironment{verse}
               {\let\\\@centercr
                \list{}{\itemsep      \z@
                        \itemindent   -15\p@%
                        \listparindent\itemindent
                        \rightmargin  \leftmargin
                        \advance\leftmargin 15\p@}%
                \item\relax}
               {\endlist}

\newenvironment{quotation}
               {\list{}{\listparindent 15\p@%
                        \itemindent    \listparindent
                        \rightmargin   \leftmargin
                        \parsep        \z@ \@plus\p@}%
                \item\relax}
               {\endlist}

\newenvironment{quote}
               {\list{}{\rightmargin\leftmargin}%
                \item\relax}
               {\endlist}

\newenvironment{description}
               {\list{}{\labelwidth\z@ \itemindent-\leftmargin
                        \let\makelabel\descriptionlabel}}
               {\endlist}
\newcommand*\descriptionlabel[1]{\hspace\labelsep
                                \normalfont\bfseries #1}


\def\thebibliography#1{%
\section*{\refname}
\small
\list{[\arabic{enumi}]}{\settowidth\labelwidth{[#1]}
 \leftmargin\labelwidth
 \advance\leftmargin\labelsep
 \usecounter{enumi}}
 \sloppy
 \sfcode`\.=500\relax}
\let\endthebibliography=\endlist

\def\footnoterule{\noindent\vskip1\baselineskip \kern-3\p@
 \hrule width \columnwidth
 \kern 2.6\p@}
 
\def\symbolfootnotes{\setcounter{footnote}{0}%
    \gdef\thefootnote{\fnsymbol{footnote}}}

\gdef\@thanks{}\symbolfootnotes

\long\def\@makefntext#1{\vskip3\p@ \hsize=\textwidth \par
\noindent
\footnotesize \hskip6\p@ $^{\@thefnmark}$\hskip1\p@#1\vskip-3\p@}

\newcommand\abstname{Abstract}
\newcommand\kwordname{Keywords}
\newcommand\abbrevname{Abbreviations}
% \newcommand\pacsname{PACS number}
\newcommand\refname{\if@l References \else \if@sn References \else REFERENCES \fi \fi}
\newcommand\figurename{Fig.}
\newcommand\tablename{Table}
\newcommand\schemename{Scheme}
\newcommand\photoname{Photo}
\newcommand\appendixname{APPENDIX}

\newenvironment{figure}
               {\@float{figure}}
               {\end@float}

\newenvironment{figure*}
               {\@dblfloat{figure}}
               {\end@dblfloat}

\newenvironment{table}
               {\@float{table}}
               {\end@float}

\newenvironment{table*}
               {\@dblfloat{table}}
               {\end@dblfloat}

\newenvironment{scheme}
               {\@float{scheme}}
               {\end@float}

\newenvironment{scheme*}
               {\@dblfloat{scheme}}
               {\end@dblfloat}

\newenvironment{photo}
               {\@float{photo}}
               {\end@float}

\newenvironment{photo*}
               {\@dblfloat{photo}}
               {\end@dblfloat}

\newlength\abovecaptionskip
\newlength\belowcaptionskip
\setlength\abovecaptionskip{1em}
\setlength\belowcaptionskip{1em}

\long\def\@makecaption#1#2{%
  \small
  \vskip\abovecaptionskip
  \sbox\@tempboxa{\textbf{#1}\hskip1em#2}%
  \ifdim \wd\@tempboxa > \hsize
  \par\hangindent2em
    \textbf{#1}\hskip1em#2\par
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip}

\long\def\@caption#1[#2]#3{\par
     \begingroup
     \@parboxrestore
     \@makecaption{\csname fnum@#1\endcsname}{\ignorespaces #3}
     \par
     \endgroup
}

%\def\tabular{\let\@halignto\@empty\@tabular}

\newcounter{figure}
\def\thecaption{\@arabic\c@figure}
\def\fps@figure{tbhp}
\def\ftype@figure{1}
\def\fnum@figure{\figurename\hskip.5em\thefigure}
\newcounter{table}
\def\thetable{\@arabic\c@table}
\def\fps@table{tbhp}
\def\ftype@table{2} 
\def\fnum@table{\tablename\hskip.5em\thetable}
\newcounter{scheme}
\def\thecaption{\@arabic\c@scheme}
\def\fps@scheme{tbhp}
\def\ftype@scheme{3}
\def\fnum@scheme{\schemename\hskip.5em\thescheme}
\newcounter{photo}
\def\thecaption{\@arabic\c@photo}
\def\fps@photo{tbhp}
\def\ftype@photo{4}
\def\fnum@photo{\photoname\hskip.5em\thephoto}

%%%%% maketitle %%%%%%
\def\maketitle{%\par
\def\@makefnmark{\hskip-1\p@{$^{\@thefnmark}$}}
\if@sn
 \global\@topnum\z@ \@maketitle
   \else
\if@paper
  \twocolumn[\@maketitle]
   \else
\if@l
  \twocolumn[\@maketitle]
   \else
     \fi
   \fi
 \fi
\thispagestyle{acoust}\@thanks
 \setcounter{footnote}{0}
 \let\maketitle\relax
 \let\@maketitle\relax
 }
\def\@maketitle{%
%%%% For letter %%%%
\if@l
\lettermark \\[12\p@]
\noindent{\large\bfseries\boldmath\@title \par}
\@ifundefined{@subtitle}{\def\@subtitle{}}{}
\par
\noindent{\bfseries\boldmath\@subtitle \par}
\vskip.5\baselineskip
\noindent{\@author \par}
\vskip.5\baselineskip
\noindent{\small\textit\@inst \par}
\@ifundefined{@recdate}{\def\@recdate{}}{}
\@ifundefined{@accdate}{\def\@accdate{}}{}
\@ifundefined{@jstdate}{\def\@jstdate{}}{}
\vskip.5\baselineskip
\ifx\@accdate\empty{\relax}
 \else \noindent\textit{(Received \@recdate, Accepted for publication \@accdate, \\
 J-STAGE Advance published date: \@jstdate)} \fi
\gdef\@recdate{}
\gdef\@accdate{}
\gdef\@jstdate{}
\vskip.5\baselineskip
%%%%% by T.Nishino
 \@ifundefined{@abst}{}{%\hspace*{50\p@}\parbox{500\p@}
  {\small{\bfseries \abstname:}\quad\@abst \par}
  }
  \vskip1\baselineskip
%%%%%
%\begin{flushright}
\small\textbf{\kwordname:}\hspace{.5em}\@kword
%\end{flushright}
\par
\vskip.5\baselineskip
% \begin{flushright}\small\textbf{\pacsname:}\hspace{.5em}\@pacs\end{flushright}
\par
\else
%%%% For shortnote %%%%
\if@sn
\twocolumn[\snmark \\ ]
\noindent{\large\bfseries\boldmath\@title\par}
\@ifundefined{@subtitle}{\def\@subtitle{}}{}
\par
\noindent{\bfseries\boldmath\@subtitle \par}
\vskip.5\baselineskip
\noindent{\large\@author \par}
\vskip.5\baselineskip
\noindent{\textit\@inst \par}
\@ifundefined{@recdate}{\def\@recdate{}}{}
\@ifundefined{@accdate}{\def\@accdate{}}{}
\@ifundefined{@jstdate}{\def\@jstdate{}}{}
\vskip.5\baselineskip
\ifx\@accdate\empty{\relax}
 \else \noindent\textit{(Received \@recdate, Accepted for publication \@accdate, \\
 J-STAGE Advance published date: \@jstdate)} \fi
\gdef\@recdate{}
\gdef\@accdate{}
\gdef\@jstdate{}
\vskip.5\baselineskip
\begin{flushright}\textbf{\kwordname:}\hspace{.5em}\@kword\end{flushright}
\par
\vspace{6\p@}
% \begin{flushright}\textbf{\pacsname:}\hspace{.5em}\@pacs\end{flushright}
\par
\else
%%%%%%%%%%%%%%%%%%%%%
\noindent
\if@tr
{\large\bfseries TECHNICAL REPORT}
\else
{\large\bfseries PAPER}
\fi
\\[24\p@]
\hspace*{30\p@}\parbox{420\p@}{\Large\bfseries\boldmath\@title \par}
\@ifundefined{@subtitle}{\def\@subtitle{}}{}
\par
\hspace*{30\p@}\parbox{420\p@}{\bfseries\boldmath\@subtitle \par}
\vskip1.5\baselineskip
\hspace*{50\p@}\parbox{400\p@}{\large\@author \par}
\vskip1\baselineskip
\hspace*{50\p@}\parbox{400\p@}{\small\itshape\@inst \par}
\@ifundefined{@recdate}{\def\@recdate{}}{}
\@ifundefined{@accdate}{\def\@accdate{}}{}
\@ifundefined{@jstdate}{\def\@jstdate{}}{}
\vskip.5\baselineskip
\ifx\@accdate\empty{\relax}
 \else \hspace*{50\p@}\parbox{400\p@}{%
 \instsize\itshape{(Received \@recdate, Accepted for publication \@accdate, \\
 J-STAGE Advance published date: \@jstdate)}}
\fi
\gdef\@recdate{}
\gdef\@accdate{}
\gdef\@jstdate{}
\vskip.75\baselineskip
 \@ifundefined{@abst}{}{%
  \hspace*{50\p@}\parbox{400\p@}{\small{\bfseries \abstname:}\quad\@abst \par}
  }
  \vskip1\baselineskip
 \@ifundefined{@kword}{}{%
 \hspace*{50\p@}\parbox{400\p@}{\abstsize\textbf{\kwordname:}\hspace{.5em}\@kword \par}
  }

 \vskip.5\baselineskip
 \@ifundefined{@pacs}{}{%
 \hspace*{50\p@}\parbox{400\p@}{\abstsize\textbf{\pacsname:}\hspace{.5em}\@pacs \par}
  }
\fi \fi
 \vskip.5\baselineskip
 \@ifundefined{@abbrev}{}{%
 {\noindent\small\textbf{\abbrevname:} \par \vskip.5\baselineskip \noindent \@abbrev \par}
  }
%%% will never appear on the title page
 \@ifundefined{@mailing address}{}{}
 \par 
 \@ifundefined{@class}{}{}
 \par
 \@ifundefined{@recommend}{\recommend{2}}{}
 \par
% \@ifundefined{@numpg}{}{}
% \par
 \vskip1\baselineskip
}

\long\def\subtitle#1{\long\gdef\@subtitle{#1}}
\long\def\abst#1{\long\gdef\@abst{#1}}
\long\def\inst#1{\long\gdef\@inst{#1}}
\long\def\kword#1{\long\gdef\@kword{#1}}
% \long\def\pacs#1{\long\gdef\@pacs{#1}}
\long\def\abbrev#1{\long\gdef\@abbrev{#1}}
\long\def\mladdress#1{\long\gdef\@mladdress{#1}}

\def\jstdate#1#2#3{\gdef\@jstdate{#3\space\month{#2}\space#1}}
\def\accdate#1#2#3{\gdef\@accdate{#3\space\month{#2}\space#1}}
\def\recdate#1#2#3{\gdef\@recdate{#3\space\month{#2}\space#1}}
\def\class#1{\gdef\@class{\classification{#1}}}
\def\recommend#1{\gdef\@recommend{\recommendation{#1}}}

\renewcommand{\month}[1]{\ifcase#1\relax ???\or
 January\or February\or March\or April\or May\or June\or
 July\or August\or September\or October\or November\or December
 \else ???\fi}

\newcommand{\classification}[1]{\ifcase#1\relax ???\or
Ultrasonic\or
Underwater Acoustics\or
Speech\or
Hearing\or
Speech and Hearing\or
Musical Acoustics\or
Electro-acoustics\or
Architectural Acoustics\or
Noise and Vibration\or
Acoustic Imaging\or
Education in Acoustics\or
Acoustical Assists(Acoustic Barrier-Free)\or
Thermoacoustic Technology\or
Sound Design
\else ??? \fi}
% Psychological and Physiological Acoustics\or

\newcommand{\recommendation}[1]{%
  \ifcase#1\relax ???\or
YES\or
NO
  \else ??? 
  \fi}

\newcommand{\name}{\relax}
\newcommand{\address}{\relax}

%%%%%%Definition of headings%%%%%%
\newcommand{\lettermark}{%
  \noindent\framebox[\textwidth][r]{\textsf{\bfseries ACOUSTICAL LETTER}}}\relax

\newcommand{\snmark}{%
  \noindent\vbox{%
  \kern-.5\baselineskip\hbox to \textwidth{%
    \hrulefill{\phantom{\bfseries\hspace{.5em}SHORT NOTE\hspace{.5em}}}\hrulefill
	}
  \kern-.5\baselineskip\hbox to \textwidth{%
    \hrulefill{\bfseries\hspace{.5em}SHORT NOTE\hspace{.5em}}\hrulefill
	}
  }
}

%%%%%% headings %%%%%%

\mark{{}{}}

\def\ps@acoust{%
  \let\@mkboth\@gobbletwo%
  \def\@evenfoot{{\textit{\thepage}}\hfill}
  \def\@oddfoot{\hfill{\textit{\thepage}}}
  \def\@evenhead{{\textit{Acoust. Sci. \& Tech.}}\hfill}
  \let\@oddhead\@evenhead
}

\def\ps@headings{%
  \let\@mkboth\@gobbletwo%
  \def\@evenfoot{{\textit{\thepage}}\hfill}
  \def\@oddfoot{\hfill{\textit{\thepage}}}
  \def\@evenhead{\hfill{\textit{Acoust. Sci. \& Tech.}}}
  \def\@oddhead{{\header}\hfill}
}

\pagestyle{headings}

%%%%% profile %%%%%
\newcommand\profile[2]{\vskip.5\baselineskip
     \small%
     \hangindent22mm\relax\hangafter-9\relax\noindent\relax
 \textbf{#1}\quad{#2}
}
 
%%%%%% Appendix %%%%%%
\newcount\@appendixflag
\@appendixflag=0
\newcount\@appendixindex
\@appendixindex=0

\def\getappendix#1{\global\@namedef{appnedix@#1}{1}}
\def\appendix{\par
\renewcommand{\section}[1]{\sectiona{##1}}
}

\def\sectiona{%
 \c@table=0
 \c@figure=0
 \setcounter{equation}{0}
 \ifnum \@appendixflag=0
   \setcounter{section}{0} \@appendixflag=1
   \def\@secapp{Appendix}
   \def\thetable{\Alph{section}$\cdot$\@arabic\c@table}%
   \def\thefigure{\Alph{section}$\cdot$\@arabic\c@figure}
   \def\theequation{\Alph{section}\raise.5ex\hbox{.}\arabic{equation}}
 \fi

 \@ifundefined {appnedix@1}{\def\thesection{}}
   {\def\thesection{\ \Alph{section}}}

 \def\thesubsection {\Alph{section}.\arabic{subsection}}
 \if@filesw \immediate\write\@auxout
       {\string\getappendix{\the\@appendixindex}}
 \advance \@appendixindex by 1 \fi
\@startsection{section}{1}{\z@}%
{1\baselineskip}{.5\baselineskip}{\bfseries\boldmath}}

\newcommand{\covering}{%
\if@twocolumn
\onecolumn
\else
\clearpage
\fi
\addtocounter{page}{-1}
\begingroup
\large
\centering{\textbf{Cover Letter for Acoustical Science and Technology}}
\par
\bigskip
\begin{enumerate}\itemsep6\p@
\item \textbf{\small Title of paper} \\
\@title \par 
\@ifundefined{@subtitle}{\def\@subtitle{}}{}
\@subtitle

\item \textbf{\small Full name(s) of author(s)} \\
\@author\let\thanks\relax

\item \textbf{\small Affiliation(s)} \\
\@inst

\item \textbf{\small Approximately five keywords} \\
\@kword

\item \textbf{\small Short running title} \\
\header

\item \textbf{\small Category of article:} \\
\if@tr{TECHNICAL REPORT} \else
\if@l{ACOUSTICAL LETTER} \else
\if@sn{SHORT NOTE} \else
PAPER
\fi \fi \fi

\item \textbf{\small Mailing address} \\
\@mladdress

\item \textbf{\small Classification} \\
\@class

\item \textbf{\small Number of pages} \\
TEXT:\quad\thepage%
\hspace{2em}%
FIGURES:\quad\thefigure%
\hspace{2em}%
TABLES:\quad\thetable

\if@l
\item \textbf{\small Recommendation of the editorial board of AST for submitting to Acoustical Letter} \\
\@recommend
\else
\relax
\fi

\end{enumerate}
\thispagestyle{empty}
\endgroup
}

\ProcessOptions\relax

\pagenumbering{arabic}\onecolumn
\pagestyle{headings}

\endinput


