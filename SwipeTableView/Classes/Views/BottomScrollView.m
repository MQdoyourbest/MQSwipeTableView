//
//  BottomScrollView.m
//  ScrollviewDemo
//
//  Created by 123 on 2019/3/18.
//  Copyright © 2019 缪强. All rights reserved.
//

#import "BottomScrollView.h"

@interface BottomScrollView()<UIPageViewControllerDelegate, UIPageViewControllerDataSource>

@end

@implementation BottomScrollView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)init {
    self = [super init];
    if (self) {
        //Headerview
        UIView *headerView = [[UIView alloc] init];
        headerView.backgroundColor = [UIColor orangeColor];
        self.headerView = headerView;
        [self addSubview:headerView];
        
        SectionView *sectionView = [[SectionView alloc] init];
        sectionView.backgroundColor = [UIColor cyanColor];
        self.sectionView = sectionView;
        [self addSubview:sectionView];
        
        //在cell上添加pageViewController的页面
        UIPageViewController *pageViewController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
        pageViewController.delegate = self;
        pageViewController.dataSource = self;
        self.pageViewController = pageViewController;
        pageViewController.delegate = self;
        pageViewController.dataSource = self;
        
        [self addSubview:pageViewController.view];
        
        self.contentSize = CGSizeMake(SCREEN_WITHD, SCREEN_HEIGHT + 100);
        self.showsVerticalScrollIndicator = NO;
    }
    return self;
}

- (void)setChildViewControllers:(NSMutableArray<__kindof UIViewController *> *)childViewControllers {
    _childViewControllers = childViewControllers;
    
    [self.pageViewController setViewControllers:@[childViewControllers.firstObject] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:^(BOOL finished) {
        
    }];
}

#pragma mark - UIPageViewControllerDataSource
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    
    NSUInteger index = [self.childViewControllers indexOfObject:viewController];
    
    if (index <= 0) {
        return nil;
    }
    
    return self.childViewControllers[index - 1];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    
    NSUInteger index = [self.childViewControllers indexOfObject:viewController];
    
    if (index >= self.childViewControllers.count - 1) {
        return nil;
    }
    
    return self.childViewControllers[index + 1];
}

- (void)layoutSubviews {
    
    self.headerView.frame = CGRectMake(0, 0, SCREEN_WITHD, 100);
    
    self.sectionView.frame = CGRectMake(0, CGRectGetMaxY(self.headerView.frame), SCREEN_WITHD, 45);
    
    self.pageViewController.view.frame = CGRectMake(0, CGRectGetMaxY(self.sectionView.frame), self.currentWidth, self.currentHeight - self.sectionView.bounds.size.height);
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return NO;
}

@end
