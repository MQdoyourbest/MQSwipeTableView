//
//  MyTableView.m
//  ScrollviewDemo
//
//  Created by 缪强 on 2019/3/12.
//  Copyright © 2019 缪强. All rights reserved.
//

#import "MyTableView.h"

@interface MyTableView()<UIGestureRecognizerDelegate>

@end

@implementation MyTableView

- (instancetype)init {
    self = [super init];
    if (self) {
//        self.beforeScrollContentOffset = CGPointZero;
        self.alwaysBounceVertical = NO;
    }
    return self;
}

- (BOOL)canScroll {
    return self.beforeScrollContentOffset.y > 0 ? NO : YES;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    if ([otherGestureRecognizer.view isMemberOfClass:NSClassFromString(@"_UIQueuingScrollView")]) {
        BOOL isTheSame = [gestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]] && [otherGestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]];
        return !isTheSame;
    } else {
        return YES;
    }
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
