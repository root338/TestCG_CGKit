//
//  YMFilterSelectTableView.h
//  QuickAskCommunity
//
//  Created by apple on 2018/5/10.
//  Copyright © 2018年 ym. All rights reserved.
//

#import "CGSelectorView.h"

NS_ASSUME_NONNULL_BEGIN
@interface YMFilterSelectTableView : CGSelectorView

@property (nonatomic, strong, readonly) UITableView *tableView;

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style;

@end
NS_ASSUME_NONNULL_END
