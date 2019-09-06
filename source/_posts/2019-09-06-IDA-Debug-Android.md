---
title: IDA Pro 启动调试安卓应用
date: 2019-09-06 22:20:00
tags: 逆向
---

```
aapt dump badging /path/xxx.apk
adb shell am start -D -n 包名/类名
adb forward tcp:23946 tcp:23946
adb forward tcp:8700 jdwp:pid
jdb -connect com.sun.jdi.SocketAttach:hostname=localhost,port=8700

eg:

adb shell am start -D -n com.tencent.mm/com.tencent.mm.ui.LauncherUI
adb forward tcp:23946 tcp:23946
adb forward tcp:8700 jdwp:pid
jdb -connect com.sun.jdi.SocketAttach:hostname=localhost,port=8700
```