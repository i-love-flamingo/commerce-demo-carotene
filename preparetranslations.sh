#!/bin/bash

echo "Preparing merged file for common side.. (main)"
bin/goi18n merge -sourceLanguage en-gb -format yaml -outdir translations/merged translations/src/*.json

#bin/goi18n merge -sourceLanguage en-gb -format yaml -outdir translations/merged translations/src/*.json translations/translated/*.yaml

