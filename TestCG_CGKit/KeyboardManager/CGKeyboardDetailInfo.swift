//
//  CGKeyboardDetailInfo.swift
//  CGPhoto
//
//  Created by PCG on 2017/12/23.
//  Copyright © 2017年 DY. All rights reserved.
//

import UIKit

class CGKeyboardDetailInfo: NSObject {
    
    let object : CGFirstResponderObject
    
    let keyboardUserInfo : [AnyHashable : Any]
    
    init(object: CGFirstResponderObject, keyboardUserInfo: [AnyHashable : Any]) {
        
        self.object             = object
        self.keyboardUserInfo   = keyboardUserInfo
        super.init()
    }
    
}
