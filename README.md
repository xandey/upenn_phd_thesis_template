# LaTeX template for UPenn PhD thesis
This is a full template which allows you to separate your thesis from the supplied code.

## Features
This contains all packages that I needed and a few things that were a bit harder to get working.

* Todo list. Allows \\todo command which is visible in draft mode and not in final mode. See [todonotes](http://www.ctan.org/tex-archive/macros/latex/contrib/todonotes/) package for more info.
* Git tag information can be added to draft version footer.
* Subfiles allows for creating chapter sections and using paper directories.
 * Makefile will compile individual chapters for faster editing

## Getting Started
In order to quickly get started using this LaTeX class:

* Check out package. Rename directory, remove .git folder and initalize your own version control system.
* Edit 8\_tex/commands.tex this contains custom commmands (these were functions other people had used in papers)
* Edit 8\_tex/names.tex to contain your information (Comittee, Title, Name, etc.)
* Edit 8\_tex/main.tex to contain all information about your content (tex files, bib files, graphicspaths)
* Use 0\_chapt.tex as an example chapter, replicate for your own. For each new chapter.
 * Create 1\_newchapt.tex
 * Create 1\_chapt/chapt\_main.tex containing all code and references
 * Edit 8\_tex/main.tex and add \subfile{1\_chapt}
* Run make from root directory

## [Gitinfo](http://www.ctan.org/tex-archive/macros/latex/contrib/gitinfo) package
This is setup to add a git short hash in the bottom right corner of pages. This hash is enabled by default, but needs the following command to be run. I wasn't able to make this enabled by default as I can't seem to get make to make the targets in the correct order.
     
     (git init)
     make gitHeadInfo.gin

# TODO
* Add graphics examples for testing and demonstration.

# Known Issues
* Unable to make gitHeadInfo.gin before the stuff that depends on it. Also, can't figure out how to detect dependency on gitHeadInfo.gin for targets automatically.