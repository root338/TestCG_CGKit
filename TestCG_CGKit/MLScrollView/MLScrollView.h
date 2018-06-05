//
//  MLScrollView.h
//  TestCG_CGKit
//
//  Created by PCG on 2018/6/2.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class MLScrollView, MLScrollCellItem;
@protocol MLScrollViewDataSource <NSObject>

@required
/// 一共需要加载多少个
- (NSUInteger)numberOfItemsInScrollView:(MLScrollView *)scrollView;
/// 加载的cell的显示信息
- (MLScrollCellItem *)scrollView:(MLScrollView *)scrollView itemAtIndexPath:(NSIndexPath *)indexPath;
/// 加载的view
- (UIView *)scrollView:(MLScrollView *)scrollView itemByIndexPath:(NSIndexPath *)indexPath;

@optional


@end

@interface MLScrollView : UIScrollView

@property (nonatomic, weak) id<MLScrollViewDataSource> dataSource;
/// cell Rect 是升序的，不会出现后面的 rect 在前面的 rect 之上或里面
@property (nonatomic, assign) BOOL cellRectAscending;



- (void)reloadData;

@end
NS_ASSUME_NONNULL_END
