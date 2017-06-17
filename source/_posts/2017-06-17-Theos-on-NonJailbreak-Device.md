title: 非越狱机上使用Theos进行Hook
date: 2017-06-17 13:48:21
tags:
---
### 原起

由于最近研究 HTTPS 的数据抓包，且发现在越狱机上使用 [GitHub - nabla-c0d3/ssl-kill-switch2](https://github.com/nabla-c0d3/ssl-kill-switch2)非常方便，且其作者主要实现了 AppStore 的 HTTPS 的数据抓包 [Intercepting the App Store’s Traffic on iOS  | In Security](https://nabla-c0d3.github.io/blog/2013/08/20/intercepting-the-app-stores-traffic-on-ios/) 。于是想能不能移植到非越狱机上实现呢。

<!-- more -->

### 实践

此前已经在非越狱机上非常熟练的使用 CaptainHook 进行 dylib 动态库制作及使用 yololib 注入到可执行的二进制文件实现 AppHook。但是  CaptainHook 对于 Objective-C 进行 Hook 是非常方便的。而对 [ssl-kill-switch2](https://github.com/nabla-c0d3/ssl-kill-switch2) 中使用的 c 函数 有点儿无能为力。所以在参考了 [ssl-kill-switch2](https://github.com/nabla-c0d3/ssl-kill-switch2) 中使用 [facebook/fishhook](https://github.com/facebook/fishhook) 的方法在 iOS 上实现同样的 hook 后发现并没有成功。这就很神奇了，暂时没有找到原因。

于是转念想使用 MobileSubstrate ，那就开始吧。最方便的使用方法是使用theos 或者 iOSOpenDev 。期间还搜索到最早之前Star过的一个对 theos 的改造用于实现非越狱机上实现 Hook 的库 [BishopFox/theos-jailed](https://github.com/BishopFox/theos-jailed)，但是也并不好使，可能是环境问题，make 总是失败。

然后使用 theos 搭配 MSHook  把 ssl-kill-switch 的代码进行转换。期间 theos 中的 libsubstrate.dylib 也不好使，参考 《iOS应用逆向工程》中提到的 theos bug 把 libsubstrate.dylib 换成了真实设备中的 CydiaSubstrate.framework/CydiaSubstrate 。终于能 make 成功了。

接着注入到可执行文件，重新打包签名安装启动，crash crash crash 。。。

### 总结一下 crash 原因：

期间各种crash就不说了，这里主要总结使用 theos 在 非越狱机上 hook 时遇到的 crash ：
	
	1. libsubstrate.dylib 在非越狱机上没有这个库，需要同自己的 dylib 一起放到 Main Bundle 中去。
	2. 放进去还没完，还要修改 dylib 的 Load Commands 。

```
install_name_tool -change /Library/Frameworks/CydiaSubstrate.framework/CydiaSubstrate @loader_path/libsubstrate.dylib your.dylib 
```

至此，hook 能在非越狱机上对OC函数生效就像在越狱机上一样好使。但是对于 c 函数 hook 还是没生效，再研究吧。
