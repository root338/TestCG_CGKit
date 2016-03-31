//
//  TestTextFieldCell.m
//  TestCG_CGKit
//
//  Created by apple on 15/12/6.
//  Copyright © 2015年 apple. All rights reserved.
//

#import "TestTextFieldCell.h"
#import "UIView+CG_CGAreaCalculate.h"
#import "CGDoubleButtonsView.h"

#import "UIView+CGSearchView.h"
#import "UITableView+CGIndexPath.h"

@interface TestTextFieldCell ()<UITextFieldDelegate>

@property (strong, nonatomic) UITextField *textField;

@property (strong, nonatomic) CGDoubleButtonsView *buttonsView;

@property (strong, nonatomic) UIView *nextTnputTextView;
@property (strong, nonatomic) UIView *previousInputTextView;
@end

@implementation TestTextFieldCell

- (void)initialization
{
    [self.contentView addSubview:self.textField];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.textField.frame = CG_CGRectWithMargin(self.bounds, UIEdgeInsetsMake(10, 10, 10, 20));
}

#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    UITableView *tableView = [self searchSuperViewWithClass:[UITableView class]];
    NSIndexPath *currentIndexPath   = [tableView indexPathForCell:self];
    
    NSIndexPath *nextIndexPath      = [tableView cg_nextIndexPathWithCurrentIndexPath:currentIndexPath];
    NSIndexPath *previousIndexPath  = [tableView cg_previousIndexPathWithCurrentIndexPath:currentIndexPath];
    
    UITableViewCell *nextCell       = nextIndexPath ? [tableView cellForRowAtIndexPath:nextIndexPath] : nil;
    UITableViewCell *previousCell   = previousIndexPath ? [tableView cellForRowAtIndexPath:previousIndexPath] : nil;
    
    self.nextTnputTextView          = [nextCell searchInputTextControl];
    self.previousInputTextView      = [previousCell searchInputTextControl];
    
    self.buttonsView.leftButton.enabled     = self.previousInputTextView ? YES : NO;
    self.buttonsView.rightButton.enabled    = self.nextTnputTextView ? YES : NO;
    
    return YES;
}

- (void)nextTextField
{
    [self.nextTnputTextView becomeFirstResponder];
}

- (void)previousTextField
{
    [self.previousInputTextView becomeFirstResponder];
}

#pragma mark - 设置属性
- (UITextField *)textField
{
    if (_textField) {
        return _textField;
    }
    
    _textField = [[UITextField alloc] init];
    _textField.delegate = self;
    _textField.returnKeyType = UIReturnKeyNext;
    
    CGDoubleButtonsView *view = [[CGDoubleButtonsView alloc] init];
    [view.leftButton setTitle:@"previous" forState:UIControlStateNormal];
    [view.leftButton addTarget:self action:@selector(previousTextField) forControlEvents:UIControlEventTouchUpInside];
    [view.rightButton setTitle:@"next" forState:UIControlStateNormal];
    [view.rightButton addTarget:self action:@selector(nextTextField) forControlEvents:UIControlEventTouchUpInside];
    _textField.inputView = view;
    
    return _textField;
}


@end
