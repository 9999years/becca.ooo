STYLES=assets/styles
RENDERED_CSS=static/css
PUBLIC=public
# typescript compiler
TSC=tsc
FIND=find
SCRIPTS=assets/scripts
RENDERED_JS=static/js

HUGO=hugo
SASS=sass
SASS_OPTS=--style=compressed

${PUBLIC}: ${RENDERED_CSS}/ ${SCRIPTS}/
	${HUGO}

.PHONY: vars
vars:
	export STYLES="${STYLES}"
	export RENDERED_CSS="${RENDERED_CSS}"
	export PUBLIC="${PUBLIC}"
	export TSC="${TSC}"
	export TSC_OPTS="${TSC_OPTS}"
	export FIND="${FIND}"
	export SCRIPTS="${SCRIPTS}"
	export RENDERED_JS="${RENDERED_JS}"
	export HUGO="${HUGO}"
	export SASS="${SASS}"
	export SASS_OPTS="${SASS_OPTS}"

${RENDERED_JS}/: ${SCRIPTS}/
	find -name '*.ts' -or -name '*.js' \
		-exec ${TSC} {} +

${RENDERED_CSS}/: ${STYLES}/
	mkdir -p ${RENDERED_CSS}
	sass ${SASS_OPTS} $<:$@

.PHONY: clean
distclean: clean
clean:
	rm -rf ${RENDERED_CSS}
	rm -rf ${PUBLIC}
