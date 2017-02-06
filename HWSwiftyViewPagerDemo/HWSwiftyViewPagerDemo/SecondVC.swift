//
//  SecondVC.swift
//  HWSwiftViewPager
//
//  Created by HyunWoo Kim on 2016. 1. 11..
//  Copyright © 2016년 KokohApps. All rights reserved.
//

import UIKit

class SecondVC: UIViewController, UICollectionViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    //MARK: CollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FullCollectionCell", for: indexPath)
        return cell
    }

}
