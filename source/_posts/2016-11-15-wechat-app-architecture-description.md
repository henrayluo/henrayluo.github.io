title: WeChat Architecture
date: 2016-11-15 11:34:29
tags:
---

//  WeAppArchitectureDescription.ReadMe
//  MicroMessenger
//
//  Created by tedwu on 2016-7-15.
//  Copyright 2016 Tencent. All rights reserved.

<!-- more -->

```
//
//  WeAppArchitectureDescription.ReadMe
//  MicroMessenger
//
//  Created by tedwu on 2016-7-15.
//  Copyright 2016 Tencent. All rights reserved.
//

Architecture:


            _____ _____ _____ _____ _____ _____ _____ _____ _____ ______      _______________
            |                                                           |    |               |
            |                                                           |    |               |
      UI    |                 Message    +    Entrance                  |    |               |
            |                                                           |    |               |
            |_____ _____ _____ _____ _____ _____ _____ _____ _____ _____|    |               |
                                                                             |               |
            _____ _____ _____ _____ _____ _____ _____ _____ _____ ______     |               |
            |                                                           |    |   ConfigMgr   |
            |                                                           |    |               |
    Facade  |                          AppMgr                           |    |               |
            |                                                           |    |               |
            |_____ _____ _____ _____ _____ _____ _____ _____ _____ _____|    |               |
                                                                             |               |
            _____ _____ _____ _____   ___ _____ _____ _____ _____ ______     |  PermissonMgr |
            |                      | |                                  |    |               |
            |                      | |                                  |    |               |
      Mgr   |      AppTaskMg       | | AppVersionMgr  +  AppListInfoMgr |    |               |
            |                      | |                                  |    |               |
            |_____ _____ _____ ____| |___ _____ _____ _____ _____ ______|    |               |
                                                                             |   DataBase    |
            _____ _____ _____ _____ _____ ______   ___ _____ _____ _____     |               |
            |                                   | |                     |    |               |
            |                                   | |                     |    |               |
            | WebView + MultiTask + AppService  | |         SDK         |    |               |
            |                                   | |                     |    |               |
            |_____ _____ _____ _____ _____ _____| |_____ _____ _____ ___|    |               |
     core                                                                    |               |
            _____ _____ _____ _____ _____ _____ _____ _____ _____ ______     |               |
            |                                                           |    |               |
            |                                                           |    |               |
            |              PageFrame    +    LocalCache                 |    |               |
            |                                                           |    |               |
            |_____ _____ _____ _____ _____ _____ _____ _____ _____ _____|    |_______________|






Directory Structure:

|_____AppMgr
|_____|_____WAAppListInfoMgr.h
|_____|_____WAAppListInfoMgr.mm
|_____|_____WAAppMgr.h
|_____|_____WAAppMgr.mm
|_____|_____WAAppTaskMgr.h
|_____|_____WAAppTaskMgr.mm
|_____|_____WAAppVersionMgr.h
|_____|_____WAAppVersionMgr.mm
|_____Base
|_____|_____ConfigMgr
|_____|_____|_____WAConfigMgr.h
|_____|_____|_____WAConfigMgr.mm
|_____|_____DataBase
|_____|_____PermissonMgr
|_____|_____|_____WAPermissonMgr.h
|_____|_____|_____WAPermissonMgr.mm
|_____Core
|_____|_____AppService
|_____|_____LocalCache
|_____|_____MultiTask
|_____|_____|_____WAMultiTaskMgr.h
|_____|_____|_____WAMultiTaskMgr.mm
|_____|_____PageFrame
|_____|_____|_____WAWebViewController+Preload.h
|_____|_____|_____WAWebViewController+Preload.mm
|_____|_____Webview
|_____|_____|_____Plugin
|_____|_____|_____|_____WAWebViewPlugin_CustomNavigationBar.h
|_____|_____|_____|_____WAWebViewPlugin_CustomNavigationBar.mm
|_____|_____|_____|_____WAWebViewPlugin_CustomTabBar.h
|_____|_____|_____|_____WAWebViewPlugin_CustomTabBar.mm
|_____|_____|_____|_____WAWebViewPlugin_InputKeyboard.h
|_____|_____|_____|_____WAWebViewPlugin_InputKeyboard.mm
|_____|_____|_____|_____WAWebViewPlugin_PullRefresh.h
|_____|_____|_____|_____WAWebViewPlugin_PullRefresh.mm
|_____|_____|_____|_____WAWebViewPluginBase.h
|_____|_____|_____|_____WAWebViewPluginBase.mm
|_____|_____|_____|_____WAWebViewPluginScheduler.h
|_____|_____|_____|_____WAWebViewPluginScheduler.mm
|_____|_____|_____WAWebViewController+AppBrand.h
|_____|_____|_____WAWebViewController+AppBrand.mm
|_____|_____|_____WAWebViewController+UI.h
|_____|_____|_____WAWebViewController+UI.mm
|_____|_____|_____WAWebViewController.h
|_____|_____|_____WAWebViewController.mm
|_____|_____|_____WAWebViewJSLogicImpl.h
|_____|_____|_____WAWebViewJSLogicImpl.mm
|_____Portal
|_____SDK
|_____|_____AppServiceAPI
|_____|_____Dependency
|_____|_____WebViewAPI
|_____Util
|_____|_____WAUtility.h
|_____|_____WAUtility.mm
```

