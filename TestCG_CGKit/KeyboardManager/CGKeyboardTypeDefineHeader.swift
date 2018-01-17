//
//  CGKeyboardTypeDefineHeader.swift
//  CGPhoto
//
//  Created by PCG on 2017/12/23.
//  Copyright © 2017年 DY. All rights reserved.
//

import Foundation

enum CGKeyboardNotificationType : Int {
    case willShow
    case didShow
    case willHide
    case didHide
    case willChangeFrame
    case didChangeFrame
    
    func notificationName() -> Notification.Name {
        let notificationName : Notification.Name
        switch self {
        case .willShow:
            notificationName    = .UIKeyboardWillShow
        case .didShow:
            notificationName    = .UIKeyboardDidShow
        case .willHide:
            notificationName    = .UIKeyboardWillHide
        case .didHide:
            notificationName    = .UIKeyboardDidHide
        case .willChangeFrame:
            notificationName    = .UIKeyboardWillChangeFrame
        case .didChangeFrame:
            notificationName    = .UIKeyboardDidChangeFrame
        }
        return notificationName
    }
    
    static func type(notificationName: Notification.Name) -> CGKeyboardNotificationType? {
        
        var type : CGKeyboardNotificationType? = nil
        
        switch notificationName {
        case .UIKeyboardWillShow:
            type    = .willShow
        case .UIKeyboardDidShow:
            type    = .didShow
        case .UIKeyboardWillHide:
            type    = .willHide
        case .UIKeyboardDidHide:
            type    = .didHide
        case .UIKeyboardWillChangeFrame:
            type    = .willChangeFrame
        case .UIKeyboardDidChangeFrame:
            type    = .didChangeFrame
        default:
            type    = nil
        }
        
        return type
    }
}

/// 键盘通知的类型
public struct CGKeyboardNotification : OptionSet {
    
    public let rawValue: Int
    public init(rawValue: Int) { self.rawValue = rawValue }
    
    public static let none     = CGKeyboardNotification.init(rawValue: 0)
    public static let willShow = CGKeyboardNotification.init(rawValue: 1 << 0)
    public static let willHide = CGKeyboardNotification.init(rawValue: 1 << 1)
    public static let didShow  = CGKeyboardNotification.init(rawValue: 1 << 2)
    public static let didHide  = CGKeyboardNotification.init(rawValue: 1 << 3)
    public static let willChangeFrame  = CGKeyboardNotification.init(rawValue: 1 << 4)
    public static let didChangeFrame   = CGKeyboardNotification.init(rawValue: 1 << 5)
    
    func keyboardNotificationTypes() -> Array<CGKeyboardNotificationType> {
        
        var types = [CGKeyboardNotificationType]()
        
        if self.contains(.willShow) {
            types.append(.willShow)
        }
        if self.contains(.willHide) {
            types.append(.willHide)
        }
        if self.contains(.didShow) {
            types.append(.didShow)
        }
        if self.contains(.didHide) {
            types.append(.didHide)
        }
        if self.contains(.willChangeFrame) {
            types.append(.willChangeFrame)
        }
        if self.contains(.didChangeFrame) {
            types.append(.didChangeFrame)
        }
        
        return types
    }
}
