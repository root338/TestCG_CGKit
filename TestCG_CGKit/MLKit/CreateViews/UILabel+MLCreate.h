//
//  UILabel+MLCreate.h
//  TestCG_CGKit
//
//  Created by PCG on 2018/6/1.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "MLCreateProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (MLCreate)<MLCreateLabelProtocol>

@property (nonatomic, class, readonly) __kindof UILabel * (^create) (void);
@property (nonatomic, readonly) __kindof UILabel * (^ml_frame) (CGRect);
@property (nonatomic, readonly) __kindof UILabel * (^ml_backgroundColor) (UIColor *);
@property (nonatomic, readonly) __kindof UILabel * (^ml_userInteractionEnabled) (BOOL);

@property (nonatomic, readonly) __kindof UILabel * (^ml_borderColor) (UIColor *);
@property (nonatomic, readonly) __kindof UILabel * (^ml_borderWidth) (CGFloat);
@property (nonatomic, readonly) __kindof UILabel * (^ml_cornerRadius) (CGFloat);

@end

NS_ASSUME_NONNULL_END
