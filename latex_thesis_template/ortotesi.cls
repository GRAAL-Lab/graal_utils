
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                             %
%       ORTO TESI CLASS       %
%      -----------------      %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}[1999/06/01]
\ProvidesClass{ortotesi}
\LoadClass[a4paper,11pt,oneside,oldfontcommands]{memoir}

\setsecnumdepth{subsection}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%          MARGINI           %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\setmargins}[8]{
    \setlength\hoffset{-1in}
    \setlength\voffset{-1in}
    \setlength\marginparwidth{#7}
    \setlength\marginparsep{#8}
    \setlength\marginparpush{.65em}
    \setlength\evensidemargin{#3}
    \addtolength\evensidemargin{\marginparsep}
    \addtolength\evensidemargin{\marginparwidth}
    \setlength\textwidth{\paperwidth}
    \addtolength\textwidth{-\evensidemargin}
    \addtolength\textwidth{-#1}
    \addtolength\textwidth{-#5}
    \if@twocolumn
      \addtolength\textwidth{-\marginparwidth}
      \addtolength\textwidth{-\marginparsep}
    \fi
    \setlength\oddsidemargin{\paperwidth}
    \addtolength\oddsidemargin{-\textwidth}
    \addtolength\oddsidemargin{-\evensidemargin}
    \setlength\topmargin{#2}
    \settoheight\headheight{M$^1$}
    \setlength\topskip{\baselineskip}
    \setlength\maxdepth{.5\topskip}
    \setlength\headsep{#6}
    \setlength\footskip{\topskip}
    \addtolength\footskip{#6}
    \setlength\textheight{\paperheight}
    \addtolength\textheight{-\topmargin}
    \addtolength\textheight{-\headheight}
    \addtolength\textheight{-\headsep}
    \addtolength\textheight{-\footskip}
    \addtolength\textheight{-#4}
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%         INTERLINEA         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% line spacing settings
\newcommand{\linespacing}{1.5}
\linespread{1.5}\selectfont%
\newcommand{\setlinespacing}[1]{%
  \renewcommand{\linespacing}{#1}
  \linespread{\linespacing}\selectfont}%
%% begin single line spacing command
\newcommand{\BeginSingle}{\linespread{1.0}\selectfont}
%% restore normal line spacing command
\newcommand{\EndSingle}{\linespread{\linespacing}\selectfont}%

%\newcommand\frontmatter{%
%  \cleardoublepage
%  \pagenumbering{roman}}
%
%\newcommand\mainmatter{%
%  \cleardoublepage
%  \pagenumbering{arabic}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%    ABSTRACT CHE NON RESETTA I NUMERI ROMANI      %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\makeatletter
\renewenvironment{abstract}{%
  \if@twocolumn
    \section*{\abstractname}%
  \else
    \small
    \begin{center}%
      {\bfseries \Large\abstractname\vspace{1em}\vspace{\z@}}%
    \end{center}%
    \quotation
  \fi}
  {\if@twocolumn\else\endquotation\fi}
\makeatother



\makeatletter
\newcommand\ackname{Acknowledgements}
\newenvironment{acknowledgements}{%
      \if@twocolumn
        \section*{\abstractname}%
      \else
        \small
        \begin{center}%
          {\bfseries \Large \ackname\vspace{1em}\vspace{\z@}}%
        \end{center}%
        \quotation
      \fi}
{\if@twocolumn\else\endquotation\fi}
\makeatother