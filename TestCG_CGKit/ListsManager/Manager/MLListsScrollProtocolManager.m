//
//  MLListsScrollProtocolManager.m
//  TestCG_CGKit
//
//  Created by PCG on 2018/5/28.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "MLListsScrollProtocolManager.h"

@interface MLListsScrollProtocolManager ()
{
    
}
@property (nonatomic, assign) CGFloat previsouContentOffsetY;
@property (nonatomic, strong) NSDate *previousScrollDate;

@property (nonatomic, assign, readwrite) CGFloat scrollRate;

@end

@implementation MLListsScrollProtocolManager

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSDate *currentDate = [NSDate date];
    CGFloat currentContentOffsetY = scrollView.contentOffset.y;
    
    if (self.previousScrollDate == nil) {
        self.previousScrollDate = [NSDate date];
        self.previsouContentOffsetY = currentContentOffsetY;
    }else {
        NSTimeInterval timeInterval = [currentDate timeIntervalSinceDate:self.previousScrollDate];
        self.scrollRate = (currentContentOffsetY - self.previsouContentOffsetY) / timeInterval;
        
        self.previsouContentOffsetY = currentContentOffsetY;
        self.previousScrollDate     = currentDate;
    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if (!decelerate) {
        [self resetScrollRate];
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self resetScrollRate];
}

- (void)resetScrollRate
{
    self.scrollRate             = 0;
    self.previousScrollDate     = nil;
    self.previsouContentOffsetY = 0;
}

#pragma mark - MLListsScrollManagerProtocol
- (BOOL)ml_tableView:(UITableView *)tableView shouldConfigureHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat rate = fabs(self.greaterThanOrEqualScrollRateStopConfigureCellHeight);
    if (rate > 0 && rate < self.scrollRate) {
        return NO;
    }
    return YES;
}

- (BOOL)ml_tableView:(UITableView *)tableView shouldConfigureCellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat rate = fabs(self.greaterThanOrEqualScrollRateStopConfigureCell);
    if (rate > 0 && rate < self.scrollRate) {
        return NO;
    }
    return YES;
}

- (void)setScrollRate:(CGFloat)scrollRate
{
    _scrollRate = scrollRate;
    NSLog(@"当前滑动速度: %f", scrollRate);
}

@end
