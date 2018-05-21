//
//  YMFilterSelectViewItem.m
//  QuickAskCommunity
//
//  Created by apple on 2018/5/11.
//  Copyright © 2018年 ym. All rights reserved.
//

#import "YMFilterSelectViewItem.h"

#import "YMFilterSelectTableViewItem.h"

@interface YMFilterSelectViewItem ()

@property (nonatomic, assign, readwrite) YMFilterSortViewStyle style;

@end

@implementation YMFilterSelectViewItem

@synthesize style = _style;
@synthesize selectorView;
@synthesize filterSortModel;
@synthesize delegate;

+ (instancetype)createItemWithStyle:(YMFilterSortViewStyle)style
{
    YMFilterSelectViewItem *item = nil;
    switch (style) {
        case YMFilterSortViewStyleTableView:
            item = [[YMFilterSelectViewItem alloc] init];
            break;
            
        default:
            NSAssert(nil, @"没有筛选/排序的item");
            break;
    }
    return item;
}

- (instancetype)initWithStyle:(YMFilterSortViewStyle)style
{
    self = [super init];
    if (self) {
        _style = style;
    }
    return self;
}

@end
