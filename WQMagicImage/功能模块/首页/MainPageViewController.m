//
//  MainPageViewController.m
//  WQMagicImage
//
//  Created by 王其飞 on 2020/10/9.
//  Copyright © 2020 王其飞. All rights reserved.
//

#import "MainPageViewController.h"
#import "ViewController.h"
@interface MainPageViewController ()

@end

@implementation MainPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.backgroundColor = [UIColor redColor];

    self.view.backgroundColor = [UIColor lightGrayColor];

    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    button.frame = CGRectMake(100, 100, 100, 100);
    
    button.backgroundColor = [UIColor greenColor];
    
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
    // Do any additional setup after loading the view.
}
-(void)buttonAction:(UIButton *)sender{
    ViewController *vc = [[ViewController alloc] init];
    
    [self.navigationController pushViewController:vc animated:YES];
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
