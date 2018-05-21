//
//  CGKeyboardManager.swift
//  CGPhoto
//
//  Created by PCG on 2017/12/23.
//  Copyright © 2017年 DY. All rights reserved.
//

import UIKit

public typealias CGExistsResultValue = (isExists: Bool, index: Int?, obj: CGKeyboardDelegateModel?)

@objc public protocol CGKeyboardDelegate : NSObjectProtocol {
    
    
    /// 是否处理该第一响应者
    ///
    /// - Parameters:
    ///   - keyboardManager: 键盘管理对象
    ///   - firstResponder: 第一响应者视图
    /// - Returns: 返回是否由该键盘管理类处理第一响应者视图
    @objc optional func manager(_ keyboardManager: CGKeyboardManager, shouldHandleAt firstResponder: UIView) -> Bool
    
    /// 处理键盘弹出时需要移动的视图
    /// - Parameters:
    ///   - keyboardManager: 键盘管理对象
    ///   - firstResponder: 第一响应者视图
    /// - Returns: 返回处理该第一响应者视图的目标视图
    @objc optional func manager(_ keyboardManager: CGKeyboardManager, handleViewAt firstResponder: UIView) ->UIView
    
    
}

/// 键盘弹出管理器
public class CGKeyboardManager: NSObject, CGKeyboardNotificationProtocol {
    
    public static let defaultManager = CGKeyboardManager.init()
    
    /// 键盘的通知类型
    open var keyboardNotification = CGKeyboardNotification.none {
        didSet {
            if keyboardNotification != oldValue {
                keyboardNotificationManager.setupKeyboardNotification(types: keyboardNotification)
            }
        }
    }
    
    //MARK:- 私有变量
    /// 键盘类型通知管理
    fileprivate let keyboardNotificationManager = CGKeyboardNotificationManager.init()
    /// 代理列表
    fileprivate var delegateList                = [CGKeyboardDelegateModel]()
    
    public override init() {
        super.init()
        keyboardNotificationManager.delegate    = self
    }
    
    //MARK:- CGKeyboardNotificationProtocol
    func keyboardNotificationManager(_ keyboardNotificationManager: CGKeyboardNotificationManager, noteType: CGKeyboardNotificationType, keyboardInfo: CGKeyboardDetailInfo) {
        
//        if let keyboardDelegateModel = self.searchTargetDelegate(firstResponder: keyboardInfo.object) {
//
//        }
    }
}

// MARK: - 键盘管理代理处理
public extension CGKeyboardManager {
    
    public func exists(targetObject: AnyObject) -> CGExistsResultValue {
        
        var isExists    = false
        
        var targetObj : CGKeyboardDelegateModel?
        var targetIndex : Int?
        
        for (index, keyboardDelegateModel) in delegateList.enumerated() {
            if keyboardDelegateModel.targetObject != nil {
                if keyboardDelegateModel.targetObject!.isEqual(targetObject) {
                    
                    targetObj   = keyboardDelegateModel
                    isExists    = true
                    targetIndex = index
                    break
                }
            }
        }
        return (isExists, targetIndex, targetObj)
    }
    
    public func add(delegateModel: CGKeyboardDelegateModel) {
        
        guard delegateModel.targetObject != nil && delegateModel.firstResponderList.count > 0 else {
            return;
        }
        
        guard delegateList.contains(delegateModel) == false else {
            return
        }
        
        let resultValue = self.exists(targetObject: delegateModel.targetObject!)
        guard resultValue.isExists == false else {
            resultValue.obj!.firstResponderList = delegateModel.firstResponderList
            return
        }
        
        delegateList.append(delegateModel)
    }
    
//    public func addDelegate(targetObject: AnyObject, firstResponderList: [UIView]) {
//
//        let resultValue = self.exists(targetObject: targetObject)
//        if resultValue.isExists {
//
//            resultValue.obj!.firstResponderList = firstResponderList
//        }else {
//
//            guard firstResponderList.count > 0 else {
//                return
//            }
//            let keyboardDelegateModel = CGKeyboardDelegateModel.init(targetObject: targetObject, firstResponderList: firstResponderList)
//            delegateList.append(keyboardDelegateModel)
//        }
//    }
    
    public func removeDelegate(targetObject: AnyObject) {
        
        let resultValue = self.exists(targetObject: targetObject)
        if resultValue.isExists {
            delegateList.remove(at: resultValue.index!)
        }
    }
    /// 搜索第一响应者是否拥有代理类
    fileprivate func searchTargetDelegate(firstResponder: CGFirstResponderObject) -> CGKeyboardDelegateModel? {
        
        var targetDelegate : CGKeyboardDelegateModel?
        
        for keyboardDelegateModel in delegateList {
            if keyboardDelegateModel.firstResponderList.contains(firstResponder) {
                targetDelegate  = keyboardDelegateModel
                break
            }
        }
        return targetDelegate
    }
    
//    fileprivate func handle(targetDelegate: CGKeyboardDelegateModel, firstResponder: CGFirstResponderObject) -> (isShouldManagerHandle: Bool, ) {
//
//
//    }
}
