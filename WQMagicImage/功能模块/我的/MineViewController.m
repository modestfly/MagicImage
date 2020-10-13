//
//  MineViewController.m
//  WQMagicImage
//
//  Created by 王其飞 on 2020/10/9.
//  Copyright © 2020 王其飞. All rights reserved.
//

#import "MineViewController.h"
typedef struct node{
    char *data;
    struct node *next;
} ListNode;
@interface MineViewController ()

@end
@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.title = @"消息";
    self.view.backgroundColor = [UIColor lightGrayColor];

    // Do any additional setup after loading the view.
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
