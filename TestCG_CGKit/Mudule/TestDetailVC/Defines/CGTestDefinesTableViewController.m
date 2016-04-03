//
//  CGTestDefinesTableViewController.m
//  TestCG_CGKit
//
//  Created by apple on 16/4/2.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "CGTestDefinesTableViewController.h"

#import "CGTableReuseHeader.h"

#import "CGTestDefinesData.h"

@interface CGTestDefinesTableViewController ()

@property (nonatomic, strong) NSArray *dataSource;
@property (nonatomic, strong) CGTestDefinesData *definesData;
@end

@implementation CGTestDefinesTableViewController

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    
    [self.tableView cg_registerClassWithClassIdentifier:[UITableViewCell class]];
    
    self.definesData    = [[CGTestDefinesData alloc] init];
    [self.definesData printTestDefinesData];
}

@end

