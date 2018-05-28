//
//  YMDiaryPostsTableViewCell.m
//  TestCG_CGKit
//
//  Created by PCG on 2018/5/27.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "YMDiaryPostsTableViewCell.h"

@interface YMDiaryPostsTableViewCell ()

@end

@implementation YMDiaryPostsTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _diaryPostsContentView = [[UIImageView alloc] init];
        [self.contentView addSubview:_diaryPostsContentView];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    _diaryPostsContentView.frame = self.bounds;
}

@end
