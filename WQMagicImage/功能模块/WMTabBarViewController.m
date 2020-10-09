//
//  WMTabBarViewController.m
//  WQMagicImage
//
//  Created by 王其飞 on 2020/10/9.
//  Copyright © 2020 王其飞. All rights reserved.
//

#import "WMTabBarViewController.h"
#import "WMTabBar.h"
#import "MainPageViewController.h"
#import "MessageViewController.h"
#import "MineViewController.h"
#import "ToolViewController.h"
@interface WMTabBarViewController ()

//定义当前控制器的枚举类型
typedef enum {
    ENUM_ViewController_Main,//首页
    ENUM_ViewController_Second,//工具
    ENUM_ViewController_Message,//消息
    ENUM_ViewController_Mine //我的
} ENUM_ViewController_ActionType;

//当前Tabbar
@property(nonatomic, strong)WMTabBar *customerTabBar;

@end

@implementation WMTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // 添加自定义tabbar
    [self setupTabBar];
    // 添加子控制器
    [self addChildViewControllers];
}
#pragma mark 创建tabbar
- (void)setupTabBar
{
    WMTabBar *customTabBar = [[WMTabBar alloc] init];
    self.customerTabBar = customTabBar;
}
#pragma mark 添加子控制器
- (void)addChildViewControllers {
    //首页
    MainPageViewController *mainVC = [[MainPageViewController alloc] init];
    [self setupChildViewController:mainVC title:@"首页" normalName:@"" selectedName:@""];
    //工具
    ToolViewController *toolVC = [[ToolViewController alloc] init];
    [self setupChildViewController:toolVC title:@"工具" normalName:@"" selectedName:@""];
    //消息
    MessageViewController *messageVC = [[MessageViewController alloc] init];
    [self setupChildViewController:messageVC title:@"消息" normalName:@"" selectedName:@""];
    //我的
    MineViewController *mine = [[MineViewController alloc] init];
    [self setupChildViewController:mine title:@"我的" normalName:@"" selectedName:@""];
    
    self.navigationItem.title = @"首页";
    
}
#pragma mark 设置控制器
- (void)setupChildViewController:(UIViewController *)childViewController title:(NSString *)title normalName:(NSString *)normalName selectedName:(NSString *)selectedName {
    
    // 设置子控制器的标题
    childViewController.title = title;
    
    // 设置标签按钮
    // 普通按钮
    UIImage *normalImage = [UIImage imageNamed:normalName];
    UIImage *selectedImage = [UIImage imageNamed:selectedName];
    
    // 选中样式被系统重新渲染，需要设置选中样式不要被渲染(图片本身样式显示，不要渲染)
    selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    childViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:title image:normalImage selectedImage:selectedImage];
    
//    // 创建导航栏控制器
//    SHTabBarNavgation *nav = [[SHTabBarNavgation alloc] initWithRootViewController:childViewController];
//    // 添加子控制器
//    [self addChildViewController:nav];
    
    //添加子控制器
    [self addChildViewController:childViewController];
}
#pragma mark 导航栏按钮点击
- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    self.navigationItem.title = item.title;
    
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
