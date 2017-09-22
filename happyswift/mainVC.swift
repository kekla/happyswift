//
//  mainVC.swift
//  happyswift
//
//  Created by Kek on 2017/9/8.
//  Copyright © 2017年 Kek. All rights reserved.
//

import UIKit
import Foundation


class mainVC: UIViewController, NavbarDelegate {
//    var delegate:NavbarDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let rect = CGRect(x: 0, y: 24, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        //        let myView = UIView(frame: rect)
        let navbar_view = NavBarView(frame: rect)
        navbar_view.delegate = self
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
        self.view.addSubview(navbar_view)
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func left_button_click() {
        print("ZZZZZZZZZZZZ")
        self.navigationController?.popViewController(animated: true)
    }
}

