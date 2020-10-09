//
//  AppDelegate.m
//  WQMagicImage
//
//  Created by 王其飞 on 2020/9/18.
//  Copyright © 2020 王其飞. All rights reserved.
//

#import "AppDelegate.h"
#import <AppOrderFiles.h>
#import "WMTabBarViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    //设置导航外观模块
    [self setupWMappearence];
    //设置启动模块
    [self setupRootVC];


    return YES;
}

- (void)setupRootVC
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    WMTabBarViewController *rootTabBar = [[WMTabBarViewController alloc] init];
    UINavigationController *rootNC = [[UINavigationController alloc] initWithRootViewController:rootTabBar];
    self.window.rootViewController = rootNC;
//    //其他对象需要时使用
//    self.rootnavCtrl = rootNC;
//    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    [self.window makeKeyAndVisible];
}
#pragma mark 设置 app 外观
- (void)setupWMappearence {
    //设置导航栏字体颜色与大小
    [UINavigationBar appearance].titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor blackColor],
                                                         NSFontAttributeName : [UIFont boldSystemFontOfSize:18]};
}


- (BOOL)application:(UIApplication *)application willFinishLaunchingWithOptions:(nullable NSDictionary<UIApplicationLaunchOptionsKey, id> *)launchOptions {
    
    return YES;
}


- (void)applicationDidBecomeActive:(UIApplication *)application
{
    
}
- (void)applicationWillResignActive:(UIApplication *)application
{
    
}

//如果需要支持 iOS8,请加上这些代码
- (void)application:(UIApplication *)application didRegisterUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings
{
    
}
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
{
    
    
}


@end
