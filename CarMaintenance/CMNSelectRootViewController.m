//
//  CMNSelectRootViewController.m
//  CarMaintenance
//
//  Created by runingfish on 2025/7/20.
//

#import "CMNSelectRootViewController.h"
#import "CMNMyCarViewController.h"
#import "CMNMaintenanceViewController.h"
#import "CMNMineViewController.h"
#import "CMNTabbarViewController.h"
@implementation CMNSelectRootViewController
+ (void)cmn_selectRootViewController {
    CMNTabbarViewController *tabVC = [CMNTabbarViewController new];
    NSMutableArray *viewControllers = [NSMutableArray array];
    
    CMNMyCarViewController *vc_1 = [CMNMyCarViewController new];
    vc_1.title = @"爱车";
    UINavigationController *nav_1 = [[UINavigationController alloc] initWithRootViewController:vc_1];
    
    CMNMaintenanceViewController *vc_2 = [CMNMaintenanceViewController new];
    vc_2.title = @"保养";
    UINavigationController *nav_2 = [[UINavigationController alloc] initWithRootViewController:vc_2];
    
    CMNMineViewController *vc_3 = [CMNMineViewController new];
    vc_3.title = @"我的";
    UINavigationController *nav_3 = [[UINavigationController alloc] initWithRootViewController:vc_3];
    
    [viewControllers addObject:nav_1];
    [viewControllers addObject:nav_2];
    [viewControllers addObject:nav_3];
    
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    tabVC.viewControllers = viewControllers;
    keyWindow.rootViewController = tabVC;
}

@end
