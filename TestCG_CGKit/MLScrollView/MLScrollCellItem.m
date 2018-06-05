//
//  MLScrollCellItem.m
//  TestCG_CGKit
//
//  Created by PCG on 2018/6/3.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "MLScrollCellItem.h"

@implementation MLScrollCellItem

- (CGFloat)minX
{
    return CGRectGetMinX(self.cellFrame);
}

- (CGFloat)maxX
{
    return CGRectGetMaxX(self.cellFrame);
}

- (CGFloat)minY
{
    return CGRectGetMinY(self.cellFrame);
}

- (CGFloat)maxY
{
    return CGRectGetMaxY(self.cellFrame);
}

@end
