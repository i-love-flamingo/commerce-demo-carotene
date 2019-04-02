# Translation structure:

* src: 
  * This is the folder where developer add the labels and a best guess for the translation. 
  * Files should be splitted nicely (e.g. per module) - so that we can also reuse them over projects
  
* merged: 
  * This contains the "src/*.json" files merged to *.all.yaml and *.untranslated.yaml
  * The complete folder can be given to external translation
  * The files here are build on build time
  * Local you can run `./preparetranslations.sh` (requires *goi18n*)
  
  
* translated:
  * This contains the files that came back from external translation. (They are loaded after "merged")
  
# Troubleshooting
* `./preparetranslations.sh: line 4: goi18n: command not found`

  __Solution__: Install *goi18n* by executing `go get -u github.com/nicksnyder/go-i18n/goi18n`
  
* If `go get -u github.com/nicksnyder/go-i18n/goi18n` results in following error: 

  `package github.com/nicksnyder/go-i18n/goi18n: directory "/Users/patrick.schaper/.virtualgo/flamingo/src/github.com/nicksnyder/go-i18n/goi18n" is not using a known version control system`
  
  __Solution__: `rm -rf PATH_TO/.virtualgo/flamingo/src/github.com/nicksnyder/go-i18n/` and retry installation of *goi18n*
  
