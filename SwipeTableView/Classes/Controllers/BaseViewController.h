//
//  BaseViewController.h
//  ScrollviewDemo
//
//  Created by 缪强 on 2019/3/13.
//  Copyright © 2019 缪强. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyTableView.h"

@class BaseViewController;
NS_ASSUME_NONNULL_BEGIN
@protocol BaseViewControllerDelegate <NSObject>

/**
 子控制器tableView已滚动代理方法的调用

 @param baseViewController 子控制器
 @param scrollview myTableView
 */
- (void)baseViewController:(BaseViewController *)baseViewController scrollViewDidScroll:(__kindof UIScrollView *)scrollview;


/**
 子控制器tableView将要开始滚动代理方法的调用

 @param baseViewController 子控制器
 @param scrollview myTableView
 */
- (void)baseViewController:(BaseViewController *)baseViewController scrollViewWillBeginDragging:(__kindof UIScrollView *)scrollview;

@end
@interface BaseViewController : UIViewController
@property (assign, nonatomic) BOOL canScroll;
@property (weak, nonatomic) id<BaseViewControllerDelegate> delegate;
@property (strong, nonatomic) MyTableView *tableView;
@end

NS_ASSUME_NONNULL_END
