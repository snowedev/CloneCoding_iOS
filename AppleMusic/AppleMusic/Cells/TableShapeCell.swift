//
//  TableShapeCell.swift
//  AppleMusic
//
//  Created by 이원석 on 2020/11/29.
//

import UIKit

class TableShapeCell: UICollectionViewCell {
    static let identifier = "TableShapeCell"

    @IBOutlet weak var albumArtImageView: UIImageView!
    @IBOutlet weak var songNameLabel: UILabel!
    @IBOutlet weak var singerNameLabel: UILabel!
    @IBOutlet weak var greyLine: UILabel!
    
    func setTableShape(imageName: String, songName: String, singerName: String) {
        self.albumArtImageView.image = UIImage(named: imageName)
        self.songNameLabel.text = songName
        self.singerNameLabel.text = singerName
        self.singerNameLabel.textColor = .brownGrey
    }
    
    
    static func nib() -> UINib {
        return UINib(nibName: "TableShapeCell", bundle: nil)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        greyLine.backgroundColor = .brightDarkGrey
        // Initialization code
    }

}
