//
//  BigRectangleCell.swift
//  AppleMusic
//
//  Created by 이원석 on 2020/11/27.
//

import UIKit

class BigRectangleCell: UICollectionViewCell {
    static let identifier = "BigRectangleCell"
    
    @IBOutlet weak var albumImageView: UIImageView!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var musicTitleLabel: UILabel!
    @IBOutlet weak var singerLabel: UILabel!
    @IBOutlet weak var greyLine: UILabel!
    
    func setBingRectangleData(imageName: String, categoryName: String, musicName: String, singerName: String){
        self.albumImageView.image = UIImage(named: imageName)
        self.categoryLabel.text = categoryName
        self.categoryLabel.textColor = .brownGrey
        self.musicTitleLabel.text = musicName
        self.singerLabel.text = singerName
        self.singerLabel.textColor = .brownGrey
    }
    
    func setCell(explore: BigRectangle){
        albumImageView.image = UIImage(named: explore.bannerName)
        
        categoryLabel.text = explore.categoryName
        categoryLabel.textColor = .brownGrey
        
        musicTitleLabel.text = explore.musicName
        
        singerLabel.text = explore.singerName
        self.singerLabel.textColor = .brownGrey
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "BigRectangleCell", bundle: nil)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        greyLine.backgroundColor = .brightDarkGrey
    }
}
