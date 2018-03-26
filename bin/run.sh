#!/usr/bin/env bash

if [ -z $1 ] ; then
	dev_appserver.py app.yaml --port=8085
else
  dev_appserver.py app.yml "$1"/api.yaml dispatch.yaml --port=8085
fi
