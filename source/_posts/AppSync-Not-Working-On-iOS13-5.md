---
title: 解决 AppSync 在 iOS 13.5 上不能安装应用的问题
date: 2020-07-16 17:23:43
tags: 越狱 安装 ipa AppSync unc0ver
---

自从用了 AltStore 之后就不能自拔，想着所有ipa都要通过它安装上去，不过没有付费的apple id是有数量限制的，sideload ipa也是有个数限制，思来想去发现自己是掉坑里面了，这才突然想起 AppSync 来。既然已经越狱，找到最新版 [AppSync](https://github.com/angelXwind/AppSync)发现已经支持到了自己越狱版本13.5。那装上用 ifunbox 装个 ipa 还不是分分钟的事情。果然事情并没有想象中的简单。

装完后爱思助手显示我没有安装AppSync，然后查看了AppSync包内容，发现有个服务进程 asu_inject ，但是高版本并不需要这个进程了，最终打包文件里也没有启动这个服务的plist文件。

问题出现在注入的 installd 这个进程没有重启，使 AppSync 的 hook 代码生效，自己手动 killall -9 installd 使其加载 hook 代码后就可以解决惹。
