//
//  TableShapeCell.swift
//  AppleMusic
//
//  Created by 이원석 on 2020/12/21.
//

import UIKit

class HotTrackCollectionCell: UICollectionViewCell {
    static let identifier = "HotTrackCollectionCell"
    @IBOutlet weak var songTableView: UITableView!
    
    var song: [HotTrackSong] = []
    
    static func nib() -> UINib {
        return UINib(nibName: "HotTrackCollectionCell", bundle: nil)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.songTableView.register(HotTrackSongTableCell.nib(), forCellReuseIdentifier: HotTrackSongTableCell.identifier)
        songTableView.dataSource = self
        songTableView.delegate = self
    }
}

extension HotTrackCollectionCell: UITableViewDelegate {
    
}
extension HotTrackCollectionCell: UITableViewDataSource {
    func updateCellWith(row: [HotTrackSong]) {
        self.song = row
        self.songTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return song.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HotTrackSongTableCell.identifier, for: indexPath) as? HotTrackSongTableCell else{
            return UITableViewCell()
        }
        cell.setCell(hotTrackSong: song[indexPath.row])

        return cell
    }
    
    
}


