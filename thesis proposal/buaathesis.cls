\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{buaathesis}[2017/08/01 v0.1 buaathesis document class]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessOptions
\LoadClass[zihao=-4,a4paper,fancyhdr,hyperref]{ctexbook}
\RequirePackage{fontspec} %[cm-default]选项主要用来解决使用数学环境时数学符号不能正常显示的问题
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{graphicx}
%\RequirePackage{fancyhdr}
%\RequirePackage{fix-cm}
\usepackage{indentfirst} %首行缩进
\setlength{\parindent}{2em}

\AtBeginDocument{\makeatletter\input{buaathesis.cfg}\makeatother}
%行间距
\renewcommand{\baselinestretch}{1.5}

% 中文断行
\XeTeXlinebreaklocale "zh"
\XeTeXlinebreakskip = 0pt plus 1pt minus 0.1pt
%\setCJKfamilyfont{zhsong}{SimSun}
%\setCJKfamilyfont{zhhei}{SimHei}
%\setCJKfamilyfont{zhfs}{Fangsong}
%\setCJKfamilyfont{zhkai}{KaiTi}
%
%\newcommand*{\songti}{\CJKfamily{zhsong}} % 宋体
%\newcommand*{\heiti}{\CJKfamily{zhhei}}   % 黑体
%\newcommand*{\kaishu}{\CJKfamily{zhkai}}  % 楷书
%\newcommand*{\fangsong}{\CJKfamily{zhfs}} % 仿宋
%\newcommand\fontnamemono{FreeMono}
%\newcommand\fontnameroman{Times New Roman}

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


%\bibliographystyle{unsrt}
\bibliographystyle{buaathesis}

%\renewcommand\contentsname{目录}
%\renewcommand\refname{参考文献}
%\renewcommand\figurename{图 }

%设置文档正文字体为宋体
%\setCJKmainfont[
%BoldFont=\heiti,
%ItalicFont=\kaishu,
%SmallCapsFont=\heiti
%]{\songti}
%\setCJKsansfont{\heiti}
%\setCJKmonofont{\fangsong}


% 生成目录和链接
\usepackage[unicode,
  bookmarksnumbered,
  bookmarksopen,
  colorlinks,
  citecolor=blue,
  linkcolor=blue]{hyperref}

% 页边距
\usepackage[top=1in,bottom=1in,left=1.25in,right=1.25in]{geometry}

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
\begin{center}
\end{center}
\begin{center}
\vskip 50bp
\centerline{\bfseries\xiaoerhao{\kaishu\@schoolname}}
\vskip 40bp
\centerline{\bfseries\heiti\yihao{\@title}}
\vskip 100bp
\end{center}


\sanhao
\begin{center}
\begin{tabular}{c p{240bp}}
  {{\bfseries \kaishu\@papertitle@label}}& \kaishu\@papertitle\\ %\cline{2-2}
   \bfseries \kaishu\xiaosanhao{\@specialty@label}& \kaishu\@specialty\\ %\cline{2-2}
   \bfseries \kaishu\xiaosanhao{\@researcharea@label}& \kaishu\@researcharea\\ %\cline{2-2}
   \bfseries \kaishu\xiaosanhao{\@author@label}& \kaishu\@author\\ %\cline{2-2}
   \bfseries \kaishu\xiaosanhao{\@studentnumber@label}& \kaishu\@studentnumber\\ %\cline{2-2}
   \bfseries \kaishu\xiaosanhao{\@advisor@label}& \kaishu\@advisor\\ %\cline{2-2}
\end{tabular}
\end{center}

\vskip 40bp
\centerline{\heiti\sanhao{\@schoolname}}
\centerline{\heiti\xiaosanhao{\@date}}
\end{titlepage}
}
