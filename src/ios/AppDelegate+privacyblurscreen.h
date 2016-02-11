/**
 * AppDelegate+privacyblurscreen.h
 * https://github.com/qplix/cordova-plugin-privacy-screen
 * MIT Licensed
 */
#import "AppDelegate.h"
#import <objc/runtime.h>


@interface AppDelegate (privacyblurscreen)
- (void)applicationWillResignActive:(UIApplication *)application;
- (void)applicationDidBecomeActive:(UIApplication *)application;

@end

@interface UIBlurEffect (Protected)
@property (nonatomic, readonly) id effectSettings;
@end

@interface MyBlurEffect : UIBlurEffect
@end

@implementation MyBlurEffect

+ (instancetype)effectWithStyle:(UIBlurEffectStyle)style
{
    id result = [super effectWithStyle:style];
    object_setClass(result, self);
    
    return result;
}

- (id)effectSettings
{
    id settings = [super effectSettings];
    [settings setValue:@3 forKey:@"blurRadius"];
    return settings;
}

- (id)copyWithZone:(NSZone*)zone
{
    id result = [super copyWithZone:zone];
    object_setClass(result, [self class]);
    return result;
}

@end