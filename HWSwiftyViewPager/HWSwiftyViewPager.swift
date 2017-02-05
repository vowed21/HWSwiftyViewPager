//
//  HWSwiftyViewPager.swift
//  HWSwiftViewPager
//
//  Created by HyunWoo Kim on 2016. 1. 11..
//  Copyright © 2016년 KokohApps. All rights reserved.
//  email : hyunwoo-21@hanmail.net
//

import UIKit

open class HWSwiftyViewPager: UICollectionView, UICollectionViewDelegate {
    
    enum PagerControlState : Int {
        case stayCurrent = 0
        case toLeft = 1
        case toRight = 2
    }
    
    fileprivate let VELOCITY_STANDARD : CGFloat = 0.6
    
    fileprivate var flowLayout: UICollectionViewFlowLayout!
    fileprivate var beforeFrame: CGRect! = nil
    fileprivate var itemsTotalCount = 0
    fileprivate var selectedPageNum = 0
    fileprivate var itemWidthWithMargin :CGFloat = 0
    fileprivate var scrollBeginOffset :CGFloat = 0
    fileprivate var pagerControlState = PagerControlState.stayCurrent
    
    var pageSelectedDelegate : HWSwiftyViewPagerDelegate?
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.isScrollEnabled = true
        self.isPagingEnabled = false
        self.delegate = self
        self.decelerationRate = UIScrollViewDecelerationRateFast
        
        self.flowLayout = self.collectionViewLayout as! UICollectionViewFlowLayout
        self.flowLayout.scrollDirection = .horizontal
        self.showsHorizontalScrollIndicator = false
        self.showsVerticalScrollIndicator = false
        self.beforeFrame = self.frame
    }
    
    
    
    
    
    override open func layoutSubviews() {
        super.layoutSubviews()
        
        //현재 뷰의 프레임 크기와 이전의 프레임과 다르다면, 아이템의 크기도 함게 바꿔준다.
        if !self.frame.equalTo(self.beforeFrame) {
            let widthNew = self.frame.size.width - (self.flowLayout.sectionInset.left * 2) - self.flowLayout.minimumLineSpacing
            let heightNew = self.frame.size.height - self.flowLayout.sectionInset.top - self.flowLayout.sectionInset.bottom
            self.flowLayout.itemSize = CGSize(width: widthNew, height: heightNew)
            
            self.beforeFrame = self.frame
            
            self.itemWidthWithMargin = widthNew + self.flowLayout.minimumLineSpacing
            
            //현재 선택된 페이지의 오프셋으로 이동시켜준다.
            let targetX = self.getOffSetFromPage(self.selectedPageNum, scrollView: self)
            self.contentOffset = CGPoint(x: targetX, y: 0)
            self.layoutIfNeeded()
        }
        
    }
    
    
    
    
    override open func reloadData() {
        super.reloadData()
        
        self.itemsTotalCount = 0
        
        let sectionCount = self.numberOfSections
        for section in 0..<sectionCount {
            self.itemsTotalCount = self.itemsTotalCount + self.dataSource!.collectionView(self, numberOfItemsInSection: section)
        }
        
        //새로 불러왔을 때, 페이지넘을 0으로, 오프셋도 0으로 이동시켜준다.
        self.selectedPageNum = 0
        self.contentOffset = CGPoint(x: 0, y: 0)
        self.layoutIfNeeded()
    }
    
    //MARK: ScrollViewDelegate
    open func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        self.scrollBeginOffset = scrollView.contentOffset.x
        self.pagerControlState = .stayCurrent
    }
    
    open func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        //타겟 포인트를 저장.
        var point = targetContentOffset.pointee
        
        //벨로서티 기준에 따라서 이동 여부를 결정한다.
        if velocity.x > VELOCITY_STANDARD {
            self.pagerControlState = .toRight
        }
        else if velocity.x < -VELOCITY_STANDARD {
            self.pagerControlState = .toLeft
        }
        
        //총 스크롤 한 거리를 구한다.
        let scrollDistance = self.scrollBeginOffset - scrollView.contentOffset.x
        let standardDistance = self.itemWidthWithMargin / 2
        
        //컨텐츠 크기의 반만큼보다 많이 스크롤을 했다면,
        if scrollDistance < -standardDistance {
            self.pagerControlState = .toRight
        }
        else if scrollDistance > standardDistance {
            self.pagerControlState = .toLeft
        }
        
        //선택 페이지를 결정한다.
        if self.pagerControlState == .toLeft && self.selectedPageNum > 0 {
            self.selectedPageNum -= 1
        }
        else if self.pagerControlState == .toRight && selectedPageNum < (itemsTotalCount - 1) {
            self.selectedPageNum += 1
        }
        
        //페이지가 설정되었고, 델리게이트가 설정되었다면, 델리게이트를 호출한다.
        self.pageSelectedDelegate?.pagerDidSelecedPage(selectedPageNum)
        
        point.x = self.getOffSetFromPage(self.selectedPageNum, scrollView: scrollView)
        targetContentOffset.pointee = point
        
    }
    
    
    open func setPage(pageNum:Int, isAnimation:Bool){
        if pageNum == self.selectedPageNum || pageNum >= itemsTotalCount {
            return
        }
        
        let offset = getOffSetFromPage(pageNum, scrollView: self)
        self.setContentOffset(CGPoint(x: offset, y: 0), animated: isAnimation)
        self.selectedPageNum = pageNum
        self.pageSelectedDelegate?.pagerDidSelecedPage(pageNum)
    }
    
    
    
    
    //페이지 번호로 offset 을 구하기.
    fileprivate func getOffSetFromPage(_ pageNum: Int, scrollView:UIScrollView) -> CGFloat {
        if pageNum == 0 {
            return 0
        }
        
        else if pageNum >= self.itemsTotalCount - 1 {
            return scrollView.contentSize.width - self.frame.size.width
        }
        
        return (self.itemWidthWithMargin * CGFloat(pageNum)) - (self.flowLayout.minimumLineSpacing / 2)
    }
}

public protocol HWSwiftyViewPagerDelegate {
    func pagerDidSelecedPage(_ selectedPage: Int)
}
