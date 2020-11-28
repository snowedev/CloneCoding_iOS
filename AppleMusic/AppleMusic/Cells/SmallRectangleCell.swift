//
//  SmallRectangleCell.swift
//  AppleMusic
//
//  Created by 이원석 on 2020/11/29.
//

import UIKit

class SmallRectangleCell: UICollectionViewCell {
    static let identifier = "SmallRectangleCell"
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var firstLabel: UILabel!
    
    func setSmallRectangleData(imageName: String, firstLabelName: String){
        self.imageView.image = UIImage(named: imageName)
        self.firstLabel.text = firstLabelName
        
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "SmallRectangleCell", bundle: nil)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
