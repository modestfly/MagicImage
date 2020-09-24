//
//  SizeHeightWithContent.h
//  WQMagicImage
//
//  Created by 王其飞 on 2020/9/22.
//  Copyright © 2020 王其飞. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SizeHeightWithContent : NSObject

#pragma mark 较短文字的计算高度的方法
- (CGSize)sizeHeightWithShortContent:(NSString *)str andFont:(UIFont *)font;

#pragma mark 详细文本计算高度的方法
- (CGSize)sizeHeightWithDetailContent:(NSString *)str andFont:(UIFont *)font andWidth:(CGFloat)width;

#pragma mark 分段或者有换行符的文字高度计算方法
- (CGSize)sizeHeightWithMutableLienContent:(NSString *)str  andFont:(UIFont *)font andWidth:(CGFloat)width andSubstr:(NSString *)substr;



@end

NS_ASSUME_NONNULL_END
