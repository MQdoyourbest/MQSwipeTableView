//
//  ViewController.m
//  SwipeTableView
//
//  Created by 123 on 2019/4/25.
//  Copyright © 2019 CWW. All rights reserved.
//

#import "ViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "BottomScrollView.h"

@interface ViewController ()<UIScrollViewDelegate, UITableViewDelegate, UITableViewDataSource, UIPageViewControllerDelegate, UIPageViewControllerDataSource, BaseViewControllerDelegate>

/**
 底部的tableview用于存放pageViewController.view
 */
@property (weak, nonatomic) BottomScrollView *fatherScrollView;

/**
 pageViewController每个页面cell显示的数据
 */
@property (strong, nonatomic) NSMutableArray<NSString *> *dataArray;

/**
 页面管理控制器
 */
@property (strong, nonatomic) UIPageViewController *pageViewController;

/**
 pageViewController所有的自控制器
 */
@property (strong, nonatomic) NSMutableArray<__kindof UIViewController *> *childViewControllers;

/**
 记录底部的tableview contentOffset
 */
@property (assign, nonatomic) CGPoint fatherScrollViewBeforeContentOffset;
@end

@implementation ViewController

- (NSMutableArray<NSString *> *)dataArray {
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray array];
        for (int i = 0; i < 50; i++) {
            [_dataArray addObject:@(i).stringValue];
        }
    }
    return _dataArray;
}


/**
 懒加载3个控制器
 
 @return 包含3个控制器的数组
 */
- (NSArray<UIViewController *> *)childViewControllers {
    
    if (_childViewControllers == nil) {
        
        FirstViewController *firsVC = [[FirstViewController alloc] init];
        firsVC.dataArray = self.dataArray;
        firsVC.delegate = self;
        
        SecondViewController *secondVC = [[SecondViewController alloc] init];
        secondVC.dataArray = self.dataArray;
        secondVC.delegate = self;
        
        ThirdViewController *thirdVC = [[ThirdViewController alloc] init];
        thirdVC.dataArray = self.dataArray;
        thirdVC.delegate = self;
        _childViewControllers = [NSMutableArray arrayWithArray:@[firsVC, secondVC, thirdVC]];
    }
    return _childViewControllers;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    BottomScrollView *fatherScrollView = [[BottomScrollView alloc] init];
    fatherScrollView.childViewControllers = self.childViewControllers;
    fatherScrollView.delegate = self;
    self.fatherScrollView = fatherScrollView;
    [self.view addSubview:fatherScrollView];
    
    [fatherScrollView makeConstraints:^(MASConstraintMaker *make) {
        if (@available(iOS 11.0, *)) {
            make.top.equalTo(self.view.safeAreaLayoutGuideTop);
            make.bottom.equalTo(self.view.safeAreaLayoutGuideBottom);
            make.left.equalTo(self.view.safeAreaLayoutGuideLeft);
            make.right.equalTo(self.view.safeAreaLayoutGuideRight);
        } else {
            make.top.bottom.right.left.equalTo(self);
        }
    }];
    
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    self.fatherScrollView.contentSize = CGSizeMake(0, [UIScreen mainScreen].bounds.size.height);
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *sectionView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 44)];
    sectionView.backgroundColor = [UIColor orangeColor];
    return sectionView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"identifier_b";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    //在cell上添加pageViewController的页面
    UIPageViewController *pageViewController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    
    pageViewController.delegate = self;
    pageViewController.dataSource = self;
    
    self.pageViewController = pageViewController;
    [cell.contentView addSubview:pageViewController.view];
    
    [pageViewController.view makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(cell.contentView);
    }];
    
    [self.pageViewController setViewControllers:@[self.childViewControllers.firstObject] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:^(BOOL finished) {
        
    }];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return self.view.currentHeight - 20;
}

#pragma mark - BaseViewControllerwDelegate
- (void)baseViewController:(BaseViewController *)baseViewController scrollViewDidScroll:(__kindof MyTableView *)scrollview {
    
}

- (void)baseViewController:(BaseViewController *)baseViewController scrollViewWillBeginDragging:(__kindof UIScrollView *)MyTableView {
    
}

- (void)scrollViewDidScroll:(BottomScrollView *)scrollView {
    
    __kindof MyTableView *tableView = scrollView.pageViewController.viewControllers.firstObject.view.subviews.firstObject;
    
    if (scrollView.contentOffset.y > self.fatherScrollViewBeforeContentOffset.y) {
        //向上滚动
        NSLog(@"------------1-------------");
        NSLog(@"向上滚动");
        if (scrollView.contentOffset.y < 100 && tableView.contentOffset.y != tableView.beforeScrollContentOffset.y) {
            //未固定sectionView,先让导航栏滚动到固定位置,内部tableView固定
            tableView.contentOffset = tableView.beforeScrollContentOffset;
            NSLog(@"-----------2--------------");
        } else if(scrollView.contentOffset.y > 100) {
            NSLog(@"-----------3--------------");
            //固定sectionView,滚动内部tableView
            scrollView.contentOffset = CGPointMake(0, 100);
        }
        
    } else {
        
        NSLog(@"-----------4--------------");
        //向下滚动
        NSLog(@"向下滚动");
        
        if (tableView.contentOffset.y > 0 && scrollView.contentOffset.y < 100) {
            if (scrollView.contentOffset.y != self.fatherScrollViewBeforeContentOffset.y) {
                NSLog(@"-----------5--------------");
                scrollView.contentOffset = self.fatherScrollViewBeforeContentOffset;
            }
        } else if(tableView.contentOffset.y < 0) {
            NSLog(@"-----------6--------------");
            tableView.contentOffset = CGPointZero;
        }
    }
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    //记录滚动之前的contentOffset
    self.fatherScrollViewBeforeContentOffset = scrollView.contentOffset;
}

@end

