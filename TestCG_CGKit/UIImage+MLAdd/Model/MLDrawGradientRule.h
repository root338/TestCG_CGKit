//
//  MLDrawGradientRule.h
//  TestCG_CGKit
//
//  Created by PCG on 2018/6/6.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol MLDrawGradientRule <NSObject>

@required
@property(nullable, nonatomic, copy, readonly) NSArray *colors;
@property(nullable, nonatomic, copy, readonly) NSArray<NSNumber *> *locations;
@property (nonatomic, assign, readonly) CGPoint startPoint;
@property (nonatomic, assign, readonly) CGPoint endPoint;

@end

@interface MLDrawGradientRule : NSObject<MLDrawGradientRule>

@property(nullable, nonatomic, copy) NSArray *colors;
@property(nullable, nonatomic, copy) NSArray<NSNumber *> *locations;
@property (nonatomic, assign) CGPoint startPoint;
@property (nonatomic, assign) CGPoint endPoint;

@end

NS_ASSUME_NONNULL_END
