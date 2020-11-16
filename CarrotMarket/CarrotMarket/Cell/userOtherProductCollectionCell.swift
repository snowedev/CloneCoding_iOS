//
//  userOtherProductCollectionCell.swift
//  CarrotMarket
//
//  Created by 이원석 on 2020/11/12.
//

import UIKit

class userOtherProductCollectionCell: UICollectionViewCell {
    static let identifier = "userOtherProductCollectionCell"
    
    @IBOutlet weak var userOtherProductImageView: UIImageView!
    @IBOutlet weak var userOtherProductNameLabel: UILabel!
    @IBOutlet weak var userOtherProductPriceLabel: UILabel!
    
    func setOtherProductData(name: String, imageName: String, price: String) {
        
        self.userOtherProductNameLabel.text = name
        self.userOtherProductImageView.image = UIImage(named: imageName)
        self.userOtherProductPriceLabel.text = price
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "userOtherProductCollectionCell", bundle: nil)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .link
    }
}
