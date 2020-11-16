//
//  recommendCollectionCell.swift
//  CarrotMarket
//
//  Created by 이원석 on 2020/11/12.
//

import UIKit

class recommendCollectionCell: UICollectionViewCell {
    static let identifier = "recommendCollectionCell"
    
    @IBOutlet weak var recommendImageView: UIImageView!
    @IBOutlet weak var recommendNameLabel: UILabel!
    @IBOutlet weak var recommendPriceLabel: UILabel!
    
    
    func setRecommendData(name: String, imageName: String, price: String) {
        
        self.recommendNameLabel.text = name
        self.recommendImageView.image = UIImage(named: imageName)
        self.recommendPriceLabel.text = price
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "recommendCollectionCell", bundle: nil)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .link
    }
    
}
