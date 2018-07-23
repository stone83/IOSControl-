//
//  AppDelegate.m
//  TApp
//
//  Created by 胡泽东 on 2018/7/2.
//  Copyright © 2018年 stone. All rights reserved.
//

#import "AppDelegate.h"
#import "navi/NaviFirstController.h"
#import "navi/NaviSecondController.h"
#import "TableViewController.h"
#import "PgViewController.h"
#import "TitleViewController.h"
#import "CYLTabBarController.h"
#import "MJRViewController.h"
#import "MainTabBarControllerConfig.h"
#import "TabbarPlusButton.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
//    UIViewController *controller =[[UIViewController alloc] init];
//    controller.view.backgroundColor = [UIColor redColor];
//    controller.title = @"Setting";
//
//    NaviSecondController *controller2 =[[NaviSecondController alloc] init];
//    controller2.view.backgroundColor = [UIColor yellowColor];
//    controller2.title = @"Detail";
//    controller2.tabBarItem.title = @"Setting";
//    controller2.tabBarItem.image = [UIImage imageNamed:@"im_ee_41"];
//
//    NaviFirstController *controller = [[NaviFirstController alloc] init];
//    controller.view.backgroundColor = [UIColor redColor];
//    controller.title = @"Setting";
//    controller.tabBarItem.title = @"Detail";
//    controller.tabBarItem.image = [UIImage imageNamed:@"im_ee_41"];
//    controller.tabBarItem.badgeValue = @"111";
//
//    TableViewController *table = [[TableViewController alloc] init];
//    table.view.backgroundColor = [UIColor whiteColor];
//    table.title = @"Table";
//    table.tabBarItem.title = @"TableDetail";
//    table.tabBarItem.image = [UIImage imageNamed:@"im_ee_41"];
//
//    MJRViewController *mjr = [[MJRViewController alloc] init];
//    mjr.view.backgroundColor = [UIColor whiteColor];
//    mjr.title = @"Table";
//    mjr.tabBarItem.title = @"TableDetail";
//    mjr.tabBarItem.image = [UIImage imageNamed:@"im_ee_41"];
//
//    PgViewController *pgview = [[PgViewController alloc] init];
//    pgview.view.backgroundColor = [UIColor yellowColor];
//    pgview.title = @"paview";
//    pgview.tabBarItem.title = @"paview";
//    pgview.tabBarItem.image = [UIImage imageNamed:@"im_ee_41"];
//
//    TitleViewController *titleVc = [[TitleViewController alloc] init];
//    titleVc.view.backgroundColor = [UIColor whiteColor];
//    titleVc.title = @"Title";
//    titleVc.tabBarItem.title = @"Title";
//    titleVc.tabBarItem.image =[UIImage imageNamed:@"im_ee_41"];
//
//
//    UITabBarController *bar = [[UITabBarController alloc] init];
//    self.window.rootViewController = bar;
//
//
//    UINavigationController *first = [[UINavigationController alloc] initWithRootViewController:controller];
//      bar.viewControllers = @[first, controller2, mjr, pgview, titleVc];
    
    
    
    
    
//    UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:controller];
//    self.window.rootViewController = navi;
//    self.window.backgroundColor = [UIColor whiteColor];
//    [self.window makeKeyAndVisible];
    
    
    
    
    // Override point for customization after application launch.
    //    /加载中间自定义按钮
    [TabbarPlusButton registerPlusButton];
    MainTabBarControllerConfig *tabbarConfig = [[MainTabBarControllerConfig alloc]init];
    CYLTabBarController *mainTabbarController = tabbarConfig.mainTabBarController;
    [self.window setRootViewController:mainTabbarController];
    [self.window makeKeyAndVisible];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
