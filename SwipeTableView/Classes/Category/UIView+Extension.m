


//
//  UIView+Extension.m
//  OCS100
//
//  Created by 众进电子科技有限公司 on 2017/2/24.
//  Copyright © 2017年 ocstat. All rights reserved.
//

#import "UIView+Extension.h"

@implementation UIView (Extension)
//X
- (void)setCurrentX:(CGFloat)currentX {
    CGRect rect = self.frame;
    
    rect.origin.x = currentX;
    
    self.frame = rect;
}

- (CGFloat)currentX {
    return self.frame.origin.x;
}

//Y
- (void)setCurrentY:(CGFloat)currentY {
    CGRect rect = self.frame;
    
    rect.origin.y = currentY;
    
    self.frame = rect;
}

- (CGFloat)currentY {
    return self.frame.origin.y;
}


//width
- (void)setCurrentWidth:(CGFloat)currentWidth {
    CGRect rect = self.frame;
    
    rect.size.width = currentWidth;
    
    self.frame = rect;
}


- (CGFloat)currentWidth {
    return self.frame.size.width;
}

//height
- (void)setCurrentHeight:(CGFloat)currentHeight {
    CGRect rect = self.frame;
    
    rect.size.height = currentHeight;
    
    self.frame = rect;
}

- (CGFloat)currentHeight {
    return self.frame.size.height;
}


//size
- (void)setCurrentSize:(CGSize)currentSize {
    CGRect rect = self.frame;
    
    rect.size = currentSize;
    
    self.frame = rect;
}

- (CGSize)currentSize {
    return self.frame.size;
}

//centerX
- (void)setCurrentCenterX:(CGFloat)currentCenterX {
    CGPoint point = self.center;
    
    point.x = currentCenterX;
    
    self.center = point;
}

- (CGFloat)currentCenterX {
    return self.center.x;
}

//centerY
- (void)setCurrentCenterY:(CGFloat)currentCenterY {
    CGPoint point = self.center;
    point.y = currentCenterY;
    
    self.center = point;
}

- (CGFloat)currentCenterY {
    return self.center.y;
}

- (void)setCornerRadius:(CGFloat)radius {
    self.layer.cornerRadius = radius;
    self.layer.masksToBounds = YES;
}

@end
