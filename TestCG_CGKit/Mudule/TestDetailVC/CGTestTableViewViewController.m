//
//  CGTestTableViewViewController.m
//  TestCG_CGKit
//
//  Created by apple on 16/10/23.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "CGTestTableViewViewController.h"

#import "CGTableView.h"

#import "UIView+CGAddConstraints.h"

#import "MLListsBaseProtocolManager.h"

@interface CGTestTableViewViewController ()<MLListsBaseManagerDelegate>
{
    CGTableView *_tableView;
}

@property (nonatomic, strong) MLListsBaseProtocolManager<id<MLListsBaseManagerDelegate>, NSString *> *listProtocolManager;

@end

@implementation CGTestTableViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _tableView  = [[CGTableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.view addSubview:_tableView];
    
    [_tableView cg_autoEdgesInsetsZeroToSuperview];
    
    NSInteger totalCount = 100;
    NSMutableArray *data = [NSMutableArray arrayWithCapacity:totalCount];
    for (NSInteger i = 0; i < totalCount; i++) {
        NSString *str = [NSString stringWithFormat:@"NO.%li", (long)i];
        [data addObject:str];
    }
    
    [self.listProtocolManager addNewData:data page:1 index:0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (MLListsBaseProtocolManager<id<MLListsBaseManagerDelegate>,NSString *> *)listProtocolManager
{
    if (_listProtocolManager) {
        return _listProtocolManager;
    }
    
    _listProtocolManager = [[MLListsBaseProtocolManager alloc] initWithTableView:_tableView registerClass:[UITableViewCell class]];
    _listProtocolManager.delegate = self;
    
    _listProtocolManager.configureCellBlock = ^(__kindof UITableViewCell * _Nonnull cell, NSString * _Nonnull obj) {
        cell.textLabel.text = obj;
    };
    
    return _listProtocolManager;
}

@end
