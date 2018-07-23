//
//  NaviSecondController.m
//  TApp
//
//  Created by 胡泽东 on 2018/7/2.
//  Copyright © 2018年 stone. All rights reserved.
//

#import "NaviSecondController.h"

@interface NaviSecondController ()
@property (weak, nonatomic) IBOutlet UIButton *clickbtn;
@property (weak, nonatomic) IBOutlet UILabel *txtshow;

@end

@implementation NaviSecondController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [_clickbtn addTarget:self action:@selector(press) forControlEvents:UIControlEventTouchUpInside];
}
-(void)press{
    NSLog(@"this is second controller!");
    _txtshow.text = @"already click me";
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    if([self isFirstResponder]){
        [self disablesAutomaticKeyboardDismissal];
//    }
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
