//
//  CGTestFoulLineViewController.swift
//  TestCG_CGKit
//
//  Created by apple on 16/5/5.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit

class CGTestBrowseViewCell : CGBrowseViewCell {
    let label = UILabel.init()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(label)
        
        label.font  = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        label.cg_autoEdgesInsetsZeroToSuperview()
        
        label.backgroundColor   = UIColor.orange
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class CGTestFoulLineViewController: CGBaseViewController, CGBrowseViewDataSource, CGBrowseViewDelegate, CGBrowseFullScreenViewDelegate {
    
//    let foulLineView    = CGFoulLineView.init(frame: CGRect.init(x: 100, y: 100, width: 100, height: 60), foulLineType: .EdgeInsetsExcludeLeft)
    let browseView  = CGBrowseView.init(frame : CGRect.init(x: 0, y: 0, width: 100, height: 100))
    
//    let browseView  = CGBrowseFullScreenView.init(frame: .zero)
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
        
        browseView.delegate         = self
        browseView.dataSource       = self
        browseView.isScrollLoop     = true
        browseView.cellWidth        = self.view.width / 5.0
        browseView.cellHeight       = self.view.height / 6.0
        browseView.interitemSpacing = 5
        browseView.scrollDirection  = .vertical
        self.view.addSubview(browseView)
        
//        browseView.delegate         = self;
//        browseView.interitemSpacing = 10
//        self.view.addSubview(browseView)
        
        if didSetupConstraints == false {
            
            browseView.cg_autoEdgesInsetsZero(to: self)
            didSetupConstraints = true
        }
        
        browseView.reloadData()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:- CGBrowseContentViewDataSource
    func browseContent(_ browseContent: CGBrowseView, index: Int) -> CGBrowseViewCell {
        let cell = CGTestBrowseViewCell.init()
        
        cell.label.text = "\(index)"
        
        return cell
    }
    
    /// 浏览视图的总数
    @objc internal func totalNumberWithBrowseContent(_ browseContent: CGBrowseView) -> Int {
        return 10
    }
    
    //MARK:- CGBrowseFullScreenViewDelegate
    func browseFullScreenView(_ browseFullScreenView: CGBrowseFullScreenView, index: Int) -> CGBrowseFullScreenViewCell {
        let cell = CGBrowseFullScreenViewCell.init()
        if index % 2 == 0 {
            cell.backgroundColor    = .orange
        }else {
            cell.backgroundColor    = .blue
        }
        
        return cell
    }
    
    func numberForFullScreenCells(in browseFullScreenView: CGBrowseFullScreenView) -> Int {
        return 10
    }
}
