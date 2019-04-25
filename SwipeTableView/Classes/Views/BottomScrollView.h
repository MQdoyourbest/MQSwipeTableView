//
//  BottomScrollView.h
//  ScrollviewDemo
//
//  Created by 123 on 2019/3/18.
//  Copyright © 2019 缪强. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SectionView.h"

NS_ASSUME_NONNULL_BEGIN

@interface BottomScrollView : UIScrollView
@property (strong, nonatomic) UIView *headerView;
@property (strong, nonatomic) SectionView *sectionView;
@property (strong, nonatomic) UIPageViewController *pageViewController;

/**
 pageViewController所有的自控制器
 */
@property (strong, nonatomic) NSMutableArray<__kindof UIViewController *> *childViewControllers;
@end

NS_ASSUME_NONNULL_END
