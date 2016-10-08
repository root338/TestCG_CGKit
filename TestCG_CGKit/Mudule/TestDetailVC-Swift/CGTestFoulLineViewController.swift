//
//  CGTestFoulLineViewController.swift
//  TestCG_CGKit
//
//  Created by apple on 16/5/5.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit

class CGTestFoulLineViewController: CGBaseViewController {
    
    let foulLineView    : CGFoulLineView
    
    init() {
        
        let constantValue = 100
        
        foulLineView    = CGFoulLineView(frame: CGRect(x: constantValue, y: constantValue, width: constantValue, height: 60))
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
//        foulLineView.foulLineEdgeInsets = UIEdgeInsetsMake(1, 1, 1, 1)
        foulLineView.foulLineColor      = UIColor.red
        foulLineView.foulLineType       = CGFoulLineType.EdgeInsetsExcludeLeft
//        foulLineView.layer.cornerRadius = 5
//        foulLineView.layer.masksToBounds = true
        self.view.addSubview(foulLineView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
