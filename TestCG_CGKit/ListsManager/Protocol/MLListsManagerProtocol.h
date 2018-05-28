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
///当管理器内部现实ml_tableView:shouldConfigureCellForRowAtIndexPath:不配置cell时调用，临时加在一个占位的cell
- (UITableViewCell *)manage:(id<MLListsProtocol>)manager tableView:(UITableView *)tableView placehoderCellForRowAtIndexPath:(NSIndexPath *)indexPath;

@end

@protocol YMListsManagerDelegate <MLListsBaseManagerDelegate, NSObject>

@optional
/// 获取计算需要的cell
- (UITableViewCell *)manager:(id<MLListsProtocol>)manager tableView:(UITableView *)tableView heightCacheCellAtIndexPath:(NSIndexPath *)indexPath;
/// 获取 indexPath 位置 cell 的高度
- (CGFloat)manager:(id<MLListsProtocol>)manager tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
/// 设置指定位置(indexPath)下的 cell 的预估高度
- (CGFloat)manager:(id<MLListsProtocol>)manager tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath;
/// 点击回调
- (void)manage:(id<MLListsProtocol>)manager tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;

@end

@protocol YMListsScrollManagerDelegate <YMListsManagerDelegate, NSObject>

@optional
- (void)manage:(id<MLListsProtocol>)manager scrollViewDidScroll:(UIScrollView *)scrollView;


@end

#pragma mark - 对内，由继承基础管理器实现的协议

@protocol MLListsBaseManagerProtocol <NSObject>

@optional
- (__kindof UITableViewCell *)ml_tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;

/**
 是否应该配置 cell 的内容，当不配置cell时会调用manage:tableView:placehoderCellForRowAtIndexPath:代理方法，如果没有实现该方法会自动添加默认的空白cell到页面
 */
- (BOOL)ml_tableView:(UITableView *)tableView shouldConfigureCellForRowAtIndexPath:(NSIndexPath *)indexPath;


@end

@protocol MLListsManagerProtocol <MLListsBaseManagerProtocol, NSObject>

@optional
- (void)ml_tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
- (UITableViewCell *)ml_tableView:(UITableView *)tableView heightCacheCellAtIndexPath:(NSIndexPath *)indexPath;

/**
 是否应该配置 cell 的高度
 当不配置 cell 高度时，使用 estimatedRowHeight/manager:tableView:estimatedHeightForRowAtIndexPath: 值进行设置
 */
- (BOOL)ml_tableView:(UITableView *)tableView shouldConfigureHeightForRowAtIndexPath:(NSIndexPath *)indexPath;

@end

@protocol MLListsScrollManagerProtocol <MLListsManagerProtocol, NSObject>

@end

NS_ASSUME_NONNULL_END
