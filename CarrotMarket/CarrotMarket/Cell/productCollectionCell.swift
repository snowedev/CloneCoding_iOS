//
//  productCollectionCell.swift
//  CarrotMarket
//
//  Created by 이원석 on 2020/11/12.
//

import UIKit

class productCollectionCell: UICollectionViewCell {
    static let identifier = "productCollectionCell"
    
    @IBOutlet weak var productImageView: UIImageView!
    
    func  setImage(imageName: String) {
        productImageView.image = UIImage(named: imageName)
    }
}
