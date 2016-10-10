//
//  CGTestInputViewController.m
//  TestCG_CGKit
//
//  Created by DY on 16/10/9.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "CGTestInputViewController.h"

#import "CGInputAccessoryView.h"

#import "UIView+CGAddConstraints.h"
#import "NSArray+CGAddConstraints.h"

@interface CGTestInputViewController ()
{
    
}

@end

@implementation CGTestInputViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIView *contentView = [[UIView alloc] init];
    CGInputAccessoryView *inputAccessoryView    = [[CGInputAccessoryView alloc] initWithFrame:CGRectMake(0, 0, 0, 40)];
    
    for (NSInteger i = 0; i < 3; i++) {
        
        UITextField *textField  = [[UITextField alloc] init];
        textField.borderStyle   = UITextBorderStyleRoundedRect;
        [contentView addSubview:textField];
        textField.inputAccessoryView    = inputAccessoryView;
    }
    [self.view addSubview:contentView];
    
    contentView.subviews.subviewsSpaceValue   = 8;
    [contentView.subviews cg_autoSetupVerticalSubviewsLayout];
    [contentView.subviews cg_autoDimension:CGDimensionHeight fixedLength:40];
    
    [contentView cg_autoEdgesToViewController:self withInsets:UIEdgeInsetsMake(20, 20, 20, 20) exculdingEdge:CGLayoutEdgeBottom];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
