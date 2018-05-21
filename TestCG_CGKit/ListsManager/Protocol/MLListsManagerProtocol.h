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
/// 配置cell
- (void)manager:(id<MLListsProtocol>)manager tableView:(UITableView *)tableView configureCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath;
/// 配置cell的高度
- (CGFloat)manager:(id<MLListsProtocol>)manager tableView:(UITableView *)tableView heightWithCell:(UITableViewCell *)cell indexPath:(NSIndexPath *)indexPath;

@end

#pragma mark - 对内，由继承基础管理器实现的协议

@protocol MLListsManagerProtocol <NSObject>

@optional
- (__kindof UITableViewCell *)ml_tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
- (void)ml_tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
@end

NS_ASSUME_NONNULL_END
