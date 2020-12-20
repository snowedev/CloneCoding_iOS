//
//  MoodTableViewCell.swift
//  AppleMusic
//
//  Created by 이원석 on 2020/12/19.
//

import UIKit

class MoodTableViewCell: UITableViewCell {
    static let identifier = "MoodTableViewCell"
    @IBOutlet weak var topGrLine: UILabel!
    @IBOutlet weak var moodCollectionView: UICollectionView!
        
    var mood : [SmallRectangle] = []
    
    static func nib() -> UINib {
        return UINib(nibName: "MoodTableViewCell", bundle: nil)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.topGrLine.backgroundColor = .brightDarkGrey
        self.moodCollectionView.register(SmallRectangleCell.nib(), forCellWithReuseIdentifier: SmallRectangleCell.identifier)
        self.moodCollectionView.delegate = self
        self.moodCollectionView.dataSource = self
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension MoodTableViewCell: UICollectionViewDelegate{
}
extension MoodTableViewCell: UICollectionViewDataSource{
    
    func updateCellWith(row: [SmallRectangle]) {
        self.mood = row
        self.moodCollectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mood.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SmallRectangleCell.identifier, for: indexPath) as? SmallRectangleCell else{
            return UICollectionViewCell()
        }
        
        cell.setCell(smallrectangle: mood[indexPath.row])
        return cell
    }
    
}

extension MoodTableViewCell: UICollectionViewDelegateFlowLayout{
    
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
