//
//  ZDCustomView.m
//  PNChartDemo
//
//  Created by 韩俊强 on 2016/10/17.
//  Copyright © 2016年 HaRi. All rights reserved.
//

#import "ZDCustomView.h"

@implementation ZDCustomView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self == [super initWithFrame:frame]) {
        
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    //设置虚线颜色
    CGContextSetStrokeColorWithColor(currentContext, [UIColor colorWithRed:14.0f/255.0f green:110.0f/255.0f blue:108.0f/255.0f alpha:1.0f].CGColor);
    //设置虚线宽度
    CGContextSetLineWidth(currentContext, 1);
    //设置虚线绘制起点
    CGContextMoveToPoint(currentContext, 0, 0);
    //设置虚线绘制终点
    CGContextAddLineToPoint(currentContext, self.frame.origin.x + self.frame.size.width, 0);
    //设置虚线排列的宽度间隔:下面的arr中的数字表示先绘制3个点再绘制1个点
    CGFloat arr[] = {7, 1};
    //下面最后一个参数“2”代表排列的个数。
    CGContextSetLineDash(currentContext, 0, arr, 2);
    //画线
    CGContextDrawPath(currentContext, kCGPathStroke);
}


@end
