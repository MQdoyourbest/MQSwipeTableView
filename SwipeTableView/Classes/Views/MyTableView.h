//
//  MyTableView.h
//  ScrollviewDemo
//
//  Created by 缪强 on 2019/3/12.
//  Copyright © 2019 缪强. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyTableView : UITableView
@property (assign, nonatomic) BOOL canScroll;

/**
 滚动前的ContentOffset
 */
@property (assign, nonatomic) CGPoint beforeScrollContentOffset;
@end

NS_ASSUME_NONNULL_END
