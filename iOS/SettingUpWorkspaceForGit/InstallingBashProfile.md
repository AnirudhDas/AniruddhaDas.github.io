# Installing Bash Profile

### Option 1

**Step 1:** Download the `.bash_profile` file.

**Step 2:** Copy it to `root` directory from `terminal`.

```
cd ~
cp ~/Downloads/bash_profile ./.bash_profile
```

**Step 3:** Close terminal and `restart` terminal.

### Option 2

**Step 1:** Copy the entire script provided at the end of this page.

**Step 2:** Start `terminal` and run the following commands:

```
cd ~
vi .bash_profile
# Now paste copied content
# hit `Esc` and use `wq` command to save and close
```

**Step 3:** Close terminal and `restart` terminal.

**Script:**

```
# Enable tab completion
source ~/git-completion.bash

# colors!
green="\[\033[0;32m\]"
blue="\[\033[0;34m\]"
purple="\[\033[0;35m\]"
reset="\[\033[0m\]"

# Change command prompt
source ~/git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1
# '\u' adds the name of the current user to the prompt
# '\$(__git_ps1)' adds git-related stuff
# '\W' adds the name of the current directory
export PS1="$purple\u$green\$(__git_ps1)$blue \W $ $reset"
```