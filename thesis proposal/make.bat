@echo off
tasklist|find /i "Acrobat.exe" && taskkill /f /im Acrobat.exe && del proposal.pdf

del proposal.blg
del proposal.dvi
del proposal.idx
del proposal.log
del mian.lof
del proposal.lot
del proposal.toc
del proposal.out
del proposal.synctex
del proposal.ind
del proposal.aux
del proposal.ilg

xelatex -shell-escape proposal.tex
makeindex proposal.idx
bibtex proposal
xelatex -shell-escape proposal.tex


proposal.pdf 
exit
