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

@interface CGTestTableViewViewController ()<UITableViewDelegate, UITableViewDataSource>
{
    CGTableView *_tableView;
}

@end

@implementation CGTestTableViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _tableView  = [[CGTableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.view addSubview:_tableView];
    
    Class className = [UITableViewCell class];
    [_tableView registerClass:className forCellReuseIdentifier:NSStringFromClass(className)];
    
    [_tableView cg_autoEdgesInsetsZeroToSuperview];
}

- (void)setupTableView
{
    _tableView.dataSource   = self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self setupTableView];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    
//    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *reuseableIdentifier = NSStringFromClass([UITableViewCell class]);
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseableIdentifier];
    cell.textLabel.text     = [NSString stringWithFormat:@"%@", indexPath];
    return cell;
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
