#!/bin/bash

echo "Preparing merged file for common side.. (main)"
go run github.com/nicksnyder/go-i18n/goi18n merge -sourceLanguage en-gb -format yaml -outdir translations/merged translations/src/*.json
