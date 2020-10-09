//
//  ViewController.m
//  WQMagicImage
//
//  Created by 王其飞 on 2020/9/18.
//  Copyright © 2020 王其飞. All rights reserved.
//

#import "ViewController.h"
#import "MainViewController.h"
#import <AVFoundation/AVFoundation.h>
#import "UIToastView.h"
#import "Utilities.h"
#import <CoreGraphics/CoreGraphics.h>
#import "testView.h"
@interface ViewController ()<UINavigationBarDelegate,UIImagePickerControllerDelegate>

@property(nonatomic, strong)UIImagePickerController *imagePickerController;

@property(nonatomic, strong)UIImageView *photoImageView;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"测试";
 
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    testView *testV = [[testView alloc] initWithFrame:CGRectMake(0, 200, SCREEN_WIDTH, SCREEN_HEIGHT)];
    
    testV.backgroundColor = [UIColor lightGrayColor];
    
    
    [self.view addSubview:testV];
    
    //一个不透明类型的Quartz 2D绘画环境,相当于一个画布,你可以在上面任意绘画

        
//    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
//    btn2.frame = CGRectMake(50, 130, 100, 100);
//    [self.view addSubview:btn2];
//    [btn2 setImage:[UIImage imageNamed:@"test"] forState:UIControlStateNormal];
//    //方法一:部分控件进行遮挡
//    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
//    btn1.frame = CGRectMake(50, 330, 100, 100);
//    [self.view addSubview:btn1];
//    [btn1 setImage:[UIImage imageNamed:@"test"] forState:UIControlStateNormal];
//    UIView *label = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, 100)];
//    label.backgroundColor = [UIColor lightGrayColor];
//    [btn1 addSubview:label];
//    UIView *labe2 = [[UIView alloc] initWithFrame:CGRectMake(20, 0, 80, 20)];
//    labe2.backgroundColor = [UIColor lightGrayColor];
//    [btn1 addSubview:labe2];
//    //方法二：使用蒙层mask进行遮挡
//    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//    btn.frame = CGRectMake(180, 330, 100, 100);
//    [self.view addSubview:btn];
//    [btn setImage:[UIImage imageNamed:@"test"] forState:UIControlStateNormal];
//    CAShapeLayer *mask = [CAShapeLayer new];
//    mask.path = [UIBezierPath bezierPathWithRect:CGRectMake(20, 20,80, 80)].CGPath;
//    btn.layer.mask = mask;

    
    
//    // 1. UIImageView
//    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(50, 100, 300, 200)];
//    imageView.image = [UIImage imageNamed:@"test"];
//    [self.view addSubview:imageView];
//
//    // image + cornerRadius + masksToBounds 不会触发离屏渲染
//    imageView.layer.cornerRadius = 10;
//    imageView.layer.masksToBounds = YES;
//
//    // 触发离屏渲染
//    imageView.backgroundColor = [UIColor greenColor];
//    // 添加一个空的UIView不会触发离屏渲染
//    // imageView.addSubview(UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10)))
//
//    // 2. UIButton
//    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
//    button.frame = CGRectMake(50, 350, 300, 50);
//    [self.view addSubview:button];
//    [button setTitle:@"Test" forState:UIControlStateNormal];
//    [button setTintColor:[UIColor blueColor]];
//    button.layer.cornerRadius = 10;
//    button.layer.masksToBounds = YES;
//
//    // 触发离屏渲染
//    button.backgroundColor = [UIColor greenColor];
//    // 触发离屏渲染
//    [button setBackgroundImage:[UIImage imageNamed:@"test"] forState:UIControlStateNormal];
//
//    // 3. UIView
//    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(50, 450, 300, 50)];
//    [self.view addSubview:view];
//    view.backgroundColor = [UIColor redColor];
//    view.layer.cornerRadius = 10;
//    view.layer.masksToBounds = YES;
//
//    // label如果被渲染，则会触发渲染，如果text为空不会被渲染
//    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 1, 1)];
//    label.text = @"1";
//    [view addSubview:label];
    
    

//    self.photoImageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 500, 100, 100)];
//
//    self.photoImageView.backgroundColor = [UIColor greenColor];
//
//
//    [self.view addSubview:self.photoImageView];
//
//    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//
//    button.frame = CGRectMake(100, 100, 100, 100);
//
//    [button setTitle:@"添加图片" forState:UIControlStateNormal];
//
//    button.backgroundColor = [UIColor redColor];
//
//    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
//
//    [self.view addSubview:button];
//
    
//
//    NSLog(@"%@",self.view);
    
    // Do any additional setup after loading the view.
}


-(void)buttonAction:(UIButton *)sender{
    
    self.imagePickerController = [[UIImagePickerController alloc] init];
    
    self.imagePickerController.delegate = self;
    
    self.imagePickerController.allowsEditing = YES;
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *photoAction = [UIAlertAction actionWithTitle:@"相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        [self selectPhotoByLibrary];
    }];
    
    UIAlertAction *albumAction = [UIAlertAction actionWithTitle:@"相机" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self selectPhotoByCancme];
    }];
    
    UIAlertAction *cancleAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    [alertController addAction:photoAction];
    [alertController addAction:albumAction];
    [alertController addAction:cancleAction];
                    
    [self.navigationController presentViewController:alertController animated:YES completion:^{
        
        
    }];
    
    NSLog(@"UIAlertView:%@",alertController.view);
    
//    MainViewController *mainVC = [[MainViewController  alloc]init];
//
//    [self.navigationController pushViewController:mainVC animated:YES];
}

-(void)selectPhotoByCancme{
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        //权限判断
        AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
        
        if (authStatus == AVAuthorizationStatusRestricted || authStatus == AVAuthorizationStatusDenied) {
            //无权限
            NSLog(@"无权限");
        }
        else{
            
            self.imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
            
            self.imagePickerController.cameraDevice = UIImagePickerControllerCameraDeviceRear;
            
            [self presentViewController:self.imagePickerController animated:YES completion:nil];
        }
    }
    else{
                
        [UIToastView showToastViewWithContent:@"该设备没有相机,请确认！" andTime:2.0f andObject:self];
    }
    
}

-(void)selectPhotoByLibrary{
    
    self.imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:self.imagePickerController animated:YES completion:nil];
}
//imagePickerController的回调方法
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey,id> *)info{
    
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    UIImage *iamge = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    self.photoImageView.image = iamge;
}



    
@end


