//
//  testView.m
//  WQMagicImage
//
//  Created by 王其飞 on 2020/9/30.
//  Copyright © 2020 王其飞. All rights reserved.
//

#import "testView.h"
#define PI 3.14159
@implementation testView

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {

     //一个不透明类型的Quartz 2D绘画环境,相当于一个画布,你可以在上面任意绘画
 //   CGContextRef contextRef =UIGraphicsGetCurrentContext();
//     //边框圆
//     CGContextSetRGBStrokeColor(contextRef,1,1,1,1.0);//画笔线的颜色
//     CGContextSetLineWidth(contextRef,1.0);//线的宽度
//     //void CGContextAddArc(CGContextRef c,CGFloat x, CGFloat y,CGFloat radius,CGFloat startAngle,CGFloat endAngle, int clockwise)1弧度＝180°/π（≈57.3°）度＝弧度×180°/π 360°＝360×π/180＝2π弧度
//     // x,y为圆点坐标，radius半径，startAngle为开始的弧度，endAngle为结束的弧度，clockwise 0为顺时针，1为逆时针。
//     CGContextAddArc(contextRef,100,20,15,0,2*PI,0);//添加一个圆
//     CGContextDrawPath(contextRef,kCGPathStroke);//绘制路径
//     //填充圆，无边框
//     CGContextAddArc(contextRef,150,30,30,0,2*PI,0);//添加一个圆
//     CGContextDrawPath(contextRef,kCGPathFill);//绘制填充
//     //画大圆并填充颜
//     UIColor *aColor = [UIColor colorWithRed:1 green:0.0 blue:0 alpha:1];
//     CGContextSetFillColorWithColor(contextRef, aColor.CGColor);//填充颜色
//     CGContextSetLineWidth(contextRef,3.0);//线的宽度
//     CGContextAddArc(contextRef,250,40,40,0,2*PI,0);//添加一个圆
//     CGContextDrawPath(contextRef,kCGPathFillStroke);//绘制路径加填充
//    //画椭圆
//    //2.描述路径 这是画椭圆的方法，大家都知道
//    CGContextAddEllipseInRect(contextRef,CGRectMake(10,280,200,100));//椭圆
//    CGContextFillPath(contextRef);
//    //画线段
//    CGPoint addLines[2];
//    addLines[0].x = 100; addLines[0].y = 100;
//    addLines[1].x = 200;  addLines[1].y = 100;
//    CGContextAddLines(contextRef,addLines,2);
//    CGContextStrokePath(contextRef);
//    //画矩形
//    CGPoint addRect[5];
//    addRect[0] = CGPointMake(250,250);
//    addRect[1] = CGPointMake(350,250);
//    addRect[2] = CGPointMake(350,350);
//    addRect[3] = CGPointMake(250,350);
//    addRect[4] = CGPointMake(250,250);
//    CGContextAddLines(contextRef,addRect,5);
//    CGContextStrokePath(contextRef);
    
    //一个不透明类型的Quartz 2D绘画环境,相当于一个画布,你可以在上面任意绘画
    CGContextRef contextRef =UIGraphicsGetCurrentContext();
    //画线段
    //2.描述路径
    UIBezierPath * path = [UIBezierPath bezierPath];
    //起点
    [path moveToPoint:CGPointMake(10, 100)];
    //终点
    [path addLineToPoint:CGPointMake(100, 200)];
    //设置颜色
    [[UIColor whiteColor]setStroke];
    //3.添加路径
    CGContextAddPath(contextRef, path.CGPath);
    //显示路径
    CGContextStrokePath(contextRef);
    //2.描述路径
    UIBezierPath * path1 = [UIBezierPath bezierPath];
    //起点
    [path1 moveToPoint:CGPointMake(200, 200)];
    //第二个点
    [path1 addLineToPoint:CGPointMake(300, 200)];
    //第三个点
    [path1 addLineToPoint:CGPointMake(300, 300)];
    //第四个点
    [path1 addLineToPoint:CGPointMake(200, 300)];
    //闭合路径 也等于 [path addLineToPoint:CGPointMake(10, 10)];
    [path1 closePath];
    //设置颜色
    [[UIColor greenColor]setStroke];
    //3.添加路径
    CGContextAddPath(contextRef, path1.CGPath);
    //显示路径
    CGContextStrokePath(contextRef);
    
    
    
}


@end
