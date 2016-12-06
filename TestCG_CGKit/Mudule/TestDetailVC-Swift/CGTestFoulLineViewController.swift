//
//  CGTestFoulLineViewController.swift
//  TestCG_CGKit
//
//  Created by apple on 16/5/5.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit



class CGTestFoulLineViewController: CGBaseViewController, CGBrowseContentViewDataSource, CGBrowseContentViewDelegate {
    
//    let foulLineView    = CGFoulLineView.init(frame: CGRect.init(x: 100, y: 100, width: 100, height: 60), foulLineType: .EdgeInsetsExcludeLeft)
    let browseView  = CGBrowseContentView.init()
    
    private var didSetupConstraints = false
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
//        foulLineView.foulLineEdgeInsets = UIEdgeInsetsMake(1, 1, 1, 1)
//        foulLineView.foulLineColor      = UIColor.red
//        foulLineView.foulLineType       = CGFoulLineType.EdgeInsetsExcludeLeft
//        foulLineView.layer.cornerRadius = 5
//        foulLineView.layer.masksToBounds = true
//        self.view.addSubview(foulLineView)
        
        browseView.delegate     = self;
        browseView.dataSource   = self;
        self.view.addSubview(browseView)
        
        if didSetupConstraints == false {
            
            browseView.cg_autoEdgesInsetsZero(to: self)
            didSetupConstraints = true
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:- CGBrowseContentViewDataSource
    func browseContent(_ browseContent: CGBrowseContentView, index: Int) -> CGBrowseViewCell {
        let cell = CGBrowseViewCell.init()
        cell.backgroundColor    = UIColor.orange
        return cell
    }
}
