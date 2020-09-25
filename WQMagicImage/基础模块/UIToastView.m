//
//  UIToastView.m
//  WQMagicImage
//
//  Created by 王其飞 on 2020/9/25.
//  Copyright © 2020 王其飞. All rights reserved.
//

#import "UIToastView.h"
#import <QuartzCore/QuartzCore.h>
#import "Utilities.h"
@implementation UIToastView

@synthesize toastView;
- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}
#pragma mark - 便利方法，提示框有默认的Frame，默认的Frame是KTOASTLA

+ (void)showToastViewWithContent:(NSString *)content andTime:(float)time andObject:(UIViewController *)selfController
{
    [UIToastView showToastViewWithContent:content andRect:KTOASTLA andTime:time andObject:selfController];
}
+(void)showToastViewWithContent:(NSString *)content andTime:(float)time andObject:(UIViewController *)selfController andR:(CGFloat)r andG:(CGFloat)g andB:(CGFloat)b{
    [UIToastView showToastViewWithContent:content andRect:KTOASTLA andTime:time andObject:selfController andR:r andG:g andB:b];
    
}
+ (void)showToastViewWithContent:(NSString *)content andTime:(float)time andObject:(UIViewController *)selfController andHightNoLimited:(BOOL)limited
{
    [UIToastView showToastViewWithContent:content andRect:KTOASTLA andTime:time andObject:selfController andHightNoLimited:limited];
}

+ (void)showToastViewWithContent:(NSString *)content andTime:(float)time andObjectView:(UIView *)parentView
{
    [UIToastView showToastViewWithContent:content andRect:KTOASTLA andTime:time andObjectView:parentView];
}

#pragma mark - 完整的方法，没有默认的frame

+ (void)showToastViewWithContent:(NSString *)content andRect:(CGRect)rect andTime:(float)time andObject:(UIViewController *)selfController
{
    if ([selfController.view viewWithTag:1234554321]) {
        UIView * tView = [selfController.view viewWithTag:1234554321];
        [tView removeFromSuperview];
    }
    
    UIView * toastView = nil;
    if (IOS7DEVICE) {
        toastView = [[UIView alloc] initWithFrame:rect];
        toastView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.7f];
        [toastView.layer setCornerRadius:8.0f];
    } else {
        toastView = [[UIImageView alloc] initWithFrame:rect];
        NSString *imageName = [NSString stringWithFormat:@"toastBackImage.png"];
        if ([UIImage imageNamed:imageName]) {
            [(UIImageView *)toastView setImage:[[UIImage imageNamed:imageName] stretchableImageWithLeftCapWidth:10 topCapHeight:10]];
        }else{
            toastView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.7f];
        }
        [toastView.layer setCornerRadius:5.0f];
    }

    [toastView.layer setMasksToBounds:YES];
    [toastView setTag:1234554321];
    [selfController.view addSubview:toastView];
    
    CGSize labelSize = [content sizeWithFont:[UIFont systemFontOfSize:17.0f]
                           constrainedToSize: CGSizeMake( rect.size.width ,MAXFLOAT)
                               lineBreakMode: NSLineBreakByWordWrapping];
    if (labelSize.height > rect.size.height) {
        [toastView setFrame:CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, labelSize.height)];
    }
    UILabel * contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, toastView.frame.size.width - 20, toastView.frame.size.height)];
    [contentLabel setText:content];
    [contentLabel setTextColor:[UIColor whiteColor]];
    [contentLabel setFont:[UIFont systemFontOfSize:14.0f]];
    [contentLabel setTextAlignment:NSTextAlignmentCenter];
    [contentLabel setBackgroundColor:[UIColor clearColor]];
    [contentLabel setNumberOfLines:0];
    [contentLabel setLineBreakMode:NSLineBreakByWordWrapping];
    [toastView addSubview:contentLabel];
    
    if (time>0.01) {
        [self performSelector:@selector(removeToastView:) withObject:selfController afterDelay:time];
    }
}
+ (void)showToastViewWithContent:(NSString *)content andRect:(CGRect)rect andTime:(float)time andObject:(UIViewController *)selfController andR:(CGFloat)r andG:(CGFloat)g andB:(CGFloat)b{
    if ([selfController.view viewWithTag:1234554321]) {
        UIView * tView = [selfController.view viewWithTag:1234554321];
        [tView removeFromSuperview];
    }
    
    UIView * toastView = nil;
    if (IOS7DEVICE) {
        toastView = [[UIView alloc] initWithFrame:rect];
        toastView.backgroundColor = [UIColor colorWithRed:r green:g blue:b alpha:0.7f];
        [toastView.layer setCornerRadius:8.0f];
    } else {
        toastView = [[UIImageView alloc] initWithFrame:rect];
        toastView.backgroundColor = [UIColor colorWithRed:r green:g blue:b alpha:0.7f];
        [toastView.layer setCornerRadius:5.0f];
    }
    
    [toastView.layer setMasksToBounds:YES];
    [toastView setTag:1234554321];
    [selfController.view addSubview:toastView];
    CGSize labelSize = [content sizeWithFont:[UIFont systemFontOfSize:17.0f]
                           constrainedToSize: CGSizeMake( rect.size.width ,MAXFLOAT)
                               lineBreakMode: NSLineBreakByWordWrapping];
    if (labelSize.height > rect.size.height) {
        [toastView setFrame:CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, labelSize.height)];
    }
    UILabel * contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, toastView.frame.size.width - 20, toastView.frame.size.height)];
    [contentLabel setText:content];
    [contentLabel setTextColor:[UIColor whiteColor]];
    [contentLabel setFont:[UIFont systemFontOfSize:14.0f]];
    [contentLabel setTextAlignment:NSTextAlignmentCenter];
    [contentLabel setBackgroundColor:[UIColor clearColor]];
    [contentLabel setNumberOfLines:0];
    [contentLabel setLineBreakMode:NSLineBreakByWordWrapping];
    [toastView addSubview:contentLabel];
    
    if (time>0.01) {
        [self performSelector:@selector(removeToastView:) withObject:selfController afterDelay:time];
    }
}
+ (void)showToastViewWithContent:(NSString *)content andRect:(CGRect)rect andTime:(float)time andObject:(UIViewController *)selfController andHightNoLimited:(BOOL)limited
{
    if ([selfController.view viewWithTag:1234554321]) {
        UIView * tView = [selfController.view viewWithTag:1234554321];
        [tView removeFromSuperview];
    }
    
    UIView * toastView = nil;
    if (IOS7DEVICE) {
        toastView = [[UIView alloc] initWithFrame:rect];
        toastView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.7f];
        [toastView.layer setCornerRadius:8.0f];
    } else {
        toastView = [[UIImageView alloc] initWithFrame:rect];
        NSString *imageName = [NSString stringWithFormat:@"toastBackImage.png"];
        if ([UIImage imageNamed:imageName]) {
            [(UIImageView *)toastView setImage:[[UIImage imageNamed:imageName] stretchableImageWithLeftCapWidth:10 topCapHeight:10]];
        }else{
            toastView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.7f];
        }
        [toastView.layer setCornerRadius:5.0f];
    }
    [toastView.layer setMasksToBounds:YES];
    [toastView setTag:1234554321];
    [selfController.view addSubview:toastView];

    UILabel * contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, 200, 40)];
    
    [contentLabel setText:content];
    [contentLabel setTextColor:[UIColor whiteColor]];
    [contentLabel setTextAlignment:NSTextAlignmentCenter];
    [contentLabel setBackgroundColor:[UIColor clearColor]];
    [contentLabel setNumberOfLines:0];
    [toastView addSubview:contentLabel];
    
    [self performSelector:@selector(removeToastView:) withObject:selfController afterDelay:time];
}

+ (void)showToastViewWithContent:(UIImage *)image andTitle:(NSString *)title andRect:(CGRect)rect andTime:(float)time andObject:(UIViewController *)selfController andStatus:(BOOL)isUploading
{
    /*在toastview上显示菊花或显示加载完成的图片  用参数 isUploading 做判断
     已基本实现根据toastview的大小完成自动布局
     菊花的宽高为toastview宽高的1/12
     加载完成图片的宽为toastview的5/12 高度根据图片自身宽高比匹配
     */
    if ([selfController.view viewWithTag:1234554321]) {
        UIView * tView = [selfController.view viewWithTag:1234554321];
        [tView removeFromSuperview];
    }
    CGFloat  ox =0;
    CGFloat  oy =0;
    CGFloat  width = 0;
    CGFloat  height=0;
    
    UIImageView * toastView = [[UIImageView alloc] initWithFrame:rect];
    
    CGSize labelSize = [title sizeWithFont:[UIFont systemFontOfSize:15.0f]
                         constrainedToSize: CGSizeMake( rect.size.width-20 ,MAXFLOAT)
                             lineBreakMode: NSLineBreakByWordWrapping];
    
    if(isUploading==YES){
        width = rect.size.width/12;
        height = width;
        ox =(rect.size.width-10)/2.0;
        oy = (rect.size.height-10-labelSize.height)/2.0;
        UIActivityIndicatorView * activityView = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
        activityView.frame = CGRectMake(ox, oy, width, height);
        [toastView addSubview:activityView];
        [activityView startAnimating];
        
    }else{
        width = rect.size.width*5/12;
        height =width*image.size.height/image.size.width;
        ox =(rect.size.width-50)/2.0;
        oy =(rect.size.height-50*image.size.height/image.size.width-labelSize.height)/2.0;
        UIImageView *completeImage = [[UIImageView alloc]initWithFrame:CGRectMake(ox,oy,width,height)];
        completeImage.image =image;
        completeImage.backgroundColor = [UIColor clearColor];
        [toastView addSubview:completeImage];
    }
    
    [toastView setBackgroundColor:[[UIColor blackColor] colorWithAlphaComponent:0.85f]];
    [toastView.layer setCornerRadius:5.0f];
    [toastView.layer setMasksToBounds:YES];
    [toastView setAlpha:1.0f];
    [toastView setTag:1234554321];
    [selfController.view addSubview:toastView];
    
    if (labelSize.height > rect.size.height) {
        [toastView setFrame:CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, labelSize.height)];
    }
    ox = 10;
    oy = rect.size.height-labelSize.height-10;
    width = rect.size.width -20;
    height = labelSize.height;
    UILabel * contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(ox , oy, width, height)];
    [contentLabel setText:title];
    [contentLabel setTextColor:[UIColor whiteColor]];
    [contentLabel setFont:[UIFont systemFontOfSize:15.0f]];
    [contentLabel setTextAlignment:NSTextAlignmentCenter];
    [contentLabel setBackgroundColor:[UIColor clearColor]];
    [contentLabel setNumberOfLines:0];
    [contentLabel setLineBreakMode:NSLineBreakByWordWrapping];
    [toastView addSubview:contentLabel];
    
    if(time>0){
        [self performSelector:@selector(removeToastView:) withObject:selfController afterDelay:time];
    }
}

+ (void)removeToastView:(id)sender
{
    UIViewController * selfController = (UIViewController *)sender;
    UIView * toastView = [selfController.view viewWithTag:1234554321];
    [toastView removeFromSuperview];
    toastView = nil;
}

//在某个view上面加一个toast提示
+ (void)showToastViewWithContent:(NSString *)content andRect:(CGRect)rect andTime:(float)time andObjectView:(UIView *)parentView
{
    if ([parentView viewWithTag:1234554321]) {
        UIView * tView = [parentView viewWithTag:1234554321];
        [tView removeFromSuperview];
    }
    
    UIView * toastView = nil;
    if (IOS7DEVICE) {
        toastView = [[UIView alloc] initWithFrame:rect];
        toastView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.7f];
        [toastView.layer setCornerRadius:8.0f];
    } else {
        toastView = [[UIImageView alloc] initWithFrame:rect];
        NSString *imageName = [NSString stringWithFormat:@"toastBackImage.png"];
        if ([UIImage imageNamed:imageName]) {
            [(UIImageView *)toastView setImage:[[UIImage imageNamed:imageName] stretchableImageWithLeftCapWidth:10 topCapHeight:10]];
        }else{
            toastView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.7f];
        }
        [toastView.layer setCornerRadius:5.0f];
    }
    [toastView.layer setMasksToBounds:YES];
    [toastView setTag:1234554321];
    [parentView addSubview:toastView];
    
    CGSize labelSize = [content sizeWithFont:[UIFont systemFontOfSize:17.0f]
                           constrainedToSize: CGSizeMake( rect.size.width ,MAXFLOAT)
                               lineBreakMode: NSLineBreakByWordWrapping];
    
    if (labelSize.height > rect.size.height) {
        [toastView setFrame:CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, labelSize.height)];
    }
    UILabel * contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, toastView.frame.size.width - 20, toastView.frame.size.height)];
    [contentLabel setText:content];
    [contentLabel setTextColor:[UIColor whiteColor]];
    [contentLabel setFont:[UIFont systemFontOfSize:14.0f]];
    [contentLabel setTextAlignment:NSTextAlignmentCenter];
    [contentLabel setBackgroundColor:[UIColor clearColor]];
    [contentLabel setNumberOfLines:0];
    [contentLabel setLineBreakMode:NSLineBreakByWordWrapping];
    [toastView addSubview:contentLabel];
    
    if (time>0.01) {
        [self performSelector:@selector(removeToastViewFromParentView:) withObject:parentView afterDelay:time];
    }
    
}

+ (void)removeToastViewFromParentView:(id)sender
{
    UIView * parentView = (UIView *)sender;
    UIView * toastView = [parentView viewWithTag:1234554321];
    [toastView removeFromSuperview];
    toastView = nil;
    
}



@end
