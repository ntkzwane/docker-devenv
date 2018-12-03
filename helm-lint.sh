#!/bin/bash

if [ $# -ne 2 ]; then
	echo "Usage: $0 chart_name chart_directory";
	exit 1;
fi

# this workaround exists because there is a constraint that currently affects `helm package` and `helm lint` that
# enforces the chart directory name and chart name be the same. This will no longer be needed once this feature is
# closed: https://github.com/helm/helm/issues/1979

CHART_NAME=$1
CHART_DIRECTORY=$2
TEMP_PATH=/tmp/helm-lint-$(date +%s)/

trap cleanup SIGINT
trap cleanup SIGKILL
trap cleanup SIGTERM
trap cleanup SIGSTOP
trap cleanup EXIT

function cleanup() {
  rm -rf ${TEMP_PATH}
}

mkdir ${TEMP_PATH}
cp -r ${CHART_DIRECTORY} ${TEMP_PATH}${CHART_NAME}
helm lint ${TEMP_PATH}${CHART_NAME}

exit $?

