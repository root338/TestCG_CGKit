//
//  MLListsBaseProtocolManager.m
//  TestCG_CGKit
//
//  Created by apple on 2018/5/21.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "MLListsBaseProtocolManager.h"

#import "MLDoubleListsSourceData.h"

#import "CGPrintLogHeader.h"

@interface MLListsBaseProtocolManager ()

@property (nonatomic, strong) MLDoubleListsSourceData *doubleListsSourceData;

@end

@implementation MLListsBaseProtocolManager

@dynamic addFirstPageRemoveIndexAllData;

- (instancetype)initWithTableView:(UITableView *)tableView registerClass:(nonnull Class)cellClass
{
    NSString *reuseIdentifier = NSStringFromClass(cellClass);
    [tableView registerClass:cellClass forCellReuseIdentifier:reuseIdentifier];
    return [self initWithTableView:tableView reuseIdentifier:reuseIdentifier];
}

- (instancetype)initWithTableView:(UITableView *)tableView reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super init];
    if (self) {
        
        tableView.delegate      = self;
        tableView.dataSource    = self;
        _tableView              = tableView;
        _reuseIdentifier        = reuseIdentifier;
    }
    return self;
}

#pragma mark - 处理数据
- (void)addNewData:(NSArray *)data page:(NSInteger)page index:(NSInteger)index
{
    [self.doubleListsSourceData addPageList:data page:page index:index];
}

- (void)addFirstIndexNewData:(NSArray *)data page:(NSInteger)page
{
    [self.doubleListsSourceData addPageList:data page:page index:0];
}

- (id)objectAtIndex:(NSInteger)index forListIndex:(NSInteger)listIndex
{
    MLListsSourceDataItem *item = [self.doubleListsSourceData itemWithIndex:listIndex];
    __block id targetObj = nil;
    [item.listsSourceData objectWithIndex:index modelBlock:^(NSInteger page, id  _Nullable obj) {
        targetObj = obj;
    }];
    return targetObj;
}

- (id)firstIndexObjectAtIndex:(NSInteger)index
{
    return [self objectAtIndex:index forListIndex:0];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.doubleListsSourceData.totalIndex;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.doubleListsSourceData itemWithIndex:section].listsSourceData.totalCount;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if ([self.delegate respondsToSelector:@selector(manage:tableView:cellForRowAtIndexPath:)]) {
        return [self.delegate manage:self tableView:tableView cellForRowAtIndexPath:indexPath];
    }else if ([self respondsToSelector:@selector(ml_tableView:cellForRowAtIndexPath:)]) {
        id<MLListsManagerProtocol> protocol = (id)self;
        return [protocol ml_tableView:tableView cellForRowAtIndexPath:indexPath];
    }else if (self.configureCellBlock && self.reuseIdentifier) {
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.reuseIdentifier];
        self.configureCellBlock(cell, [self objectAtIndex:indexPath.row forListIndex:indexPath.section]);
        return cell;
    }else {
        CGDebugAssert(nil, @"请实现delegate 代理的manage:tableView:cellForRowAtIndexPath:,或自身实现ml_tableView:cellForRowAtIndexPath:方法，来创建UITableViewCell实例");
        return [UITableViewCell new];
    }
}

#pragma mark - Properties

- (MLDoubleListsSourceData *)doubleListsSourceData
{
    if (_doubleListsSourceData) {
        return _doubleListsSourceData;
    }
    
    _doubleListsSourceData = [[MLDoubleListsSourceData alloc] init];
    
    return _doubleListsSourceData;
}

- (BOOL)addFirstPageRemoveIndexAllData
{
    return self.doubleListsSourceData.addFirstPageRemoveIndexAllData;
}

- (void)setAddFirstPageRemoveIndexAllData:(BOOL)addFirstPageRemoveIndexAllData
{
    self.doubleListsSourceData.addFirstPageRemoveIndexAllData = addFirstPageRemoveIndexAllData;
}

@end
