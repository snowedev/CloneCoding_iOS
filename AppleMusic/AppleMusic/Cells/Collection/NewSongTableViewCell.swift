//
//  NewSongTableViewCell.swift
//  AppleMusic
//
//  Created by 이원석 on 2020/11/30.
//

import UIKit

class NewSongTableViewCell: UITableViewCell {
    static let identifier = "NewSongTableViewCell"
    @IBOutlet weak var newSongCollectionView: UICollectionView!
    
    var newsong : [MiddleSquare] = []
    
    static func nib() -> UINib {
        return UINib(nibName: "NewSongTableViewCell", bundle: nil)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.newSongCollectionView.register(MiddleSquareCell.nib(), forCellWithReuseIdentifier: MiddleSquareCell.identifier)
        self.newSongCollectionView.delegate = self
        self.newSongCollectionView.dataSource = self
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension NewSongTableViewCell: UICollectionViewDelegate{
}
extension NewSongTableViewCell: UICollectionViewDataSource{
    
    func updateCellWith(row: [MiddleSquare]) {
        self.newsong = row
        self.newSongCollectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return newsong.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MiddleSquareCell.identifier, for: indexPath) as? MiddleSquareCell else{
            return UICollectionViewCell()
        }
        
        cell.setCell(middlesquare: newsong[indexPath.row])
        return cell
    }
    
}

extension NewSongTableViewCell: UICollectionViewDelegateFlowLayout{
    
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
