//
//  HotTrackTableViewCell.swift
//  AppleMusic
//
//  Created by 이원석 on 2020/12/21.
//

import UIKit

class HotTrackTableViewCell: UITableViewCell {
    static let identifier = "HotTrackTableViewCell"
    @IBOutlet weak var hottrackCollectionView: UICollectionView!
    
    var minItemSpacing: CGFloat = 10
    var hottrack : [HotTrack] = []
    
    static func nib() -> UINib {
        return UINib(nibName: "HotTrackTableViewCell", bundle: nil)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.hottrackCollectionView.register(HotTrackCollectionCell.nib(), forCellWithReuseIdentifier: HotTrackCollectionCell.identifier)
        self.hottrackCollectionView.contentInsetAdjustmentBehavior = .never
        self.hottrackCollectionView.decelerationRate = .fast
        self.hottrackCollectionView.delegate = self
        self.hottrackCollectionView.dataSource = self
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

extension HotTrackTableViewCell: UICollectionViewDelegate{
}
extension HotTrackTableViewCell: UICollectionViewDataSource{
    
    func updateCellWith(row: [HotTrack]) {
        self.hottrack = row
        self.hottrackCollectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return hottrack.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HotTrackCollectionCell.identifier, for: indexPath) as? HotTrackCollectionCell else{
            return UICollectionViewCell()
        }
        let rowArray = hottrack[indexPath.row].songs
        cell.updateCellWith(row: rowArray)

        return cell
    }
    
}

extension HotTrackTableViewCell: UICollectionViewDelegateFlowLayout{
    
    //MARK: - Cell 사이즈
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: collectionView.frame.width-40, height: collectionView.frame.height)
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
    
    // MARK: Paging Effect
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>)
    {
            let cellWidthIncludeSpacing = (self.hottrackCollectionView.frame.width)-40 + minItemSpacing
            var offset = targetContentOffset.pointee
            let index = (offset.x + scrollView.contentInset.left) / cellWidthIncludeSpacing
            let roundedIndex: CGFloat = round(index)
            
            offset = CGPoint(x: roundedIndex * cellWidthIncludeSpacing, y: scrollView.contentInset.top)
            targetContentOffset.pointee = offset
    }

}

