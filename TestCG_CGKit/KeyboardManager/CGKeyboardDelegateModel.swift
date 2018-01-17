//
//  CGKeyboardDelegateModel.swift
//  CGPhoto
//
//  Created by PCG on 2018/1/17.
//  Copyright © 2018年 DY. All rights reserved.
//

import UIKit

public typealias CGFirstResponderObject = UIView

public enum CGKeyboardHandleViewType {
    case autoLayout
    case move
}

/// 添加CGKeyboardManager代理的类
public class CGKeyboardDelegateModel: NSObject {
    /// 可能成为第一响应者的对象列表
    var firstResponderList  : [CGFirstResponderObject]
    /// 实现代理的对象
    weak var targetObject       : AnyObject?
    /// 处理键盘高度时可以处理的滑动视图，
    var targetView              : UIView?
    /// 处理目录视图的类型, 默认是使用约束来处理键盘遮挡
    var handleViewType = CGKeyboardHandleViewType.autoLayout
    /// 目标视图的约束
    var targetViewConstraint : NSLayoutConstraint?
    
    
    init(targetObject: AnyObject, firstResponderList: [UIView]) {
        
        self.firstResponderList = firstResponderList
        self.targetObject           = targetObject
        super.init()
    }
}
