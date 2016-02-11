/**
 * AppDelegate+privacyblurscreen.m
 * https://github.com/qplix/cordova-plugin-privacy-screen
 * MIT Licensed
 */
#import "AppDelegate+privacyblurscreen.h"
#import <objc/runtime.h>

UIView *imageView;
UIVisualEffectView *blurEffectView;

@implementation AppDelegate (privacyblurscreen)

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    [imageView removeFromSuperview];
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    if (UIAccessibilityIsReduceTransparencyEnabled()) return; // No support for old devices..
    
    UIBlurEffect *blurEffect = [MyBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    blurEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    blurEffectView.frame = self.viewController.view.bounds;
    blurEffectView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    [self.viewController.view addSubview:blurEffectView];
    
    imageView = [self.viewController.view snapshotViewAfterScreenUpdates:YES];
    
    [blurEffectView removeFromSuperview];
    [self.viewController.view addSubview:imageView];
}

@end