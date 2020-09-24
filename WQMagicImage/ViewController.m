//
//  ViewController.m
//  WQMagicImage
//
//  Created by 王其飞 on 2020/9/18.
//  Copyright © 2020 王其飞. All rights reserved.
//

#import "ViewController.h"
#import "MainViewController.h"
@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    button.frame = CGRectMake(100, 100, 100, 100);
    
    button.backgroundColor = [UIColor greenColor];
    
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
    
    // Do any additional setup after loading the view.
}

-(void)buttonAction:(UIButton *)sender{
    
    MainViewController *mainVC = [[MainViewController  alloc]init];
    
    [self.navigationController pushViewController:mainVC animated:YES];
}

-(void)viewWillDisappear:(BOOL)animated{
    
    
}

-(void)dealloc{
    
}
@end
