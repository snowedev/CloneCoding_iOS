//
//  TableShapeCell.swift
//  AppleMusic
//
//  Created by 이원석 on 2020/11/29.
//

import UIKit

class HotTrackSongTableCell: UITableViewCell {
    static let identifier = "HotTrackSongTableCell"

    @IBOutlet weak var albumArtImageView: UIImageView!
    @IBOutlet weak var songNameLabel: UILabel!
    @IBOutlet weak var singerNameLabel: UILabel!
    
    static func nib() -> UINib {
        return UINib(nibName: "HotTrackSongTableCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
    }
    
    // MARK: - Functions
    func setCell(hotTrackSong: HotTrackSong){
        albumArtImageView.image = UIImage(named: hotTrackSong.imageName)
        songNameLabel.text = hotTrackSong.songLabelName
        singerNameLabel.text = hotTrackSong.songLabelName
    }

}
