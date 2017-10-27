//
//  AdvanceSettingView.swift
//  happyswift
//
//  Created by Kek on 2017/9/29.
//  Copyright © 2017年 Kek. All rights reserved.
//

import Foundation
import UIKit

class AdvanceSettingView: UIView {
    var title_label = UILabel.newAutoLayout()
    var text_view = UITextView.newAutoLayout()
    var phone_sound_label = UILabel.newAutoLayout()
    var tracmo_sound_label = UILabel.newAutoLayout()
    var phone_sound_switch = UISwitch.newAutoLayout()
    var tracmo_sound_switch = UISwitch.newAutoLayout()
    var text_view_height:NSLayoutConstraint = NSLayoutConstraint()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        title_label.text = "InRange"
        text_view.text = "xxx"
        text_view.backgroundColor = .blue

        
        self.backgroundColor = .orange
        
        self.addSubview(title_label)
        self.addSubview(text_view)
        
        title_label.autoPinEdge(toSuperviewEdge: .top)
        title_label.autoPinEdge(toSuperviewEdge: .left)
        
        text_view.autoPinEdge(.top, to: .bottom, of: title_label)
        text_view.autoPinEdge(toSuperviewEdge: .right)
        text_view.autoPinEdge(toSuperviewEdge: .left)
//        text_view.isScrollEnabled = false
        text_view.autoSetDimension(.width, toSize: UIScreen.main.bounds.size.width)
        self.text_view_height = self.text_view.autoSetDimension(.height, toSize: 300)
        text_view.autoPinEdge(toSuperviewEdge: .bottom)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update_text_view_height(height: CGFloat) {
        print("AUTO SET \(height)")
        self.text_view.autoSetDimension(.height, toSize: height)

    }
    
    func update_text(str: String) {
        print("REAL UPDATE: \(str)")
        self.text_view.text = str
    }
}
