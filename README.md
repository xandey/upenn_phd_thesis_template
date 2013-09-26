# LaTeX template for UPenn PhD thesis
This is a full template which allows you to separate your thesis from the supplied code.

## Features
This contains all packages that I needed and a few things that were a bit harder to get working.
* Todo list. Allows \todo command which is visible in draft mode and not in final mode. See [todonotes][http://www.ctan.org/tex-archive/macros/latex/contrib/todonotes/] package for more info.
* Git tag information can be added to draft version footer.
* Subfiles allows for creating chapter sections and using paper directories.
 * Makefile will compile individual chapters for faster editing

## Getting Started
In order to quickly get started using this LaTeX class:

* Check out package. Rename directory, remove .git folder and initalize your own version control system.
* Edit 8_tex/commands.tex this contains custom commmands (these were functions other people had used in papers)
* Edit 8_tex/names.tex to contain your information (Comittee, Title, Name, etc.)
* Edit 8_tex/main.tex to contain all information about your content (tex files, bib files, graphicspaths)
* Use 0_chapt.tex as an example chapter, replicate for your own. For each new chapter.
 * Create 1_newchapt.tex
 * Create 1_chapt/chapt_main.tex containing all code and references
 * Edit 8_tex/main.tex and add \subfile{1_chapt}
* Run make from root directory

# TODO

# Known Issues