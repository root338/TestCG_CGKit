//
//  CGKeyboardNotificationModel.swift
//  CGPhoto
//
//  Created by PCG on 2017/12/23.
//  Copyright © 2017年 DY. All rights reserved.
//

import UIKit

protocol CGKeyboardNotificationProtocol : NSObjectProtocol {
    
    func keyboardNotificationManager(_ keyboardNotificationManager: CGKeyboardNotificationManager, noteType: CGKeyboardNotificationType, keyboardInfo: CGKeyboardDetailInfo)
}

class CGKeyboardNoteDetailModel: NSObject {
    
    var object              : Any?
    
    let notificationType    : CGKeyboardNotificationType
    
    private weak var target : AnyObject?
    private var selector    : Selector?
    
    var isAction            = false {
        didSet {
            if isAction != oldValue {
                if isAction {
                    if self.target != nil && self.selector != nil {
                        self.add(target: self.target!, selector: self.selector!)
                    }
                }else {
                    
                    self.remove()
                }
            }
        }
    }
    
    init(notificationType: CGKeyboardNotificationType) {
        self.notificationType   = notificationType
        super.init()
    }
    
    convenience init(notificationType: CGKeyboardNotificationType, target: AnyObject, selector: Selector) {
        
        self.init(notificationType: notificationType)
        
        self.add(target: target, selector: selector)
    }
    
    func add(target: AnyObject, selector: Selector) -> Void {
        
        var isEqual = false
        
        if self.isAction == true && self.target != nil && self.selector != nil {
            
            if self.target!.isEqual(target) == true && self.selector == selector {
                isEqual = true
            }else {
                self.remove()
            }
        }
        
        guard isEqual == false else {
            return
        }
        
        self.target     = target
        self.selector   = selector
        self.addNotification(target: target, selector: selector)
    }
    
    func remove() -> Void {
        
        if self.target != nil {
            self.removeNotification(target: self.target!)
        }
    }
    
    private func addNotification(target: AnyObject, selector: Selector) {
        
        NotificationCenter.default.addObserver(target, selector: selector, name: self.notificationType.notificationName(), object: object)
        
    }
    
    private func removeNotification(target: AnyObject) {
        
        NotificationCenter.default.removeObserver(target, name: self.notificationType.notificationName(), object: object)
    }
}

class CGKeyboardNotificationManager: NSObject {
    
    fileprivate var keyboardNotificationDict = [CGKeyboardNotificationType : CGKeyboardNoteDetailModel]()
    
    weak var delegate : CGKeyboardNotificationProtocol?
    
    convenience init(delegate: CGKeyboardNotificationProtocol?) {
        self.init()
        self.delegate   = delegate
    }
    
    /// 设置需要添加的键盘通知，已有的但不需要的设置为不可用状态
    func setupKeyboardNotification(types: CGKeyboardNotification) {
        
        let newKeyboardNotificationTypes = types.keyboardNotificationTypes()
        let notificationTypes = Set.init(newKeyboardNotificationTypes).union(Set.init(keyboardNotificationDict.keys))
        for noteType in notificationTypes {
            
            var noteDetailModel = keyboardNotificationDict[noteType]
            let isAction        = newKeyboardNotificationTypes.contains(noteType)
            
            if noteDetailModel == nil {
                
                noteDetailModel = CGKeyboardNoteDetailModel.init(notificationType: noteType, target: self, selector: #selector(handleKeyboardNotification(_:)))
                
                keyboardNotificationDict.updateValue(noteDetailModel!, forKey: noteType)
            }
            noteDetailModel?.isAction   = isAction
        }
    }
    
    @objc func handleKeyboardNotification(_ note: Notification) {
        
        if let keyboardNoteType = CGKeyboardNotificationType.type(notificationName: note.name), note.userInfo != nil, let targetObject = note.object as? CGFirstResponderObject {
            
            let keyboardInfo = CGKeyboardDetailInfo.init(object: targetObject, keyboardUserInfo: note.userInfo!)
            self.delegate?.keyboardNotificationManager(self, noteType: keyboardNoteType, keyboardInfo: keyboardInfo)
        }
        
        
    }
}
