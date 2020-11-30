//
//  SHTradingVC.swift
//  CarrotMarket
//
//  Created by 이원석 on 2020/11/01.
//

import UIKit

class SecondHandSellingVC: UIViewController {
    static let identifier = "SecondeHandSelling"
    
    var headerHeight: NSLayoutConstraint!
    var upperheader: UIView!
    var minHeight: CGFloat = 0.0 //maxH
    var maxHeight: CGFloat = 0.0 //minH
    
    
    @IBOutlet weak var productListTableView: UITableView!{
        didSet {
            productListTableView.contentInset = UIEdgeInsets(top: 100, left: 0, bottom: 0, right: 0)
        }
    }
    
    var prolist: [ProList] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setProductData()
        productListTableView.dataSource = self
        productListTableView.delegate = self
    }
    
    func setProductData() {
        prolist.append(contentsOf: [
            ProList(proname: "아이패드 프로 12.9인치", loc: "성북구 돈암1동", uploadtime: "3초 전", price: "550,000원", chatnum: 3, heartnum: 10, proImageName: "ipad_pro"),
            ProList(proname: "싱싱한 당근 팔아요", loc: "성북구 정릉동", uploadtime: "10초 전", price: "5,000원", chatnum: 5, heartnum: 20, proImageName: "carrot"),
            ProList(proname: "앉으면 다 외워지는 의자", loc: "정릉 제3동", uploadtime: "13분 전", price: "490,000원", chatnum: 2, heartnum: 54, proImageName: "chair"),
            ProList(proname: "말하는 모자 판매합니다", loc: "정릉 제4동", uploadtime: "20분 전", price: "1,000,000원", chatnum: 1, heartnum: 12, proImageName: "magic_hat"),
            ProList(proname: "공기청정기 팝니다~", loc: "노원구 월계3동", uploadtime: "2분 전", price: "150,000원", chatnum: 1, heartnum: 4, proImageName: "airfresh"),
            ProList(proname: "애플 펜슬 2세대 새제품", loc: "동대문구 휘경동", uploadtime: "5분 전", price: "120,000원", chatnum: 3, heartnum: 15, proImageName: "apple_pencil"),
            ProList(proname: "세상 따뜻한 차렵이불", loc: "삼선동 5가", uploadtime: "10분 전", price: "10,000원", chatnum: 0, heartnum: 0, proImageName: "blanket"),
            ProList(proname: "되게 튼튼한 테이블 팝니다", loc: "정릉 제3동", uploadtime: "13분 전", price: "19,000원", chatnum: 2, heartnum: 54, proImageName: "table")
            
        ])
    }
}

extension SecondHandSellingVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectProduct = prolist[indexPath.row]
        let storyboard = UIStoryboard(name:"ProductDetail", bundle: nil)
        
        if let dvc = storyboard.instantiateViewController(identifier: "ProductDetailViewController") as? ProductDetailViewController {
            dvc.prolist = selectProduct
            self.navigationController?.pushViewController(dvc, animated: true)
        }
    }
    
    // 스크롤에 따라 최 상단 헤더뷰 Collapsable하게
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("\(scrollView.contentOffset.y)")
        if scrollView.contentOffset.y < 0 {
            headerHeight?.constant = max(abs(scrollView.contentOffset.y), minHeight)
        }
        else{
            headerHeight?.constant = minHeight
        }
//        let totalScroll = scrollView.contentSize.height - scrollView.bounds.size.height
        let offset = -scrollView.contentOffset.y
        let transparent = (offset-50)/100
        upperheader?.alpha = transparent
        
        

    }
    
}

extension SecondHandSellingVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return prolist.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProductViewCell.identifier) as? ProductViewCell else {
            return UITableViewCell()
        }
        
        cell.setCell(product: prolist[indexPath.row])
        cell.selectionStyle = .none // 셀 선택시 회색으로 선택 표시해주는거 없애기
        return cell
    }
}
