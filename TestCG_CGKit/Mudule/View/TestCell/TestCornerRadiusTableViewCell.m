//
//  TestCornerRadiusTableViewCell.m
//  TestCG_CGKit
//
//  Created by PCG on 2018/5/24.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "TestCornerRadiusTableViewCell.h"

#import "UIView+MLFrame.h"

@interface TestCornerRadiusTableViewCell ()
{
    CGSize size;
}

@end

@implementation TestCornerRadiusTableViewCell

    - (void)layoutSubviews
    {
        [super layoutSubviews];
        
        if (!CGSizeEqualToSize(self.ml_size, CGSizeZero)) {
            [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
            UIEdgeInsets insets = UIEdgeInsetsMake(8, 8, 8, 8);
            NSInteger hcount = 10;
            NSInteger space = 2;
            NSInteger vcount = 5;
            CGFloat width   = (self.ml_size.width - insets.left - insets.right - (hcount - 1) * space) / hcount;
            CGFloat height  = (self.ml_size.height - insets.top - insets.bottom - (vcount - 1) * space) / vcount;
            for (NSInteger i = 0; i < vcount; i++) {
                for (NSInteger j = 0; j < hcount; j++) {
                    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(j * (width + space) + insets.left, i * (height + space) + insets.top, width, height)];
                    view.backgroundColor = [UIColor colorWithRed:j / hcount green:j / hcount blue:1 alpha:1];
                    [self addSubview:view];
                    view.layer.cornerRadius = height / 2.0;
                }
            }
        }
    }

@end
