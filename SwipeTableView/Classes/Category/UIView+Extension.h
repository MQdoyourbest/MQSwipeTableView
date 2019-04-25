//
//  UIView+Extension.h
//  OCS100
//
//  Created by 众进电子科技有限公司 on 2017/2/24.
//  Copyright © 2017年 ocstat. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Extension)
/**
 *  X
 */
@property (nonatomic, assign) CGFloat currentX;
/**
 *  Y
 */
@property (nonatomic, assign) CGFloat currentY;
/**
 *  width
 */
@property (nonatomic, assign) CGFloat currentWidth;
/**
 *  height
 */
@property (nonatomic, assign) CGFloat currentHeight;
/**
 *  size
 */
@property (nonatomic, assign) CGSize currentSize;
/**
 *  centerX
 */
@property (nonatomic, assign) CGFloat currentCenterX;
/**
 *  centerY
 */
@property (nonatomic, assign) CGFloat currentCenterY;


/**
 *  设置圆角半径
 *
 *  @param radius 圆角半径
 */
- (void)setCornerRadius:(CGFloat)radius;

@end
