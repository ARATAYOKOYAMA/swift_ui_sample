//
//  MainActivityNewsViewController.swift
//  sweetTest
//
//  Created by 横山　新 on 2018/05/11.
//  Copyright © 2018年 横山　新. All rights reserved.
//

import UIKit

class MainActivityNewsViewController: UIViewController {

    @IBOutlet weak var testCollection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setuptestCollection()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var testSize = 10
    //テーブルビューの初期化を行う
    private func setuptestCollection() {
        testCollection.delegate   = self
        testCollection.dataSource = self
//        testCollection.rowHeight  = UITableViewAutomaticDimension
//        testCollection.estimatedRowHeight = 120
        testCollection.delaysContentTouches = false
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print("viewDidLayoutSubviews()")
        testCollection.frame = CGRect(
            x: testCollection.frame.origin.x,
            y: testCollection.frame.origin.y,
            width: testCollection.frame.width,
            height: testCollection.contentSize.height
        )
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear")
        
        if testSize > 0 {
            let height = testCollection.contentSize.height
            print("contentSize.height",height)
            NotificationCenter.default.post(name: Notification.Name(rawValue: receiveNewsNotification), object: self, userInfo: ["height": height])
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension MainActivityNewsViewController : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "bob", for: indexPath) as! CollectionViewCell
        
        return cell
    }
    
    
}

extension MainActivityNewsViewController : UICollectionViewDelegate {
    
}
