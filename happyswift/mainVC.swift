
//
//  mainVC.swift
//  happyswift
//
//  Created by Kek on 2017/9/8.
//  Copyright © 2017年 Kek. All rights reserved.
//

import UIKit
import Foundation
import PureLayout


class mainVC: UIViewController, MyTableViewDelegate, NavbarDelegate, UITableViewDelegate, UITableViewDataSource {
//    var delegate:NavbarDelegate?
    var text_view_value:String = ""
    var table_view:UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let navbar_height = CGFloat(66)
        let rect = CGRect(x: 0, y: 24, width: UIScreen.main.bounds.size.width, height: navbar_height)
        //        let myView = UIView(frame: rect)
        let navbar_view = NavBarView(frame: rect)
        table_view = UITableView(frame: CGRect(x: 0, y: 24+navbar_height, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height - 24-navbar_height) )
        
        BLE.sharedInstance.my_table_view_delegate = self
        navbar_view.delegate = self
        table_view.delegate = self
        table_view.dataSource = self
        table_view.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        table_view.isScrollEnabled = false
        table_view.translatesAutoresizingMaskIntoConstraints = false
        table_view.estimatedRowHeight = 3000
        table_view.rowHeight = UITableViewAutomaticDimension
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
        self.view.addSubview(navbar_view)
        self.view.addSubview(table_view)
        
        
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return BLE.sharedInstance.scaned_items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for:indexPath) as UITableViewCell
        
//        if (indexPath.row == 1) {
//            let adv_setting_view = AdvanceSettingView.newAutoLayout()
//
//            print("self.text_view_value: \(self.text_view_value)")
//            adv_setting_view.update_text(str: self.text_view_value)
//            cell.contentView.addSubview(adv_setting_view)
//            adv_setting_view.autoPinEdgesToSuperviewEdges()
//
//            let new_size = adv_setting_view.text_view.sizeThatFits(CGSize(width: Double.infinity, height: Double.infinity))
//            adv_setting_view.text_view_height.constant = new_size.height
//            print("height: \(new_size.height)")
//            print("width: \(adv_setting_view.frame.size.width)")
//            print("adv_setting_view.text_view.frame.size.height: \(adv_setting_view.text_view.contentSize.height)")
//
//        } else {
//            cell.textLabel?.text = "111"
//
//        }
        
        cell.textLabel?.text = BLE.sharedInstance.scaned_items[indexPath.row]
        cell.textLabel?.textColor = .black
        // if (BLE.sharedInstance.scaned_items[indexPath.row] == "tracMo 0001E2FE0BFB")
        if (BLE.sharedInstance.scaned_items[indexPath.row] == "tracMo B09122655077") {
            cell.textLabel?.textColor = .white
            cell.backgroundColor = .blue
            cell.textLabel?.backgroundColor = .blue
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var p = BLE.sharedInstance.peripherals[indexPath.row]
        BLE.sharedInstance.centralManager.connect(p)
    }
    
    func reload_data() {
        print("final reload")
        DispatchQueue.main.async{
            self.table_view?.reloadData()
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        BLE.sharedInstance.centralManager.stopScan()
        if (BLE.sharedInstance.connected_item != nil) {
            BLE.sharedInstance.centralManager.cancelPeripheralConnection(BLE.sharedInstance.connected_item)
        }
        
    }
}

