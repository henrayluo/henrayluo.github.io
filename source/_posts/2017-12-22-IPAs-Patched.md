title: IPAs-Patched
date: 2017-12-22 13:48:21
tags: Tweak iOS Crack
---

### 腾讯视频去除播放前120+s广告

```
#import <Foundation/Foundation.h>
#import <CydiaSubstrate/CydiaSubstrate2.h>

DefineObjCHook(BOOL, isAdvertisementEnabled, id self, SEL _cmd) {
    return NO;
}

__attribute__((constructor))
EXTERN_API_C("C") void RemoveAD_Initialize() {
    InstallObjCInstanceHook(objc_getClass("KKMediaRootViewController"), @selector(isAdvertisementEnabled), isAdvertisementEnabled);
}
```