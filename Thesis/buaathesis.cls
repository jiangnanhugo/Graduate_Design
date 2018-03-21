% !Mode:: "TeX:UTF-8"
%%%%% 'buaathesis.cls' BEGIN

%%%%%%%%%% class clarification %%%%%%%%%%
% 模板声明
% updated by Nan Jiang (nanjiang@buaa.edu.cn, jiangnan.hugo@gmail.com)
\NeedsTeXFormat{LaTeX2e}[2007/10/19]
\ProvidesClass{buaathesis}
              [2018/03/10 v0.8.1
The LaTeX template for thesis of BUAA]
\typeout{Document Class `buaathesis' v0.8.1 by BHOSC (2018/03)}

%%%%%%%%%% class options %%%%%%%%%%
% 模板选项

% 本模板自身包含五个选项
% 前四个为对应学位类型，决定不同样式
% 第五个为颜色选项，用于电子版的情况
\newif\ifbuaa@bachelor\buaa@bachelorfalse
\newif\ifbuaa@master\buaa@mastertrue
\newif\ifbuaa@engineer\buaa@engineerfalse
\newif\ifbuaa@doctor\buaa@doctorfalse
\newif\ifbuaa@color\buaa@colorfalse
\newif\ifbuaa@twoteacher\buaa@twoteacherfalse
\DeclareOption{bachelor}{\buaa@bachelortrue}
\DeclareOption{master}{\buaa@mastertrue}
\DeclareOption{engineer}{\buaa@engineertrue}
\DeclareOption{doctor}{\buaa@doctortrue}
\DeclareOption{color}{\buaa@colortrue}
\DeclareOption{twoteacher}{\buaa@twoteachertrue}
% 其余选项传递给ctexbook
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessOptions\relax
% 引用ctexbook及基本设置
\LoadClass[UTF8,zihao=-4,a4paper,linespread=1.7]{ctexbook}%

%%%%%%%%%% global package %%%%%%%%%%
% 全局通用宏包

\RequirePackage{ifthen}


%%%%%%%%%% font %%%%%%%%%%
% 数学相关和字体设置

\RequirePackage{amsmath,amsfonts}
\RequirePackage[amsmath,thmmarks,hyperref]{ntheorem}
\RequirePackage{txfonts}
%\RequirePackage{microtype}


% 主要字体为Times New Roman和宋体
% 模板某些标题需要华文行楷和32号字
%\setmainfont{Times New Roman}
% 不需要设置CJKmainfont，ctex 宏包已经很好的处理了
% 不仅设置了粗体为黑体，斜体为楷体，还兼容了winfonts和adobefonts
% 直接设置反而会在只有adobefonts的情况下报错
% \setCJKmainfont{宋体}
\setCJKfamilyfont{hwxingkai}{STXingkai}
\newcommand{\hwxingkai}{\CJKfamily{hwxingkai}}
\newcommand{\xiaochuhao}{\fontsize{32pt}{\baselineskip}\selectfont}
\RequirePackage[xetex,unicode]{hyperref}
\RequirePackage[unicode]{hyperref}

%%%%%%%%%% color %%%%%%%%%%
% 颜色设置

% 只用于电子版
\RequirePackage{color}
\definecolor{dkgreen}{rgb}{0,0.6,0}
\definecolor{gray}{rgb}{0.5,0.5,0.5}
\definecolor{mauve}{rgb}{0.58,0,0.82}

%%%%%%%%%% page margin %%%%%%%%%%
% 页面边距

\RequirePackage{geometry}
%
%\newgeometry{
%    top=25mm, bottom=25mm, left=30mm, right=20mm,
%    headsep=5mm, headheight=10mm, footskip=10mm,
%}
%\savegeometry{mastergeometry}
%\loadgeometry{mastergeometry}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% 页面设置
%% 设置页面大小
%% A4纸页边距均25mm
%% 打印留边平移5mm
%\geometry{papersize={210mm,297mm}}
\geometry{top=25mm,bottom=25mm,inner=30mm,outer=20mm}

%%%%%%%%%% space %%%%%%%%%%
% 其他间距

%\renewcommand{\baselinestretch}{1.5}
\setlength{\parindent}{2em}
\setlength{\floatsep}{3pt plus 3pt minus 2pt}      % 图形之间或图形与正文之间的距离
\setlength{\abovecaptionskip}{12pt plus 1pt minus 1pt} % 图形中的图与标题之间的距离
\setlength{\belowcaptionskip}{12pt plus 1pt minus 2pt} % 表格中的表与标题之间的距离

%%%%%%%%%% header & footer %%%%%%%%%%
% 页眉页脚

\RequirePackage{fancyhdr}
\fancypagestyle{frontmatter}{
    \renewcommand{\headrulewidth}{0pt}
    \renewcommand{\headrulewidth}{0pt}
    \fancyhf{}
    \fancyfoot[C]{\thepage}
}
\fancypagestyle{mainmatter}{
    \fancyhead{}
    \fancyfoot{}
    \ifbuaa@bachelor
        \fancyhead[C]{
            \includegraphics[width=37bp]{figures/buaamark.eps}\hfill
            \raisebox{2ex}{\heiti\zihao{4}\buaa@university 毕业设计(论文)}\hfill
            \raisebox{2ex}{\songti\zihao{5}第\quad\thepage\quad 页}
        }
    \else
        \if@twoside
            \fancyhead[CO]{\zihao{-5}\songti
                \buaa@university\buaa@headdegree 学位论文\vspace{1.5mm}
            }
            \fancyhead[CE]{\zihao{-5}\songti\leftmark\vspace{1.5mm}}
        \else
            \fancyhead[C]{\zihao{-5}\songti
                \ifthenelse{\isodd{\value{page}}}
                    {\buaa@university\buaa@headdegree 学位论文}
                    {\leftmark}
                \vspace{1.5mm}
            }
        \fi
        \fancyfoot[C]{\zihao{5}\thepage}
    \fi

    \renewcommand{\headrulewidth}{0.5bp} % 页眉线宽度
}

\fancypagestyle{plain}{
    \pagestyle{fancy}
}

%%%%%%%%%% title %%%%%%%%%%
% 标题
%\linespread{1.5}
% 汉化
\renewcommand{\contentsname}{目\qquad 录}
\renewcommand\listfigurename{图\qquad 目}
\renewcommand\listtablename{表\qquad 目}
\renewcommand\bibname{参\ 考\ 文\ 献}
\renewcommand{\figurename}{图}
\renewcommand{\tablename}{表}

\ctexset{%
  chapter={%章标题 : 三号黑体居中 单倍行距 段前/段后0.5行 另起新页
    format=\zihao{3} \heiti \centering \thispagestyle{fancy},
    fixskip=true,
    beforeskip=19.27pt,
    afterskip=22.48pt,
    break=\clearpage,
  },
  section={%节标题 : 四号黑体居左 单倍行距 段前/段后0.5行
    format=\zihao{4} \heiti \raggedright,
    beforeskip=8.43pt,
    afterskip=11.24pt,
  },
  subsection={%条标题 : 小四号黑体居左 单倍行距 段前/段后0.5行
    format=\zihao{-4} \heiti \raggedright,
    beforeskip=3.61pt,
    afterskip=3.61pt,
  },
  subsubsection={% 附加4级标题 : 小四号宋体加粗居左
    format=\zihao{-4} \songti \raggedright \bfseries,
  },
  paragraph={% 附加5级标题 : 小四号宋体居左
    format=\zihao{-4} \songti \raggedright,
  },
  subparagraph={% 附加6级标题 : 小四号宋体居左
    format=\zihao{-4} \songti \raggedright,
  }
}

%%%%%%%%%% contents %%%%%%%%%%
% 目录

\RequirePackage{titletoc}
\titlecontents{chapter}[0pt]{\heiti\zihao{-4}}{\thecontentslabel\ }{}
{\hspace{.5em}\titlerule*[4pt]{.}\contentspage}
\titlecontents{section}[2em]{\songti\zihao{-4}}{\thecontentslabel\ }{}
{\hspace{.5em}\titlerule*[4pt]{.}\contentspage}
\titlecontents{subsection}[3em]{\songti\zihao{5}}{\thecontentslabel\ }{}
{\hspace{.5em}\titlerule*[4pt]{.}\contentspage}
\titlecontents{figure}[0pt]{\songti\zihao{-4}}{图~\thecontentslabel\quad}{}
{\hspace{.5em}\titlerule*[4pt]{.}\contentspage}
\titlecontents{table}[0pt]{\songti\zihao{-4}}{表~\thecontentslabel\quad}{}
{\hspace{.5em}\titlerule*[4pt]{.}\contentspage}

% 图表环境设置
\RequirePackage{remreset}     % 计数器设置
\RequirePackage{caption}      % 标题设置
\@removefromreset{table}{chapter}
\@removefromreset{figure}{chapter}
\renewcommand{\thefigure}{\arabic{figure}}
\renewcommand{\thetable}{\arabic{table}}
\DeclareCaptionFormat{tabfigformat}{\songti\zihao{5}{#1~~#3}} % \bfseries
\captionsetup[figure]{
  position=bottom, margin=2mm, format=tabfigformat,
  aboveskip=6pt, belowskip=-8pt, justification=centerlast}
\captionsetup[table]{
  position=top, margin=2mm, format=tabfigformat,
  aboveskip=6pt, belowskip=0pt, justification=centerlast}

%    \titlecontents{chapter}[0pt]{\vspace{-0.25\baselineskip}\heiti\zihao{4}}{\thecontentslabel\ }{}
%        {\hspace{.5em}\titlerule*[3pt]{$\cdot$}{\zihao{-4}\contentspage}}[\vspace{0.07\baselineskip}]
%    \titlecontents{section}[2em]{\songti\zihao{-4}}{\thecontentslabel\ }{}
%        {\hspace{.5em}\titlerule*[3pt]{$\cdot$}{\zihao{-4}\contentspage}}[\vspace{0.1\baselineskip}]
%    \titlecontents{subsection}[4em]{\vspace{-0.2\baselineskip}\heiti\zihao{5}}{\thecontentslabel\ }{}
%        {\hspace{.5em}\titlerule*[3pt]{$\cdot$}{\zihao{-4}\contentspage}}[\vspace{0.1\baselineskip}]

%取消图片、表格目录中的章节空格
\newcommand*{\noaddvspace}{\renewcommand*{\addvspace}[1]{}}
\addtocontents{lof}{\protect\noaddvspace}
\addtocontents{lot}{\protect\noaddvspace}

%表目录图目录的格式设置
%表目录与图目录数字前增加“表”与“图”字，并且使目录行间距与section行间距一致

% \titlecontents{figure}[0pt]{\vspace{0.15\baselineskip}\songti\zihao{-4}}{\makebox[3em][l]{图~\thecontentslabel\quad}}{}
%    {\hspace{.5em}\titlerule*[4pt]{$\cdot$}\contentspage}[\vspace{0.15\baselineskip}]

% \titlecontents{table}[0pt]{\vspace{0.15\baselineskip}\songti\zihao{-4}}{\makebox[3em][l]{表~\thecontentslabel\quad}}{}
%    {\hspace{.5em}\titlerule*[4pt]{$\cdot$}\contentspage}[\vspace{0.15\baselineskip}]

%%%%%%%%%% cross reference %%%%%%%%%%
% 交叉引用


\hypersetup{hidelinks}

\hypersetup{
    bookmarksnumbered,
    bookmarksopen,
    pdftitle={BUAA thesis},
    pdfauthor={BHOSC},
    pdfsubject={北航毕业设计论文},
    pdfcreator={LaTeXed~By~BHOSC}
}

%%%%%%%%%% reference %%%%%%%%%%
% 参考文献
\RequirePackage[sort&compress]{natbib}              % BibTex
\newcommand\bibstyle@super{\bibpunct{[}{]}{,}{s}{,}{\textsuperscript{,}}}
\newcommand\bibstyle@numbers{\bibpunct{[}{]}{,}{n}{,}{,}}
\newcommand\bibstyle@authoryear{\bibpunct{(}{)}{;}{a}{,}{,}}
\bibpunct{[}{]}{,}{n}{}{}
\setlength{\bibsep}{0pt}
\newcommand{\upcite}[1]{\textsuperscript{\cite{#1}}}

%%%%%%%%%% table %%%%%%%%%%
% 表格

% 表格中的行合并
\RequirePackage{multirow}

% 重定义table/tabular/tabularx环境，使表格内为5号字
% TODO(huxuan): 支持 longtable
\let\oldtable\table
\let\endoldtable\endtable
\renewenvironment{table}[1][h!]
{\renewcommand{\arraystretch}{1.5}
\oldtable[#1]\zihao{5}}
{\renewcommand{\arraystretch}{1}
\endoldtable}

\let\oldtabular\tabular
\let\endoldtabular\endtabular
\renewenvironment{tabular}[1][h!]
{\renewcommand{\arraystretch}{1.5}
\oldtabular[#1]\zihao{5}}
{\renewcommand{\arraystretch}{1}
\endoldtabular}

\RequirePackage{tabularx}
\let\oldtabularx\tabularx
\let\endoldtabularx\endtabularx
\renewenvironment{tabularx}[2]
{\renewcommand{\arraystretch}{1.5}
\zihao{5}\oldtabularx{#1}{#2}}
{\renewcommand{\arraystretch}{1}
\endoldtabularx}


\RequirePackage{array}

%%%%%%%%%% picture %%%%%%%%%%
% 图片

\RequirePackage{graphicx}
\DeclareGraphicsExtensions{.eps,.ps,.jpg,.bmp}
\graphicspath{{figure/}}
\RequirePackage{pifont} % “秘级”后的五角星


%%%%%%%%%% list %%%%%%%%%%
% 列表

\RequirePackage{enumitem}
\setlist{noitemsep}
\setlist[1,2]{labelindent=\parindent}
\setlist[enumerate,1]{label=\arabic*、}
\setlist[enumerate,2]{label=（\arabic*）}
\setlist{
    topsep=0pt,
    itemsep=0pt,
    partopsep=0pt,
    parsep=\parskip,
}


%%%%%%%%%% theorem %%%%%%%%%%
% 定理

\theoremsymbol{\ensuremath{\square}}
\newtheorem*{proof}{证明}
\theoremstyle{plain}
\theoremsymbol{}
\theoremseparator{：}
\newtheorem{assumption}{假设}[chapter]
\newtheorem{definition}{定义}[chapter]
\newtheorem{proposition}{命题}[chapter]
\newtheorem{lemma}{引理}[chapter]
\newtheorem{theorem}{定理}[chapter]
\newtheorem{axiom}{公理}[chapter]
\newtheorem{corollary}{推论}[chapter]
\newtheorem{exercise}{练习}[chapter]
\newtheorem{example}{例}[chapter]
\newtheorem{remark}{注释}[chapter]
\newtheorem{problem}{问题}[chapter]
\newtheorem{conjecture}{猜想}[chapter]

%%%%%%%%%% file directory %%%%%%%%%%
% 文件目录

\RequirePackage{dirtree}
\ifbuaa@color
    \renewcommand*\DTstylecomment{\ttfamily\color{dkgreen}}
    \renewcommand*\DTstyle{\ttfamily\color{red}}
\fi


% Fix subfigure reference bug
\let\p@subfigure=\thefigure

% 图片表格标题命令，主要用于混排
\newcommand\figcaption{\def\@captype{figure}\caption}
\newcommand\tabcaption{\def\@captype{table}\caption}

%%%%%%%%%% other settings %%%%%%%%%%
% 杂项

% 设置<附录>的图表编号与当前附录章号关联
\newcommand{\rmrelation}{
% 图、表、公式编号随 chapter 清零
\@addtoreset{figure}{chapter}
\@addtoreset{table}{chapter}
\@addtoreset{equation}{chapter}
%图、表、公式编号章节关联
\renewcommand{\thefigure}{\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@figure}
\renewcommand{\thetable}{\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@table}
\renewcommand{\theequation}{\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@equation}
}

\let\oldappendix\appendix
\renewcommand{\appendix}{
\oldappendix\rmrelation
}


% 下划线
\RequirePackage{ulem}

% 设置行距
\RequirePackage{setspace}

% 正文前的页码设置位大写罗马数字
\renewcommand{\frontmatter}{
    \cleardoublepage
    \@mainmatterfalse
    \ifbuaa@bachelor
        \pagenumbering{Roman}
    \else
        \pagenumbering{roman}
    \fi
}

% 保证偶数页结束章节
\newcommand{\clearemptydoublepage}{%
    \clearpage
    \if@twoside
        \ifodd
            \c@page
        \else
            \hbox{}\thispagestyle{empty}\newpage
            \if@twocolumn
                \hbox{}\newpage
            \fi
        \fi
    \fi
}

%%%%%%%%%% index %%%%%%%%%%
% 首页

% 本科生首页的右上角和底部的填写内容居中
% cvrtc : CoVer - Right  - Top    - Center
% cvcbc : CoVer - Center - Bottom - Center
\newcommand{\ulinecvrtc}[1]{\uline{\makebox[9em][c]{\bf #1}}}
\newcommand{\ulinecvcbc}[1]{\uline{\makebox[14em][c]{#1}}}

% 中文首页
\newcommand{\titlech}{
        \begin{titlepage}
            \begin{center}
                \begin{spacing}{1.5}
                    {
                        \zihao{5}\heiti
                        \begin{flushleft}
                            中图分类号：\buaa@category  \\
							%中图分类号：\buaa@category\hfill 密级\ding{73}~~\buaa@mibao \\ % 保密论文时用此行代码替换上行代码即可
                            论\,\,文\,\,编\,\,号：\buaa@thesisID\\
                        \end{flushleft}
                    }
                    \vskip 80bp
                    \includegraphics[width=.5\textwidth]{figures/buaaname.eps}
                    \vskip 30bp
                    \centerline{\zihao{0}\ziju{0.2}\hwxingkai\buaa@degree 论文}
                    ~~\\
                    %\vskip 100bp
                    \vspace*{\stretch{5}}
                    \begin{minipage}[h]{.85\textwidth}
                        \begin{spacing}{3}
                            % actually, it should be 1.5, but I think 3 will be prefect.
                            \centering{\xiaochuhao\songti \buaa@thesistitle}
                        \end{spacing}
                    \end{minipage}
                    %\vspace{5bp}
                    % the space between title and subtitle, however, it seems doesn't work.
                    \begin{minipage}[h]{.75\textwidth}
                        \begin{spacing}{1.5}
                            \centering{\heiti\zihao{3}\buaa@thesissubtitle}
                        \end{spacing}
                    \end{minipage}
                    \vspace*{\stretch{4}}
                    ~~\\
                    %\vskip 80bp
                    {
                        \heiti\zihao{4}\ziju{0.2}
                        \ifbuaa@twoteacher
                            \begin{tabular}[b]{ll}
                                作~~者~~姓~~名~~ & \buaa@thesisauthor\\[.3ex]
                                学~~科~~专~~业~~ & \buaa@major\\[.3ex]
                                指~~导~~教~~师~~ & \buaa@teacher\quad\buaa@teacherdegree\\[.3ex]
                                ~~ & \buaa@subteacher\quad\buaa@subteacherdegree\\[.3ex]
                                培~~养~~院~~系~~ & \buaa@school 学院\\
                            \end{tabular}
                        \else
                            \begin{tabular}[b]{ll}
                                作~~者~~姓~~名~~ & \buaa@thesisauthor\\[.4ex]
                                学~~科~~专~~业~~ & \buaa@major\\[.4ex]
                                指~~导~~教~~师~~ & \buaa@teacher \quad\buaa@teacherdegree\\[.4ex]
                                培~~养~~院~~系~~ & \buaa@school 学院\\
                            \end{tabular}
                        \fi
                    }
                \end{spacing}
            \end{center}
        \end{titlepage}
}

% 英文首页
\newcommand{\titleeng}{
    \clearemptydoublepage
    \thispagestyle{empty}
    \vspace*{\stretch{.8}}
    \begin{center}
    \begin{minipage}[h]{.8\textwidth}
    	\begin{spacing}{2}
        	\centering{\zihao{-2}\textbf{\buaa@thesistitleeng}}
        \end{spacing}
    \end{minipage}
    \vskip 10bp
    \vspace*{\stretch{.4}}
        {\zihao{4}A Dissertation Submitted for the Degree of \buaa@degreeeng}\\
        \vskip 90bp
        \begin{center}
            \zihao{-3}
                \begin{tabular}{rl}
                    \textbf{Candidate:\ }&\textbf{\buaa@thesisauthoreng}\\[1.9ex]
                    \textbf{Supervisor:\ }&\textbf{\buaa@teacherdegreeeng ~~\buaa@teachereng}\\
                \end{tabular}
        \end{center}
        \vskip 100bp
        \begin{spacing}{1.5}
        \zihao{-3}{\buaa@schooleng \\[0ex]
        \buaa@universityeng , Beijing, China}
        \end{spacing}
        \vskip 50bp
    \end{center}
}

%%%%%%%%%% abstract %%%%%%%%%%
% 摘要

% 中文摘要
\newenvironment{cabstract}{%
    \newpage
    \vspace*{2bp}
    \begin{spacing}{1.7}
    \centerline{\bfseries\heiti\zihao{3} 摘~~~~要}
    \vspace{0ex}

    \setlength{\parindent}{24bp}
    }{%
    \vskip 21bp

    {\heiti\zihao{-4} 关键词：}\buaa@ckeyword
    \end{spacing}
}

% 英文摘要
\newenvironment{eabstract}{%
    \newpage
    \vspace*{2bp}
    \begin{spacing}{1.7}
    \centerline{\bf\zihao{3} Abstract}

    \setlength{\parindent}{24bp}
    }{%
    \vskip 21bp
    {\bf\zihao{-4} Key words: }\buaa@ekeyword
    \end{spacing}
}



% 文字左对齐的下划线
\newcommand{\ulinel}[2][]{\uline{\makebox[#1\textwidth][l]{#2}}}
% 文字居中的下划线
\newcommand{\ulinec}[2][]{\uline{\makebox[#1\textwidth][c]{#2}}}
% 任务书条目序号
\newcounter{assign}
% 原始资料及设计要求
\def\buaa@bachelor@assign@req@one{}
\def\buaa@bachelor@assign@req@two{}
\def\buaa@bachelor@assign@req@three{}
\def\buaa@bachelor@assign@req@four{}
\def\buaa@bachelor@assign@req@five{}
\newcommand{\assignReq}[5]{
    \def\buaa@bachelor@assign@req@one{#1}
    \def\buaa@bachelor@assign@req@two{#2}
    \def\buaa@bachelor@assign@req@three{#3}
    \def\buaa@bachelor@assign@req@four{#4}
    \def\buaa@bachelor@assign@req@five{#5}
}
% 工作内容
\def\buaa@bachelor@assign@work@one{}
\def\buaa@bachelor@assign@work@two{}
\def\buaa@bachelor@assign@work@three{}
\def\buaa@bachelor@assign@work@four{}
\def\buaa@bachelor@assign@work@five{}
\def\buaa@bachelor@assign@work@six{}
\newcommand{\assignWork}[6]{
    \def\buaa@bachelor@assign@work@one{#1}
    \def\buaa@bachelor@assign@work@two{#2}
    \def\buaa@bachelor@assign@work@three{#3}
    \def\buaa@bachelor@assign@work@four{#4}
    \def\buaa@bachelor@assign@work@five{#5}
    \def\buaa@bachelor@assign@work@six{#6}
}
% 参考文献
\def\buaa@bachelor@assign@ref@one{}
\def\buaa@bachelor@assign@ref@two{}
\def\buaa@bachelor@assign@ref@three{}
\def\buaa@bachelor@assign@ref@four{}
\def\buaa@bachelor@assign@ref@five{}
\def\buaa@bachelor@assign@ref@six{}
\def\buaa@bachelor@assign@ref@seven{}
\def\buaa@bachelor@assign@ref@eight{}
\newcommand{\assignRef}[8]{
    \def\buaa@bachelor@assign@ref@one{#1}
    \def\buaa@bachelor@assign@ref@two{#2}
    \def\buaa@bachelor@assign@ref@three{#3}
    \def\buaa@bachelor@assign@ref@four{#4}
    \def\buaa@bachelor@assign@ref@five{#5}
    \def\buaa@bachelor@assign@ref@six{#6}
    \def\buaa@bachelor@assign@ref@seven{#7}
    \def\buaa@bachelor@assign@ref@eight{#8}
}


%%%%%%%%%% nominate %%%%%%%%%%
% 研究生提名页

\newcommand{\timingye}{%
    \clearemptydoublepage
    \thispagestyle{empty}
    \begin{flushleft}
        {\zihao{5}\heiti\bfseries
        中图分类号：\buaa@category\\
        论\,\,文\,\,编\,\,号：\buaa@thesisID\\}
    \end{flushleft}
    \begin{center}
        \vskip 100bp
        \begin{spacing}{1.5}
        {\zihao{-2}\heiti{\ziju{1.3}\buaa@degree 论文}}
        \vskip 100bp
        \begin{minipage}[h]{.85\textwidth}
            \zihao{-1}\heiti\centering{\buaa@thesistitle}
        \end{minipage}
        \end{spacing}

        \vspace{170pt}

        \begin{spacing}{2.2}
            {\zihao{-4}\songti
            \begin{tabular}[b]{llll}
                \makebox[6em][s]{作\hfill 者\hfill 姓\hfill 名} & \buaa@thesisauthor& 申请学位级别 & \buaa@appdegree \\
                指导教师姓名 & \makebox[9em][s]{\buaa@teacher\quad\buaa@subteacher\hfill} & 职\qquad\qquad 称 & \buaa@teacherdegree \\
                \makebox[6em][s]{学\hfill 科\hfill 专\hfill 业} & \buaa@major  &
                \makebox[6em][s]{研\hfill 究\hfill 方\hfill 向} & \buaa@direction \\
                \makebox[6em][s]{学\hfill 习\hfill 时\hfill 间\hfill 自} &\buaa@thesisbeginyear~~年~~\buaa@thesisbeginmonth~~月~~\buaa@thesisbeginday~~日\qquad &
                \makebox[6em][s]{起\hfill 至} & \buaa@thesisendyear~~年~~\buaa@thesisendmonth~~月~~\buaa@thesisendday~~日止\qquad\\
                论文提交日期 &\buaa@commityear~~年~~\buaa@commitmonth~~月~~\buaa@commitday~~日\qquad & 论文答辩日期& \buaa@defenseyear~~年~~\buaa@defensemonth~~月~~\buaa@defenseday~~日~\qquad\\
                学位授予单位 & \buaa@university &学位授予日期 &\buaa@awardyear~~年~~\buaa@awardmonth~~月~~\buaa@awardday~~日~\qquad\\
            \end{tabular}}
        \end{spacing}
    \end{center}
}

%%%%%%%%%% creation and use %%%%%%%%%%
% 研究生独创性声明和授权书

\newcommand{\creationanduse}{%
     \clearemptydoublepage
     \thispagestyle{empty}
     \vspace*{10bp}
    \begin{spacing}{1.7}
    \centerline{\zihao{3}\heiti 关于学位论文的独创性声明}
    \zihao{-4}\songti ~\par
        本人郑重声明：所呈交的论文是本人在指导教师指导下独立进行研究工作所取得的成果，
    论文中有关资料和数据是实事求是的。尽我所知，除文中已经加以标注和致谢外，
    本论文不包含其他人已经发表或撰写的研究成果，也不包含本人或他人为获得北京航空航天大学
    或其它教育机构的学位或学历证书而使用过的材料。与我一同工作的同志对研究所做的任何贡献
    均已在论文中作出了明确的说明。\par
    若有不实之处，本人愿意承担相关法律责任。\par
    ~~\\
    {\zihao{5}学位论文作者签名：\uline{\hspace{6em}}\hspace{8em}日期：\hspace{7ex}年\hspace{5ex}月\hspace{5ex}日}
    \vspace{120pt}
    \par
    \centerline{\zihao{3}\heiti 学位论文使用授权书}
    \zihao{-4}\songti ~\par
        本人完全同意北京航空航天大学有权使用本学位论文（包括但不限于其印刷版和电子版），
    使用方式包括但不限于：保留学位论文，按规定向国家有关部门（机构）送交学位论文，
    以学术交流为目的赠送和交换学位论文，允许学位论文被查阅、借阅和复印，将学位论文的全部
    或部分内容编入有关数据库进行检索，采用影印、缩印或其他复制手段保存学位论文。\par
    保密学位论文在解密后的使用授权同上。\par
    ~~\\
    {\zihao{5}
    学位论文作者签名：\uline{\hspace{6em}}\hspace{8em}日期：\hspace{7ex}年\hspace{5ex}月\hspace{5ex}日\\
    指导教师签名：\uline{\hspace{8em}}\hspace{8em}日期：\hspace{7ex}年\hspace{5ex}月\hspace{5ex}日}
    \end{spacing}
}



%%%%%%%%%% settings for custom pages %%%%%%%%%%
% 首页重定义

\renewcommand{\maketitle}{%
    \titlech
    \titleeng                 %研究生英文封面
    \timingye                 %研究生题名页
    \creationanduse           %研究生独创性声明和使用授权书
    \clearemptydoublepage
    \frontmatter
    \songti
    \zihao{-4}
}

%%%%%%%%%% common user info %%%%%%%%%%
% 用户信息

% 学校名称
\def\buaa@university{北京航空航天大学}
\def\buaa@universityeng{Beihang University}
\newcommand{\university}[2]{%
    \def\buaa@university{#1}
    \def\buaa@universityeng{#2}
}
% 学院
\def\buaa@school{}
\def\buaa@schooleng{}
\newcommand{\school}[2]{%
    \def\buaa@school{#1}
    \def\buaa@schooleng{#2}
}
% 专业
\def\buaa@major{}
\def\buaa@majoreng{}
\newcommand{\major}[2]{%
    \def\buaa@major{#1}
    \def\buaa@majoreng{#2}
}
% 论文标题和副标题
\def\buaa@thesistitle{}
\def\buaa@thesissubtitle{}
\def\buaa@thesistitleeng{}
\def\buaa@thesissubtitleeng{}
\newcommand{\thesistitle}[4]{%
    \def\buaa@thesistitle{#1}
    \def\buaa@thesissubtitle{#2}
    \def\buaa@thesistitleeng{#3}
    \def\buaa@thesissubtitleeng{#4}
}
% 作者
\def\buaa@thesisauthor{}
\def\buaa@thesisauthoreng{}
\newcommand{\thesisauthor}[2]{%
    \def\buaa@thesisauthor{#1}
    \def\buaa@thesisauthoreng{#2}
}
% 指导老师
\def\buaa@teacher{}
\def\buaa@teachereng{}
\newcommand{\teacher}[2]{%
    \def\buaa@teacher{#1}
    \def\buaa@teachereng{#2}
}
% 副指导老师
\def\buaa@subteacher{}
\def\buaa@subteachereng{}
\newcommand{\subteacher}[2]{%
    \def\buaa@subteacher{#1}
    \def\buaa@subteachereng{#2}
}
% 分类号
\def\buaa@category{}
\newcommand{\category}[1]{%
    \def\buaa@category{#1}
}
% 论文开始时间
\def\buaa@thesisbeginyear{}
\def\buaa@thesisbeginmonth{}
\def\buaa@thesisbeginday{}
\newcommand{\thesisbegin}[3]{%
    \def\buaa@thesisbeginyear{#1}
    \def\buaa@thesisbeginmonth{#2}
    \def\buaa@thesisbeginday{#3}
}
% 论文结束时间
\def\buaa@thesisendyear{}
\def\buaa@thesisendmonth{}
\def\buaa@thesisendday{}
\newcommand{\thesisend}[3]{%
    \def\buaa@thesisendyear{#1}
    \def\buaa@thesisendmonth{#2}
    \def\buaa@thesisendday{#3}
}
% 答辩时间
\def\buaa@defenseyear{}
\def\buaa@defensemonth{}
\def\buaa@defenseday{}
\newcommand{\defense}[3]{%
    \def\buaa@defenseyear{#1}
    \def\buaa@defensemonth{#2}
    \def\buaa@defenseday{#3}
}
% 中文摘要关键字
\def\buaa@ckeyword{}
\newcommand{\ckeyword}[1]{%
    \def\buaa@ckeyword{#1}}
% 英文摘要关键字
\def\buaa@ekeyword{}
\newcommand{\ekeyword}[1]{%
    \def\buaa@ekeyword{#1}}
% 学位
\def\buaa@degree{} % 中文首页和题名页
\def\buaa@degreeeng{} % 英文首页
\def\buaa@headdegree{} % 页眉页脚
\newcommand{\degree}[3]{%
    \def\buaa@degree{#1}
    \def\buaa@degreeeng{#2}
    \def\buaa@headdegree{#3}
}
\ifbuaa@doctor
    \degree{博士学位}{Doctor of Philosophy}{博士}
\else
    \ifbuaa@engineer
        \degree{专业硕士学位}{Master}{硕士}
    \else
        \ifbuaa@bachelor
            \degree{学士学位}{Bachelor}{学士}
        \else
            \degree{硕士学位}{Master}{硕士}
        \fi
    \fi
\fi

%%%%%%%%%% bachelor user info %%%%%%%%%%
% 本科生信息

% 班级
\def\buaa@class{}
\newcommand{\class}[1]{%
    \def\buaa@class{#1}
}
% 单位代码
\def\buaa@unicode{1006}
\newcommand{\unicode}[1]{%
    \def\buaa@unicode{#1}
}
% 学号
\def\buaa@studentID{}
\newcommand{\studentID}[1]{%
    \def\buaa@studentID{#1}
}
% 论文时间
\def\buaa@thesisdateyear{}
\def\buaa@thesisdatemonth{}
\newcommand{\thesisdate}[2]{%
    \def\buaa@thesisdateyear{#1}
    \def\buaa@thesisdatemonth{#2}
}

%%%%%%%%%% master user info %%%%%%%%%%
% 研究生信息

% 保密等级
\def\buaa@mibao{}
\newcommand{\mibao}[1]{%
    \def\buaa@mibao{#1}
}
% 研究方向
\def\buaa@direction{}
\newcommand{\direction}[1]{
    \def\buaa@direction{#1}
}
% 导师职称
\def\buaa@teacherdegree{}
\def\buaa@teacherdegreeeng{}
\newcommand{\teacherdegree}[2]{%
    \def\buaa@teacherdegree{#1}
    \def\buaa@teacherdegreeeng{#2}
}
% 副导师职称
\def\buaa@subteacherdegree{}
\def\buaa@subteacherdegreeeng{}
\newcommand{\subteacherdegree}[2]{%
    \def\buaa@subteacherdegree{#1}
    \def\buaa@subteacherdegreeeng{#2}
}
% 申请学位级别(题名页)
\def\buaa@appdegree{}
\newcommand{\applydegree}[1]{%
    \def\buaa@appdegree{#1}
}
% 论文编号
\def\buaa@thesisID{}
\newcommand{\thesisID}[1]{%
    \def\buaa@thesisID{#1}
}
% 论文提交时间
\def\buaa@commityear{}
\def\buaa@commitmonth{}
\def\buaa@commitday{}
\newcommand{\commit}[3]{%
    \def\buaa@commityear{#1}
    \def\buaa@commitmonth{#2}
    \def\buaa@commitday{#3}
}
% 授予学位时间
\def\buaa@awardyear{}
\def\buaa@awardmonth{}
\def\buaa@awardday{}
\newcommand{\award}[3]{%
    \def\buaa@awardyear{#1}
    \def\buaa@awardmonth{#2}
    \def\buaa@awardday{#3}
}
\newcommand{\summary}{%结论
  \ctexset{chapter/numbering=false}
  \chapter{结论和展望}
}
%%%%% 'buaathesis.cls' %%%%% END
