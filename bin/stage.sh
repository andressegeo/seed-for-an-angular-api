#!/usr/bin/env bash

set -e

if [ -z $1 ] || [ -z $2 ] ; then
	echo "Usage: $0 <version> <gcloud account>"
	exit 1
fi

echo "==== Building app for production ===="

perl -pi -e "s/'dev'/'staging'/g" app.yaml

ng build --prod

echo "==== Deploying app to App Engine ===="

sanitized_version=$(echo $1 | tr . -)

gcloud app deploy \
    app.yaml \
    --account=$2 \
    --project=gestion-groupes-dev \
    --version=${sanitized_version}

perl -pi -e "s/'staging'/'dev'/g" app.yaml
