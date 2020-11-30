//
//  ExploreTableViewCell.swift
//  AppleMusic
//
//  Created by 이원석 on 2020/11/30.
//

import UIKit

class ExploreTableViewCell: UITableViewCell {
    static let identifier = "ExploreTableViewCell"
    @IBOutlet weak var exploreCollectionView: UICollectionView!
    
    var minItemSpacing: CGFloat = 10
//    var previousIndex = 0
//    var isOneStepPaging = true
    var explore : [BigRectangle] = []
    
    static func nib() -> UINib {
        return UINib(nibName: "ExploreTableViewCell", bundle: nil)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.exploreCollectionView.register(BigRectangleCell.nib(), forCellWithReuseIdentifier: BigRectangleCell.identifier)
        self.exploreCollectionView.contentInsetAdjustmentBehavior = .never
        self.exploreCollectionView.decelerationRate = .fast
        self.exploreCollectionView.delegate = self
        self.exploreCollectionView.dataSource = self
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension ExploreTableViewCell: UICollectionViewDelegate{
}

extension ExploreTableViewCell: UICollectionViewDataSource{

    // The data we passed from the TableView send them to the CollectionView Model
    func updateCellWith(row: [BigRectangle]) {
        self.explore = row
        self.exploreCollectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return explore.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BigRectangleCell.identifier, for: indexPath) as? BigRectangleCell else{
            return UICollectionViewCell()
        }
        
        cell.setCell(explore: explore[indexPath.item])
        return cell
    }
    
    
}
extension ExploreTableViewCell: UICollectionViewDelegateFlowLayout{
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
            return UIEdgeInsets(top: 0, left: 20, bottom: 20, right: 20)
    }
    
    // MARK: Paging Effect
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>)
    {
            let cellWidthIncludeSpacing = (self.exploreCollectionView.frame.width)-40 + minItemSpacing
            var offset = targetContentOffset.pointee
            let index = (offset.x + scrollView.contentInset.left) / cellWidthIncludeSpacing
            let roundedIndex: CGFloat = round(index)
            
            offset = CGPoint(x: roundedIndex * cellWidthIncludeSpacing, y: scrollView.contentInset.top)
            targetContentOffset.pointee = offset
    }
}
