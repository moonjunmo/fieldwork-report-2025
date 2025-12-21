%%
%% This is file `snu-fl-report.cls'.
%%
%% -----------------------------------------------------------------
%% The snu-fl-report class --- A class for SNU Field Lingusitics reports
%% Maintained by Junmo Moon
%% E-mail: moonjunmo@gatech.edu
%% Released under the MIT License.
%% -----------------------------------------------------------------
%%
\NeedsTeXFormat{LaTeX2e}[2022-06-01]
\RequirePackage{expl3}
\ProvidesExplClass
  {snu-fl-report}
  {2025/11/18}
  {0.1}
  {A class for SNU Field Lingusitics reports}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Load class %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{memoir}}
\ProcessOptions*
\LoadClass[a4paper,10pt,left,openany]{memoir}

\DoubleSpacing
\setlength{\parindent}{10pt}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Base packages %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{kotex}

\RequirePackage{xcolor}
\RequirePackage{graphicx}

\RequirePackage{tabularray}
\UseTblrLibrary{booktabs}

\RequirePackage{indentfirst}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Font setup %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{microtype}

% Works for pdfLaTeX, XeLaTeX, and LuaLaTeX
\RequirePackage{libertine}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%% Page layout configuration %%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\setlrmarginsandblock{2cm}{2cm}{*}
\setulmarginsandblock{2cm}{2cm}{*}
\setheadfoot{0.5cm}{1cm}
\checkandfixthelayout


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%% Chapter style configuration %%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\setsecnumdepth{subsection}
\headstyles{komalike}

\makechapterstyle{customchap}{
  \renewcommand{\printchaptername}{}
  \renewcommand{\printchapternum}{
    \chapnumfont
    \rule[0.2\midchapskip]{1em}{0.4pt}
    \hspace{5pt} \thechapter \hspace{5pt}
    \rule[0.2\midchapskip]{1em}{0.4pt}
  }
  \renewcommand{\afterchapternum}{\vskip}
  \renewcommand{\chapnumfont}{\centering\fontsize{14pt}{16pt}\selectfont\sffamily\bfseries}
  \renewcommand{\chaptitlefont}{\centering\fontsize{20pt}{22pt}\selectfont\sffamily\bfseries}

  \setlength{\beforechapskip}{0pt}
}
\chapterstyle{customchap}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%% Pagination / ToC configuration %%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand*{\contentsname}{목차}
\renewcommand*\cftappendixname{부록~}
\settocdepth{section}

\pagestyle{ruled}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%% Watermark configuration %%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage[
  firstpageonly,
  angle=0,
  scale=1.25,
  hpos=0.8\paperwidth,
  vpos=0.8\paperheight,
  text={\includegraphics{images/snu-ui-trans.png}}
]{draftwatermark}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%% Document metadata fields %%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Additional Fields
\NewDocumentCommand \course { m }
  { \newcommand*\@course{#1} }

\NewDocumentCommand \tel { m }
  { \newcommand*\@tel{#1} }

% Title page
\renewcommand{\maketitle}{
  \begin{flushleft}
    \setlength{\leftskip}{1cm}
    \vspace*{1.75cm}
    \fontsize{30pt}{32pt}\selectfont\sffamily\bfseries
    \@title \\
    \vspace{1cm}
    \fontsize{17pt}{19pt}\selectfont\sffamily\bfseries
    \@author \\
    \fontsize{17pt}{19pt}\selectfont\sffamily\mdseries
    \@course
  \end{flushleft}
}

% Colophon page
\newcommand{\makecolophon}{
  \thispagestyle{empty}
  \vspace*{20cm}
  \begin{flushleft}
    \fontsize{15pt}{17pt}\selectfont\sffamily\bfseries
    \@title \\
    \vspace{0.5cm}
    \fontsize{10pt}{11pt}\selectfont\sffamily\mdseries
    펴낸날~|~\@date \\
    엮은이~|~\@author \\
    전 \hspace{8pt} 화~|~\@tel
  \end{flushleft}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Transcription %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NewDocumentCommand \Tr { mmmm } {
  \noindent{%
    \linespread{1.1}\selectfont
    \begin{minipage}[t]{40pt}
    \textbf{#1}\\(#2)
    \end{minipage}%
    \hfill
    \begin{minipage}[t]{\dimexpr\linewidth-40pt\relax}
    #3\tl_if_blank:nF {#4}
      { \par\vspace{0.4em}#4 }
    \end{minipage}
  }%
  \par\vspace{0.8em}
}