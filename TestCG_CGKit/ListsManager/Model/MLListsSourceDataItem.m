//
//  MLListsSourceDataItem.m
//  TestCG_CGKit
//
//  Created by apple on 2018/5/21.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "MLListsSourceDataItem.h"

@implementation MLListsSourceDataItem

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        _pageSize = -1;
    }
    return self;
}

#pragma mark - Properties

- (MLListsSourceData *)listsSourceData
{
    if (_listsSourceData) {
        return _listsSourceData;
    }
    
    _listsSourceData = [[MLListsSourceData alloc] init];
    
    return _listsSourceData;
}

@end
