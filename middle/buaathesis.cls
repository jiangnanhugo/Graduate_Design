\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{buaathesis}[2017/08/01 v0.1 buaathesis document class]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexart}}
\ProcessOptions
\LoadClass[zihao=-4,a4paper,fancyhdr,hyperref,fontset=windows,scheme=chinese]{ctexart}
\RequirePackage[sort&compress,longnamesfirst,square,super]{natbib}
%\RequirePackage{fontspec} %[cm-default]选项主要用来解决使用数学环境时数学符号不能正常显示的问题
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{titletoc}
\RequirePackage{graphicx}
%\RequirePackage{fancyhdr}
%\RequirePackage{fix-cm}
\usepackage{indentfirst} %首行缩进
\setlength{\parindent}{2em}

\AtBeginDocument{\makeatletter\input{buaathesis.cfg}\makeatother}
%行间距
\renewcommand{\baselinestretch}{1.5}

%% 中文断行
\XeTeXlinebreaklocale "zh"
\XeTeXlinebreakskip = 0pt plus 1pt minus 0.1pt


\renewcommand{\contentsname}{\heiti\zihao{-2}\bfseries 目\qquad 录}
\renewcommand\listfigurename{\heiti\zihao{-2}\bfseries 插\ 图\ 目\ 录}
\renewcommand\listtablename{\heiti\zihao{-2}\bfseries 表\ 格\ 目\ 录}

\renewcommand{\figurename}{图}
\renewcommand{\tablename}{表}


\contentsmargin{0.55em}
\titlecontents{section}
[1.5em]
{}
{\contentslabel{1.3em}}
{\hspace*{-2.3em}}
{\titlerule*[0.3pc]{.}\contentspage}
\titlecontents{subsection}
[3.8em]
{} % note that 3.8 = 1.5 + 2.3
{\contentslabel{2.0em}}
{\hspace*{-3.2em}}
{\titlerule*[0.3pc]{.}\contentspage}



%%设置常用中文字号，方便调用
\newcommand{\yihao}{\fontsize{26pt}{\baselineskip}\selectfont}
\newcommand{\erhao}{\fontsize{22pt}{\baselineskip}\selectfont}
\newcommand{\xiaoerhao}{\fontsize{18pt}{\baselineskip}\selectfont}
\newcommand{\sanhao}{\fontsize{16pt}{\baselineskip}\selectfont}
\newcommand{\xiaosanhao}{\fontsize{15pt}{\baselineskip}\selectfont}
\newcommand{\sihao}{\fontsize{14pt}{\baselineskip}\selectfont}
\newcommand{\xiaosihao}{\fontsize{12pt}{\baselineskip}\selectfont}
\newcommand{\wuhao}{\fontsize{10.5pt}{\baselineskip}\selectfont}
\newcommand{\xiaowuhao}{\fontsize{9pt}{\baselineskip}\selectfont}
\newcommand{\liuhao}{\fontsize{7.5pt}{\baselineskip}\selectfont}

\ctexset{
section={
    name={,.},
    number=\arabic{section},
    %format={\noindent\bfseries},
    %nameformat={\zihao{-3}},
    titleformat+=\raggedright%{\songti\zihao{-3}}
    },
subsection={
    name={,},
    number=\thesection.\arabic{section}
    },
}






% 生成目录和链接
\usepackage[unicode,
  bookmarksnumbered,
  bookmarksopen,
  colorlinks,
  citecolor=blue,
  linkcolor=blue]{hyperref}

% 页边距
\usepackage[top=1in,bottom=1in,left=1.2in,right=1.2in]{geometry}

% 论文题目
\gdef\@papertitle{火焰仿真}
\newcommand{\papertitle}[1]{\gdef\@papertitle{#1}}

% 关键字
\gdef\@keywords{纳维-斯托克斯方程}
\gdef\@ekeywords{Navier-Stokes}
\newcommand{\keywords}[2]{\gdef\@keywords{#1}\gdef\@ekeywords{#2}}

% 中文摘要
\newenvironment{abstract_ch}
{
\begin{center}
\sanhao{摘要}
\end{center}

}{

\textbf{关键词：\@keywords}
}

% 英文摘要
\newenvironment{abstract_en}
{
\begin{center}
\sanhao{Abstract}
\end{center}

}{

\textbf{Keyword: \@ekeywords}
}

% 学号
\gdef\@studentnumber{SY000000}
\newcommand{\studentnumber}[1]{\gdef\@studentnumber{#1}}

% 院系名称
\gdef\@schoolname{计算机学院}
\newcommand{\schoolname}[1]{\gdef\@schoolname{#1}}

% 专业名称
\gdef\@specialty{计算机科学与技术}
\newcommand{\specialty}[1]{\gdef\@specialty{#1}}

% 导师
\gdef\@advisor{郝爱民}
\newcommand{\advisor}[1]{\gdef\@advisor{#1}}

% 研究方向
\gdef\@researcharea{虚拟现实与可视化}
\newcommand{\researcharea}[1]{\gdef\@researcharea{#1}}

%\bibliographystyle{unsrt}
%\bibliographystyle{buaathesis}
\newcommand\buaathesisbib[1]{%
  \setcitestyle{numbers, round, comma, aysep={}, yysep={,}, notesep={,}}
  \setlength{\bibsep}{0.5ex}
  \setlength{\bibhang}{2em}
  \renewcommand{\bibfont}{\songti\zihao{5}}

  \bibliographystyle{buaathesis}
  \bibliography{#1}
}

% 页眉页脚
\setlength{\headheight}{15pt}
\pagestyle{fancy}
\lhead{}
\chead{\kaishu\@title}
\rhead{}
\lfoot{\kaishu\@schoolname}
\cfoot{}
\rfoot{$\cdot$~\thepage$~\cdot$}
\renewcommand{\footrulewidth}{0.5pt}


% 标题页
\renewcommand{\maketitle}{\begin{titlepage}
\thispagestyle{empty}
\linespread{1.3}
\begin{center}
\end{center}
\begin{center}
\vskip 50bp
\centerline{\bfseries\xiaoerhao{\@schoolname}}
\vskip 45bp
\centerline{\bfseries\heiti\yihao{\@title}}
\vskip 80bp
\end{center}


\sanhao
\begin{center}
\begin{tabular}{c p{290bp}}
  {{\bfseries \kaishu\@papertitle@label}}& \@papertitle\\ %\cline{2-2}
   \bfseries \kaishu\xiaosanhao{\@specialty@label}& \@specialty\\ %\cline{2-2}
   \bfseries \kaishu\xiaosanhao{\@researcharea@label}& \@researcharea\\ %\cline{2-2}
   \bfseries \kaishu \xiaosanhao{\@author@label}& \@author\\ %\cline{2-2}
   \bfseries \kaishu\xiaosanhao{\@studentnumber@label}& \@studentnumber\\ %\cline{2-2}
   \bfseries \kaishu\xiaosanhao{\@advisor@label}& \@advisor\\ %\cline{2-2}
\end{tabular}
\end{center}

\vskip 80bp
\centerline{\heiti\sanhao{\@schoolname}}
\centerline{\heiti\xiaosanhao{\@date}}
\end{titlepage}
}
