//
//  HomeViewController.m
//  TestCG_CGKit
//
//  Created by apple on 15/12/5.
//  Copyright © 2015年 apple. All rights reserved.
//

#import "HomeViewController.h"
#import "UIView+CGSetupFrame.h"

//#import "TestTableViewController.h"

@interface HomeViewController ()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *contentViewWidth;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *contentViewHeight;

@end

@implementation HomeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.contentViewHeight.constant = self.view.height;
    self.contentViewWidth.constant  = self.view.width;
}

- (IBAction)pushTestDetailVC:(id)sender
{
//    TestTableViewController *tableViewVC = [[TestTableViewController alloc] init];
//    [self.navigationController pushViewController:tableViewVC animated:YES];
}

@end
