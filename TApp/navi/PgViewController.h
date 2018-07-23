//
//  PgViewController.h
//  TApp
//
//  Created by 胡泽东 on 2018/7/3.
//  Copyright © 2018年 stone. All rights reserved.
//


#import <UIKit/UIKit.h>
@interface PgViewController : UIViewController <UIPageViewControllerDataSource, UIPageViewControllerDelegate>
@property (strong, nonatomic)  UIPageControl *pageControl;
@end
