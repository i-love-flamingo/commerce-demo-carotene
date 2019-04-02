#!/bin/bash

echo "Preparing merged file for common side.. (main)"
goi18n merge -sourceLanguage en-gb -format yaml -outdir translations/merged translations/src/*.json

#goi18n merge -sourceLanguage en-gb -format yaml -outdir translations/merged translations/src/*.json translations/translated/*.yaml

