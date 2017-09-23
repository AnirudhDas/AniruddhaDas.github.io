# Git Commands

1.
 
```
git add .
```

2.

```
git commit -m "<Commit Message>"
```

3.

```
git pull origin <Branch Name>
```

4.

```
git push origin <Branch Name>
```

5.

```
git reset --hard
```

6.

```
git status
```

7.

```
git checkout <Branch Name>
```

8.

```
git clone <Repository URL>
```

9.

```
git push origin --mirror
```

10.

```
git tag
```

11.

```
git tag <Tag Number>
```

12.

```
git tag --delete 1.0.1 1.0.2 1.0.3
```

13.

```
git branch <new-branch-to-be-created>
```

14.

```
git branch -d <branch-to-be-deleted>
```

or

```
git branch -D <branch-to-be-deleted>
```

15.

```
git git stash create <stash-message>
```

### How to take checkout of the code before previous two commits?

```
git pull origin master
```

```
git log -2
```

```
git checkout 592985dca2f7f7bfa8d10795ac63c190700d61c4
```

Here, `592985dca2f7f7bfa8d10795ac63c190700d61c4` is the commit number before previous two commits, which appears after `git log -2`.