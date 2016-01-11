



# HWSwiftyViewPager

- Swift 2.1
- Inherited "UICollectionView"
- looks likes Android's ViewPager
- Preview Left Right Side Partially



## Supported
- **Full Screen in "Auto Layout"**
- **or Preview Left Right Side partially**
- **Auto Fit - Orientation Rotate**
- **Page Selected Delegate Protocol Supported**



## Requirements

- **UICollectionViewFlowLayout**
- **Don't Use SectionView in UICollectionView**
- **Initialize by Storyboard

## Usage

#### Full Screen in "Auto Layout"
- Configure "Section Inset" Left = 0, Right = 0, minimumLineSpacing = 0 ... in FlowLayout (Use storyboard) 


#### Preview Side (Left, Right) partially"
- Configure "SectionInset" Value Left, Right. And minimumLineSpacing


#### SetCurrentPage
```
- func setPage(pageNum: Int, isAnimation: Bool)
```


##Protocol

HWSwiftyViewPagerDelegate

```
func pagerDidSelecedPage(selectedPage: Int)
```

- `HWSwiftyViewPager.pageSelectedDelegate = TARGET`



## License

`HWViewPager` is available under the MIT license. See the LICENSE file for more info.





# HWSwiftyViewPager

- 예전에 Objective-C로 만들었던 HWViewPager 를 Swift로 만들었습니다.
- 원하는 페이지를 선택 & 이동하는 기능을 추가했습니다.
- 양 옆이 짤리는 페이저 찾다가, 어떤 뷰든지 범용으로 쓰고 싶어서, 한번 직접 만들어봤습니다.
- 더 좋은 아이디어가 있으신 분들은 코멘트 많이 부탁드립니다.
- UICollectionView 를 상속받아서 만들었습니다.
- 별것 아닌 허잡한 코드지만, 깃허브에 꼭 한번 올려보고 싶었어요. 코멘트 주시면 감사히 받겠습니다.
- 코코아팟에 적용하고싶은데 아직 못하고 있습니다. 도와주세요.



## 사용

- 스토리보드를 사용하는게 정신건강에 좋습니다.

#### 풀스크린
- 스토리보드에서 "CollectionView"에 있는 SectionInset 의 여백들과 minimumLineSpacing 을 모두 0으로 주시면 그냥 풀로 보입니다.

#### 양 옆이 조금씩 짤려 보이는 페이저.

- SectionInset 의 값들과 minimumLineSpacing 을 적당히 주시면 저절로 양옆이 보이기 시작합니다.


#### 페이지 선택하기.

```
- func setPage(pageNum: Int, isAnimation: Bool)
```


##Protocol

HWSwiftyViewPagerDelegate

```
func pagerDidSelecedPage(selectedPage: Int)
```

- 델리게이트 설정하기 : `viewPager.pageSelectedDelegate = self (or TARGET)`
- 델리게이트를 설정해 놓으면, 페이지가 선택될 때마다 이 메소드가 호출됩니다.




#Example


<p align="center" >
<img src="http://blogfiles.naver.net/20160111_242/vowed_1452494985906DuAvE_JPEG/example1.jpg">
</p>


<p align="center" >
<img src="http://blogfiles.naver.net/20160111_281/vowed_1452494278090Rgt3l_PNG/%BD%BA%C5%A9%B8%B0%BC%A6_2016-01-11_%BF%C0%C8%C4_3.36.38.png>
</p>



