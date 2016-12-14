.PHONY: all clean view

paper_name=master
master_tex=${paper_name}.tex
tex_sources=${shell ls *.tex} 
bibf=bibs.bib
pdf_output=paper.pdf

all: pdf_output

#TODO: 在编译结束以后使用了grep来显示出错的地方，但是
#如果不存在出错的话grep会返回一个错误，导致make停止。
#虽然可以使用减号前缀让make继续，但是仍然会显示一个错误
#信息。有没有什么办法让make闭嘴？
pdf_output: ${tex_source} ${bibf}
	xelatex ${master_tex}
	bibtex ${paper_name}
	xelatex ${master_tex}
	xelatex ${master_tex}
	@echo 
	@echo ========= Compiling results
	-@grep Error *.log -Hn
	-@grep Warning *.log -Hn
	cp master.pdf ../literature_review.pdf

clean:
	rm -f *.aux *.pdf *.bbl *.blg *.log *.toc
