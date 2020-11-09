//
//  LocationSelectVC.swift
//  CarrotMarket
//
//  Created by 이원석 on 2020/11/06.
//

import UIKit

// PopoverContentControllerDelegate 프로토콜 정의
// 팝오버로 띄운 모달에서 지역을 고르면 해당 지역으로 선택 변경되는 것을 구현하기 위함
protocol PopoverContentControllerDelegate:class {
    func popoverContent(controller:LocationSelectVC, didselectItem name:String)
}

class LocationSelectVC: UIViewController {
    static let identifier = "LocationSelectVC"
    
    @IBOutlet var locselectTableView: UITableView!
    @IBOutlet var locselectTableViewHeight: NSLayoutConstraint!
    
    let locsourceArray = ["돈암 제1동", "정릉로 4길", "내 동네 설정하기"]
    static let CELL_RESUE_ID = "POPOVER_CELL_REUSE_ID"
    var delegate:PopoverContentControllerDelegate? //declare a delegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locselectTableView.delegate = self
        locselectTableView.dataSource = self
        
//        super.updateViewConstraints()
//        self.locselectTableViewHeight?.constant = self.locselectTableView.contentSize.height
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

}

extension LocationSelectVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedLocation = locsourceArray[indexPath.row]
        self.delegate?.popoverContent(controller: self, didselectItem: selectedLocation) // 선택된 아이템으로 변경해주기
        self.dismiss(animated: true, completion: nil)
    }
    
}

extension LocationSelectVC:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locsourceArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: LocationSelectVC.CELL_RESUE_ID)
              if cell == nil {
                  cell = UITableViewCell(style: .default, reuseIdentifier: LocationSelectVC.CELL_RESUE_ID)
              }
        cell?.textLabel?.text = locsourceArray[indexPath.row]
//        cell?.textLabel?.textAlignment = .center // 테이블 뷰 내 라벨 정렬
        cell?.textLabel?.font = UIFont(name:"HelveticaNeue-Bold", size: 20.0)
        return cell ?? UITableViewCell()
    }
    
    
}
