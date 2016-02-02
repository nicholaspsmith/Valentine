//
//  MemoryCell.swift
//  Valentine
//
//  Created by Nick on 2/1/16.
//  Copyright © 2016 Nick. All rights reserved.
//

import UIKit

class MemoryCell: UITableViewCell {

    @IBOutlet weak var memoryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func configureCell(label: String) {
        memoryLabel.text = label
    }
}
