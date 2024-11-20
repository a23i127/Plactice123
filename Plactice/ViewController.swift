//
//  ViewController.swift
//  Plactice
//
//  Created by 高橋沙久哉 on 2024/11/20.
//

import UIKit

final class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(offline),
            name: .offlineNotifyName,
            object: nil
        )
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(online),
            name: .onlineNotifyName,
            object: nil
        )
    }
    
    func showAlert() {
            let alert = UIAlertController(title: "お知らせ", message: "オフラインのようです", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
}
@objc private extension ViewController {
    func online() {
       // アラートを閉じる
        
    }
    
    func offline() {
       // アラートを表示する
        showAlert()
    }
}


