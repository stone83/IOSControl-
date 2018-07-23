#import "MJRViewController.h"
#import "MJRefresh.h"
#import "MJTableViewCell.h"

@interface MJRViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@end

@implementation MJRViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //添加一个tableview
    self.tableView= [[UITableView alloc]initWithFrame:self.view.bounds];
    
    self.tableView.delegate=self;
    
    self.tableView.dataSource=self;
    
    [self.view addSubview:_tableView];
//
//    [_tableView removeFromSuperview];
//    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 40, 200, 30)];
//    view.backgroundColor = [UIColor lightGrayColor];
//    [self.view addSubview:view];
    
    //创建下拉刷新
    MJRefreshNormalHeader* header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        
        [self performSelector:@selector(headRefresh)withObject:nil afterDelay:2.0f];
        
    }];
    
    //设置自定义文字，因为默认是英文的
    [header setTitle:@"下拉刷新"forState:MJRefreshStateIdle];
    
    [header setTitle:@"松开加载更多"forState:MJRefreshStatePulling];
    
    [header setTitle:@"正在刷新中"forState:MJRefreshStateRefreshing];
    
    
    self.tableView.mj_header= header;
    
    //创建上拉刷新
    MJRefreshBackNormalFooter * foot =[MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        
        [self performSelector:@selector(footRefresh)withObject:nil afterDelay:2.0f];
        
    }];
    self.tableView.mj_footer = foot;
    
    [foot setTitle:@"上拉刷新"forState:MJRefreshStateIdle];
    
    [foot setTitle:@"松开加载更多"forState:MJRefreshStatePulling];
    
    [foot setTitle:@"正在刷新中"forState:MJRefreshStateRefreshing];
//    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
}
- (void)headRefresh {
    NSLog(@"下拉,加载数据");
    [self.tableView.mj_header endRefreshing];
//    if(1){
//        [_tableView removeFromSuperview];
//        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 40, 200, 30)];
//        view.backgroundColor = [UIColor lightGrayColor];
//        [self.view addSubview:view];
//    } else {
//        [self.view addSubview:_tableView];
//    }
}
- (void)footRefresh {
    NSLog(@"上拉，加载数据");
    [self.tableView.mj_footer endRefreshing];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

# pragma mark - tabelView代理方法.

- (NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section

{
    
    return 10;
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 5;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return @"0";
            break;
        case 1:
            return @"1";
            break;
        case 2:
            return @"2";
            break;
        case 3:
            return @"3";
            break;
        case 4:
            return @"4";
            break;
        default:
            return @"5";
            break;
    }
    return @"111";
}
//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    return 80;
//}
- (UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath

{
    
    NSString* cellReuseIdentifier =@"cell";
    switch ([indexPath section]) {
        case 0:
        {
            MJTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"setting"];
            if (cell == nil) {
                cell = [MJTableViewCell cellWithTableView:tableView];
            }
            [cell setTableView:tableView];
            return cell;
            //            break;
        }

            
        default:{
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: cellReuseIdentifier];
            if (cell == nil) {
                cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellReuseIdentifier];
            }
            return cell;
            //            break;
        }

    }
    
//    cell.textLabel.text=@"hello，MjRefresh";
    
}


@end
