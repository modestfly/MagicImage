//
//  Utilities.h
//  WQMagicImage
//
//  Created by 王其飞 on 2020/9/25.
//  Copyright © 2020 王其飞. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

//屏幕宽度
#define SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width
//屏幕高度
#define SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height
//状态栏高度
#define STATUSBAR_HEIGHT 20.0f
//导航栏高度self.navigationController.navigationBar.frame.size.height
#define NAVIGATIONBAR_HEIGHT 44.0f
//RGB色值
#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
//toast位置
#define KTOASTLA CGRectMake((SCREEN_WIDTH - 200)/2.0, SCREEN_HEIGHT/2-50-NAVIGATIONBAR_HEIGHT, 200, 50)
//判断设备的系统版本
#define IOS7DEVICE ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)

@interface Utilities : NSObject

//去除前后空格
+(NSString *)removeSpaceWitnString:(NSString*)string;
//获取当前网络状态
+(NSString *)netWorkStates;
//有关时间的解析
+(NSDateFormatter *)dateFormateFromDateString:(NSString *)datsString;

@end

@interface NSString (NSStringExtend)
/**
    如果截取字符串越界，那么截取从location 到结尾的字符串
 */
- (NSString *)substringWithSafeRange:(NSRange)range;
- (NSString *)subStringFrom:(NSString *)startString to:(NSString *)endString;
@end
NS_ASSUME_NONNULL_END
