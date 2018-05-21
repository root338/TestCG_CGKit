//
//  YMTableViewProtocolManager.m
//  QuickAskCommunity
//
//  Created by apple on 2018/5/8.
//  Copyright © 2018年 ym. All rights reserved.
//

#import "YMListsProtocolManager.h"

#import "YMCellProtocol.h"

@interface YMListsProtocolManager ()

@property (nonatomic, strong, readonly) NSArray *sourceDataArray;

@property (nonatomic, strong) NSMutableDictionary<NSString *, NSNumber *> *cacheCellHeights;
@property (nonatomic, strong) NSMutableDictionary<NSString *, UITableViewCell *> *reusableCellsDict;

///// 源数据加载的状态
//@property (nonatomic, assign, readwrite) YMSourceDataStatus sourceDataStatus;
///// 页脚的处理方式
//@property (nonatomic, assign, readwrite) YMHandleRefreshFooterType handleFooterType;
///// 数据加载完后的处理方式
//@property (nonatomic, assign, readwrite) YMHandleLoadEndType handleLoadEndType;

@end

@implementation YMListsProtocolManager

- (instancetype)initWithTableView:(UITableView *)tableView registerCellClass:(Class)registerCellClass
{
    self = [super init];
    if (self) {

        _tableView = tableView;
        _estimatedRowHeight = 44;
        _registerCellClass = registerCellClass;
        if (tableView && registerCellClass) {

            tableView.delegate = self;
            tableView.dataSource = self;

            NSString *cellIdentifier = NSStringFromClass(registerCellClass);
            [tableView registerClass:registerCellClass forCellReuseIdentifier:cellIdentifier];
            _cellIdentifier = cellIdentifier;
        }
    }
    return self;
}

#pragma mark - YMListsManagerProtocol
- (void)resetAllSourceDataListWithNewData:(NSArray *)data
{

}

- (void)addNewData:(NSArray *)data page:(NSInteger)page
{

}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.sourceDataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    if (self.isCustomCellBlock) {
        cell = self.dequeueReusableCell(tableView, indexPath);
    }else if (self.cellIdentifier) {

        cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier];
    }
    NSAssert(cell, @"cell 不能为空");

    if ([self.delegate respondsToSelector:@selector(manager:setupCell:data:)]) {
        [self.delegate manager:self setupCell:cell data:self.sourceDataArray[indexPath.row]];
    }else {
        [self configureCell:cell forRowAtIndexPath:indexPath sourceType:YMCellUpdateSourceTypeCreateCell];
    }

    return cell;
}

- (void)configureCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath sourceType:(YMCellUpdateSourceType)sourceType
{
    id obj = self.sourceDataArray[indexPath.row];

    if ([cell conformsToProtocol:@protocol(YMCellProtocol)]) {

        id<YMCellProtocol> cellProtocol = (id)cell;
        [cellProtocol setupContentViewWithData:obj];

        BOOL updateLayout = YES;
        BOOL updateConstraints = YES;

        if ([cellProtocol respondsToSelector:@selector(updateConstraintsWithSourceType:)]) {
            updateConstraints = [cellProtocol updateConstraintsWithSourceType:sourceType];
        }
        if (updateConstraints) {
            [cell.contentView setNeedsUpdateConstraints];
            [cell.contentView updateConstraintsIfNeeded];
        }

        if ([cellProtocol respondsToSelector:@selector(updateLayoutWithSourceType:)]) {
            updateLayout = [cellProtocol updateLayoutWithSourceType:sourceType];
        }

        if (updateLayout) {
            [cell setNeedsLayout];
            [cell layoutIfNeeded];
        }
    }else {
        CGDebugAssert(NO, @"cell请实现 YMCellProtocol 协议");
    }
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.cellHeight > 0) {
        return self.cellHeight;
    }

    NSString *key = [NSString stringWithFormat:@"%li-%li", (long)indexPath.section, (long)indexPath.row];
    NSNumber *cellHeightValue = self.cacheCellHeights[key];
    if (cellHeightValue) {
        return cellHeightValue.floatValue;
    }

    CGFloat cellHeight = 0;

    if ([self.delegate respondsToSelector:@selector(manager:heightWithData:indexPath:)]) {
        id obj = self.sourceDataArray[indexPath.row];
        cellHeight = [self.delegate manager:self heightWithData:obj indexPath:indexPath];
    }else {
        UITableViewCell *cell = nil;
        if (self.isCustomCellBlock) {
            cell = self.cacheCell(tableView, indexPath);
        }else {
            cell = self.reusableCellsDict[self.cellIdentifier];
            if (cell == nil) {
                cell = [[self.registerCellClass alloc] init];
                [self.reusableCellsDict setObject:cell forKey:self.cellIdentifier];
            }
        }
        if ([self.delegate respondsToSelector:@selector(manager:heightWithCell:data:indexPath:)]) {
            id obj = self.sourceDataArray[indexPath.row];
            cellHeight = [self.delegate manager:self heightWithCell:cell data:obj indexPath:indexPath];
        }else {

            [self configureCell:cell forRowAtIndexPath:indexPath sourceType:YMCellUpdateSourceTypeCalculateHeight];

            if ([cell conformsToProtocol:@protocol(YMCellProtocol)]) {
                id<YMCellProtocol> cellProtocol = (id)cell;
                if ([cellProtocol respondsToSelector:@selector(cellHeight)]) {
                    cellHeight = cellProtocol.cellHeight;
                }else {

                    BOOL constraintCalculateCellHeight = YES;

                    if ([cellProtocol respondsToSelector:@selector(constraintCalculateCellHeight)]) {
                        constraintCalculateCellHeight = [cellProtocol constraintCalculateCellHeight];
                    }

                    if (constraintCalculateCellHeight) {
                        CGSize cellSize = [cell systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
                        cellHeight = cellSize.height + self.cellHeightAddOffsetValue;
                    }else {
                        CGDebugAssert(NO, @"请设置cell高度计算的方法");
                    }
                }
            }
        }
    }

    [self.cacheCellHeights setValue:@(cellHeight) forKey:key];

    return cellHeight;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.cellHeight > 0) {
        return self.cellHeight;
    }else {
        if (self.cacheCellHeights.count > 0) {
            NSString *key = [NSString stringWithFormat:@"%li-%li", (long)indexPath.section, (long)indexPath.row];
            NSNumber *value = [self.cacheCellHeights objectForKey:key];
            if (value) {
                return value.floatValue;
            }
        }
    }

    return self.estimatedRowHeight;
}

#pragma mark - Properties

- (NSArray *)sourceDataArray
{
    return (NSArray *)[self.listsSourceData dataWithIndex:0];
}

- (MLListsSourceDataManager *)listsSourceData
{
    if (_listsSourceData) {
        return _listsSourceData;
    }

    _listsSourceData = [[MLListsSourceDataManager alloc] init];

    return _listsSourceData;
}

- (BOOL)isCustomCellBlock
{
    BOOL result = self.dequeueReusableCell || (self.cacheCell && self.cellHeight == 0);

    CGDebugAssert(self.dequeueReusableCell && (self.cacheCell || self.cellHeight > 0), @"registerCell, dequeueReusableCell, cacheCell三个block必须同时设置");

    return result;
}

- (NSMutableDictionary<NSString *,NSNumber *> *)cacheCellHeights
{
    if (_cacheCellHeights) {
        return _cacheCellHeights;
    }

    _cacheCellHeights = [NSMutableDictionary dictionary];

    return _cacheCellHeights;
}

- (NSMutableDictionary<NSString *,UITableViewCell *> *)reusableCellsDict
{
    if (_reusableCellsDict) {
        return _reusableCellsDict;
    }

    _reusableCellsDict = [NSMutableDictionary dictionary];;

    return _reusableCellsDict;
}

@end
