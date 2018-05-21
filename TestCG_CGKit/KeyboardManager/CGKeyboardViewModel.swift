//
//  CGKeyboardViewModel.swift
//  CGPhoto
//
//  Created by PCG on 2017/12/23.
//  Copyright © 2017年 DY. All rights reserved.
//

import UIKit

class CGKeyboardViewModel: NSObject {
    
    /// 第一响应者
    let firstResponder  : UIView
    ///目标视图
    var targetView      : UIView?
    
    
    init(firstResponder: UIView) {
        
        self.firstResponder = firstResponder
        super.init()
        
    }
    
}
