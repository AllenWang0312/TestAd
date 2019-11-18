//
//  YHView.swift
//  TestAd
//
//  Created by Hs on 2019/11/8.
//  Copyright © 2019 swant. All rights reserved.
//

import UIKit

class YHView: UIView {

    public let getVeiw: UIView = {
        let line = UIView()
        line.frame = CGRect(x: 0, y: 0, width: kScreenW, height: 100)
        line.backgroundColor = UIColor.orange
        line.isHidden  = false
        return line
    }()
    
    required init?(coder: NSCoder) {
        super.init(coder:coder)
    }
    override init(frame: CGRect) {
        super.init(frame:frame)
        self.addSubview(getVeiw)
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
