//
//  ViewController.swift
//  happyswift
//
//  Created by Kek on 2017/9/8.
//  Copyright © 2017年 Kek. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let main_view = mainView(frame: CGRect(x: 0, y: 24, width: UIScreen.main.bounds.size.width, height: 100))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let button = UIButton()
        
        
        main_view.backgroundColor = .red
        
        button.setTitle("GO!!", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action: #selector(btn_go), for: .touchUpInside)
        
        self.view.addSubview(button)
        self.view.addSubview(main_view)
        
        
        button.autoCenterInSuperview()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func btn_go() {
        let main_vc = mainVC()
        main_vc.text_view_value = main_view.text_view.text
        BLE.sharedInstance.scaned_items = [String]()
        print(main_view.text_view.text)
        
        BLE.sharedInstance.centralManager.stopScan()
        
//        let timer = Timer.scheduledTimer(timeInterval: 25.0, target: self, selector: #selector(stopScan), userInfo: nil, repeats: false)
        BLE.sharedInstance.centralManager.scanForPeripherals(withServices: nil, options: nil)
//        mainView.btnScan.setTitle("Scanning...", for: .normal)
        self.navigationController?.pushViewController(main_vc, animated: true)
    }

    func stopScan() {
        BLE.sharedInstance.centralManager.stopScan()
    }
}

