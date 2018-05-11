//
//  MainActivityViewController.swift
//  sweetTest
//
//  Created by 横山　新 on 2018/05/11.
//  Copyright © 2018年 横山　新. All rights reserved.
//

import UIKit

//MainActivityNewsViewControllerから受け取るNotificationの識別名
let receiveNewsNotification = "ReceiveNewsNotification"

class MainActivityViewController: UIViewController {
    
    //ニュース表示部分の高さのConstraint
    @IBOutlet weak var mainActivityNewsContainerHeight: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //MainActivityNewsViewControllerから受け取るNotificationをセットする
        NotificationCenter.default.addObserver(self, selector: #selector(self.setNewsContainerHeight(_:)), name: Notification.Name(rawValue: receiveNewsNotification), object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        //MainActivityNewsViewControllerから受け取るNotificationを削除する
        NotificationCenter.default.removeObserver(self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: - Private Functions
    
    @objc private func setNewsContainerHeight(_ notification: Notification) {
        if let height = notification.userInfo?["height"] as? CGFloat {
            mainActivityNewsContainerHeight.constant = height
        }
    }
}
