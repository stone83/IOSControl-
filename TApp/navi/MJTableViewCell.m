//
//  MJTableViewCell.m
//  TApp
//
//  Created by 胡泽东 on 2018/7/7.
//  Copyright © 2018年 stone. All rights reserved.
//

#import "MJTableViewCell.h"
#import "Masonry.h"

@interface MJTableViewCell()
@property(nonatomic, strong) UILabel *label;
@property(nonatomic, strong) UIImageView *img;
@property(nonatomic, strong) UITableView *tview;
@end

@implementation MJTableViewCell

+(instancetype) cellWithTableView:(UITableView *)tableView{
    static NSString *ID = @"setting";
    MJTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if(cell == nil){
        cell = [[MJTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}

-(instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    NSLog(@"initWithStyleinitWithStyleinitWithStyleinitWithStyleinitWithStyle");
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.label = [[UILabel alloc] init];
        self.label.text = @"texttext";
//        self.label.backgroundColor = [UIColor blueColor];
//        self.label.alpha = 1;

        self.img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"im_ee_41"]];
        [self addSubview:_img];
        [self addSubview:_label];
        self.label.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 30);
        [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
            //        make.top.mas_equalTo(self).with.offset(15);
//            make.centerX.mas_equalTo(self);
//            make.top.mas_equalTo(self.img.mas_bottom).with.offset(10);
//            make.bottom.equalTo(self).offset(10);
//            make.edges.insets = UIEdgeInsetsMake(20, 20, 20, 20);
//            make.rightMargin.mas_equalTo(@-8);
//            make.topMargin.mas_equalTo(@8);
//            make.size.mas_equalTo(CGSizeMake(40, 20));
//            make.edges.equalTo(self).with.insets(UIEdgeInsetsMake(10, 150, 10, 10));
            
//            make.width.mas_equalTo([self.label bounds].size.width);
//            make.height.mas_equalTo([self.label bounds].size.height);
//                    make.leftMargin.mas_equalTo(@10);
            
//                    make.topMargin.mas_equalTo(self.mas_topMargin).offset(50);
//
//                    make.rightMargin.mas_equalTo(@10);
//
//                    make.bottomMargin.mas_equalTo(@10);
            
            
//            make.top.mas_equalTo(@10);
            make.top.mas_equalTo(self.img.mas_bottom);
            make.right.mas_equalTo(self.img).with.offset(80);
            make.width.mas_equalTo([self.label bounds].size.width);
            make.height.mas_equalTo([self.label bounds].size.height);
            

        }];
        NSInteger height = [UIImage imageNamed:@"im_ee_41"].size.height + [_label bounds].size.height;
        [self.img mas_makeConstraints:^(MASConstraintMaker *make) {

            make.top.mas_equalTo(@10);
            make.right.mas_equalTo(@-30);
            make.width.mas_equalTo([UIImage imageNamed:@"im_ee_41"].size.width);
            make.height.mas_equalTo([UIImage imageNamed:@"im_ee_41"].size.height);
//            make.centerX.mas_equalTo(self);
//            make.left.mas_equalTo(self);
//            make.right.mas_equalTo(self);
//            make.width.mas_equalTo(40);
//            make.height.mas_equalTo(40);
//            make.rightMargin.mas_equalTo(self.mas_rightMargin).with.offset(10);
        }];
//        [self setFrame:CGRectMake(0, 0,[[UIScreen mainScreen] bounds].size.width, 100)];
        
    }
    
    return self;
}
-(void) setTableView:(UITableView *)view{
    self.tview = view;
//    self.tview.rowHeight = [self.img bounds].size.height + [self.label bounds].size.height + 30;
//    self.tview.rowHeight = [[self.img mas_height].view bounds].size.height + [[self.label mas_height].view bounds].size.height  + 30;
    self.tview.rowHeight = UITableViewAutomaticDimension;
}
//-(void)layoutSubviews{
//    [super layoutSubviews];
//
//}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    NSLog(@"awakeFromNibawakeFromNibawakeFromNibawakeFromNibawakeFromNib");
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
