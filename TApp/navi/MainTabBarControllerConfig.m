//
//  MainTabBarControllerConfig.m
//  TApp
//
//  Created by 胡泽东 on 2018/7/11.
//  Copyright © 2018年 stone. All rights reserved.
//

#import "MainTabBarControllerConfig.h"
#import "NaviFirstController.h"
#import "NaviSecondController.h"
#import "TableViewController.h"
#import "PgViewController.h"
#import "TitleViewController.h"
#import "CYLTabBarController.h"
#import "MJRViewController.h"
#import "MainTabBarControllerConfig.h"
#import "TabbarPlusButton.h"

@implementation MainTabBarControllerConfig

- (CYLTabBarController *)mainTabBarController{
    if (!_mainTabBarController) {
        UIEdgeInsets imageInsets = UIEdgeInsetsZero;
        UIOffset titlePositionAdjustment = UIOffsetZero;
        _mainTabBarController = [CYLTabBarController tabBarControllerWithViewControllers:[self arrayViewControllerItem] tabBarItemsAttributes:[self arrayAttributesItem] imageInsets:imageInsets titlePositionAdjustment:titlePositionAdjustment];
        [self customizeTabBarAppearance:_mainTabBarController];
    }
    return _mainTabBarController;
}

- (NSArray *)arrayViewControllerItem{
//    NaviFirstController *bookcaseNavi = [[NaviFirstController alloc] init];
//    NaviFirstController *askKlNavi = [[NaviFirstController alloc] init];
//    NaviFirstController *discoverNavi = [[NaviFirstController alloc] init];
//    NaviFirstController *userNavi = [[NaviFirstController alloc] init];
    
        NaviSecondController *controller2 =[[NaviSecondController alloc] init];
        controller2.view.backgroundColor = [UIColor yellowColor];
        controller2.title = @"Detail";
        controller2.tabBarItem.title = @"Setting";
//        controller2.tabBarItem.image = [UIImage imageNamed:@"im_ee_41"];
    
        NaviFirstController *controller = [[NaviFirstController alloc] init];
        controller.view.backgroundColor = [UIColor redColor];
        controller.title = @"Setting";
        controller.tabBarItem.title = @"Detail";
//        controller.tabBarItem.image = [UIImage imageNamed:@"im_ee_41"];
        controller.tabBarItem.badgeValue = @"111";
    
        TableViewController *table = [[TableViewController alloc] init];
        table.view.backgroundColor = [UIColor whiteColor];
        table.title = @"Table";
        table.tabBarItem.title = @"TableDetail";
//        table.tabBarItem.image = [UIImage imageNamed:@"im_ee_41"];
    
        MJRViewController *mjr = [[MJRViewController alloc] init];
        mjr.view.backgroundColor = [UIColor whiteColor];
        mjr.title = @"Table";
        mjr.tabBarItem.title = @"TableDetail";
//        mjr.tabBarItem.image = [UIImage imageNamed:@"im_ee_41"];
    
        PgViewController *pgview = [[PgViewController alloc] init];
        pgview.view.backgroundColor = [UIColor yellowColor];
        pgview.title = @"paview";
        pgview.tabBarItem.title = @"paview";
//        pgview.tabBarItem.image = [UIImage imageNamed:@"im_ee_41"];
    
        TitleViewController *titleVc = [[TitleViewController alloc] init];
        titleVc.view.backgroundColor = [UIColor whiteColor];
        titleVc.title = @"Title";
        titleVc.tabBarItem.title = @"Title";
//        titleVc.tabBarItem.image =[UIImage imageNamed:@"im_ee_41"];
    ///返回需要加载的模块
//    return @[bookcaseNavi,discoverNavi,askKlNavi,userNavi];
      return @[ table, mjr, pgview, titleVc];
}

- (NSArray *)arrayAttributesItem{
//    NSDictionary *bookcaseItemsAttributes =@{CYLTabBarItemTitle : @"nav1",
//                                             CYLTabBarItemImage : @"im_ee_41",
//                                             /* NSString and UIImage are supported*/
//                                             CYLTabBarItemSelectedImage : @"bar_tk_02",};
    
    NSDictionary *discoverItemsAttributes = @{CYLTabBarItemTitle : @"nav2",
                                              CYLTabBarItemImage : @"im_ee_41",
                                              CYLTabBarItemSelectedImage : @"bar_kc_02",};
    
    NSDictionary *askklItemsAttributes = @{CYLTabBarItemTitle : @"nav3",
                                           CYLTabBarItemImage : @"im_ee_41",
                                           CYLTabBarItemSelectedImage : @"bar_dzs_02",};
    
    NSDictionary *userItemsAttributes = @{CYLTabBarItemTitle : @"nav4",
                                          CYLTabBarItemImage : @"im_ee_41",
                                          CYLTabBarItemSelectedImage : @"bar_wd_02"};
    NSDictionary *mjrItemsAttributes = @{CYLTabBarItemTitle : @"nav4",
                                          CYLTabBarItemImage : @"im_ee_41",
                                          CYLTabBarItemSelectedImage : @"bar_wd_02"};
    NSDictionary *tableItemsAttributes = @{CYLTabBarItemTitle : @"nav4",
                                          CYLTabBarItemImage : @"im_ee_41",
                                          CYLTabBarItemSelectedImage : @"bar_wd_02"};
    NSDictionary *pgItemsAttributes = @{CYLTabBarItemTitle : @"nav4",
                                           CYLTabBarItemImage : @"im_ee_41",
                                           CYLTabBarItemSelectedImage : @"bar_wd_02"};
    NSDictionary *titleItemsAttributes = @{CYLTabBarItemTitle : @"nav4",
                                        CYLTabBarItemImage : @"im_ee_41",
                                        CYLTabBarItemSelectedImage : @"bar_wd_02"};
    NSArray *tabBarItemsAttributes = @[
//                                       bookcaseItemsAttributes,
//                                       discoverItemsAttributes,
//                                       askklItemsAttributes,
//                                       userItemsAttributes,
                                       mjrItemsAttributes,
                                       tableItemsAttributes,
                                       pgItemsAttributes,
                                       titleItemsAttributes];
    return tabBarItemsAttributes;
}


/**
 *  更多TabBar自定义设置：比如：tabBarItem 的选中和不选中文字和背景图片属性、tabbar 背景图片属性等等
 */
- (void)customizeTabBarAppearance:(CYLTabBarController *)tabBarController {
    // Customize UITabBar height
    // 自定义 TabBar 高度
    //     tabBarController.tabBarHeight = CYLTabBarControllerHeight;
    
    // set the text color for unselected state
    // 普通状态下的文字属性
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    normalAttrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    
    // set the text color for selected state
    // 选中状态下的文字属性
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
//    selectedAttrs[NSForegroundColorAttributeName] = Wonderful_BlueColor6;
    
    // set the text Attributes
    // 设置文字属性
    UITabBarItem *tabBar = [UITabBarItem appearance];
    [tabBar setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    [tabBar setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    
    // Set the dark color to selected tab (the dimmed background)
    // TabBarItem选中后的背景颜色
    // [self customizeTabBarSelectionIndicatorImage];
    
    // update TabBar when TabBarItem width did update
    // If your app need support UIDeviceOrientationLandscapeLeft or UIDeviceOrientationLandscapeRight，
    // remove the comment '//'
    // 如果你的App需要支持横竖屏，请使用该方法移除注释 '//'
    // [self updateTabBarCustomizationWhenTabBarItemWidthDidUpdate];
    
    // set the bar shadow image
    // This shadow image attribute is ignored if the tab bar does not also have a custom background image.So at least set somthing.
    [[UITabBar appearance] setBackgroundImage:[[UIImage alloc] init]];
    [[UITabBar appearance] setBackgroundColor:[UIColor whiteColor]];
    [[UITabBar appearance] setShadowImage:[UIImage imageNamed:@"tapbar_top_line"]];
    
    // set the bar background image
    // 设置背景图片
    //     UITabBar *tabBarAppearance = [UITabBar appearance];
    //     [tabBarAppearance setBackgroundImage:[UIImage imageNamed:@"tab_bar"]];
    
    // remove the bar system shadow image
    // 去除 TabBar 自带的顶部阴影
    // [[UITabBar appearance] setShadowImage:[[UIImage alloc] init]];
}
@end
