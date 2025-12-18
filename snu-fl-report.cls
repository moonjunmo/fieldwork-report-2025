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
\LoadClass[b5paper,10pt,left,openany]{memoir}

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
\setheadfoot{0.5cm}{0.5cm}
\checkandfixthelayout


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%% Chapter style configuration %%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\makechapterstyle{customchap}{
  % Section/subsection font
  \setsecheadstyle{\fontsize{12pt}{14pt}\selectfont\sffamily\bfseries\raggedright}
  \setsubsecheadstyle{\fontsize{10pt}{11pt}\selectfont\sffamily\bfseries\raggedright}

  \renewcommand{\printchaptername}{}
  \renewcommand{\afterchapternum}{.\space}
  \renewcommand{\chapnumfont}{\centering\fontsize{16pt}{19pt}\selectfont\sffamily\bfseries}
  \renewcommand{\chaptitlefont}{\centering\fontsize{16pt}{19pt}\selectfont\sffamily\bfseries}

  \setlength{\beforechapskip}{0pt}
  \setlength{\afterchapskip}{40pt}
}
\chapterstyle{customchap}

% Section style
\renewcommand{\thesection}{\arabic{chapter}.\arabic{section}.}
\setsecnumformat{\csname the#1\endcsname\space}

\setsecnumdepth{section}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%% Pagination / ToC configuration %%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand*{\contentsname}{목차}
\renewcommand*\cftappendixname{부록~}
\settocdepth{chapter}

\copypagestyle{customruled}{plain}
\makeevenfoot{customruled}{\footnotesize{\thepage{}~|~서울대학교~언어학과}}{}{}
\makeoddfoot{customruled}{}{}{\footnotesize{한국~언어조사~질문지~|~\thepage}}
\pagestyle{customruled}

\aliaspagestyle{chapter}{customruled}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%% Watermark configuration %%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage[
  firstpageonly,
  angle=0,
  scale=0.75,
  text={\includegraphics{img/snu-ui-trans.png}}
]{draftwatermark}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%% Document metadata fields %%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Additional Fields
\NewDocumentCommand \printdate { m }
  { \newcommand*\@printdate{#1} }

\NewDocumentCommand \issuedate { m }
  { \newcommand*\@issuedate{#1} }

\NewDocumentCommand \tel { m }
  { \newcommand*\@tel{#1} }

% Front title
\renewcommand{\maketitle}{
  \thispagestyle{empty}
  \begin{center}
    \vspace*{1cm}
    \rule{333pt}{3pt}
    \par\vspace{-0.8\baselineskip}
    \fontsize{28pt}{30pt}\selectfont\sffamily\bfseries
    \@title
    \par\vspace{-0.6\baselineskip}
    \rule{333pt}{3pt}
    \vfill
    \fontsize{20pt}{22pt}\selectfont\sffamily\bfseries
    \@author \\
    \fontsize{18pt}{20pt}\selectfont\sffamily\mdseries
    \@date \\
    \vspace*{2cm} 
  \end{center}
  \newpage
}

% Back cover
\newcommand{\makebackcover}{
  \thispagestyle{empty}
  \selectfont\sffamily
  \null\vfill
  \begin{center}
    \setlength{\fboxrule}{0.4pt} 
    \setlength{\fboxsep}{20pt} 
    \fbox{
      \begin{tabular}{c}
        \strut \fontsize{15pt}{17pt}\selectfont\bfseries\@title \strut \\[2.5ex]
        \strut \fontsize{10pt}{11pt}\selectfont\mdseries\@printdate{}~인쇄 \strut \\
        \strut \fontsize{10pt}{11pt}\selectfont\mdseries\@printdate{}~발행 \strut \\[2.5ex]
        \strut 엮은이:~\@author \strut \\
        \strut 전화:~\@tel \strut
      \end{tabular}
    }
    \vfill
  \end{center}
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