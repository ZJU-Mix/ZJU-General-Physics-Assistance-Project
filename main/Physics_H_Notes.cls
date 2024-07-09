\ProvidesClass{Physics_H_Notes}
%模板名称
%-------------------------------------------------------------
\LoadClass[openany, 11pt, a4paper, oneside]{ctexbook}
%使用中文书籍文档类
%-------------------------------------------------------------
\RequirePackage{geometry}
\geometry{left=3cm,right=3cm,top=3cm,bottom=3cm}
%版面大小设计
%-------------------------------------------------------------
\RequirePackage{comment}
%为编辑方便，允许使用注释环境comment
%-------------------------------------------------------------
\RequirePackage{tikz}
%绘制封面
%-------------------------------------------------------------
\RequirePackage{graphicx}
\RequirePackage{float}
\graphicspath%
{%
    {../figures/figure1/},
    {../figures/figure2/},
    {../figures/figure3/},
    {../figures/figure4/},
    {../figures/figure5/},
    {../figures/figure6/},
    %{../figures/cover/}
}
%图片地址
\newcommand{\illustyle}{\itshape}
\NewDocumentEnvironment{singlefigure}{omO{0.95}}%
{%
	\begin{figure}[H]%
		\centering%
		\includegraphics[width=#3\textwidth]{#2}%
		\IfNoValueTF{#1}{\par}{\vspace{-1.2ex}\caption{#1\labelrootmark{#2}}}%
		\illustyle%
}%
{%
	\end{figure}%
}
%单张图片，环境内容为注释，均居中
%-------------------------------------------------------------
%\RequirePackage{keyval}
%模板key定制
\definecolor{titlepagecolor}{cmyk}{1,.60,0,.40}
\definecolor{c1}{RGB}{62, 97, 127}
\definecolor{c2}{RGB}{104, 182, 182}
\definecolor{c3}{RGB}{107, 190, 190}
\definecolor{c4}{RGB}{100, 172, 174}
\definecolor{c5}{RGB}{95, 162, 162}
\setmainfont{Times New Roman}
\begin{comment}
	
% 初始化一些命令用于保存封面信息
\def\fancybook@theme@color{green}
\def\fancybook@title{}
% 标题

\def\fancybook@subtitle{}
% 副标题

\def\fancybook@author{}
% 作者

\def\fancybook@cover@picture{}
% 封面插图

\def\fancybook@cover@color{}
% 封面 `带子' 颜色

\define@key{fancybook/cover}{title}{%
	\def\fancybook@title{#1}
}

\define@key{fancybook/cover}{subtitle}{%
	\def\fancybook@subtitle{#1}
}

\define@key{fancybook/cover}{author}{%
	\def\fancybook@author{#1}
}

\define@key{fancybook/cover}{picture}{%
	\def\fancybook@cover@picture{#1}
}

\define@key{fancybook/cover}{color}{%
	\def\fancybook@cover@color{#1}
}

\define@key{fancybook}{cover}{
	\setkeys{fancybook/cover}{#1}
}

\def\fancybooksetup#1{%
	\setkeys{fancybook}{#1}
}
% 使用 keyval 宏包，对外暴露 `key-value' 形式的接口以便用户能够修改封面信息

\def\maketitle{%
	\begin{titlepage}
        \begin{tikzpicture}[remember picture, overlay]
            \node[inner sep = 0pt, anchor = north west] at (current page.north west) {
                \includegraphics[width = \paperwidth, height = .45\paperheight]{\fancybook@cover@picture}};
            \fill[color = \fancybook@cover@color] ([yshift = -.45\paperheight]current page.north west) rectangle ++ (\paperwidth, -.05\paperheight);
            \node[anchor = north east, inner sep = 2cm] at (current page.east) {
                \begin{minipage}{.75\paperwidth}
                    \begin{flushright}
                        {\zihao{-1}\bfseries\fancybook@title} \\[.5cm]
                        {\zihao{-2}\bfseries\fancybook@subtitle} \\[.75cm]
                        {\zihao{-3}\kaishu\fancybook@author}
                    \end{flushright}
                \end{minipage}
            };
        \end{tikzpicture}
	\end{titlepage}
}
%封面定义
\end{comment}
%-------------------------------------------------------------
\RequirePackage%
[	bookmarksopen=true,
	bookmarksnumbered=true,
	pdfborder={0 0 0},
	colorlinks=true,
	linkcolor=blue,
	hyperfootnotes=false,
	urlcolor=blue,
	anchorcolor=blue,
	citecolor=blue
]{hyperref}
%启用超链接和书签目录
%-------------------------------------------------------------
\RequirePackage{ocgx2}
%启用交互健
\RequirePackage{calc}
%为方便计算交互词长度，使用宏包calc
\newlength{\ItrLenMax}
\newcounter{ItrCtr}
\colorlet{plainred}{red!80!black}
\colorlet{plaincyan}{cyan!80!black}
\colorlet{plaingreen}{green!70!black}
\colorlet{orangepink}{orange!20!pink}

%常用颜色，主要是护眼（）
\newcommand{\itr}[2]%
{%
	\setlength{\ItrLenMax}{\maxof{\widthof{#1}}{\widthof{#2}}}%记录长度最大值
	\stepcounter{ItrCtr}%
	\ %前后距离修正
	\makebox[\ItrLenMax][c]%
	{%做一个盒子，取最大长度，美观起见居中
		\switchocg{itr\theItrCtr}%
		{%
			\begin{ocg}{itr\theItrCtr}{itr\theItrCtr}{1}%
				\textcolor{plaincyan}{\textit{#1}}%
			\end{ocg}
		}%
	}%
	\hspace{-\ItrLenMax}%长度修正，防止中英互换时盒子偏移
	\makebox[\ItrLenMax][c]%
	{%
		\begin{ocmd}{\Not{itr\theItrCtr}}%
			\textcolor{plaincyan}{#2}%
		\end{ocmd}%
	}%
}
%可交互词定义
%-------------------------------------------------------------
\newcommand{\En}[1]%
{%
	\textcolor{plainred}{\textit{#1}}%
}
%写英文时使用该命令，修改颜色
%-------------------------------------------------------------
\counterwithin{footnote}{chapter}
%让脚注编号随章改变
\renewcommand{\thefootnote}%
{%
	{\textcolor{teal!60!black}{[\arabic{footnote}]}}%
}
%设置脚注样式

\RequirePackage[Mgcounter=chapter,Mglength=5em]{mgnote}
%使用自己编写的mgnote包编辑边注
%-------------------------------------------------------------
\RequirePackage{xcolor}
\RequirePackage{fancyhdr}
\pagestyle{fancy}
\makeatletter
\def\headrule{{\if@fancyplain\let\headrulewidth\plainheadrulewidth\fi%
		\hrule\@height 1.0pt \@width\headwidth\vskip1pt%上面线为1pt粗
		\hrule\@height 0.5pt\@width\headwidth%下面0.5pt粗
		\vskip-2\headrulewidth\vskip-1pt}%两条线的距离1pt
	\vspace{6mm}}%双线与下面正文之间的垂直间距
\makeatother
%双线页眉
\renewcommand{\footrulewidth}{0.4pt}
%单线页脚
\cfoot{\em\large\thepage}
%页面样式设置

\RequirePackage[Bjornstrup]{fncychap}
%章结构优化显示
%-------------------------------------------------------------
\newcommand{\dove}%
{%
	{%
		\normalsize%
		\mbox%
		{%
			\raisebox{0.2ex}{\itshape\mdseries\large 斑}%
			\hspace{-0.2em}%
			\raisebox{1.4ex}{\tiny\normalfont 咕}%
			\hspace{-0.55em}%
			\raisebox{-0.6ex}{\bfseries\normalsize 鸠}%
			\hspace{-1.4em}%
			\raisebox{-0.75ex}{\tiny\normalfont 咕}%
		}%
		\quad%
	}%
}
%作者：陈锦浩logo
%-------------------------------------------------------------
\RequirePackage{amsmath}
\RequirePackage{bm}
%数学公式排版宏包
\newcommand{\upperline}[1]{\raisebox{1.5ex}{$\dfrac{}{\mbox{$#1$}}$}}
%使用新构建命令\upperline获得带上划线的文字，默认在数学模式下使用
\renewcommand{\vec}[1]{\boldsymbol{#1}}
%向量采用粗体显示
%-------------------------------------------------------------

\RequirePackage[Clever,Unified]{reftree}
%交叉引用设置采用自己编写的reftree宏包，实现超链接卡片
%-------------------------------------------------------------
\newcommand{\eg}{{\itshape e.g.}\ }
%举例子e.g.缩写

\newcommand{\dif}{\mathrm{d}}
%微分符号d的定义命令
%-------------------------------------------------------------
\RequirePackage{tabularray}
%利用tabularray宏包编写表格
%-------------------------------------------------------------
\RequirePackage{tcolorbox}
\tcbuselibrary{most}
\newenvironment{Itemize}{\begin{itemize}}{\end{itemize}}
\tcolorboxenvironment{Itemize}%
{
	blanker,
	before skip = 10pt,
	after skip = 10pt,
	borderline west = {3mm}{13pt}{red!10!white}
}
%设计书签格式itemize

\newcounter{law}
\counterwithin{law}{chapter}
\renewcommand{\thelaw}{{\large\arabic{chapter}}.\arabic{law}}
\newtcolorbox{lawbox}[1][1]%
{
	colback=cyan!10!white,
	colbacktitle=yellow!10!white,
	coltitle=plainred,
	title={\itshape 定理\thelaw\labelrootmark{law\arabic{chapter}.\arabic{law}}\ #1},
	colframe=black!50!white,
	boxrule=0.6pt,
	breakable
}
\NewDocumentEnvironment{law}{O{未命名定理}}%
{%
	\refstepcounter{law}%
	\labelroot*{law\arabic{chapter}.\arabic{law}}[3.2ex]%
	\begin{lawbox}[#1]%
}%
{%
	\end{lawbox}%
}

%定理环境law

\newcounter{prove}
\counterwithin{prove}{chapter}
\renewcommand{\theprove}{{\large\arabic{chapter}}.\arabic{prove}}
\newtcolorbox{provebox}[1][1]%
{
	colback=cyan!10!white,
	colbacktitle=yellow!10!white,
	coltitle=plainred,
	title={\itshape 证明\theprove\labelrootmark{prove\arabic{chapter}.\arabic{prove}}\ #1},
	colframe=black!50!white,
	boxrule=0.6pt,
	breakable
}
\NewDocumentEnvironment{prove}{O{未知证明目标}}%
{%
	\refstepcounter{prove}%
	\labelroot*{prove\arabic{chapter}.\arabic{prove}}[3.2ex]%
	\begin{provebox}[#1]%
}%
{%
	\end{provebox}%
}

%证明环境prove
\newcounter{example}
\counterwithin{example}{chapter}
\renewcommand{\theexample}{{\large\arabic{chapter}}.\arabic{example}}
\newtcolorbox{examplebox}[1][1]%
{
	colback=green!2!white,
	colbacktitle=yellow!10!white,
	coltitle=plaingreen,
	title={\itshape 习题\theexample\labelrootmark{example\arabic{chapter}.\arabic{example}}\ #1},
	colframe=black!50!white,
	boxrule=0.6pt,
	breakable
}
\NewDocumentEnvironment{example}{O{未命名习题}}%
{%
	\refstepcounter{example}%
	\labelroot*{example\arabic{chapter}.\arabic{example}}[3.2ex]%
	\begin{examplebox}[#1]%
}%
{%
	\end{examplebox}%
}
%习题环境example

\newcounter{EXAMPLE}
\counterwithin{EXAMPLE}{chapter}
\renewcommand{\theEXAMPLE}{{\large\arabic{chapter}}.\arabic{EXAMPLE}}
\newtcolorbox{EXAMPLEbox}[1][1]%
{
	colback=cyan!5!white,
	colbacktitle=red!5!white,
	coltitle=black!70!white,
	title={\itshape 例题\theEXAMPLE\labelrootmark{EXAMPLE\arabic{chapter}.\arabic{EXAMPLE}}\ #1},
	colframe=black!50!white,
	boxrule=0.6pt,
	breakable
}
\NewDocumentEnvironment{EXAMPLE}{O{未命名例题}}%
{%
	\refstepcounter{EXAMPLE}%
	\labelroot*{EXAMPLE\arabic{chapter}.\arabic{EXAMPLE}}[3.2ex]%
	\begin{EXAMPLEbox}[#1]%
	}%
	{%
	\end{EXAMPLEbox}%
}
%例题环境EXAMPLE

\newcounter{solution}
\counterwithin{solution}{chapter}
\renewcommand{\thesolution}{{\large\arabic{chapter}}.\arabic{solution}}
\newtcolorbox{solutionbox}[1][1]%
{
	colback=green!2!white,
	colbacktitle=yellow!5!white,
	coltitle=green!50!black,
	title={\itshape {\large Solution:\thesolution\labelrootmark{solution\arabic{chapter}.\arabic{solution}}}\ #1},
	colframe=black!50!white,
	boxrule=0.6pt,
	breakable
}
\NewDocumentEnvironment{solution}{O{未给定习题解答}}%
{%
	\refstepcounter{solution}%
	\labelroot*{solution\arabic{chapter}.\arabic{solution}}[3.2ex]%
	\begin{solutionbox}[#1]%
}%
{%
	\end{solutionbox}%
}
%解答环境solution
\Crefname{law}{定理}{定理}
\Crefname{example}{习题}{习题}
\Crefname{solution}{Solution}{Solution}
\Crefname{prove}{Prove}{Prove}
\Crefname{EXAMPLE}{例题}{例题}
%各环境的引用头
%-------------------------------------------------------------
\newcounter{apart}
\counterwithin{chapter}{apart}
\newcommand{\apart}[1]%
{
	\newpage
	\thispagestyle{empty}
	\stepcounter{apart}%
	\addcontentsline{toc}{chapter}{\large #1}%
	\begin{tikzpicture}[overlay,remember picture,font=\sffamily\bfseries]
		\fill[fill=green!2!white] (current page.south west) rectangle (current page.north east);  
		
		\draw[ultra thick,c4,name path=big arc] ([xshift=-2mm]current page.north) arc(150:285:11)
		coordinate[pos=0.225] (x0);
		\begin{scope}
			\clip ([xshift=-2mm]current page.north) arc(150:285:11) --(current page.north
			east);
			\fill[c4!50,opacity=0.25] ([xshift=4.55cm]x0) circle (4.55);
			\fill[c4!50,opacity=0.25] ([xshift=3.4cm]x0) circle (3.4);
			\fill[c4!50,opacity=0.25] ([xshift=2.25cm]x0) circle (2.25);
			\draw[ultra thick,c4!50] (x0) arc(-90:30:6.5);
			\draw[ultra thick,c4] (x0) arc(90:-30:8.75);
			\draw[ultra thick,c4!50,name path=arc1] (x0) arc(90:-90:4.675);
			\draw[ultra thick,c4!50] (x0) arc(90:-90:2.875);
			\path[name intersections={of=big arc and arc1,by=x1}];
			\draw[ultra thick,c4,name path=arc2] (x1) arc(135:-20:4.75);
			\draw[ultra thick,c4!50] (x1) arc(135:-20:8.75);
			\path[name intersections={of=big arc and arc2,by={aux,x2}}];
			\draw[ultra thick,c4!50] (x2) arc(180:50:2.25);
		\end{scope} 
		\path[decoration={text along path,text color=c4,
			raise = -2.8ex,
			text  along path,
			text = {|\sffamily\bfseries|},
			text align = center,
		},
		decorate
		] ([xshift=-2mm]current page.north) arc(150:245:11);
		%
		\begin{scope}
			\path[clip,postaction={fill=yellow!10!white}]
			([xshift=2cm,yshift=-9.5cm]current page.center) rectangle ++ (4.2,7.7);
			\draw[ultra thick,plaincyan] ([xshift=-1.5cm,yshift=-9.5cm]current page.center) 
			arc(180:0:2);
			\draw[ultra thick,plaincyan] ([xshift=0.5cm,yshift=-9.5cm]current page.center) 
			arc(180:0:2);
			\draw[ultra thick,plaincyan] ([xshift=2.5cm,yshift=-9.5cm]current page.center) 
			arc(180:0:2);
			\draw[ultra thick,plaincyan] ([xshift=4.5cm,yshift=-9.5cm]current page.center) 
			arc(180:0:2);
			\fill[red!20!white] ([xshift=2.5cm,yshift=-9.5cm]current page.center) +(60:2) circle(1.5mm);
			\node[text=c5!80!black] at ([xshift=4.7cm,yshift=-6.7cm]current page.center) {\LARGE \hspace*{-3.9em}G.P.A};
		\end{scope}
		%
		\fill[red!5!white] ([xshift=2cm,yshift=-9.5cm]current page.center) rectangle ++ (-13.7,7.7);
		\fill[red!10!white]([xshift=-2cm,yshift=-7.3cm]current page.center) rectangle ++ (-9.7,3);
		\node[text=black!60!white,anchor=west,scale=4,inner sep=0pt] at
		([xshift=-10.55cm,yshift=-5.8cm]current page.center) {\ \,#1};
		\fill[orangepink!60!white] ([xshift=-2cm,yshift=-7.3cm]current page.center) -- ([xshift=-2cm,yshift=-4.3cm]current page.center) -- ([xshift=-1cm,yshift=-5.8cm]current page.center) -- cycle;
	\end{tikzpicture}
}
\renewcommand{\thechapter}{\arabic{chapter}}
\endinput







