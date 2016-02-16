//
//  TestPhotosCollectionViewCell.m
//  TestCG_CGKit
//
//  Created by DY on 16/2/16.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "TestPhotosCollectionViewCell.h"

@implementation TestPhotosCollectionViewCell

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.imageView.frame   = self.contentView.bounds;
}

- (UIImageView *)imageView
{
    if (_imageView) {
        return _imageView;
    }
    
    _imageView = [[UIImageView alloc] initWithFrame:self.bounds];
    [self.contentView addSubview:_imageView];
    
    return _imageView;
}
@end
