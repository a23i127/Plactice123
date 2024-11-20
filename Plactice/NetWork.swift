//
//  NetWork.swift
//  Plactice
//
//  Created by 高橋沙久哉 on 2024/11/20.
//

import Network
import Foundation

class Network {
    static let shared: Network = .init()
    private let queue = DispatchQueue(label: "qwertyuiop")
    private var monitor = NWPathMonitor()
    private init() {
    }
    func setUp() {
        monitor.pathUpdateHandler = { path in
            print("Path update detected: \(path.status)")
            if path.status == .unsatisfied {
                DispatchQueue.main.async {
                    NotificationCenter.default.post(name: .offlineNotifyName, object: nil)
                    print("offline")
                }
            } else {
                DispatchQueue.main.async {
                    NotificationCenter.default.post(name: .onlineNotifyName, object: nil)
                    print("oNline")
                }
            }
        }
        monitor.start(queue: queue)
    }
    func resetMonitor() {
        
        monitor.cancel() // 既存のモニターを停止
        let newMonitor = NWPathMonitor()
        self.monitor = newMonitor
        setUp() // 新しいモニターで再初期化
    }
}
extension Notification.Name {
    static let offlineNotifyName = Notification.Name("notifyName")
    static let onlineNotifyName = Notification.Name("notifyName")
}
