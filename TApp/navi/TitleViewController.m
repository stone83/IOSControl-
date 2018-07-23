//
//  TitleViewController.m
//  TApp
//
//  Created by 胡泽东 on 2018/7/4.
//  Copyright © 2018年 stone. All rights reserved.
//

#import "TitleViewController.h"
#import "FSSegmentTitleView.h"
#import "FSPageContentView.h"

@interface TitleViewController () <FSPageContentViewDelegate,FSSegmentTitleViewDelegate>
@property (nonatomic, strong) FSPageContentView *pageContentView;
@property (nonatomic, strong) FSSegmentTitleView *titleView;
@end

@implementation TitleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    // Do any additional setup after loading the view, typically from a nib.
//    self.automaticallyAdjustsScrollViewInsets = NO;
//    self.view.backgroundColor = [UIColor whiteColor];
//    //demo1
//    self.titleView = [[FSSegmentTitleView alloc]initWithFrame:CGRectMake(0, 64, CGRectGetWidth(self.view.bounds), 50) titles:@[@"全部",@"服饰穿搭",@"生活百货",@"美食吃货"] delegate:self indicatorType:0];
//    self.titleView.indicatorColor = [UIColor blueColor];
//    [self.view addSubview:_titleView];
//    self.titleView.backgroundColor = [UIColor lightGrayColor];
//    //demo2
//    FSSegmentTitleView *titleView2 = [[FSSegmentTitleView alloc]initWithFrame:CGRectMake(0, 124, CGRectGetWidth(self.view.bounds), 50) titles:@[@"全部",@"服饰穿搭",@"生活百货",@"美食吃货",@"美容护理",@"母婴儿童",@"数码家电",@"其他"] delegate:nil indicatorType:0];
//    [self.view addSubview:titleView2];
//    titleView2.backgroundColor = [UIColor lightGrayColor];
//    //demo3
//    FSSegmentTitleView *titleView3 = [[FSSegmentTitleView alloc]initWithFrame:CGRectMake(0, 194, CGRectGetWidth(self.view.bounds), 50) titles:@[@"全部",@"服饰穿搭",@"生活百货",@"美食吃货",@"美容护理",@"母婴儿童",@"数码家电",@"其他"] delegate:nil indicatorType:2];
//    titleView3.indicatorExtension = 6;
//    [self.view addSubview:titleView3];
//    titleView3.backgroundColor = [UIColor lightGrayColor];
//    //demo4
//    FSSegmentTitleView *titleView4 = [[FSSegmentTitleView alloc]initWithFrame:CGRectMake(0, 264, CGRectGetWidth(self.view.bounds), 50) titles:@[@"全部",@"服饰穿搭",@"生活百货",@"美食吃货",@"美容护理",@"母婴儿童",@"数码家电",@"其他"] delegate:nil indicatorType:3];
//    [self.view addSubview:titleView4];
//    titleView4.backgroundColor = [UIColor lightGrayColor];
//
//    //demo5
//    FSSegmentTitleView *titleView5 = [[FSSegmentTitleView alloc]initWithFrame:CGRectMake(0, 334, CGRectGetWidth(self.view.bounds), 50) titles:@[@"全部",@"服饰穿搭",@"生活百货",@"美食吃货",@"美容护理",@"母婴儿童",@"数码家电",@"其他"] delegate:nil indicatorType:3];
//    titleView5.titleSelectFont = [UIFont systemFontOfSize:20];
//    [self.view addSubview:titleView5];
//    titleView5.backgroundColor = [UIColor lightGrayColor];
//
//    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//    btn.backgroundColor = [UIColor blackColor];
//    [btn setTitle:@"pageContentView" forState:UIControlStateNormal];
//    btn.frame = CGRectMake(50, 400, 50, 30);
//    [btn sizeToFit];
//    [btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:btn];
    
    // Do any additional setup after loading the view.
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"pageContentView";
    self.titleView = [[FSSegmentTitleView alloc]initWithFrame:CGRectMake(0, 64, CGRectGetWidth(self.view.bounds), 50) titles:@[@"全部",@"服饰穿搭",@"生活百货",@"美食吃货",@"美容护理",@"母婴儿童",@"数码家电",@"其他"] delegate:self indicatorType:FSIndicatorTypeEqualTitle];
    self.titleView.titleSelectFont = [UIFont systemFontOfSize:10];
    self.titleView.selectIndex = 2;
    [self.view addSubview:_titleView];
    
    NSMutableArray *childVCs = [[NSMutableArray alloc]init];
    for (NSString *title in @[@"全部",@"服饰穿搭",@"生活百货",@"美食吃货",@"美容护理",@"母婴儿童",@"数码家电",@"其他"]) {
        UIViewController *vc = [[UIViewController alloc]init];
        vc.title = title;
        [childVCs addObject:vc];
    }
    self.pageContentView = [[FSPageContentView alloc]initWithFrame:CGRectMake(0, 114, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds) - 90) childVCs:childVCs parentVC:self delegate:self];
    self.pageContentView.contentViewCurrentIndex = 2;
    //    self.pageContentView.contentViewCanScroll = NO;//设置滑动属性
    [self.view addSubview:_pageContentView];
}

#pragma mark --
- (void)FSSegmentTitleView:(FSSegmentTitleView *)titleView startIndex:(NSInteger)startIndex endIndex:(NSInteger)endIndex
{
    self.pageContentView.contentViewCurrentIndex = endIndex;
    self.title = @[@"全部",@"服饰穿搭",@"生活百货",@"美食吃货",@"美容护理",@"母婴儿童",@"数码家电",@"其他"][endIndex];
}

- (void)FSContenViewDidEndDecelerating:(FSPageContentView *)contentView startIndex:(NSInteger)startIndex endIndex:(NSInteger)endIndex
{
    self.titleView.selectIndex = endIndex;
    self.title = @[@"全部",@"服饰穿搭",@"生活百货",@"美食吃货",@"美容护理",@"母婴儿童",@"数码家电",@"其他"][endIndex];
}
- (void)click
{
//    UIViewController *vc = [[UIViewController alloc]init];
//    vc.view.backgroundColor = [UIColor lightGrayColor];
//    [self.navigationController pushViewController:vc animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
