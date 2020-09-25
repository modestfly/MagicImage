//
//  Utilities.m
//  WQMagicImage
//
//  Created by 王其飞 on 2020/9/25.
//  Copyright © 2020 王其飞. All rights reserved.
//

#import "Utilities.h"
#import "AppDelegate.h"
@implementation Utilities

#pragma mark 去除前后空格
+(NSString *)removeSpaceWitnString:(NSString *)string
{
    NSString *str = @"";
    
    if (string == nil) {
        return str;
    }
    
    unichar ch;
    int startIndex = -1;
    int endIndex = 0;
    NSInteger length = [string length];
    for (int i = 0; i < length; i++) {
        
        ch = [string characterAtIndex:i];
        
        if (!isblank(ch)) {
            
            if (startIndex < 0) {
                startIndex = i;
            }
            else
            {
                endIndex = i;
            }
        }
    }
    
    if (startIndex == -1) {
        return @"";
    }
    
    NSRange range;
    range.location = startIndex;
    if (endIndex == 0) {
        range.length = endIndex + 1;
    } else {
        
        range.length = endIndex - startIndex + 1;
    }
    str = [string substringWithSafeRange:range];
    return str;
}
//获取当前网络状态
+(NSString *)netWorkStates
{
    UIApplication *app = [UIApplication sharedApplication];
    NSArray *children = [[[app valueForKeyPath:@"statusBar"]valueForKeyPath:@"foregroundView"]subviews];
    NSString *state = [[NSString alloc]init];
    int netType = 0;
    //获取到网络返回码
    for (id child in children) {
        if ([child isKindOfClass:NSClassFromString(@"UIStatusBarDataNetworkItemView")]) {
            //获取到状态栏
            netType = [[child valueForKeyPath:@"dataNetworkType"]intValue];
            
            switch (netType) {
                case 0:
                    state = @"无网络";
                    //无网模式
                    break;
                case 1:
                    state = @"2G流量";
                    break;
                case 2:
                    state = @"3G流量";
                    break;
                case 3:
                    state = @"4G流量";
                    break;
                case 5:
                {
                    state = @"wifi";
                }
                    break;
                default:
                    break;
            }
        }
    }
    //根据状态选择
    return state;
}
+(NSDateFormatter *)dateFormateFromDateString:(NSString *)datsString
{
    NSDateFormatter * formatter = [[NSDateFormatter alloc]init];
    NSString * formatString = @"";
    if([datsString rangeOfString:@"-"].location != NSNotFound)
    {
        formatString = @"yyyy-MM-dd HH:mm:ss";
    }
    else
    {
        formatString = @"yyyy/MM/dd HH:mm:ss";
    }
    [formatter setDateFormat:formatString];
    
    return formatter;
}

@end

@implementation NSString (NSStringExtend)

- (NSString *)substringWithSafeRange:(NSRange)range
{
    if (self.length >= range.location + range.length) {
        
        return [self substringWithRange:range];
    }else{
        
        return [self substringWithRange:NSMakeRange(range.location, self.length - range.location)];
    }
}
- (NSString *)subStringFrom:(NSString *)startString to:(NSString *)endString{
    
    NSRange startRange = [self rangeOfString:startString];
    NSRange endRange = [self rangeOfString:endString];
    NSRange range = NSMakeRange(startRange.location + startRange.length, endRange.location - startRange.location - startRange.length);
    return [self substringWithRange:range];
    
}
@end
