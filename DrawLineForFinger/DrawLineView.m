//
//  DrawLineView.m
//  DrawLineForFinger
//
//  Created by hankielao on 16/7/24.
//  Copyright © 2016年 hankielao. All rights reserved.
//

#import "DrawLineView.h"

@implementation DrawLineView


/**
 *  自动调用
 *
 *  @param rect <#rect description#>
 */
- (void)drawRect:(CGRect)rect {
    //获取上下文(画笔)
    CGContextRef context = UIGraphicsGetCurrentContext();
    //设置颜色
    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
    //线条的宽度
    CGContextSetLineWidth(context, 2);
    //单线条画法
    [self drawOneLine:context with:self.array];
}
- (void)drawOneLine:(CGContextRef)context with:(NSArray *)array;
{
    if (array.count>1) {
        NSValue *sta = array[0];
        for (NSInteger i = 1;i<array.count; i++) {
            //    NSLog(@"xxxxxx");
            NSValue *endValue = array[i];
            CGPoint spoint= [sta CGPointValue];
            CGPoint epoint = [endValue CGPointValue];
            sta = endValue;
            //起点
            CGContextMoveToPoint(context, spoint.x, spoint.y);
            //终点
            CGContextAddLineToPoint(context, epoint.x, epoint.y);
            //开始画线
            CGContextStrokePath(context);
            
        }
        
    }
}

@end
