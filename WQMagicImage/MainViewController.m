//
//  MainViewController.m
//  WQMagicImage
//
//  Created by 王其飞 on 2020/9/23.
//  Copyright © 2020 王其飞. All rights reserved.
//

#import "MainViewController.h"
#import "ViewController.h"
@interface MainViewController ()
@property (nonatomic, strong) NSTimer *testTimer;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.testTimer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(test) userInfo:nil repeats:YES];
    
     [[NSRunLoop currentRunLoop] addTimer:self.testTimer forMode:NSDefaultRunLoopMode];
    self.view.backgroundColor = [UIColor  grayColor];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    button.frame = CGRectMake(100, 100, 100, 100);
    
    button.backgroundColor = [UIColor greenColor];
    
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
    
    // Do any additional setup after loading the view.
}
- (void)test{
    NSLog(@"222222");
}
-(void)viewWillDisappear:(BOOL)animated{
    
    [self.testTimer invalidate];
}
-(void)buttonAction:(UIButton *)sender{
    
    ViewController *mainVC = [[ViewController  alloc]init];
    
    [self.navigationController pushViewController:mainVC animated:YES];
}
-(void)dealloc{
    [self.testTimer invalidate];
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
