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
@interface ViewController ()<UINavigationBarDelegate,UIImagePickerControllerDelegate>

@property(nonatomic, strong)UIImagePickerController *imagePickerController;

@property(nonatomic, strong)UIImageView *photoImageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.photoImageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 0, 100, 100)];
    
    self.photoImageView.backgroundColor = [UIColor lightGrayColor];
    
    [self.view addSubview:self.photoImageView];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    button.frame = CGRectMake(100, 100, 100, 100);
    
    [button setTitle:@"添加图片" forState:UIControlStateNormal];
    
    button.backgroundColor = [UIColor lightGrayColor];
    
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
    
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
