DOCS = ./less/docs.less
DOCS_COMPILED = ./css/docs-compiled.css
DATE=$(shell date +%I:%M%p)
CHECK=\033[32m✔ Done\033[39m
HR=\033[37m--------------------------------------------------\033[39m
PATH := ./node_modules/.bin:$(PATH)

#
# COMPILE CSS
#

build:
	@echo "\n"
	@printf "${DATE} · \033[35mCompiling Preboot...\033[39m"
	@recess --compile ${DOCS} > ${DOCS_COMPILED}
	@echo "\033[32m Success!\033[39m"

#
# WATCH LESS FILES
#

watch:
	echo "Watching less files..."; \
	watchr -e "watch('less/.*\.less') { system 'make' }"
