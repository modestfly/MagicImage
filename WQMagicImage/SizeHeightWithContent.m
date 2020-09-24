//
//  SizeHeightWithContent.m
//  WQMagicImage
//
//  Created by 王其飞 on 2020/9/22.
//  Copyright © 2020 王其飞. All rights reserved.
//

#import "SizeHeightWithContent.h"

@implementation SizeHeightWithContent

#pragma mark 较短文字的计算高度的方法
- (CGSize)sizeHeightWithShortContent:(NSString *)str andFont:(UIFont *)font{
    
    CGSize size = [str sizeWithAttributes:@{NSFontAttributeName:font}];
    
    
    return size;
    
}

#pragma mark 详细文本计算高度的方法
- (CGSize)sizeHeightWithDetailContent:(NSString *)str andFont:(UIFont *)font andWidth:(CGFloat)width{
    
    CGSize size = [str boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX) options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil].size;
    
    return size;
    
}

#pragma mark 分段或者有换行符的文字高度计算方法
- (CGSize)sizeHeightWithMutableLienContent:(NSString *)str  andFont:(UIFont *)font andWidth:(CGFloat)width andSubstr:(NSString *)substr{
    
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] init];
    
    //获取头部字符串的长度
    NSRange titleRange = NSMakeRange(0, str.length);
    
    //将头部标题的字符串进行转化
    NSMutableAttributedString *titleAttributeString = [[NSMutableAttributedString alloc] initWithString:str];
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    
    paragraphStyle.alignment = NSTextAlignmentCenter;
    
    [titleAttributeString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:titleRange];
    
    [titleAttributeString addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:18.f] range:titleRange];
    
    //内容
    //获取内容字符串的长度
    NSRange contentRange = NSMakeRange(0, substr.length);
    
    NSMutableAttributedString *contentAttributeString = [[NSMutableAttributedString alloc]initWithString:substr];
    
    NSMutableParagraphStyle *contentParagraphStyle = [[NSMutableParagraphStyle alloc] init];
    
    contentParagraphStyle.lineSpacing = 10.f;
    
    [contentAttributeString addAttribute:NSParagraphStyleAttributeName value:contentParagraphStyle range:contentRange];
    
    [contentAttributeString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:14.f] range:contentRange];
    
    [contentAttributeString addAttribute:NSKernAttributeName value:@(1) range:contentRange];
    
    [attributeString appendAttributedString:contentAttributeString];
    
    
    CGSize size = CGSizeMake(width, CGFLOAT_MAX);
    
    NSDictionary *titleAttribute = @{NSFontAttributeName:[UIFont boldSystemFontOfSize:18.f],NSParagraphStyleAttributeName:paragraphStyle};
    
    //头部标题Size的计算
    CGSize titleSize = [str boundingRectWithSize:size options:NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin attributes:titleAttribute context:nil].size;
    
    //下面内容Size的计算
    NSDictionary *ContentAttribute = @{NSFontAttributeName:[UIFont systemFontOfSize:14.f],NSParagraphStyleAttributeName:contentParagraphStyle,NSKernAttributeName:@(1)};
    
    CGSize contentSize = [substr boundingRectWithSize:size options:NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin attributes:ContentAttribute context:nil].size;
    
    size = CGSizeMake(width, titleSize.height + contentSize.height);
    
    return size;
}

@end
