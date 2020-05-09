# Void zsh theme

Minimalistic zsh prompt theme.

![void](screenshot.png)

Features:

  - Status code
  - Current path (basename) 
  - Git branch
  - Git prompt (VOID_GIT_PROMPT=1)
  - Git prompt aliases

```
git › commit -m "update git prompt alias"
...
git › push
...
git › type push
push is an alias for git push -u origin 
```

Aliases are dynamically set up and tear down when entering a git project.


That's it.
