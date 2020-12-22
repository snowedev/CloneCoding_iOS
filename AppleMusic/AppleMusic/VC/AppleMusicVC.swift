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
    var thirdArray = ThirdData()
    var fourthArray = FourthData()
    var fifthArray = FifthData()
    var sixthArray = SixthData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationItem.largeTitleDisplayMode = .automatic
        
        // 테이블 뷰 경계션 없애기
        mainTableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
        
        self.mainTableView.register(ExploreTableViewCell.nib(), forCellReuseIdentifier: ExploreTableViewCell.identifier)
        self.mainTableView.register(NewSongTableViewCell.nib(), forCellReuseIdentifier: NewSongTableViewCell.identifier)
        self.mainTableView.register(MoodTableViewCell.nib(), forCellReuseIdentifier: MoodTableViewCell.identifier)
        self.mainTableView.register(EnjoyTableViewCell.nib(), forCellReuseIdentifier: EnjoyTableViewCell.identifier)
        self.mainTableView.register(HotTrackTableViewCell.nib(), forCellReuseIdentifier: HotTrackTableViewCell.identifier)
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
        }else if(indexPath.row == 2){
            return 180
        }else if(indexPath.row == 3){
            return 230
        }else if(indexPath.row == 4){
            return 320
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
        }else if(indexPath.row == 2) {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MoodTableViewCell.identifier) as? MoodTableViewCell else{
                return UITableViewCell()
            }
            //table view cell 내의 collection view에게 데이터 전달
            let rowArray = thirdArray.objectsArray
            cell.updateCellWith(row: rowArray)
            
            return cell
        }else if(indexPath.row == 3) {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: EnjoyTableViewCell.identifier) as? EnjoyTableViewCell else{
                return UITableViewCell()
            }
            //table view cell 내의 collection view에게 데이터 전달
            let rowArray = fourthArray.objectsArray
            cell.updateCellWith(row: rowArray)
            
            return cell
        }else if(indexPath.row == 4) {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: HotTrackTableViewCell.identifier) as? HotTrackTableViewCell else{
                return UITableViewCell()
            }
            //table view cell 내의 collection view에게 데이터 전달
            let rowArray = fifthArray.objectsArray
            cell.updateCellWith(row: rowArray)
            
            return cell
        }else{
            return UITableViewCell()
        }
        
    }
}

extension AppleMusicVC: UITableViewDelegate{
}

