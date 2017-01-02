# Git Hooks

### Introduction

Git Hooks are scripts that run automatically every time a particular event occurs in a Git repository. They let you customize Git’s internal behavior and trigger customizable actions at key points in the development life cycle.

### Directory

Git Hooks reside in the ```.git/hooks``` directory of every Git repository. 

### Installation

To “install” a hook, all you have to do is remove the ```.sample``` extension. Or, if you’re writing a new script from scratch, you can simply add a new file matching one of the above filenames, minus the `.sample` extension.

### Example of `prepare-commit-msg` hook

Remove the `.sample` extension from this script, and add the following to the file:

      #!/bin/sh

      echo “#Any Commit Comment!" > $1

Make sure that `prepare-commit-msg` is executable, you would run the following command:

```
chmod +x prepare-commit-msg
```

### Example of `pre-commit` hook

Use this file to execute some command during `git commit`.

```
tailor -f html * > tailor.html
# Use following command to upload your file in slack channel
curl -F file=@tailor.html -F channels=testslackwebhooks -F token=xoxp-11455772647-64939065205-68361930212-6ac5082626 https://slack.com/api/files.upload &
cd Desktop/FastlaneSnapshot/
scan
cd fastlane/test_output/
curl -F file=@report.html -F channels=testslackwebhooks -F token=xoxp-11455772647-64939065205-68361930212-6ac5082626 https://slack.com/api/files.upload
cd ../
snapshot
cd fastlane/screenshots/en-US
for f in *.png
do
curl -F file=@$f -F channels=testslackwebhooks -F token=xoxp-11455772647-64939065205-68361930212-6ac5082626 https://slack.com/api/files.upload
done
# cd ../../../../../../..
```

All these commands will execute whenever we will commit your source code to git repository.



