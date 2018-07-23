//
//  NaviFirstController.m
//  TApp
//
//  Created by 胡泽东 on 2018/7/2.
//  Copyright © 2018年 stone. All rights reserved.
//

#import "NaviFirstController.h"
#import "NaviSecondController.h"
#import "Masonry.h"
#import "HMSegmentedControl.h"

@interface NaviFirstController ()
@property(nonatomic, strong) NaviSecondController *controller2;
@property(nonatomic, strong) UISegmentedControl *segmentedControl2;
@end

@implementation NaviFirstController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.controller2 = [[NaviSecondController alloc] init];
    self.controller2.view.backgroundColor = [UIColor blackColor];
    self.controller2.title = @"Second";
    // Do any additional setup after loading the view.
    UISwitch *switchbtn = [[UISwitch alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    switchbtn.backgroundColor = [UIColor greenColor];
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 200, 100, 100)];
//    UIView * view = [[UIView alloc] init];
    view.backgroundColor = [UIColor greenColor];
    [self.view addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).with.offset(100);
        make.left.equalTo(self.view).with.offset(30);
        make.right.equalTo(self.view).with.offset(-30);
        make.bottom.equalTo(self.view).with.offset(-100);
    }];
    
    HMSegmentedControl *segmentedControl = [[HMSegmentedControl alloc] initWithSectionTitles:@[@"One", @"Two", @"Three"]];
    
    segmentedControl.frame = CGRectMake(10, 70, 300, 60);
    [segmentedControl addTarget:self action:@selector(segmentedControlChangedValue:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:segmentedControl];
    
    
    // 初始化，添加分段名，会自动布局
    self.segmentedControl2 = [[UISegmentedControl alloc] initWithItems:@[@"正在销售", @"已下架"]];
    self.segmentedControl2.frame = CGRectMake(40, 150, 150+10, 30);
    
    // 设置整体的色调
    self.segmentedControl2.tintColor = [UIColor lightGrayColor];
    
    // 设置分段名的字体
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor lightGrayColor],NSForegroundColorAttributeName,[UIFont systemFontOfSize:18],NSFontAttributeName ,nil];
    [self.segmentedControl2 setTitleTextAttributes:dic forState:UIControlStateNormal];
    
    // 设置初始选中项
    self.segmentedControl2.selectedSegmentIndex = 0;
    
    [self.segmentedControl2 addTarget:self action:@selector(selectItem:) forControlEvents:UIControlEventValueChanged];// 添加响应方法
    
    // 设置样式的segmentedControlStyle属性在iOS 7.0之后将不再起作用
    
    // 设置点击后恢复原样，默认为NO，点击后一直保持选中状态
    self.segmentedControl2.momentary = NO;
    
    // 在指定序号处插入一个分段，会自动布局
    [self.segmentedControl2 insertSegmentWithTitle:@"已删除" atIndex:2 animated:NO];
    
    // 在指定序号处移除一个分段，会自动布局
    [self.segmentedControl2 removeSegmentAtIndex:2 animated:NO];
    
    // 设置指定序号处的分段的宽度
//    [self.segmentedControl2 setWidth:50.0 forSegmentAtIndex:1];
    
    // 获取指定序号处标题的内容
    NSLog(@"%@", [self.segmentedControl2 titleForSegmentAtIndex:1]);
    
    // 获取指定序号处标题的宽度
    NSLog(@"%f", [self.segmentedControl2 widthForSegmentAtIndex:1]);
    
    // 设置指定序号处的分段不可选
//    [self.segmentedControl2 setEnabled:NO forSegmentAtIndex:1];
    
    [self.view addSubview:self.segmentedControl2];

}

- (void)selectItem:(UISegmentedControl *)sender {
    if (sender.selectedSegmentIndex == 0) {
        NSLog(@"正在销售");
    } else {
        NSLog(@"已下架");
    }
}

- (void)segmentedControlChangedValue:(HMSegmentedControl *)segmentedControl {
    NSLog(@"Selected index %ld (via UIControlEventValueChanged)", (long)segmentedControl.selectedSegmentIndex);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    [self presentViewController:self.controller2 animated:YES completion:^{
//        NSLog(@"this is a firt to second controller");
//    }];
    [self.navigationController pushViewController:self.controller2 animated:YES];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
