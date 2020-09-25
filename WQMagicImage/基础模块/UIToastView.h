//
//  UIToastView.h
//  WQMagicImage
//
//  Created by 王其飞 on 2020/9/25.
//  Copyright © 2020 王其飞. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIToastView : NSObject

{
    UIImageView * toastView;
}

@property (nonatomic,retain) UIImageView * toastView;

#pragma mark - 便利方法，提示框有默认的Frame，默认的Frame是KTOASTLA

+ (void)showToastViewWithContent:(NSString *)content andTime:(float)time andObject:(UIViewController *)selfController;

+(void)showToastViewWithContent:(NSString *)content andTime:(float)time andObject:(UIViewController *)selfController andR:(CGFloat)r andG:(CGFloat)g andB:(CGFloat)b;

+ (void)showToastViewWithContent:(NSString *)content andTime:(float)time andObject:(UIViewController *)selfController andHightNoLimited:(BOOL)limited;

+ (void)showToastViewWithContent:(NSString *)content andTime:(float)time andObjectView:(UIView *)parentView;

#pragma mark - 完整的方法，没有默认的frame

+ (void)showToastViewWithContent:(NSString *)content andRect:(CGRect)rect andTime:(float)time andObject:(UIViewController *)selfController;

+ (void)showToastViewWithContent:(NSString *)content andRect:(CGRect)rect andTime:(float)time andObject:(UIViewController *)selfController andHightNoLimited:(BOOL)limited;

+ (void)showToastViewWithContent:(UIImage *)image andTitle:(NSString *)title andRect:(CGRect)rect andTime:(float)time andObject:(UIViewController *)selfController andStatus:(BOOL)isUploading;

+ (void)showToastViewWithContent:(NSString *)content andRect:(CGRect)rect andTime:(float)time andObjectView:(UIView *)parentView;

+ (void)removeToastView:(id)sender;

@end

NS_ASSUME_NONNULL_END
