//
//  FirstVC.swift
//  HWSwiftViewPager
//
//  Created by HyunWoo Kim on 2016. 1. 11..
//  Copyright © 2016년 KokohApps. All rights reserved.
//

import UIKit

class FirstVC: UIViewController, UICollectionViewDataSource, HWSwiftyViewPagerDelegate {
    @IBOutlet weak var pager: HWSwiftyViewPager!
    @IBOutlet weak var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.pager.dataSource = self
        self.pager.pageSelectedDelegate = self
    }

    
    
    //MARK: CollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FullCollectionCell", for: indexPath)
        return cell
    }
    
    
    //MARK: HWSwiftyViewPagerDelegate
    func pagerDidSelecedPage(_ selectedPage: Int) {
        let string = "SectionInset Left,Right = 30\nminLineSpacing = 20\nSelectedPage = \(selectedPage)"
        self.label.text = string
    }

    
    @IBAction func clickGoToPage0(_ sender: AnyObject) {
        self.pager.setPage(pageNum: 0, isAnimation: false)
    }
    
    @IBAction func clickGoToPage2(_ sender: AnyObject) {
        self.pager.setPage(pageNum: 2, isAnimation: true)
    }
}
