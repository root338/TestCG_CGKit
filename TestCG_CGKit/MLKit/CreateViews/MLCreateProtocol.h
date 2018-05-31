//
//  MLCreateProtocol.h
//  TestCG_CGKit
//
//  Created by PCG on 2018/6/1.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
/*
 创建类的链式方法，最好从最上层开始设置，因为返回的类型暂时不能和创建的类型匹配
 */

@protocol MLEnableProtocol <NSObject>

@required
@property (nonatomic, copy, readonly) __kindof UIView * (^ml_enabled) (BOOL);

@end

@protocol MLCreateViewProtocol <NSObject>

@required
@property (nonatomic, copy, class, readonly) __kindof UIView * (^create) (void);
@property (nonatomic, copy, readonly) __kindof UIView * (^ml_frame) (CGRect);
@property (nonatomic, copy, readonly) __kindof UIView * (^ml_backgroundColor) (UIColor *);
@property (nonatomic, copy, readonly) __kindof UIView * (^ml_userInteractionEnabled) (BOOL);

@property (nonatomic, copy, readonly) __kindof UIView * (^ml_borderColor) (UIColor *);
@property (nonatomic, copy, readonly) __kindof UIView * (^ml_borderWidth) (CGFloat);
@property (nonatomic, copy, readonly) __kindof UIView * (^ml_cornerRadius) (CGFloat);

@end

@protocol MLCreateLabelProtocol <MLCreateViewProtocol, MLEnableProtocol>

@required
@property (nonatomic, copy) __kindof UILabel * (^ml_text) (NSString *);
@property (nonatomic, copy) __kindof UILabel * (^ml_attributedText) (NSAttributedString *);
@property (nonatomic, copy) __kindof UILabel * (^ml_font) (UIFont *);
@property (nonatomic, copy) __kindof UILabel * (^ml_color) (UIColor *);
@property (nonatomic, copy) __kindof UILabel * (^ml_alignment) (NSTextAlignment);
@property (nonatomic, copy) __kindof UILabel * (^ml_lineBreakMode) (NSLineBreakMode);
@property (nonatomic, copy) __kindof UILabel * (^ml_numberOfLines) (NSUInteger);

@end

@protocol MLCreateButtonProtocol <MLCreateViewProtocol, MLEnableProtocol>

@required
@property (nonatomic, copy, class, readonly) __kindof UIView * (^ml_button) (UIButtonType);

@end

NS_ASSUME_NONNULL_END
