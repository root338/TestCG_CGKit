//
//  YMFilterSelectTableView.m
//  QuickAskCommunity
//
//  Created by apple on 2018/5/10.
//  Copyright © 2018年 ym. All rights reserved.
//

#import "YMFilterSelectTableView.h"

@interface YMFilterSelectTableView ()
{
    
}

@property (nonatomic, strong, readwrite) UITableView *tableView;

@end

@implementation YMFilterSelectTableView

- (instancetype)initWithFrame:(CGRect)frame
{
    return [self initWithFrame:frame style:UITableViewStylePlain];
}

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame];
    if (self) {
        _tableView = [[UITableView alloc] initWithFrame:frame style:style];
    }
    return self;
}

- (UIView *)contentView
{
    return self.tableView;
}

@end
