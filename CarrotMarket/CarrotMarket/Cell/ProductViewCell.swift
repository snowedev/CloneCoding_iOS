//
//  ProductViewCell.swift
//  CarrotMarket
//
//  Created by 이원석 on 2020/10/30.
//

import UIKit

//물건 리스트 모델
struct ProList {
    var proname: String
    var loc: String
    var uploadtime: String
    var price: String
    var chatnum: Int
    var heartnum: Int
    var proImageName: String
    
    func makeProductImage() -> UIImage? {
        return UIImage(named: proImageName)
    }
}

class ProductViewCell: UITableViewCell {
    static let identifier = "ProductViewCell"
    
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var locLabel: UILabel!
    @IBOutlet weak var uploadTimeLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var chatNumLabel: UILabel!
    @IBOutlet weak var heartNumLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setCell(product: ProList) {
        productImageView.image = product.makeProductImage()
        productNameLabel.text = product.proname
        locLabel.text = product.loc
        uploadTimeLabel.text = product.uploadtime
        priceLabel.text = product.price
        chatNumLabel.text = "\(product.chatnum)"
        heartNumLabel.text = "\(product.heartnum)"
    }
    
}
