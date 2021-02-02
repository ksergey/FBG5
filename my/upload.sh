#!/bin/bash

printerIp=192.168.88.119

inputFile="${1}"
if [ -z "${inputFile}" ]; then
  echo "No input file"
  exit 1
fi

fileOnSD="${2}"
if [ -z "${fileOnSD}" ]; then
  fileOnSD="${inputFile}"
fi

curl -v -H "Content-Type:application/octet-stream" \
  http://${printerIp}/upload?X-Filename="${fileOnSD}" \
  --data-binary @"${inputFile}"
