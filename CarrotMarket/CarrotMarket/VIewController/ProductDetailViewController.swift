//
//  ProductDetailViewController.swift
//  CarrotMarket
//
//  Created by 이원석 on 2020/10/30.
//

import UIKit

class ProductDetailViewController: UIViewController {
    
    @IBOutlet weak var productCollectionView: UICollectionView!
    @IBOutlet weak var productPageControl: UIPageControl!
    @IBOutlet weak var wholeItemScrollViewController: UIScrollView!
    @IBOutlet weak var locLabel: UILabel!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var uploadTimeLabel: UILabel!
    @IBOutlet weak var userProfileImageView: UIImageView!
    @IBOutlet weak var productPriceLabel: UILabel!
    
    // 최하단 뷰
    @IBOutlet weak var veryBottomView: UIView!
    @IBOutlet weak var heartButton: UIButton!
    var heartStatus : Bool!
    
    // 컬렉션뷰
    @IBOutlet weak var userOtherProductCollectionView: UICollectionView!
    @IBOutlet weak var recommendCollectionView: UICollectionView!
    
    var prolist: ProList? // ProList정보를 받을 변수
    var otherproduct: [otherProduct] = [] // 사용자의 다른 판매목록을 담을 리스트
    var recommendproduct: [recommendProduct] = [] // 추천 목록
    var productImageList: [String] = ["img1","img2", "img3", "img4"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setProductInfo()
        pageControlInitLayout()
        productCollectionView.delegate = self
        productCollectionView.dataSource = self
        
        setOther()
        userOtherProductCollectionView.register(userOtherProductCollectionCell.nib(), forCellWithReuseIdentifier: userOtherProductCollectionCell.identifier)
        userOtherProductCollectionView.delegate = self
        userOtherProductCollectionView.dataSource = self
        
        setRecommend()
        recommendCollectionView.register(recommendCollectionCell.nib(), forCellWithReuseIdentifier: recommendCollectionCell.identifier)
        recommendCollectionView.delegate = self
        recommendCollectionView.dataSource = self
        
        wholeItemScrollViewController.delegate = self
        
        // 상태바 글씨색 흰색으로
        self.navigationController?.navigationBar.barStyle = UIBarStyle.black
        
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.isTranslucent = true
        
        heartStatus = false
        naviStyle()
        bottomViewStyle()
    }
    
    @IBAction func heartActionBtn(_ sender: Any) {
        if heartStatus == false {
            heartButton.tintColor = .red
            heartButton.setImage(UIImage (systemName: "heart.fill"), for: UIControl.State.normal)
            heartStatus = true
        }else{
            heartButton.tintColor = .darkGray
            heartButton.setImage(UIImage (systemName: "heart"), for: UIControl.State.normal)
            heartStatus = false
        }
        
    }
    
    func naviStyle(){
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationController?.navigationBar.tintColor = .white
        
        // 네비 바 전체 Backgrond 이미지, 경계선 삭제
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }

    
    func bottomViewStyle(){
        veryBottomView.layer.addBorder([.top, .bottom], color: UIColor.gray, width: 0.5)
    }
    
    func setProductInfo() {
        if let prolist = prolist {
            locLabel.text = prolist.loc
            productNameLabel.text = prolist.proname
            uploadTimeLabel.text = prolist.uploadtime
            productPriceLabel.text = prolist.price
            //productImageVIew.image = prolist.makeProductImage()
        }
    }
    
    func setOther() {
        otherproduct.append(contentsOf: [
            otherProduct(imageName: "airpodpro", name: "에어팟 프로", price: "13,000 원"),
            otherProduct(imageName: "ipadair3", name: "아이패드 에어3세대", price: "3,000,000 원"),
            otherProduct(imageName: "case", name: "아이패드 미니 정품 케이스", price: "500,000 원"),
            otherProduct(imageName: "iphone11pro", name: "아이폰 11프로", price: "76,000 원")
            
        ])
    }
    
    func setRecommend() {
        recommendproduct.append(contentsOf: [
            recommendProduct(imageName: "freedom", name: "자유 팝니다..", price: "0 원"),
            recommendProduct(imageName: "assignment", name: "과제 대신 해주실 분..", price: "10,000 원"),
            recommendProduct(imageName: "adapter", name: "충전기 팔아용", price: "5,000 원"),
            recommendProduct(imageName: "baseball_glove", name: "야구글러브", price: "16,000 원"),
            recommendProduct(imageName: "baseball", name: "야구공 100개", price: "50,000 원"),
            recommendProduct(imageName: "baseball_bat", name: "야구배트", price: "20,000 원"),
            recommendProduct(imageName: "danggn_juice", name: "되게 맛있는 당근주스", price: "3,000 원"),
            recommendProduct(imageName: "dyson", name: "다이슨 청소기", price: "80,000 원"),
            recommendProduct(imageName: "dysonhairdry", name: "다이슨 헤어드라이기", price: "150,000 원"),
            recommendProduct(imageName: "harryporter", name: "해리포터 전권", price: "30,000 원"),
            recommendProduct(imageName: "recliner3", name: "브랜드 리클라이너", price: "980,000 원"),
            recommendProduct(imageName: "macbookpro", name: "2020 맥북프로 16인치", price: "1,960,000 원"),
            recommendProduct(imageName: "moongori", name: "문고리", price: "5,000 원"),
            recommendProduct(imageName: "recliner", name: "리클라이너", price: "560,000 원"),
            recommendProduct(imageName: "roma", name: "로마인이야기 전권", price: "30,000 원"),
            recommendProduct(imageName: "crane", name: "포크레인", price: "15,600,000 원"),
            recommendProduct(imageName: "shinemuscat", name: "샤인머스캣 농장", price: "1,000,000,000 원"),
            recommendProduct(imageName: "umbrella", name: "캐릭터 우산", price: "5,000 원"),
            recommendProduct(imageName: "recliner2", name: "리클라이너", price: "760,000 원"),
            recommendProduct(imageName: "light", name: "조명", price: "6,000 원")
        ])
    }
    
    func pageControlInitLayout() {
        productPageControl.numberOfPages = productImageList.count
        productPageControl.currentPageIndicatorTintColor = .white
    }
    
}


extension ProductDetailViewController: UICollectionViewDelegate {
    
}

extension ProductDetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.productCollectionView {
            return productImageList.count
        } else if collectionView == self.userOtherProductCollectionView {
            return 4
        } else if collectionView == self.recommendCollectionView {
            return 20
        } else { return 0 }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == self.productCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: productCollectionCell.identifier, for: indexPath) as? productCollectionCell else {
                return UICollectionViewCell()
            }
            
            cell.setImage(imageName: productImageList[indexPath.item])
            return cell
        }
        else if collectionView == self.userOtherProductCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: userOtherProductCollectionCell.identifier, for: indexPath) as? userOtherProductCollectionCell else {
                return UICollectionViewCell()
            }
            
            cell.setOtherProductData(name: otherproduct[indexPath.row].name, imageName: otherproduct[indexPath.row].imageName, price: otherproduct[indexPath.row].price)
            return cell
        }
        else if collectionView == self.recommendCollectionView{
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: recommendCollectionCell.identifier, for: indexPath) as? recommendCollectionCell else {
                return UICollectionViewCell()
            }
            cell.setRecommendData(name: recommendproduct[indexPath.row].name, imageName: recommendproduct[indexPath.row].imageName, price: recommendproduct[indexPath.row].price)
            return cell
        }else{
            return UICollectionViewCell()
        }
    }
}

extension ProductDetailViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:
                            UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.productCollectionView{
            return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
        }else if collectionView == self.userOtherProductCollectionView{
            return CGSize(width: 165, height: 160)
        }else if collectionView == self.recommendCollectionView{
            return CGSize(width: 165, height: 160)
        }else{
            return CGSize(width: 0, height: 0)
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        if collectionView == self.productCollectionView {
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }else if collectionView == self.userOtherProductCollectionView {
            return UIEdgeInsets(top: 5, left: 20, bottom: 0, right: 20)
        }else if collectionView == self.recommendCollectionView{
            return UIEdgeInsets(top: 5, left: 20, bottom: 0, right: 20)
        }else{
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            if collectionView == self.recommendCollectionView{
                let recommendHeaderView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: recommendReusableView.identifier, for: indexPath) as! recommendReusableView
                
                return recommendHeaderView
            }else if collectionView == self.userOtherProductCollectionView{
                let otherHeaderView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: otherProductReusableView.identifier, for: indexPath) as! otherProductReusableView
                
                return otherHeaderView
            }else{
                return UICollectionReusableView()
            }
        default: assert(false, "응 아니야")
            
        }
    }
    
    // 헤더 사이즈
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if collectionView == self.recommendCollectionView{
            return CGSize(width: collectionView.frame.width, height: 56)
        }else if collectionView == self.userOtherProductCollectionView {
            return CGSize(width: collectionView.frame.width, height: 112)
        }else{
            return CGSize(width: 0, height: 0)
        }
    }
}



//스크롤한후움직임이점차줄어들때호출
//- ScrollView의 ContentsOffset과 frame 상의 너비를 비교하여 현재 Page를 구할 수 있다.
extension ProductDetailViewController {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) { productPageControl.currentPage = Int(scrollView.contentOffset.x) /
        Int(scrollView.frame.width) }
}

extension ProductDetailViewController: UIScrollViewDelegate{
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y > 200 {
            self.navigationController?.navigationBar.barStyle = UIBarStyle.default // Status Bar 글씨 색상 흰색
            
            self.navigationController?.navigationBar.tintColor = .darkGray
            self.navigationController?.navigationBar.barTintColor = .white
            self.navigationController?.navigationBar.setBackgroundImage(.none, for: .default)
            self.navigationController?.navigationBar.shadowImage = .none
        }
        else {
            self.navigationController?.navigationBar.barStyle = UIBarStyle.black // Status Bar 글씨 색상 검정색
            self.navigationController?.navigationBar.tintColor = .white
            naviStyle()
        }
    }
}

// MARK: -UIView Border
extension CALayer {
    func addBorder(_ arr_edge: [UIRectEdge], color: UIColor, width: CGFloat) {
        for edge in arr_edge {
            let border = CALayer()
            switch edge {
            case UIRectEdge.top:
                border.frame = CGRect.init(x: 0, y: 0, width: frame.width, height: width)
                break
            case UIRectEdge.bottom:
                border.frame = CGRect.init(x: 0, y: frame.height - width, width: frame.width, height: width)
                break
            case UIRectEdge.left:
                border.frame = CGRect.init(x: 0, y: 0, width: width, height: frame.height)
                break
            case UIRectEdge.right:
                border.frame = CGRect.init(x: frame.width - width, y: 0, width: width, height: frame.height)
                break
            default:
                break
            }
            border.backgroundColor = color.cgColor;
            self.addSublayer(border)
        }
    }
}

