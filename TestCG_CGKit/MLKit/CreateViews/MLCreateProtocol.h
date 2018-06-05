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

#pragma mark - UIView
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

#pragma mark - UILabel
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

#pragma mark - UIButton
@protocol MLCreateButtonProtocol <MLCreateViewProtocol, MLEnableProtocol>

@required
@property (nonatomic, class, readonly) __kindof UIButton * (^ml_button) (UIButtonType);
@property (nonatomic) __kindof UIButton * (^ml_setTitle) (NSString *, UIControlState);
@property (nonatomic) __kindof UIButton * (^ml_setImage) (UIImage *, UIControlState);
@property (nonatomic) __kindof UIButton * (^ml_setBackgroundImage) (UIImage *, UIControlState);
@property (nonatomic) __kindof UIButton * (^ml_setAttributedTitle) (NSAttributedString *, UIControlState);

//@property (nonatomic) __kindof UIButton * (^ml_title) (NSString *);
//@property (nonatomic) __kindof UIButton * (^ml_image) (UIImage *);
//@property (nonatomic) __kindof UIButton * (^ml_attributedTitle) (NSAttributedString *);
//@property (nonatomic) __kindof UIButton * (^ml_backgroundImage) (UIImage *);


/**
 设置当前设置按钮环境 使用此属性最后需要 调用 ml_end 来释放保存的值
 @bug 暂时还没有想到自动释放的方法，所有必须手动调用 ml_end
 比如 button.ml_state(UIControlStateHighlighted).ml_title(@"hello") 这时设置的 @"hello" 就相当于 [button setTitle:@"hello" forState:UIControlStateHighlighted]
 后面的值会同时符合前面设置的 ml_state() 状态
 */
//@property (nonatomic) __kindof UIButton * (^ml_state) (UIControlState);
//
//@property (nonatomic) __kindof UIButton * (^ml_imageRenderingMode) (UIImageRenderingMode);
//
//@property (nonatomic) __kindof UIButton * ml_end;

@end



NS_ASSUME_NONNULL_END
