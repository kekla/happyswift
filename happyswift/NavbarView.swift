//
//  NavbarView.swift
//  happyswift
//
//  Created by Kek on 2017/9/22.
//  Copyright © 2017年 Kek. All rights reserved.
//

import UIKit
import PureLayout
import Foundation

class NavBarView: UIView {
    var title_label = UILabel()
    var right_button = UIButton()
    var left_button = UIButton()
    var delegate:NavbarDelegate!
    
    override init (frame : CGRect) {
        super.init(frame: frame)
        
        title_label.text = "TEST"
        self.backgroundColor = .green
        let left_img = UIImage(named: "left_arrow")
        left_button.setImage(left_img, for: .normal)
        left_button.addTarget(self, action: #selector(dg_left_button_click), for: .touchUpInside)
        
        self.addSubview(title_label)
        self.addSubview(left_button)
        
        title_label.autoCenterInSuperview()
        left_button.autoPinEdge(toSuperviewEdge: .left, withInset: 15)
        left_button.autoPinEdge(toSuperviewEdge: .top, withInset: 7)
    }
    
    convenience init () {
        self.init(frame:CGRect.zero)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }
    
    func dg_left_button_click() {
        print("DDDDDDDD");
        delegate.left_button_click()
    }

}
