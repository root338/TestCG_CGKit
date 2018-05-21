//
//  YMFilterSelectTableViewItem.m
//  QuickAskCommunity
//
//  Created by apple on 2018/5/11.
//  Copyright © 2018年 ym. All rights reserved.
//

#import "YMFilterSelectTableViewItem.h"

#import "CGSelectorView.h"
#import "YMTextFilterTableViewCell.h"

#import "YMFilterSortModel.h"
#import "YMFilterViewConfig.h"
#import "YMListsProtocolManager.h"

@interface YMFilterSelectTableViewItem ()
{
    
}

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) YMListsProtocolManager *listsProtocolManager;
@property (nonatomic, strong, readwrite) CGSelectorView *selectorView;

@end

@implementation YMFilterSelectTableViewItem

@synthesize selectorView = _selectorView;
@synthesize filterSortModel = _filterSortModel;

- (instancetype)initWithStyle:(YMFilterSortViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        
        _listsProtocolManager = [YMListsProtocolManager createWithType:YMTableViewTypeDefault tableView:self.tableView registerCellClass:[YMTextFilterTableViewCell class]];
        
    }
    return self;
}

- (void)handleChangeFilterSortModel:(YMFilterSortModel *)model
{
    [self.listsProtocolManager resetAllSourceDataListWithNewData:model.filterList];
    
}

- (CGSelectorView *)selectorView
{
    if (_selectorView) {
        return _selectorView;
    }
    
    _selectorView = [[CGSelectorView alloc] init];
    return _selectorView;
}

- (void)setFilterSortModel:(YMFilterSortModel *)filterSortModel
{
    _filterSortModel = filterSortModel;
    [self handleChangeFilterSortModel:filterSortModel];
}

- (YMListsProtocolManager *)listsProtocolManager
{
    if (_listsProtocolManager) {
        return _listsProtocolManager;
    }
    
    _listsProtocolManager = [YMListsProtocolManager createWithType:YMTableViewTypeDefault tableView:self.tableView registerCellClass:nil];
    
//    _listsProtocolManager.registerCell = ^(UITableView * _Nullable tableView) {
//        [tableView register]
//    };
    
    return _listsProtocolManager;
}

@end
