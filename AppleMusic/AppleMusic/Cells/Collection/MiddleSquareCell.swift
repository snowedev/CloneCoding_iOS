//
//  MiddleSquareCell.swift
//  AppleMusic
//
//  Created by 이원석 on 2020/11/27.
//

import UIKit

class MiddleSquareCell: UICollectionViewCell {
    static let identifier = "MiddleSquareCell"
    
    @IBOutlet weak var albumImageView: UIImageView!
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    
    func setCell(middlesquare: MiddleSquare){
        albumImageView.image = UIImage(named: middlesquare.albumArtName)
        firstLabel.text = middlesquare.firstLabelName
        secondLabel.text = middlesquare.secondLabelName
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "MiddleSquareCell", bundle: nil)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
