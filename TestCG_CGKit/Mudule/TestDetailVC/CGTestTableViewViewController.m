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
    
    Class className = [UITableViewCell class];
    [_tableView registerClass:className forCellReuseIdentifier:NSStringFromClass(className)];
    
    _tableView.delegate = self.listProtocolManager;
    _tableView.dataSource = self.listProtocolManager;
    
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

#pragma mark - MLListsBaseManagerDelegate
- (UITableViewCell *)manage:(id<MLListsProtocol>)manager tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class])];
    
    cell.textLabel.text = [self.listProtocolManager objectAtIndex:indexPath.row forListIndex:indexPath.section];
    
    return cell;
}

- (void)manage:(id<MLListsProtocol>)manager tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (MLListsBaseProtocolManager<id<MLListsBaseManagerDelegate>,id> *)listProtocolManager
{
    if (_listProtocolManager) {
        return _listProtocolManager;
    }
    
    _listProtocolManager = [[MLListsBaseProtocolManager alloc] init];
    _listProtocolManager.delegate = self;
    
    return _listProtocolManager;
}

@end
