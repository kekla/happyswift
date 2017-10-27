//
//  mainView.swift
//  happyswift
//
//  Created by Kek on 2017/9/8.
//  Copyright © 2017年 Kek. All rights reserved.
//

import Foundation
import UIKit
import PureLayout

class mainView: UIView {
    
    var text_view = UITextView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(text_view)
        
        text_view.autoPinEdge(.top, to: .top, of: self, withOffset: 20)
        text_view.autoPinEdge(.bottom, to: .bottom, of: self, withOffset: -20)
        text_view.autoPinEdge(.left, to: .left, of: self, withOffset: 20)
        text_view.autoPinEdge(.right, to: .right, of: self, withOffset: -20)
        text_view.autoCenterInSuperview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
