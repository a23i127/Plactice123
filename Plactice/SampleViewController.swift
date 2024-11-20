//
//  SampleViewController.swift
//  Plactice
//
//  Created by 高橋沙久哉 on 2024/11/21.
//

import Foundation
import UIKit
class SampleViewController: UIViewController {
    
    @IBOutlet weak var tekitou: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /// NotificationCenterを登録
        NotificationCenter.default.addObserver(self, selector: #selector(doSomething(notification:)), name: .notifyName, object: nil)
    }
    @objc func doSomething(notification: Notification) {
        print("通知きたね")
    }
    @IBAction func tekitouAction(_ sender: Any) {
        NotificationCenter.default.post(name: .notifyName, object: nil)
    }
}
extension Notification.Name {
    static let notifyName = Notification.Name("notifyName")
}

