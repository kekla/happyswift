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
    var peripherals = Array<CBPeripheral>()
    var connected_item:CBPeripheral!


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
                // peripheral.delegate = self
                peripherals.append(peripheral)
                print("name")
                print(name)
                self.reload_data()
            }
        }
//        let manufacturerData = advertisementData[CBAdvertisementDataManufacturerDataKey] as! NSData
//        if manufacturerData == nil || manufacturerData.length < 8 { return }
    }
    
    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        print("CONNECTED!!!!!")
        peripheral.delegate = self
        self.connected_item = peripheral
        peripheral.discoverServices([CBUUID(string: "180A")])
    }
    
    func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) {
        print("discovery service")
        
        peripheral.services?.forEach { service in
            print("show characterics")
            print(service)
            print(service.uuid.uuidString == "180A")
            peripheral.discoverCharacteristics([CBUUID(string: "2A23")], for: service)
//            print(service.characteristics?.count ?? "NO")
//            for _:CBCharacteristic in service.characteristics! {
//                print("ccccc")
//
//            }
            
            service.characteristics?.forEach { ch in
                print(ch.uuid.data)
            }
        }
    }
    
    func peripheral(_ peripheral: CBPeripheral, didDiscoverCharacteristicsFor service: CBService, error: Error?) {
        print("didDiscoverCharacteristicsFor")
    }
    
    func centralManager(_ central: CBCentralManager, didDisconnectPeripheral peripheral: CBPeripheral, error: Error?) {
        self.connected_item = nil
        print("DISCONNECT!!!!!!!!!!!!!!!!!!")
    }
    
    func reload_data() {
        print("start reload")
        my_table_view_delegate.reload_data()
    }
}
