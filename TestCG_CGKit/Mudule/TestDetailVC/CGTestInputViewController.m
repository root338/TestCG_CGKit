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

@interface CGTestInputViewController ()
{
    
}

@end

@implementation CGTestInputViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UITextField *textField  = [[UITextField alloc] init];
    textField.borderStyle   = UITextBorderStyleRoundedRect;
    
    [self.view addSubview:textField];
    
    [textField cg_autoEdgesInsetsZeroToViewController:self exculdingEdge:CGLayoutEdgeBottom];
    
    textField.inputAccessoryView    = [[CGInputAccessoryView alloc] initWithFrame:CGRectMake(0, 0, 0, 40)];
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
