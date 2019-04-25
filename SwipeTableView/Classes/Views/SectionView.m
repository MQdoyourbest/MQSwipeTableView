//
//  SectionView.m
//  ScrollviewDemo
//
//  Created by 123 on 2019/3/16.
//  Copyright © 2019 缪强. All rights reserved.
//
#import "SectionView.h"
#import "UIColor+Extension.h"

@interface SectionView()
@property (strong, nonatomic) NSMutableArray<UIButton *> *childViews;
@property (strong, nonatomic) UIView *underlineView;
@end

@implementation SectionView

- (NSMutableArray<UIButton *> *)childViews {
    if (_childViews == nil) {
        _childViews = [NSMutableArray array];
    }
    return _childViews;
}

- (UIView *)underlineView {
    if (_underlineView == nil) {
        _underlineView = [[UIView alloc] initWithFrame:CGRectMake(0, 44, SCREEN_WITHD / 3.0, 1)];
        _underlineView.backgroundColor = [UIColor redColor];
    }
    return _underlineView;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        for (int i = 0; i < 3; i++) {
            UIButton *subBtn = [[UIButton alloc] init];
            [subBtn addTarget:self action:@selector(didClickButton:) forControlEvents:UIControlEventTouchUpInside];
            subBtn.tag = i;
            subBtn.backgroundColor = [UIColor lightGrayColor];
            [self addSubview:subBtn];
            [self.childViews addObject:subBtn];
        }
        
        [self addSubview:self.underlineView];
    }
    return self;
}

- (void)didClickButton:(UIButton *)button {
    self.index = (int)button.tag;
    if ([self.delegate respondsToSelector:@selector(sectionView:didClickbButton:)]) {
        [self.delegate sectionView:self didClickbButton:button];
    }
}

- (void)setIndex:(int)index {
    _index = index;
    CGFloat width = SCREEN_WITHD / 3.0;
    [UIView animateWithDuration:0.25 animations:^{
        self.underlineView.frame = CGRectMake(index * width , 44, width, 1);
    }];
}

- (void)layoutSubviews {
    for (int i = 0; i < self.childViews.count; i++) {
        UIButton *subBtn = self.childViews[i];
        CGFloat width = SCREEN_WITHD / 3.0;
        CGFloat x = i * width;
        CGFloat y = 0;
        CGFloat height = 44;
        subBtn.frame = CGRectMake(x, y, width, height);
    }
    
    CGFloat width = SCREEN_WITHD / 3.0;
    self.underlineView.frame = CGRectMake(0 , 44, width, 1);
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
