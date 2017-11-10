//
//  CGPhotoManager.swift
//  TestCG_CGKit
//
//  Created by DY on 2017/11/10.
//  Copyright © 2017年 apple. All rights reserved.
//

import UIKit
import Photos

class CGPhotoManager: NSObject {
    
    static let defalutManager = CGPhotoManager.init()
    
    var photoAuthorizationStatus : PHAuthorizationStatus {
        return currentAuthorizationStatus
    }
    
    //MARK:- 私有属性
    fileprivate var currentAuthorizationStatus = PHPhotoLibrary.authorizationStatus()
    
    fileprivate let library = PHPhotoLibrary.shared()
    
    
    
}
