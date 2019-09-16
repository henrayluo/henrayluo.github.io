title: macOS Setup
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

### Karabiner

[Karabiner](https://github.com/tekezo/Karabiner)(KeyRemap4MacBook) is a powerful utility for keyboard customization.

rules: Vi Mode [D as Trigger Key] (recommended).

### Mos

[Mos](https://github.com/Caldis/Mos) 一个用于在 MacOS 上平滑你的鼠标滚动效果或单独设置滚动方向的小工具, 让你的滚轮爽如触控板 | A lightweight tool used to smooth scrolling and set scroll direction independently for your mouse on MacOS.

简单讲，这家伙可以为我的黑苹果省一块 [Magic Trackpad 2(秒控板 2)](https://www.apple.com/cn/shop/product/MRMF2?fnode=4c)。

### [QuickLook Plugins](https://github.com/sindresorhus/quick-look-plugins)

### 百度云加速下载

* [aria2gui](https://github.com/yangshun1029/aria2gui)
* [Chrome扩展BaiduExporter](https://github.com/acgotaku/BaiduExporter) 不要去release页面下载旧版本，直接在仓库中有较新的版本呢 -_-
 
