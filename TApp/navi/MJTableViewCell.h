//
//  MJTableViewCell.h
//  TApp
//
//  Created by 胡泽东 on 2018/7/7.
//  Copyright © 2018年 stone. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MJTableViewCell : UITableViewCell
+(instancetype) cellWithTableView:(UITableView *) tableView;
-(void) setTableView:(UITableView *)view;
@end
