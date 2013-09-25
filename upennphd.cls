% UPenn PhD LaTeX Class File
%
% Author: Alexander Patterson IV
% 9/25/2013
%
% based heavily on the work of 2006 Christopher K. Monson
% Based upon the BYU thesis class file:
% BYU MS/PhD LaTeX Class File
%   http://latex-byu-thesis.googlecode.com/

% Version 0.2

\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{upennphd}[2013/09/25 UPenn PhD Dissertation Class]

% Boolean option creation
\newif\if@lof % Show list of figures?
\newif\if@lot % Show list of tables?
\newif\if@lol % Show list of listings?
\newif\if@needlistings % Need the listings package?  Using List of Listings?
\newif\if@layout % This will draw lines showing all the margins
\newif\if@needdrawing % Need the eso-pic environment?  Drawing something?
\newif\if@grid % Show a grid
\newif\if@committeemembera
\newif\if@committeememberb
\newif\if@committeememberc
\newif\if@committeememberd
\newif\if@usegit

% committee members are not assumed to exist
\@committeememberafalse
\@committeememberbfalse
\@committeemembercfalse
\@committeememberdfalse

\newcommand{\@@ptsize}{12pt}

% This is an empty no-op command in case pdfbookmark is not defined (hyperref
% not included)
\newcommand{\@@pdfbookmark}[3][1]{%
  \ifx\pdfbookmark\undefined
    \relax
  \else
    \pdfbookmark[#1]{#2}{#3}%
  \fi
}%

%
% Options:
\DeclareOption{lof}{\@loftrue}
\DeclareOption{lot}{\@lottrue}
\DeclareOption{lol}{\@needlistingstrue \@loltrue}
\DeclareOption{layout}{\@needdrawingtrue \@layouttrue}
\DeclareOption{grid}{\@needdrawingtrue \@gridtrue}
\DeclareOption{10pt}{\renewcommand{\@@ptsize}{10pt}}%
\DeclareOption{11pt}{\renewcommand{\@@ptsize}{11pt}}%
\DeclareOption{12pt}{\renewcommand{\@@ptsize}{12pt}}%

%
% Defaults:

% Default to NOT showing lists of figures and tables
\@loffalse
\@lotfalse
\@lolfalse

% Don't show the layout, usually
\@needdrawingfalse
\@layoutfalse
\@gridfalse
\ExecuteOptions{%
    chapternum,
    chapterleft,
    partmiddle,
    equalmargins,
    oneside,
    }%
\ProcessOptions

%
% We base our work on the report class
%
% You would think that we could just use a DeclareOption* and pass the options
% on to this class, but that doesn't work very well.  If you want to do that,
% you can't use ExecuteOptions to set defaults because then the overriding
% options never get passed.  It's nuts.  So, this is how we do it, with
% appropriate default specifications.
\LoadClass[\@@ptsize,letterpaper]{report}

%
% Rather than fiddle with spacing, we set it up using the setspace package
% Note that even though most of the document is double spaced, we start with
% single spacing because of the following reasons:
%  * setspace likes to *enlarge* the spacing, not shrink it
%  * the minimum style requirements dictate vertical spacing as a number of
%   ``blank lines'', and the size of those lines is single-spaced.
\RequirePackage[doublespacing]{setspace}

\RequirePackage{geometry}

\RequirePackage{calc}
\RequirePackage{tabularx}
\RequirePackage{booktabs}

%
% If we are showing a list of listings, then we need to include the listings package
\if@needlistings
    \RequirePackage{listings}%
\fi

%
% If we are showing layout grids, then we include the appropriate package and
% draw stuff on every page.
\if@needdrawing
    \RequirePackage[grid=false]{eso-pic}%
    \newcommand{\@vertline}{\line(0,1){11}}
    \newcommand{\@horzline}{\line(1,0){8.5}}
    \newcommand{\@maingrid}{%
        \multiput(1,0)(1,0){8}{\thicklines\@vertline}%
        \multiput(0,1)(0,1){10}{\thicklines\@horzline}%
    }%
    \newcommand{\@smallgrid}{%
        \multiput(0.5,0)(1,0){8}{\thinlines\@vertline}%
        \multiput(0,0.5)(0,1){11}{\thinlines\@horzline}%
    }%
    \newcommand{\@layoutpreamble}{\setlength{\unitlength}{1in}}
    \newcommand{\@rightsidebox}{
        \put (1.5,1){\dashbox{0.03125}(6,9)}%
    }%
    \newcommand{\@leftsidebox}{
        \put (1,1){\dashbox{0.03125}(6,9)}%
    }%
    \newcommand{\@prefaceinnerbox}{
        \put (1.5,1){\dashbox{0.03125}(6,8)}%
    }%
    \AddToShipoutPicture{%
        \@layoutpreamble
        \if@layout
            \@rightsidebox
            \@leftsidebox
            \@prefaceinnerbox
        \fi
        \if@grid
            \@smallgrid
            \@maingrid
        \fi
    }%
\fi


%
% These are internal variables used throughout the class.  They represent
% default values for their corresponding @-less versions.
\newcommand{\@university}{University of Pennsylvania}
\newcommand{\@universityabbrev}{UPenn}
\newcommand{\@department}{Computer and Information Science}
%\newcommand{\@graduatechair}{\color{red}Graduate~Chair}
%\newcommand{\@supervisor}{{\color{red}Supervisor~Name}}
\newcommand{\@graduatechair}{{\color{red}Graduate~Chair}}
\newcommand{\@supervisor}{{\color{red}Supervisor~Name}}
\newcommand{\@committeechair}{\color{red}Committee~Chair~Name}
\newcommand{\@committeemembera}{}
\newcommand{\@committeememberb}{}
\newcommand{\@committeememberc}{}
\newcommand{\@committeememberd}{}
%\newcommand{\@graduatechairtitle}{\color{red}Graduate~Chair~Title}
%\newcommand{\@supervisortitle}{{\color{red}Supervisor~Title}}
\newcommand{\@graduatechairtitle}{\color{red}Graduate~Chair~Title}
\newcommand{\@supervisortitle}{{\color{red}Supervisor~Title}}
\newcommand{\@committeechairtitle}{\color{red}Comittee~Chair~Title}
\newcommand{\@committeemembertitlea}{}
\newcommand{\@committeemembertitleb}{}
\newcommand{\@committeemembertitlec}{}
\newcommand{\@committeemembertitled}{}
\newcommand{\@monthapproved}{}
\newcommand{\@yearapproved}{\color{red}\bf 2300}
\newcommand{\@yearcopyrighted}{\@yearapproved}
%\newcommand{\@copyrighttext}{All Rights Reserved}
%
\newcommand{\@documentabstract}{}
\newcommand{\@documentkeywords}{}
\newcommand{\@acknowledgments}{}
\newcommand{\@degreename}{Doctor of Philosophy}

\newcommand{\@authorfull}{\color{red}Authors~Full~Name}
\newcommand{\@bibfiles}{}
%
% This tells us whether to generate the acknowledgments
\newif\if@hasacknowledgments
\@hasacknowledgmentsfalse

%
% Set up default geometry specifications
\geometry{top=1.0in,
          bottom=1.0in,
          left=1.5in, 
          right = 1in,
          includefoot}
\geometry{marginparwidth=1.2in,
          marginparsep=0.05in}
\reversemarginpar

%
% Here are some things that can be set from inside the document.  Most of them
% have suitable defaults.
\newcommand{\university}[1]{\renewcommand{\@university}{#1}}
\newcommand{\universityabbrev}[1]{\renewcommand{\@universityabbrev}{#1}}
\newcommand{\department}[1]{\renewcommand{\@department}{#1}}
\newcommand{\departmentprefix}[1]{\renewcommand{\@departmentprefix}{#1}}
\newcommand{\departmentprefixshort}[1]{\renewcommand{\@departmentprefixshort}{#1}}
%% \newcommand{\graduatecoordinator}[1]{\renewcommand{\@graduatecoordinator}{#1}}
%% \newcommand{\graduatecoordinatortitle}[1]{\renewcommand{\@graduatecoordinatortitle}{#1}}
\newcommand{\graduatechair}[1]{\renewcommand{\@graduatechair}{#1}}
\newcommand{\graduatechairtitle}[1]{\renewcommand{\@graduatechairtitle}{#1}}
%% \newcommand{\college}[1]{\renewcommand{\@college}{#1}}
%% \newcommand{\collegedean}[1]{\renewcommand{\@collegedean}{#1}}
%% \newcommand{\collegedeantitle}[1]{\renewcommand{\@collegedeantitle}{#1}}
\newcommand{\supervisor}[1]{\renewcommand{\@supervisor}{#1}}
\newcommand{\committeechair}[1]{\renewcommand{\@committeechair}{#1}}
\newcommand{\committeemembera}[1]{\@committeememberatrue\renewcommand{\@committeemembera}{#1}}
\newcommand{\committeememberb}[1]{\@committeememberbtrue\renewcommand{\@committeememberb}{#1}}
\newcommand{\committeememberc}[1]{\@committeememberctrue\renewcommand{\@committeememberc}{#1}}
\newcommand{\committeememberd}[1]{\@committeememberdtrue\renewcommand{\@committeememberd}{#1}}
\newcommand{\supervisortitle}[1]{\renewcommand{\@supervisortitle}{#1}}
\newcommand{\committeechairtitle}[1]{\renewcommand{\@committeechairtitle}{#1}}
\newcommand{\committeemembertitlea}[1]{\@committeememberatrue\renewcommand{\@committeemembertitlea}{#1}}
\newcommand{\committeemembertitleb}[1]{\@committeememberbtrue\renewcommand{\@committeemembertitleb}{#1}}
\newcommand{\committeemembertitlec}[1]{\@committeememberctrue\renewcommand{\@committeemembertitlec}{#1}}
\newcommand{\committeemembertitled}[1]{\@committeememberdtrue\renewcommand{\@committeemembertitled}{#1}}
\newcommand{\authorfull}[1]{\renewcommand{\@authorfull}{#1}}
\newcommand{\monthapproved}[1]{\renewcommand{\@monthapproved}{#1}}
\newcommand{\yearapproved}[1]{\renewcommand{\@yearapproved}{#1}}
\newcommand{\yearcopyrighted}[1]{\renewcommand{\@yearcopyrighted}{#1}}
%\newcommand{\copyrighttext}[1]{\renewcommand{\@copyrighttext}{#1}}
%
\newcommand{\documentabstract}[1]{\renewcommand{\@documentabstract}{#1}}
%\newcommand{\documentkeywords}[1]{%
%    \@hasdocumentkeywordstrue
%    \renewcommand{\@documentkeywords}{#1}%
%}
\newcommand{\acknowledgments}[1]{%
    \@hasacknowledgmentstrue
    \renewcommand{\@acknowledgments}{#1}%
}
%\newcommand{\settextwidth}[1]{\geometry{textwidth=#1}}

\newcommand{\bibfiles}[1]{\renewcommand{\@bibfiles}{#1}}

\DeclareRobustCommand{\printbibliography}{
%\DeclareRobustCommand{\printbibliography}{
  \clearpage
  \phantomsection
  \addcontentsline{toc}{chapter}{Bibliography}
  \bibliographystyle{abbrvnat}
  \bibliography{\@bibfiles}
}

\DeclareRobustCommand{\nobibliography}{%
%\DeclareRobustCommand{\nobibliography}{%
  \@ifnextchar[%]
    {\blx@nobibliography}
    {\blx@nobibliography[]}
}


\newcommand{\my@title}{\expandafter{\MakeUppercase{\@title}}}

\newcommand{\mysignature}[3]{%
  \begin{singlespace}
   #1\\
   \vspace{2.0\baselineskip}
   \makebox[3.0in]{\hrulefill}\\
   #2, #3\\
   \vspace{\baselineskip}
  \end{singlespace}
}%


%
% Title page
\renewcommand{\titlepage}{%
    \clearpage
    \setcounter{page}{1}
    \thispagestyle{empty}
    \@@pdfbookmark[1]{Title Page}{title}%
    \begin{center}

      \begin{spacing}{1.8}
      %\doublespacing
      %\onehalfspacing

      %\expandafter{\MakeUppercase{\@title}}
      \my@title

      \expandafter{\@author}
      
      A DISSERTATION
      
      in
      
      \@department
      
      Presented to the Faculties of the \@university

      in
      
      Partial Fulfillment of the Requirements for the
      
      \@degreename
      
      \expandafter{\@yearapproved}

      \end{spacing}

    \end{center}
    
    \vfill % Here to make sure the page is filled

    \begin{flushleft}

      \mysignature{Supervisor of Dissertation}{\@supervisor}{\@supervisortitle}

      \mysignature{Graduate Group Chairperson}{\@graduatechair}{\@graduatechairtitle}
      
      Dissertation Committee\\
      {\@committeechair}, {\@committeechairtitle}\\%
      \if@committeemembera
        {\@committeemembera}, {\@committeemembertitlea}\\
      \fi
      \if@committeememberb
        {\@committeememberb}, {\@committeemembertitleb}\\
      \fi
      \if@committeememberc
        {\@committeememberc}, {\@committeemembertitlec}\\
      \fi
      \if@committeememberd
        {\@committeememberd}, {\@committeemembertitled}\\
      \fi
    \end{flushleft}


}
\newcommand{\copyrightpage}{%
  \clearpage
  \thispagestyle{empty} % No page number as per Manual, p. 11
  \begin{doublespace}
    \setlength{\parskip}{0.5\baselineskip}

    \vspace*{\fill}
    \begin{flushleft}

      %\expandafter{\MakeUppercase{\@title}}
      \my@title

      \copyright \space COPYRIGHT
      
      \expandafter{\@yearcopyrighted}

      \expandafter{\@authorfull}\\[24 pt] % If traditional copyright then delete everything below here, but keep \end{flushleft}

      This work is licensed under the \\
      Creative Commons Attribution \\
      NonCommercial-ShareAlike 3.0 \\
      License

      To view a copy of this license, visit

      \url{http://creativecommons.org/licenses/by-nc-sa/3.0/us/}

    \end{flushleft}
  \end{doublespace}

}%

% abstract page style, different chapter headings


% ABSTRACT
\newcommand{\abstractpage}{%
    \clearpage
    \phantomsection
    \addcontentsline{toc}{chapter}{Abstract} % This is to include this section in the Table of Contents
    \begin{center}
      \begin{spacing}{2.5}
        ABSTRACT
      \end{spacing}

      \my@title

      \@author

      \@supervisor

    \end{center}
    \noindent
    \@documentabstract
}%

% ACKNOWLEDGMENTS
\newcommand{\acknowledgmentspage}{%
    \clearpage
    \phantomsection
    \addcontentsline{toc}{chapter}{Acknowedgment} % This is to include this section in the Table of Contents
    \begin{center}
        ACKNOWLEDGMENT
    \end{center}
    \noindent
    \@acknowledgments
}%

\renewcommand{\maketitle}{%
    \pagenumbering{roman}%
        %\pagestyle{empty}%
        \titlepage
        \copyrightpage
        \abstractpage
        \if@hasacknowledgments
            \acknowledgmentspage
        \fi
        \clearpage
        \pdfbookmark{\contentsname}{Contents}
        \tableofcontents
        \if@lof
            \listoffigures
        \fi
        \if@lot
            \listoftables
        \fi
        \if@lol
            \lstlistoflistings
        \fi
    \clearpage
    \pagenumbering{arabic}%
}%

%
%
% Set up default document settings
\AtBeginDocument{%
    \pagestyle{plain}%
    \pagenumbering{arabic}%
    %\parindent \@defaultindent
    % Fix the bibliography stuff (if using natbib).
    %% \@ifpackageloaded{natbib}{% natbib loaded
    %%     \renewcommand{\bibname}{\refname}
    %%     \let\oldbibsection\bibsection
    %%     \renewcommand{\bibsection}{%
    %%         \oldbibsection
    %%         \refstepcounter{toclistings}%
    %%         \addcontentsline{toc}{chapter}{\refname}
    %%     }%
    %% }{% natbib not loaded
    %%     \ClassWarning{upennphd}{Not using natbib - TOC might not show references.  Search class file comments for "NATBIB" for how to resolve this by hand (or just use natbib - it's an excellent package)}
    %%     \renewcommand{\bibname}{References}
    %% }%
    % Set up double spacing---this is safe because the overall document is
    % single-spaced and we'll set up single spacing as the default in maketitle
    % where spacing matters.
    %\doublespace
}%
%
