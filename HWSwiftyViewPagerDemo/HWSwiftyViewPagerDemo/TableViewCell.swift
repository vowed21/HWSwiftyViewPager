//
//  TableViewCell.swift
//  HWSwiftViewPager
//
//  Created by HyunWoo Kim on 2016. 1. 11..
//  Copyright © 2016년 KokohApps. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell, UICollectionViewDataSource, HWSwiftyViewPagerDelegate {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var pager: HWSwiftyViewPager!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.pager.dataSource = self
        self.pager.pageSelectedDelegate = self
    }
    
    
    //MARK: CollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath)
        return cell
    }
    
    
    //MARK: HWSwiftyViewPagerDelegate
    func pagerDidSelecedPage(_ selectedPage: Int) {
        let string = "SelectedPage = \(selectedPage)"
        self.label.text = string
    }
    
    
    


}
