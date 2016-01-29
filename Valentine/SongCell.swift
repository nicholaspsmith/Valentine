//
//  SongCell.swift
//  Valentine
//
//  Created by Nick on 1/29/16.
//  Copyright © 2016 Nick. All rights reserved.
//

import UIKit

class SongCell: UITableViewCell {

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var artistLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func configureCell(title: String, artist: String) {
        titleLbl.text = title
        artistLbl.text = artist
    }
}
