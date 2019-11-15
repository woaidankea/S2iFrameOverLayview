//
//  S2iFrameOverlayView.m
//  S2iPhone
//
//  Created by Pai Peng on 04/11/2016.
//  Copyright © 2016 沈阳安创信息科技有限公司. All rights reserved.
//

#import "S2iFrameOverlayView.h"
@interface S2iFrameOverlayView(){
    NSInteger cols;
    NSInteger rows;
     NSInteger lineWidth;
    NSString *lineColor;
}

@end
@implementation S2iFrameOverlayView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (id)initWithCol:(NSInteger)col andRow:(NSInteger)row lineColor:(NSString *)hexColor lineWidth:(NSInteger)width Frame:(CGRect)frame{
    self = [super initWithFrame:frame];
    [self setBackgroundColor:[UIColor colorWithRed:(0)/255.0 green:(0)/255.0 blue:(0)/255.0 alpha:(0)]];
    cols = col;
    rows = row;
    lineWidth = width;
    lineColor = hexColor;
    
    return self;
}

- (id) initWithFrame: (CGRect) frame {
    self = [super initWithFrame:frame];
    [self setBackgroundColor:[UIColor colorWithRed:(0)/255.0 green:(0)/255.0 blue:(0)/255.0 alpha:(0)]];
    
    
    return self;
}

-(void) drawRect:(CGRect)rect {
    //获得处理的上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //指定直线样式
    CGContextSetLineCap(context, kCGLineCapButt);
    
    //直线宽度
    CGContextSetLineWidth(context, lineWidth);
    
    unsigned int red, green, blue,alpha;
       NSRange range;
       range.length = 2;
       
       range.location = 0;
       [[NSScanner scannerWithString:[lineColor substringWithRange:range]] scanHexInt:&red];
       range.location = 2;
       [[NSScanner scannerWithString:[lineColor substringWithRange:range]] scanHexInt:&green];
       range.location = 4;
       [[NSScanner scannerWithString:[lineColor substringWithRange:range]] scanHexInt:&blue];
        range.location = 6;
        [[NSScanner scannerWithString:[lineColor substringWithRange:range]] scanHexInt:&alpha];

    // draw rect line
    //设置颜色
    CGContextSetRGBStrokeColor(context, (float)(red/255.0f), (float)(green/255.0f), (float)(blue/255.0f), (float)(alpha/255.0f));
    CGPoint aPoints[5];//坐标点
    aPoints[0] =CGPointMake(0, 0);//坐标1
    aPoints[1] =CGPointMake(rect.size.width, 0);//坐标2
    aPoints[2] =CGPointMake(rect.size.width, rect.size.height);//坐标2
    aPoints[3] =CGPointMake(0, rect.size.height);//坐标2
    aPoints[4] =CGPointMake(0, 0);//坐标1
    
    
    //CGContextAddLines(CGContextRef c, const CGPoint points[],size_t count)
    //points[]坐标数组，和count大小
    CGContextAddLines(context, aPoints, 5);//添加线

    
    CGFloat x_step = rect.size.width/cols;
    for (int i = 1; i < cols; i++) {
        CGPoint aPoints[2];
        aPoints[0] =CGPointMake(x_step*i, 0);//坐标1
        aPoints[1] =CGPointMake(x_step*i, rect.size.height);//坐标2
        CGContextAddLines(context, aPoints, 2);//添加线
    }
    CGFloat y_step = rect.size.height/rows;
    
    for (int i = 1; i < rows; i++) {
          CGPoint aPoints[2];
          aPoints[0] =CGPointMake(0, y_step*i);//坐标1
          aPoints[1] =CGPointMake(rect.size.width, y_step*i);//坐标2
          CGContextAddLines(context, aPoints, 2);//添加线
      }
    
//    for (int i = 1; i < rect.size.height/x_step ; i++) {
//        CGPoint aPoints[2];
//        aPoints[0] =CGPointMake(0, x_step*i);//坐标1
//        aPoints[1] =CGPointMake(-rect.size.width, x_step*i);//坐标2
//        CGContextAddLines(context, aPoints, 2);//添加线
//    }
//
    
    
    
    
    
    
    CGContextDrawPath(context, kCGPathStroke); //根据坐标绘制路径
    
    
    
    
    
    
    
    
    
    
    //绘制完成
    CGContextStrokePath(context);
}
@end
