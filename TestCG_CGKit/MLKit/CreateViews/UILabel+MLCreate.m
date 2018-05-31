//
//  UILabel+MLCreate.m
//  TestCG_CGKit
//
//  Created by PCG on 2018/6/1.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "UILabel+MLCreate.h"
#import "UIView+MLCreate.h"

@implementation UILabel (MLCreate)

@dynamic ml_enabled;
@dynamic ml_text;
@dynamic ml_attributedText;
@dynamic ml_font;
@dynamic ml_color;
@dynamic ml_alignment;
@dynamic ml_lineBreakMode;
@dynamic ml_numberOfLines;

#pragma mark - MLCreateLabelProtocol
- (__kindof UILabel *  _Nonnull (^)(NSString * _Nonnull))ml_text {
    return ^(NSString *text) {
        if (![self.text isEqualToString:text]) {
            self.text = text;
        }
        return self;
    };
}

- (__kindof UILabel *  _Nonnull (^)(NSAttributedString * _Nonnull))ml_attributedText {
    return ^(NSAttributedString *attributedText) {
        if (![self.attributedText isEqualToAttributedString:attributedText]) {
            self.attributedText = attributedText;
        }
        return self;
    };
}

- (__kindof UILabel *  _Nonnull (^)(UIFont * _Nonnull))ml_font {
    return ^(UIFont *font){
        if (self.font != font) {
            self.font = font;
        }
        return self;
    };
}

- (__kindof UILabel *  _Nonnull (^)(UIColor * _Nonnull))ml_color {
    return ^(UIColor *color) {
        if (self.textColor != color) {
            self.textColor = color;
        }
        return self;
    };
}

- (__kindof UILabel *  _Nonnull (^)(NSTextAlignment))ml_alignment {
    return ^(NSTextAlignment alignment){
        if (self.textAlignment != alignment) {
            self.textAlignment = alignment;
        }
        return self;
    };
}

- (__kindof UILabel *  _Nonnull (^)(NSLineBreakMode))ml_lineBreakMode {
    return ^(NSLineBreakMode lineBreakMode){
        if (self.lineBreakMode != lineBreakMode) {
            self.lineBreakMode = lineBreakMode;
        }
        return self;
    };
}

- (__kindof UILabel *  _Nonnull (^)(NSUInteger))ml_numberOfLines {
    return ^(NSUInteger numberOfLins) {
        if (self.numberOfLines != numberOfLins) {
            self.numberOfLines = numberOfLins;
        }
        return self;
    };
}

- (__kindof UILabel * _Nonnull (^)(BOOL))ml_enabled {
    return ^(BOOL enabled) {
        if (self.enabled != enabled) {
            self.enabled = enabled;
        }
        return self;
    };
}

@end
