//
//  EnjoyTableViewCell.swift
//  AppleMusic
//
//  Created by 이원석 on 2020/12/21.
//

import UIKit

class EnjoyTableViewCell: UITableViewCell {
    static let identifier = "EnjoyTableViewCell"
    @IBOutlet weak var enjoyCollectionView: UICollectionView!
    
        
    var enjoy : [MiddleSquare] = []
    
    static func nib() -> UINib {
        return UINib(nibName: "EnjoyTableViewCell", bundle: nil)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.enjoyCollectionView.register(MiddleSquareCell.nib(), forCellWithReuseIdentifier: MiddleSquareCell.identifier)
        self.enjoyCollectionView.delegate = self
        self.enjoyCollectionView.dataSource = self
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension EnjoyTableViewCell: UICollectionViewDelegate{
}
extension EnjoyTableViewCell: UICollectionViewDataSource{
    
    func updateCellWith(row: [MiddleSquare]) {
        self.enjoy = row
        self.enjoyCollectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return enjoy.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MiddleSquareCell.identifier, for: indexPath) as? MiddleSquareCell else{
            return UICollectionViewCell()
        }
        
        cell.setCell(middlesquare: enjoy[indexPath.row])
        return cell
    }
    
}

extension EnjoyTableViewCell: UICollectionViewDelegateFlowLayout{
    
    //MARK: - Cell 사이즈
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: (collectionView.frame.width-40)/2, height: collectionView.frame.height)
    }
    
    //MARK: - Cell간의 좌우간격 지정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat
    {
        return 10
    }

    //MARK: - 마진
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets
    {
        return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
}
