# Apply basic settings for Git

### Set up editor for commit and merge messages

```
git config --global core.editor "'/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl' -n -w"
```

### Setup default push type

```
git config --global push.default upstream
```

### Setup default merge type

```
git config --global merge.conflictstyle diff3
```

### Setup default user name

```
# Set your name
git config --global user.name "Aniruddha Das"

git config --global user.name # Verify
# Aniruddha Das
```

### Setup default email id

```
# Set an email
git config --global user.email "cse.anirudh@gmail.com" 

git config --global user.email # Verify
# cse.anirudh@gmail.com
```