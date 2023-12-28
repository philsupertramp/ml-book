# LaTeX Starter Project
Idea: Setting up a project structure for LaTeX large documents is tideous. This repository shall act like a template.

## Structure
- Write your LaTeX code in `src/`.
- Locate your library and definition files in `src/lib/`
- Place your asset files / images in `src/images/`

## Build Process
To build the project simply run
```shell
make build PROJECT_NAME=YOUR_PROJECT_NAME
```
this will automatically
1. Build a docker image that is used to build your LaTeX document
2. Compile your document(s) (incl. bibtex references)
3. Collect log files of all `pdflatex` runs
4. Add a `YOUR_PROJECT_NAME.pdf` file

