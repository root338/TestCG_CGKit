//
//  HomeViewController.m
//  TestCG_CGKit
//
//  Created by apple on 15/12/5.
//  Copyright © 2015年 apple. All rights reserved.
//

#import "HomeViewController.h"

#import "CGTableViewCell.h"

#import "CGHomeDataModel.h"
#import "CGTableViewDataSourceManager.h"

#import "CGPrintLogHeader.h"

@interface HomeViewController ()<UITableViewDelegate>
{
    
    __weak IBOutlet UITableView *tableView;
}

@property (nonatomic, strong) CGTableViewDataSourceManager *dataSourceManager;

@end

@implementation HomeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title  = @"Test CG_CGKit";
    
    self.dataSourceManager  = [[CGTableViewDataSourceManager alloc] initWithDataSource:[CGHomeDataModel cg_getHomeDataSourceList] cellIdentifierForString:@"CGTableViewCell" setupCellBlock:^(UITableView * _Nonnull tableView, __kindof CGTableViewCell * _Nonnull cell, NSIndexPath * _Nonnull indexPath, CGHomeDataModel *  _Nonnull data) {
        
        cell.textLabel.text         = data.title;
        cell.detailTextLabel.text   = data.subtitle;
    }];
    tableView.dataSource    = self.dataSourceManager;
    tableView.delegate      = self;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGHomeDataModel *homeDataObj        = self.dataSourceManager.dataSource[indexPath.row];
    UIViewController *viewController    = [homeDataObj createTargetViewController];
    if (viewController) {
        if (homeDataObj.showType == CGShowTypeModel) {
            
            [self.navigationController presentViewController:viewController animated:YES completion:nil];
        }else if (homeDataObj.showType == CGShowTypePush) {
            
            [self.navigationController pushViewController:viewController animated:YES];
        }
        
    }
}

@end
