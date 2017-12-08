//
//  ViewController.swift
//  happyswift
//
//  Created by Kek on 2017/9/8.
//  Copyright © 2017年 Kek. All rights reserved.
//

import UIKit
import CoreBluetooth


class ViewController: UIViewController {
    let main_view = mainView(frame: CGRect(x: 0, y: 24, width: UIScreen.main.bounds.size.width, height: 100))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let button = UIButton()
        let get_connected_btn = UIButton()
        
        
        main_view.backgroundColor = .red
        
        button.setTitle("GO!!", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action: #selector(btn_go), for: .touchUpInside)
        
        get_connected_btn.setTitle("Get connected tracmo", for: .normal)
        get_connected_btn.setTitleColor(.green, for: .normal)
        get_connected_btn.addTarget(self, action: #selector(get_connected_btn_go), for: .touchUpInside)
        
        self.view.addSubview(button)
        self.view.addSubview(get_connected_btn)
        self.view.addSubview(main_view)
        
        button.autoCenterInSuperview()
        get_connected_btn.autoPinEdge(.top, to: .bottom, of: button, withOffset: 30)
        get_connected_btn.autoPinEdge(.left, to: .left, of: button)
        
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
    
    func get_connected_btn_go() {
        var connected_peripherals = BLE.sharedInstance.centralManager.retrieveConnectedPeripherals(withServices: [CBUUID(string: "180A")])
        print(connected_peripherals)
        if (connected_peripherals.count > 0) {
            BLE.sharedInstance.peripherals = connected_peripherals
            BLE.sharedInstance.centralManager.connect(BLE.sharedInstance.peripherals[0])
        }
    }

    func stopScan() {
        BLE.sharedInstance.centralManager.stopScan()
    }
}

