#!make

GITREF=`git rev-parse --abbrev-ref HEAD |  sed -e 's/\(.*\)/\L\1/'`
K8S_NAMESPACE=dev
export

env:
	@echo "GITREF: ${GITREF}"
	@echo "K8S_NAMESPACE: ${K8S_NAMESPACE}"

template:
	helm template ./expressjs-restapi

uninstall:
	helm -n ${K8S_NAMESPACE} uninstall expressjs-restapi-${GITREF}

install:
	helm -n ${K8S_NAMESPACE} install expressjs-restapi-${GITREF} ./expressjs-restapi \
		--set image.tag=${GITREF}

reinstall: uninstall install