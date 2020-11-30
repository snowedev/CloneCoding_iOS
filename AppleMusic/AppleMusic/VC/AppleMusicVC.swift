//
//  AppleMusicVC.swift
//  AppleMusic
//
//  Created by 이원석 on 2020/11/30.
//

import UIKit

class AppleMusicVC: UIViewController {

    @IBOutlet weak var mainTableView: UITableView!
    
    var firstArray = FirstData()
    var secondArray = SecondData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 테이블 뷰 경계션 없애기
        mainTableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
        
        self.mainTableView.register(ExploreTableViewCell.nib(), forCellReuseIdentifier: ExploreTableViewCell.identifier)
        self.mainTableView.register(NewSongTableViewCell.nib(), forCellReuseIdentifier: NewSongTableViewCell.identifier)
        mainTableView.delegate = self
        mainTableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
}

extension AppleMusicVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(indexPath.row == 0) {
            return 300
        }else if(indexPath.row == 1){
            return 230
        }else{
            return 0
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(indexPath.row == 0) {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ExploreTableViewCell.identifier) as? ExploreTableViewCell else{
                return UITableViewCell()
            }
                //table view cell 내의 collection view에게 데이터 전달
                let rowArray = firstArray.objectsArray
                cell.updateCellWith(row: rowArray)
                
                return cell
        }else if(indexPath.row == 1) {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: NewSongTableViewCell.identifier) as? NewSongTableViewCell else{
                return UITableViewCell()
            }
                //table view cell 내의 collection view에게 데이터 전달
                let rowArray = secondArray.objectsArray
                cell.updateCellWith(row: rowArray)
                
                return cell
        }else{
            return UITableViewCell()
        }
        
    }
}



extension AppleMusicVC: UITableViewDelegate{
}
