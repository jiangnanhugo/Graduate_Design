::======================================
:: Filename: mamske.bat
:: Author:   Joseph
:: Created:  2012 - 07 - 12
:: E-mail:   mrpeng000@gmail.com
:: Author: Nan Jiang
:: Created: 2016 - 12 -12
:: E-mail: jiangnan.hugo@gmail.com
::======================================
:: USER NOTEIFICATION
::
::   1. generating pdf
::   msmake master [full]
::     在当前目录下编译论文，将执行xelatex命令，若无相应的cls/bst文件，将直接报错
::      - full 为首次编译或完全清空时的选项，将执行xelatex->bibtex->xelatex->xelatex命令
::   2. clean file
::   msmake clean/dclean
::     - clean: clean temp file
::     - dclean: clean all file
::
::======================================

@echo off
:init
if /i {%1}=={master} goto thesis
if /i {%1}=={clean} goto clean
if /i {%1}=={dclean} goto dclean
if /i {%1}=={help} goto help
if /i {%1}=={} goto help
goto help

::======================================
:: COMPLING MY　TEMPLATE
::======================================
:thesis
echo compiling your latex file
if not exist buaathesis.cls goto clserr
if not exist buaathesis.bst goto bsterr

call xelatex %main%
if {%2}=={full} (goto full)
if errorlevel 1 goto myerr1
echo succeed generating pdf...
call %main%.pdf
goto end
:full
call bibtex %main%
if errorlevel 1 goto biberr
call xelatex %main%
call xelatex %main%
if errorlevel 1 goto myerr1
echo pdf generation succeed!
call %main%.pdf
goto end

::======================================
:: DELETE TEMP FILE INFORMATION
::======================================
:clean
echo deleting temp file...
del /f /q /s *.log *.glo *.idx *.ilg *.lof *.ind *.out *.thm *.toc *.lot *.loe *.out.bak *.blg *.synctex.gz
del /f /s *.dvi *.ps
goto end
:dclean
del /f /q /s *.log *.glo *.idx *.ilg *.lof *.ind *.out *.thm *.toc *.lot *.loe *.out.bak *.blg *.synctex.gz
del /f /s *.dvi *.ps
del /f /q /s *.aux *.bbl *.pdf
goto end


::======================================
:: HELP INFORMATION
::======================================
:help
echo input msmake+ command to choose your operation
echo example: "msmake master"
echo msmake parameter notification:
echo     master: generate your master file
echo     clean: clean temp file  
echo     help: view help information
echo     master full  generate all the content including catalogue
goto end

::======================================
:: ERROR INFORMATION
::======================================
:myerr1
echo pdf generation failed!
goto end
:biberr
echo bib reference file not found!
goto end
:clserr
echo cls template not found!
goto end
:bsterr
echo bst template not found!
goto end

::======================================
:: end token
::======================================
:end