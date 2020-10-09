//
//  WMTabBar.m
//  WQMagicImage
//
//  Created by 王其飞 on 2020/10/9.
//  Copyright © 2020 王其飞. All rights reserved.
//

#import "WMTabBar.h"
#import "Utilities.h"
@implementation WMTabBar

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [Utilities colorWithHexString:@"#f7f7f8"];
        // 添加消息按钮
//        [self createMessageBtn];
    }
    return self;

}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
