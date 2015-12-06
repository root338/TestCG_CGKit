//
//  TestTableViewController.m
//  TestCG_CGKit
//
//  Created by apple on 15/12/5.
//  Copyright © 2015年 apple. All rights reserved.
//

#import "TestTableViewController.h"

#import "CGBaseTableView.h"
#import "TestTextFieldCell.h"

#import "UITableView+CGCreateTableView.h"
#import "UIView+Constant.h"

@interface TestTableViewController ()

@property (strong, nonatomic) CGBaseTableView *tableView;

@end

@implementation TestTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
    self.tableView.frame = self.view.bounds;
    [self.view addSubview:self.tableView];
    self.tableView.autoresizingMask = UIViewAutoresizingFlexibleAllMargin;
    
    self.tableView.dataSourceManager.rowNumberForAllSections = 100;
    self.tableView.dataSourceManager.cellIdentifier = NSStringFromClass([TestTextFieldCell class]);
    [self.tableView cg_registerClassWithClassIdentifier:[TestTextFieldCell class]];
}

- (CGBaseTableView *)tableView
{
    if (_tableView) {
        return _tableView;
    }
    
    _tableView = [CGBaseTableView createTableViewStyle:UITableViewStyleGrouped rowHeight:60];
    return _tableView;
}
@end
