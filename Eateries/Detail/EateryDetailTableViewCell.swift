//
//  EateryDetailTableViewCell.swift
//  Eateries
//
//  Created by Arthur on 04.02.2019.
//  Copyright © 2019 Arthur. All rights reserved.
//

import UIKit

class EateryDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var keyLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
