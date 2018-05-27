//
//  CGTestTableViewViewController.m
//  TestCG_CGKit
//
//  Created by apple on 16/10/23.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "CGTestTableViewViewController.h"

#import "CGTableView.h"
#import "TestDrawImageView.h"

#import "UIView+CGAddConstraints.h"

#import "MLListsScrollProtocolManager.h"

#import "TestCornerRadiusTableViewCell.h"

#import "YMDiaryPostsTableViewCell.h"
#import "YMDiaryPostsCellManager.h"

@interface CGTestTableViewViewController ()<YMListsScrollManagerDelegate>
{
    CGTableView *_tableView;
}

@property (nonatomic, strong) MLListsScrollProtocolManager<id<YMListsScrollManagerDelegate>, NSString *> *listProtocolManager;
@property (nonatomic, strong) YMDiaryPostsCellManager *cellManager;

@end

@implementation CGTestTableViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _tableView  = [[CGTableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.view addSubview:_tableView];
    
    [_tableView cg_autoEdgesInsetsZeroToSuperview];
    
    dispatch_queue_t globalQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(globalQueue, ^{
        
        NSInteger totalCount = 1000;
        NSMutableArray *data = [NSMutableArray arrayWithCapacity:totalCount];
        for (NSInteger i = 0; i < totalCount; i++) {
            NSString *str = [NSString stringWithFormat:@"NO.%li", (long)i];
            [data addObject:str];
        }
        
        dispatch_sync(dispatch_get_main_queue(), ^{
            [self.listProtocolManager addNewData:data page:1 index:0];
            [self->_tableView reloadData];
        });
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - YMListsScrollManagerDelegate

- (CGFloat)manager:(id<MLListsProtocol>)manager tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self.cellManager getCellHeightWithData:indexPath width:self.view.frame.size.width];
}

- (UITableViewCell *)manage:(id<MLListsProtocol>)manager tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = nil;
    if (cellIdentifier == nil) {
        cellIdentifier = NSStringFromClass([YMDiaryPostsTableViewCell class]);
    }
    YMDiaryPostsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[YMDiaryPostsTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.diaryPostsContentView.image = nil;
    
    [self.cellManager getDiaryPostsContentImageWithIndexPath:indexPath completion:^(UIImage *image) {
        if ([tableView.indexPathsForVisibleRows containsObject:indexPath]) {
            cell.diaryPostsContentView.image = image;
        }
    }];
    
    return cell;
}

- (void)manage:(id<MLListsProtocol>)manager tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (MLListsScrollProtocolManager<id<YMListsScrollManagerDelegate>,NSString *> *)listProtocolManager
{
    if (_listProtocolManager) {
        return _listProtocolManager;
    }
    
    _listProtocolManager = [[MLListsScrollProtocolManager alloc] initWithTableView:_tableView registerClass:nil];
    _listProtocolManager.greaterThanOrEqualScrollRateStopConfigureCell = 7000;
    _listProtocolManager.delegate = self;
    
    return _listProtocolManager;
}

- (YMDiaryPostsCellManager *)cellManager
{
    if (_cellManager) {
        return _cellManager;
    }
    
    _cellManager = [[YMDiaryPostsCellManager alloc] init];
    
    return _cellManager;
}

@end
