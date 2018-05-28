//
//  MLListsManagerProtocol.h
//  TestCG_CGKit
//
//  Created by apple on 2018/5/21.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol MLListsProtocol <NSObject>
@end

#pragma mark - 对外，有管理器外类实现的协议

@protocol MLListsBaseManagerDelegate <NSObject>

@optional
/// tableView:cellForRowAtIndexPath: 代理方法下回调的方法
- (UITableViewCell *)manage:(id<MLListsProtocol>)manager tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;

- (void)manage:(id<MLListsProtocol>)manager tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
@end

@protocol YMListsManagerDelegate <MLListsBaseManagerDelegate>

@optional
/// 获取指定位置下的 cell 高度
- (CGFloat)manage:(id<MLListsProtocol>)manager tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
/// 获取计算所需的 cell
- (UITableViewCell *)manage:(id<MLListsProtocol>)manager tableView:(UITableView *)tableView calculateHeightCellWithIndexPath:(NSIndexPath *)indexPath;

@end

#pragma mark - 对内，由继承基础管理器实现的协议

@protocol MLListsManagerProtocol <NSObject>

@optional
- (__kindof UITableViewCell *)ml_tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
- (void)ml_tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
@end

NS_ASSUME_NONNULL_END
