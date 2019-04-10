title: CocoaLumberjack使用
date: 2016-07-26 15:24:00
tags:
---

#### 安装

```
pod 'CocoaLumberjack'
Xcode Install XcodeColors 
```

#### 导入头文件

```
#import <CocoaLumberjack/CocoaLumberjack.h>
static const DDLogLevel ddLogLevel = DDLogLevelAll;
```

#### 初始化及使用

```
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    setenv("XcodeColors", "YES", 0);                        // 启用颜色区分
    
    [DDLog addLogger:[DDTTYLogger sharedInstance]];         // TTY = Xcode console
    [DDLog addLogger:[DDASLLogger sharedInstance]];         // ASL = Apple System Logs
    [[DDTTYLogger sharedInstance] setColorsEnabled:YES];    // 启用颜色区分
    
    DDFileLogger *fileLogger = [[DDFileLogger alloc] init]; // File Logger
    fileLogger.rollingFrequency = 60 * 60 * 24;             // 24 hour rolling
    fileLogger.logFileManager.maximumNumberOfLogFiles = 7;
    [DDLog addLogger:fileLogger];
    
    // Test
    DDLogVerbose(@"Verbose");
    DDLogDebug(@"Debug");
    DDLogInfo(@"Info");
    DDLogWarn(@"Warn");
    DDLogError(@"Error");
    
    return YES;
}
```
