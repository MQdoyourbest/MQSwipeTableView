//
//  SectionView.h
//  ScrollviewDemo
//
//  Created by 123 on 2019/3/16.
//  Copyright © 2019 缪强. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol SectionViewDelegate;

@interface SectionView : UIView
@property (assign, nonatomic) int index;
@property (weak, nonatomic) id<SectionViewDelegate> delegate;
@end

@protocol SectionViewDelegate <NSObject>

- (void)sectionView:(SectionView *)sectionView didClickbButton:(UIButton *)button;

@end
NS_ASSUME_NONNULL_END
