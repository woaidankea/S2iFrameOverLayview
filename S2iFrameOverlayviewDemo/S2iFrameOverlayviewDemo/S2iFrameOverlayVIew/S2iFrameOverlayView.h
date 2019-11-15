//
//  S2iFrameOverlayView.h
//  S2iPhone
//
//  Created by Pai Peng on 04/11/2016.
//  Copyright © 2016 沈阳安创信息科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface S2iFrameOverlayView : UIView
/// 创建网格视图
/// @param col 列
/// @param row 行
/// @param hexColor 颜色
/// @param width 线条宽度
/// @param frame 视图位置大小
- (id)initWithCol:(NSInteger)col andRow:(NSInteger)row lineColor:(NSString *)hexColor lineWidth:(NSInteger)width Frame:(CGRect)frame;
@end
