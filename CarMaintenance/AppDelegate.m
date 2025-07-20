//
//  AppDelegate.m
//  CarMaintenance
//
//  Created by runingfish on 2025/7/20.
//

#import "AppDelegate.h"
#import "CMNAlpashViewController.h"

@implementation AppDelegate
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:[CMNAlpashViewController new]];
    self.window.rootViewController = nav;
    return YES;
}

@end
