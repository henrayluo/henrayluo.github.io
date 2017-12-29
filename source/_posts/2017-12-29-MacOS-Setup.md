title: My MacOS Setup
date: 2017-12-29 10:48:21
tags: Mac Software
---

### Terminal

![My Terminal Setup](/assets/blogImg/2017-12-29-Terminal.jpeg)

* [Oh-My-ZSH](http://ohmyz.sh/)
* [powerlevel9k](https://github.com/bhilburn/powerlevel9k)
* [Nerd-Fonts](https://github.com/ryanoasis/nerd-fonts)
* [Color scheme(3024 Night)](https://github.com/lysyi3m/osx-terminal-themes)

.zshrc Configiration

```
POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_SHORTEN_DIR_LENGTH=3
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_middle"
POWERLEVEL9K_STATUS_VERBOSE=false
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(status os_icon dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(ram load time)
POWERLEVEL9K_SHOW_CHANGESET=true
POWERLEVEL9K_CHANGESET_HASH_LENGTH=6

ZSH_THEME="powerlevel9k/powerlevel9k"
```
