//
//  BLE.swift
//  happyswift
//
//  Created by Kek on 2017/10/13.
//  Copyright © 2017年 Kek. All rights reserved.
//

import Foundation
import CoreBluetooth

class BLE:NSObject, CBCentralManagerDelegate, CBPeripheralDelegate {
    var centralManager:CBCentralManager!
    var my_table_view_delegate:MyTableViewDelegate!
    var scaned_items = [String]()

    static let sharedInstance = BLE()
    
    override init() {
        super.init()
        let queue = DispatchQueue(label: "queuename")
        centralManager = CBCentralManager(delegate: self, queue: queue)
        centralManager.delegate = self
    }
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        
    }
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        var name:String? = advertisementData["kCBAdvDataLocalName"] as! String?
        if (advertisementData.keys.contains("kCBAdvDataLocalName") && name != nil && name!.count >= 7) {
            let index = name!.index(name!.startIndex, offsetBy: 6)
            
            let prefix = name?.substring(to: index)
            if (prefix == "tracMo") {
                scaned_items.append(name!)
                print("name")
                print(name)
                self.reload_data()
            }
        }
//        let manufacturerData = advertisementData[CBAdvertisementDataManufacturerDataKey] as! NSData
//        if manufacturerData == nil || manufacturerData.length < 8 { return }
    }
    
    func reload_data() {
        print("start reload")
        my_table_view_delegate.reload_data()
    }
}
