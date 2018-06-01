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
@property (nonatomic, readonly) __kindof UIView * (^ml_enabled) (BOOL);

@end

@protocol MLCreateViewProtocol <NSObject>

@required
@property (nonatomic, class, readonly) __kindof UIView * (^create) (void);
@property (nonatomic, readonly) __kindof UIView * (^ml_frame) (CGRect);
@property (nonatomic, readonly) __kindof UIView * (^ml_backgroundColor) (UIColor *);
@property (nonatomic, readonly) __kindof UIView * (^ml_userInteractionEnabled) (BOOL);

@property (nonatomic, readonly) __kindof UIView * (^ml_borderColor) (UIColor *);
@property (nonatomic, readonly) __kindof UIView * (^ml_borderWidth) (CGFloat);
@property (nonatomic, readonly) __kindof UIView * (^ml_cornerRadius) (CGFloat);

@end

@protocol MLCreateLabelProtocol <MLCreateViewProtocol, MLEnableProtocol>

@required
@property (nonatomic) __kindof UILabel * (^ml_text) (NSString *);
@property (nonatomic) __kindof UILabel * (^ml_attributedText) (NSAttributedString *);
@property (nonatomic) __kindof UILabel * (^ml_font) (UIFont *);
@property (nonatomic) __kindof UILabel * (^ml_color) (UIColor *);
@property (nonatomic) __kindof UILabel * (^ml_alignment) (NSTextAlignment);
@property (nonatomic) __kindof UILabel * (^ml_lineBreakMode) (NSLineBreakMode);
@property (nonatomic) __kindof UILabel * (^ml_numberOfLines) (NSUInteger);

@end

@protocol MLCreateButtonProtocol <MLCreateViewProtocol, MLEnableProtocol>

@required
@property (nonatomic, class, readonly) __kindof UIButton * (^ml_button) (UIButtonType);
@property (nonatomic) __kindof UIButton * (^ml_setTitle) (NSString *, UIControlState);
@property (nonatomic) __kindof UIButton * (^ml_setImage) (UIImage *, UIControlState);
@property (nonatomic) __kindof UIButton * (^ml_setBackgroundImage) (UIImage *, UIControlState);
@property (nonatomic) __kindof UIButton * (^ml_setAttributedTitle) (NSAttributedString *, UIControlState);

@end

NS_ASSUME_NONNULL_END
